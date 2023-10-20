import { ChangelogMessage, Commit, ExpandedMessage, FixUpInfo, Parser } from "../../types/changelogTypes";
import dedent from "dedent-js";
import matter, { GrayMatterFile } from "gray-matter";
import toml from "@ltd/j-toml";
import {
	combineKey,
	combineList,
	detailsKey,
	detailsList,
	expandKey,
	expandList,
	fixUpKey,
	fixUpList,
	indentationLevel,
} from "./definitions";
import { findCategories, findSubCategory } from "./parser";
import ChangelogData from "./changelogData";

let data: ChangelogData;

export function specialParserSetup(inputData: ChangelogData): void {
	data = inputData;
}

/**
 * Parses a commit with 'Fixup'.
 */
export async function parseFixUp(commit: Commit): Promise<boolean> {
	if (!commit.body || !commit.body.includes(fixUpKey)) return false;
	await parse(
		commit.body,
		commit,
		fixUpKey,
		fixUpList,
		(item: FixUpInfo) => item.sha && item.newTitle,
		(item) => {
			// Only override if no other overrides, from newer commits, set
			if (!data.commitFixes.has(item.sha)) data.commitFixes.set(item.sha, item);
		},
		(matter) => {
			// Must override, even if newer commits specified changes, as need to remove fixup data
			data.commitFixes.set(commit.hash, {
				sha: commit.hash,
				newTitle: commit.message,
				newBody: commit.body.replace(matter.matter.trim(), ""),
			});
		},
	);
	return true;
}

/**
 * Parses a commit with 'expand'.
 */
export async function parseExpand(commitBody: string, commitObject: Commit, parser: Parser): Promise<void> {
	await parse(
		commitBody,
		commitObject,
		expandKey,
		expandList,
		(item: ExpandedMessage) => item.messageTitle,
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
	await parse(
		commitBody,
		commitObject,
		detailsKey,
		detailsList,
		(item: string) => item,
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
	await parse(
		commitBody,
		commitObject,
		combineKey,
		combineList,
		(item: string) => item,
		(item: string) => {
			if (!data.combineList.has(item)) data.combineList.set(item, []);
			data.combineList.get(item).push(commitObject);
		},
	);
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
async function parse<T>(
	commitBody: string,
	commitObject: Commit,
	delimiter: string,
	listKey: string,
	emptyCheck: (item: T) => string,
	perItemCallback: (item: T) => void,
	matterCallback?: (matter: GrayMatterFile<string>) => void,
): Promise<void> {
	let messages: T[];
	let endMessage = "Skipping...";

	if (data.isTest) {
		endMessage = dedent`
			Try checking the TOML syntax in https://www.toml-lint.com/, checking the object tree in https://www.convertsimple.com/convert-toml-to-json/, checking syntax in https://toml.io/en/v1.0.0, and looking through https://github.com/Nomi-CEu/Nomi-CEu/blob/main/CONTRIBUTING.md!
			Also check that you have surrounded the TOML in '${delimiter}'!`;
	}

	try {
		// Remove everything before first delimiter in body
		const list = commitBody.split(delimiter);
		list.shift();
		const body = `${delimiter} ${list.join(delimiter)}`.split("\r\n").join("\n");

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

		messages = parseResult.data[listKey];
	} catch (e) {
		console.error(dedent`
			Failed parsing TOML in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}).
			This could be because of invalid syntax, or because the Message List (key: '${listKey}') is not an array.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			console.error(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}

		console.error(`\n${endMessage}\n`);
		if (data.isTest) throw e;
		return;
	}

	if (!messages || !Array.isArray(messages) || messages.length === 0) {
		console.error(dedent`
			List (key: '${listKey}') in body:
			\`\`\`
			${commitBody}\`\`\`
			of commit object ${commitObject.hash} (${commitObject.message}) is empty, not a list, or does not exist.`);

		if (commitObject.body && commitBody !== commitObject.body) {
			console.error(dedent`
				Original Body:
				\`\`\`
				${commitObject.body}\`\`\``);
		}
		console.error(`${endMessage}\n`);

		if (data.isTest) throw new Error("Failed Parsing Message List. See Above.");
		return;
	}
	for (let i = 0; i < messages.length; i++) {
		const item = messages[i];
		if (!emptyCheck(item)) {
			console.error(dedent`
				Missing Requirements for entry ${i + 1} in body:
				\`\`\`
				${commitBody}\`\`\`
				of commit object ${commitObject.hash} (${commitObject.message}).`);

			if (commitObject.body && commitBody !== commitObject.body) {
				console.error(dedent`
					Original Body:
					\`\`\`
					${commitObject.body}\`\`\``);
			}
			console.error(`${endMessage}\n`);

			if (data.isTest) throw new Error("Bad Entry. See Above.");
			continue;
		}
		perItemCallback(item);
	}
}
