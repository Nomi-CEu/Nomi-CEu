import {
	ChangelogMessage,
	Commit,
	ExpandedMessage,
	FixUpInfo,
	Ignored,
	IgnoreInfo,
	IgnoreLogic,
	ModInfo,
	ParsedModInfo,
	Parser,
} from "../../types/changelogTypes";
import dedent from "dedent-js";
import matter, { GrayMatterFile } from "gray-matter";
import toml from "@ltd/j-toml";
import {
	combineKey,
	combineList,
	defaultIgnoreLogic,
	detailsKey,
	detailsList,
	expandKey,
	expandList,
	fixUpKey,
	fixUpList,
	ignoreChecks,
	ignoreKey,
	ignoreLogics,
	indentationLevel,
	modInfoKey,
	modInfoList,
} from "./definitions";
import { findCategories, findSubCategory } from "./parser";
import ChangelogData from "./changelogData";
import { error } from "fancy-log";

let data: ChangelogData;

export function specialParserSetup(inputData: ChangelogData): void {
	data = inputData;
}

/**
 * Checks a commit's ignore.
 * @commit The Commit Body. Does check whether the ignore key is there.
 * @return Returns undefined to continue, and an Ignored object if to skip.
 */
export async function parseIgnore(commitBody: string, commitObject: Commit): Promise<Ignored | undefined> {
	if (!commitBody.includes(ignoreKey)) return undefined;
	const info = await parseTOML<IgnoreInfo>(commitBody, commitObject, ignoreKey);
	if (!info) return undefined;

	if (!info.checks) {
		error(dedent`
			Ignore Info in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is missing check info (key 'checks').`);
		return undefined;
	}

	let infoKeys: string[];
	try {
		infoKeys = Object.keys(info.checks);
	} catch (err) {
		error(dedent`
			Could not get the keys in Ignore Info of body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message})!`);
		if (data.isTest) throw err;
		return undefined;
	}

	/* Find Checks */
	const ignoreKeys = new Set<string>(Object.keys(ignoreChecks));
	const checkResults: boolean[] = [];
	infoKeys.forEach((key) => {
		if (ignoreKeys.has(key)) checkResults.push(ignoreChecks[key].call(this, info.checks[key], data));
		else {
			error(dedent`
			Ignore Check with key '${key}' in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is not accepted!
			Only accepts keys: ${Array.from(ignoreKeys)
				.map((key) => `'${key}'`)
				.join(", ")}.`);
			if (data.isTest) throw new Error("Failed Parsing Ignore Check. See Above.");
		}
	});
	if (checkResults.length === 0) {
		error(dedent`
			No Ignore Checks found in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message})!
			Only accepts keys: ${Array.from(ignoreKeys)
				.map((key) => `'${key}'`)
				.join(", ")}.`);
		if (data.isTest) throw new Error("Failed Parsing Ignore Checks. See Above.");
		return undefined;
	}

	/* Find Logic */
	let logic: IgnoreLogic;
	if (info.logic === undefined) logic = defaultIgnoreLogic;
	else if (Object.keys(ignoreLogics).includes(info.logic)) logic = ignoreLogics[info.logic];
	else {
		error(dedent`
			Ignore Logic '${info.logic}' in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message})!
			Only accepts keys: ${Object.keys(ignoreLogics)
				.map((key) => `'${key}'`)
				.join(", ")}.`);
		if (data.isTest) throw new Error("Failed Parsing Ignore Logic. See Above.");
		logic = defaultIgnoreLogic;
	}

	if (logic.call(this, checkResults)) return new Ignored(info.addCommitList);
	return undefined;
}

/**
 * Parses a commit with 'Fixup'.
 */
export async function parseFixUp(commit: Commit): Promise<boolean> {
	if (!commit.body || !commit.body.includes(fixUpKey)) return false;
	await parseTOMLToList(
		commit.body,
		commit,
		fixUpKey,
		fixUpList,
		(item: FixUpInfo) => Boolean(item.sha) && Boolean(item.newTitle),
		(item) => {
			// Only override if no other overrides, from newer commits, set
			if (!data.commitFixes.has(item.sha)) data.commitFixes.set(item.sha, item);
		},
		(matter) => {
			// Must override, even if newer commits specified changes, as need to remove fixup data
			data.commitFixes.set(commit.hash, {
				sha: commit.hash,
				newTitle: commit.message,
				// Replace "\r\n" (Caused by editing on GitHub) with "\n", as the output matter has this done.
				newBody: commit.body.replace(/\r\n/g, "\n").replace(matter.matter.trim(), ""),
			});
		},
	);
	return true;
}

/**
 * Parses a commit with 'mod info'.
 */
export async function parseModInfo(commitBody: string, commitObject: Commit): Promise<void> {
	await parseTOMLToList(
		commitBody,
		commitObject,
		modInfoKey,
		modInfoList,
		(item: ModInfo) =>
			// Accept if have project id, and has either info, or details which is an array with length > 0
			Boolean(item.projectID) &&
			(Boolean(item.info) || (Boolean(item.details) && Array.isArray(item.details) && item.details.length > 0)),
		async (item) =>
			// Must parse projectID into string then int because of weird artifacts
			data.modInfoList.set(Number.parseInt(String(item.projectID)), await getParsedModInfo(item)),
	);
}

/**
 * Gets the parsed mod info of a mod info.
 */
async function getParsedModInfo(modInfo: ModInfo): Promise<ParsedModInfo> {
	let subMessages: ChangelogMessage[] = undefined;
	if (modInfo.details && modInfo.details.length > 0)
		subMessages = modInfo.details.map((detail) => {
			return { commitMessage: detail, indentation: indentationLevel };
		});

	return {
		info: modInfo.info,
		details: subMessages,
	};
}

/**
 * Parses a commit with 'expand'.
 */
export async function parseExpand(commitBody: string, commitObject: Commit, parser: Parser): Promise<void> {
	await parseTOMLToList(
		commitBody,
		commitObject,
		expandKey,
		expandList,
		(item: ExpandedMessage) => Boolean(item.messageTitle),
		async (item) => {
			const title = dedent(item.messageTitle);

			if (item.messageBody) {
				const body = dedent(item.messageBody).trim();
				if (!(await parser.itemCallback(parser, commitObject, title, body))) {
					if (parser.leftOverCallback) {
						parser.leftOverCallback(commitObject, title, body);
					}
				}
			} else {
				if (parser.leftOverCallback) {
					parser.leftOverCallback(commitObject, title);
				}
			}
		},
	);
}

/**
 * Parses a commit with 'details'.
 */
export async function parseDetails(
	commitMessage: string,
	commitBody: string,
	commitObject: Commit,
	parser: Parser,
): Promise<void> {
	const sortedCategories = findCategories(commitBody);
	const subMessages = await expandDetailsLevel(commitBody, commitObject);

	if (sortedCategories.length === 0) {
		if (parser.leftOverCallback) {
			parser.leftOverCallback(commitObject, commitMessage, commitBody, subMessages);
		}
	} else {
		sortedCategories.forEach((category) => {
			const subCategory = findSubCategory(commitBody, category);

			category.changelogSection.get(subCategory).push({
				commitMessage: commitMessage,
				commitObject: commitObject,
				subChangelogMessages: subMessages,
			});
		});
	}
}

/**
 * Parses a 'level' of Details.
 */
async function expandDetailsLevel(
	commitBody: string,
	commitObject: Commit,
	indentation = indentationLevel,
): Promise<ChangelogMessage[]> {
	const result: ChangelogMessage[] = [];
	await parseTOMLToList(
		commitBody,
		commitObject,
		detailsKey,
		detailsList,
		(item: string) => Boolean(item),
		async (item) => {
			item = dedent(item).trim();
			if (item.includes(detailsKey)) {
				result.push(...(await expandDetailsLevel(item, commitObject, `${indentation}${indentationLevel}`)));
			} else {
				result.push({ commitMessage: item, commitObject: commitObject, indentation: indentation });
			}
		},
	);
	return result;
}

/**
 * Parses a commit with 'combine'.
 */
export async function parseCombine(commitBody: string, commitObject: Commit): Promise<void> {
	await parseTOMLToList(
		commitBody,
		commitObject,
		combineKey,
		combineList,
		(item: string) => Boolean(item),
		(item: string) => {
			if (!data.combineList.has(item)) data.combineList.set(item, []);
			data.combineList.get(item).push(commitObject);
		},
	);
}

/**
 * Parse TOML in a commit body.
 * @param commitBody The body to parse
 * @param commitObject The commit object to grab messages from, and to determine error messages.
 * @param delimiter The delimiters, surrounding the TOML.
 * @param itemKey The key of the item to parse. If not set, will just parse the main object.
 * @param matterCallback An optional callback to perform on the matter.
 * @returns item The Item/Object. Undefined if error.
 */
async function parseTOML<T>(
	commitBody: string,
	commitObject: Commit,
	delimiter: string,
	itemKey?: string,
	matterCallback?: (matter: GrayMatterFile<string>) => void,
): Promise<T | undefined> {
	let item: T;
	const endMessage = getEndMessage(delimiter);

	try {
		// Remove everything before first delimiter in body
		const list = commitBody.split(delimiter);
		list.shift();
		// Replace "\r\n" (Caused by editing on GitHub) with "\n", as \r\n crashes the TOML parser.
		const body = `${delimiter} ${list.join(delimiter)}`.replace(/\r\n/g, "\n");

		// Parse
		const parseResult = matter(body, {
			delimiters: delimiter,
			engines: {
				toml: (input): Record<string, unknown> => {
					return toml.parse(input, "\n");
				},
			},
			language: "toml",
		});

		if (matterCallback) matterCallback(parseResult);

		if (!itemKey) item = parseResult.data as T;
		else item = parseResult.data[itemKey];
	} catch (e) {
		error(dedent`
			Failed parsing TOML in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}).
			This could be because of invalid syntax.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			error(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}

		error(`\n${endMessage}\n`);
		if (data.isTest) throw e;
		return undefined;
	}

	return item;
}

/**
 * Parse TOML in a commit body to produce a list.
 * @param commitBody The body to parse
 * @param commitObject The commit object to grab messages from, and to determine error messages.
 * @param delimiter The delimiters, surrounding the TOML.
 * @param listKey The key of the list to parse.
 * @param emptyCheck The check to see if an item in the list is invalid.
 * @param perItemCallback The callback to perform on each item in the list.
 * @param matterCallback An optional callback to perform on the matter.
 */
async function parseTOMLToList<T>(
	commitBody: string,
	commitObject: Commit,
	delimiter: string,
	listKey: string,
	emptyCheck: (item: T) => boolean,
	perItemCallback: (item: T) => void,
	matterCallback?: (matter: GrayMatterFile<string>) => void,
): Promise<void> {
	const messages = await parseTOML<T[]>(commitBody, commitObject, delimiter, listKey, matterCallback);
	const endMessage = getEndMessage(delimiter);

	if (!messages || !Array.isArray(messages) || messages.length === 0) {
		error(dedent`
			List (key: '${listKey}') in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is empty, not a list, or does not exist.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			error(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}
		error(`${endMessage}\n`);

		if (data.isTest) throw new Error("Failed Parsing Message List. See Above.");
		return;
	}
	for (let i = 0; i < messages.length; i++) {
		const item = messages[i];
		if (!emptyCheck(item)) {
			error(dedent`
				Missing Requirements for entry ${i + 1} in body:
				\`\`\`
				${commitBody}\`\`\`
				of commit object ${commitObject.hash} (${commitObject.message}).`);

			if (commitObject.body && commitBody !== commitObject.body) {
				error(dedent`
					Original Body:
					\`\`\`
					${commitObject.body}\`\`\``);
			}
			error(`${endMessage}\n`);

			if (data.isTest) throw new Error("Bad Entry. See Above.");
			continue;
		}
		perItemCallback(item);
	}
}

function getEndMessage(delimiter: string) {
	if (data.isTest) {
		return dedent`
			Try checking the TOML syntax in https://www.toml-lint.com/, checking the object tree in https://www.convertsimple.com/convert-toml-to-json/, checking syntax in https://toml.io/en/v1.0.0, and looking through https://github.com/Nomi-CEu/Nomi-CEu/blob/main/CONTRIBUTING.md!
			Also check that you have surrounded the TOML in '${delimiter}'!`;
	}
	return "Skipping...";
}
