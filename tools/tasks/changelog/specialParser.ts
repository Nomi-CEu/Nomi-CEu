import {
	AuthorInfo,
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
	PriorityInfo,
} from "#types/changelogTypes.ts";
import dedent from "dedent-js";
import matter, { GrayMatterFile } from "gray-matter";
import {
	coAuthorsKey,
	coAuthorsList,
	combineKey,
	combineList,
	combineRoot,
	defaultIgnoreLogic,
	detailsKey,
	detailsList,
	detailsRoot,
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
	priorityKey,
} from "./definitions.ts";
import { findCategories, findSubCategory } from "./parser.ts";
import ChangelogData from "./changelogData.ts";
import toml from "toml-v1";
import { logError } from "#utils/log.ts";

const { parse } = toml;
let data: ChangelogData;

export function specialParserSetup(inputData: ChangelogData): void {
	data = inputData;
}

/**
 * Reads a commit's priority.
 */
export async function parsePriority(
	commitBody: string,
	commitObject: Commit,
): Promise<number | undefined> {
	if (!commitBody.includes(priorityKey)) return undefined;
	const info = await parseTOML<PriorityInfo>(
		commitBody,
		commitObject,
		priorityKey,
	);
	if (!info) return undefined;

	if (!info.priority) {
		logError(dedent`
			Priority Info in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is missing priority info (key 'priority').`);
		if (data.isTest)
			throw new Error("Failed to Parse Priority Info. See Above.");
		return undefined;
	}

	return info.priority;
}

/**
 * Checks a commit's ignore.
 * @commit The Commit Body. Does check whether the ignore key is there.
 * @return Returns undefined to continue, and an Ignored object if to skip.
 */
export async function parseIgnore(
	commitBody: string,
	commitObject: Commit,
): Promise<Ignored | undefined> {
	if (!commitBody.includes(ignoreKey)) return undefined;
	const info = await parseTOML<IgnoreInfo>(commitBody, commitObject, ignoreKey);
	if (!info) return undefined;

	if (!info.checks) {
		logError(dedent`
			Ignore Info in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is missing check info (key 'checks').`);
		if (data.isTest) throw new Error("Failed to Parse Ignore Info. See Above.");
		return undefined;
	}

	let infoKeys: string[];
	try {
		infoKeys = Object.keys(info.checks);
	} catch (err) {
		logError(dedent`
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
		if (ignoreKeys.has(key))
			checkResults.push(ignoreChecks[key](info.checks[key], data));
		else {
			logError(dedent`
			Ignore Check with key '${key}' in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is not accepted!
			Only accepts keys: ${Array.from(ignoreKeys)
				.map((key) => `'${key}'`)
				.join(", ")}.`);
			if (data.isTest)
				throw new Error("Failed Parsing Ignore Check. See Above.");
		}
	});
	if (checkResults.length === 0) {
		logError(dedent`
			No Ignore Checks found in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message})!
			Only accepts keys: ${Array.from(ignoreKeys)
				.map((key) => `'${key}'`)
				.join(", ")}.`);
		if (data.isTest)
			throw new Error("Failed Parsing Ignore Checks. See Above.");
		return undefined;
	}

	/* Find Logic */
	let logic: IgnoreLogic;
	if (info.logic === undefined) logic = defaultIgnoreLogic;
	else if (Object.keys(ignoreLogics).includes(info.logic))
		logic = ignoreLogics[info.logic];
	else {
		logError(dedent`
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

	if (logic(checkResults)) return new Ignored(info.addCommitList);
	return undefined;
}

/**
 * Parses a commit with coauthor info.
 */
export async function parseCoAuthor(
	commitBody: string,
	commitObject: Commit,
): Promise<void> {
	if (!commitBody.includes(coAuthorsKey)) return;
	await parseTOMLWithRootToList<AuthorInfo>(
		commitBody,
		commitObject,
		coAuthorsKey,
		coAuthorsList,
		(item) => !item.email || !item.name,
		async (item) => {
			const authors = data.coAuthorList.get(commitObject.hash) ?? [];
			authors.push(item);
			data.coAuthorList.set(commitObject.hash, authors);
		},
		(item) => item as unknown as AuthorInfo,
	);
}

/**
 * Parses a commit with 'Fixup'.
 */
export async function parseFixUp(
	commit: Commit,
	fix?: FixUpInfo,
): Promise<boolean> {
	if (!commit.body || !commit.body.includes(fixUpKey)) return false;
	await parseTOMLWithRootToList<FixUpInfo>(
		commit.body,
		commit,
		fixUpKey,
		fixUpList,
		(item) => !item.sha || (!item.newTitle && !item.newBody),
		async (item) => {
			if (!item.mode) item.mode = "REPLACE"; // Default Mode is Replace (Legacy Compat)
			// Only override if no other overrides, from newer commits, set
			if (!data.commitFixes.has(item.sha)) data.commitFixes.set(item.sha, item);
		},
		(item) => item as unknown as FixUpInfo,
		(matter) => {
			let title = commit.message;
			// Replace "\r\n" (Caused by editing on GitHub) with "\n", as the output matter has this done.
			let body = commit.body
				.replace(/\r\n/g, "\n")
				.replace(matter.matter.trim(), "");

			// Apply Ignored Fixes
			if (fix) {
				if (fix.newTitle) title = fix.newTitle;
				if (fix.newBody) {
					switch (fix.mode) {
						case "REPLACE":
							body = fix.newBody;
							break;
						case "ADDITION":
							body = body.concat(`\n\n${fix.newBody}`);
							break;
					}
				}
			}

			// Must override, even if newer commits specified changes, as need to remove fixup data
			data.commitFixes.set(commit.hash, {
				sha: commit.hash,
				mode: "REPLACE",
				newTitle: title,
				newBody: body,
			});
		},
	);
	return true;
}

/**
 * Parses a commit with 'mod info'.
 */
export async function parseModInfo(
	commitBody: string,
	commitObject: Commit,
): Promise<void> {
	await parseTOMLWithRootToList<ModInfo>(
		commitBody,
		commitObject,
		modInfoKey,
		modInfoList,
		(item): boolean => {
			// noinspection SuspiciousTypeOfGuard
			const invalidProjectID =
				!item.projectID ||
				typeof item.projectID !== "number" ||
				Number.isNaN(item.projectID);
			const invalidInfo = !item.info;
			const invalidRootDetails = !item.detail;
			const invalidDetails =
				!item.details ||
				!Array.isArray(item.details) ||
				!(item.details.length > 0);
			// Invalid if invalid ID, or invalid info and invalid details
			return (
				invalidProjectID ||
				(invalidInfo && invalidRootDetails && invalidDetails)
			);
		},
		async (item) => {
			data.modInfoList.set(item.projectID, await getParsedModInfo(item));
		},
	);
}

/**
 * Gets the parsed mod info of a mod info.
 */
async function getParsedModInfo(modInfo: ModInfo): Promise<ParsedModInfo> {
	const subMessages: ChangelogMessage[] = [];
	if (modInfo.detail)
		subMessages.push({
			commitMessage: modInfo.detail,
			indentation: indentationLevel,
		});
	if (modInfo.details && modInfo.details.length > 0)
		subMessages.push(
			...modInfo.details.map((detail) => {
				return { commitMessage: detail, indentation: indentationLevel };
			}),
		);

	return {
		info: modInfo.info,
		details: subMessages,
	};
}

/**
 * Parses a commit with 'expand'.
 */
export async function parseExpand(
	commitBody: string,
	commitObject: Commit,
	parser: Parser,
): Promise<void> {
	await parseTOMLWithRootToList<ExpandedMessage>(
		commitBody,
		commitObject,
		expandKey,
		expandList,
		(item) => !item.messageTitle && !item.messageBody,
		async (item) => {
			if (!item.messageTitle) item.messageTitle = commitObject.message;
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
			parser.leftOverCallback(
				commitObject,
				commitMessage,
				commitBody,
				subMessages,
			);
		}
	} else {
		sortedCategories.forEach((category) => {
			const subCategory = findSubCategory(commitBody, category);

			category.changelogSection?.get(subCategory)?.push({
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
	await parseTOMLWithRootToList<string | unknown[]>(
		commitBody,
		commitObject,
		detailsKey,
		detailsList,
		(item) => !item,
		async (item) => {
			// Nested Details
			if (Array.isArray(item)) {
				await addDetailsLevel(
					commitBody,
					commitObject,
					item as unknown[],
					`${indentation}${indentationLevel}`,
					result,
				);
				return;
			}
			let string = item as string;
			string = dedent(string).trim();

			// Legacy Nested Details
			if (string.includes(detailsKey)) {
				result.push(
					...(await expandDetailsLevel(
						string,
						commitObject,
						`${indentation}${indentationLevel}`,
					)),
				);
			} else {
				result.push({
					commitMessage: string,
					commitObject: commitObject,
					indentation: indentation,
				});
			}
		},
		(root) => root[detailsRoot] as string,
	);
	return result;
}

/**
 * Adds Levels of Details through Arrays.
 */
async function addDetailsLevel(
	commitBody: string,
	commitObject: Commit,
	details: unknown[],
	indentation: string,
	builder: ChangelogMessage[],
) {
	const endMessage = getEndMessage(detailsKey);
	for (const detail of details) {
		// Nested Details
		if (Array.isArray(detail)) {
			await addDetailsLevel(
				commitBody,
				commitObject,
				detail as unknown[],
				`${indentation}${indentationLevel}`,
				builder,
			);
			continue;
		}

		// Transform into String
		if (typeof detail !== "string") {
			logError(dedent`
				Failed parsing Detail \`${detail}\` of Details Level:
				\`\`\`
				${details}\`\`\`
				of commit object ${commitObject.hash} (${commitObject.message}).
				The value is not a string.`);

			if (commitObject.body && commitBody !== commitObject.body) {
				logError(dedent`
					Original Body:
					\`\`\`
					${commitObject.body}\`\`\``);
			}

			logError(`\n${endMessage}\n`);
			if (data.isTest) throw new Error("Value is not a string.");
			continue;
		}

		const detailString = dedent(detail).trim();

		// Legacy Nested Details
		if (detailString.includes(detailsKey)) {
			builder.push(
				...(await expandDetailsLevel(
					detailString,
					commitObject,
					`${indentation}${indentationLevel}`,
				)),
			);
		} else {
			builder.push({
				commitMessage: detailString,
				commitObject: commitObject,
				indentation: indentation,
			});
		}
	}
}

/**
 * Parses a commit with 'combine'.
 */
export async function parseCombine(
	commitBody: string,
	commitObject: Commit,
): Promise<void> {
	await parseTOMLWithRootToList<string>(
		commitBody,
		commitObject,
		combineKey,
		combineList,
		(item) => !item,
		async (item) => {
			if (!data.combineList.has(item)) data.combineList.set(item, []);
			data.combineList.get(item)?.push(commitObject);
		},
		(root) => root[combineRoot] as string,
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
					return parse(input) as Record<string, unknown>;
				},
			},
			language: "toml",
		});

		if (matterCallback) matterCallback(parseResult);

		if (!itemKey) item = parseResult.data as T;
		else item = parseResult.data[itemKey];
	} catch (e) {
		logError(dedent`
			Failed parsing TOML in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}).
			This could be because of invalid syntax.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			logError(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}

		logError(`\n${endMessage}\n`);
		if (data.isTest) throw e;
		return undefined;
	}

	return item;
}

/**
 * Parses a List with safety.
 * @param messages List to parse
 * @param listKey List Key, used for error messages
 * @param commitBody The commit body
 * @param commitObject The commit object, used for error messages.
 * @param endMessage The end message to use
 * @param emptyCheck Check to see if an item is valid. True -> Empty
 * @param perItemCallback Callback to perform per item. Async to allow for further toml parsing
 * @param entryModifier Callback to change the entry in error messages. Optional. Defaults to `i + 1`.
 */
async function parseList<T>(
	messages: T[],
	listKey: string,
	commitBody: string,
	commitObject: Commit,
	endMessage: string,
	emptyCheck: (item: T) => boolean,
	perItemCallback: (item: T) => Promise<void>,
	entryModifier?: (index: number) => number,
) {
	for (let i = 0; i < messages.length; i++) {
		const item = messages[i];
		if (emptyCheck(item)) {
			let index = i + 1;
			if (entryModifier) index = entryModifier(i);

			logError(dedent`
				Missing Requirements for entry ${index} of list with key '${listKey}' in body:
				\`\`\`
				${commitBody}\`\`\`
				of commit object ${commitObject.hash} (${commitObject.message}).`);

			if (commitObject.body && commitBody !== commitObject.body) {
				logError(dedent`
					Original Body:
					\`\`\`
					${commitObject.body}\`\`\``);
			}
			logError(`${endMessage}\n`);

			if (data.isTest) throw new Error("Bad Entry. See Above.");
			continue;
		}
		await perItemCallback(item);
	}
}

/**
 * Parses TOML in a commit body to produce a list. List includes items in the base of the toml (added first).
 * List just contains root item if none in list.
 * @param commitBody The body to parse
 * @param commitObject The commit object to grab messages from, and to determine error messages.
 * @param delimiter The delimiters, surrounding the TOML.
 * @param listKey The key of the list to parse.
 * @param rootObjTransform Transform root obj into T. Return undefined if invalid.
 * @param emptyCheck The check to see if an item in the list is invalid. True -> Invalid/Empty
 * @param perItemCallback The callback to perform on each item in the list. Async to allow for further toml parsing
 * @param matterCallback An optional callback to perform on the matter.
 */
async function parseTOMLWithRootToList<T>(
	commitBody: string,
	commitObject: Commit,
	delimiter: string,
	listKey: string,
	emptyCheck: (item: T) => boolean,
	perItemCallback: (item: T) => Promise<void>,
	rootObjTransform?: (root: Record<string, unknown>) => T,
	matterCallback?: (matter: GrayMatterFile<string>) => void,
): Promise<void> {
	let root: Record<string, unknown> | undefined;
	const messages: T[] = [];

	const endMessage = getEndMessage(delimiter);

	// Parse Root TOML
	try {
		root = await parseTOML<Record<string, unknown>>(
			commitBody,
			commitObject,
			delimiter,
			undefined,
			matterCallback,
		);
		if (!root) return;
		const rootObj = rootObjTransform ? rootObjTransform(root) : (root as T);
		// Only push root if it passes empty check
		if (rootObj && !emptyCheck(rootObj)) messages.push(rootObj);
	} catch (e) {
		logError(dedent`
			Failed parsing Root TOML in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}).
			This could be because of invalid syntax.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			logError(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}

		logError(`\n${endMessage}\n`);
		if (data.isTest) throw e;
		return undefined;
	}

	// No List
	if (!(listKey in root)) {
		if (messages.length > 0) {
			await perItemCallback(messages[0]);
			return;
		}
		// No Valid Entry
		logError(dedent`
				Missing Requirements for root entry, & no list with list key '${listKey}' detected in body:
				\`\`\`
				${commitBody}\`\`\`
				of commit object ${commitObject.hash} (${commitObject.message}).`);

		if (commitObject.body && commitBody !== commitObject.body) {
			logError(dedent`
					Original Body:
					\`\`\`
					${commitObject.body}\`\`\``);
		}
		logError(`${endMessage}\n`);

		if (data.isTest) throw new Error("No Valid Entry. See Above.");
	}

	// Parse List TOML
	if (!root[listKey] || !Array.isArray(root[listKey])) {
		logError(dedent`
			List (key: '${listKey}') in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) not a list, or does not exist.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			logError(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}
		logError(`${endMessage}\n`);

		if (data.isTest) throw new Error("Failed Parsing List. See Above.");
		return;
	}

	let list: T[];
	try {
		list = root[listKey] as unknown as T[];
	} catch (e) {
		logError(dedent`
			List (key: '${listKey}') in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) could not be turned into correct list type.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			logError(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}
		logError(`${endMessage}\n`);

		if (data.isTest) throw new Error("Failed Parsing List. See Above.");
		return;
	}
	if (list.length === 0) {
		logError(dedent`
			List (key: '${listKey}') in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is empty.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			logError(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}
		logError(`${endMessage}\n`);

		if (data.isTest) throw new Error("Failed Parsing List. See Above.");
		return;
	}

	if (messages.length > 0) {
		messages.push(...list);
		// Because we've already done empty check on root obj, no need to suppress error msg
		// Keep as index (root: 0, obj1: 1, obj2: 2, ...)
		await parseList<T>(
			messages,
			listKey,
			commitBody,
			commitObject,
			endMessage,
			emptyCheck,
			perItemCallback,
			(i) => i,
		);
	}
	// Normal Parsing of List
	else
		await parseList<T>(
			list,
			listKey,
			commitBody,
			commitObject,
			endMessage,
			emptyCheck,
			perItemCallback,
		);
}

function getEndMessage(delimiter: string) {
	const normal = dedent`
			Try checking the TOML syntax in https://www.toml-lint.com/, checking the object tree in https://www.convertsimple.com/convert-toml-to-json/, checking syntax in https://toml.io/en/v1.0.0, and looking through https://github.com/Nomi-CEu/Nomi-CEu/wiki/Part-2:-Maintainer-Information#62-create-changelog!
			Also check that you have surrounded the TOML in '${delimiter}'!`;
	if (data.isTest) return normal;
	return normal.concat("\nSkipping...");
}
