import { ChangelogMessage, Commit, ExpandedMessage, FixUpInfo, Parser } from "../../types/changelogTypes";
import dedent from "dedent-js";
import matter from "gray-matter";
import toml from "@ltd/j-toml/index";
import { detailsKey, detailsList, expandKey, expandList, fixUpKey, fixUpList, indentationLevel } from "./definitions";
import { commitFixes, findCategories, findSubCategory } from "./parser";
import { isTest } from "./createChangelog";

export async function parseFixUp(commitBody: string, commitObject: Commit): Promise<boolean> {
	if (!commitBody.includes(fixUpKey)) return false;
	await parse(
		commitBody,
		commitObject,
		fixUpKey,
		fixUpList,
		(item: FixUpInfo) => item.sha && item.newMessage,
		(item) => commitFixes.set(item.sha, item),
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
				const body = dedent(item.messageBody);
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
				commitObjects: [commitObject],
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
			item = dedent(item);
			if (item.includes(detailsKey)) {
				result.push(...(await expandDetailsLevel(item, commitObject, `${indentation}${indentationLevel}`)));
			} else {
				result.push({ commitMessage: item, commitObjects: [commitObject], indentation: indentation });
			}
		},
	);
	return result;
}

/**
 * Parse TOML in a commit body.
 * @param commitBody The body to parse
 * @param commitObject The commit object to grab messages from, and to determine error messages.
 * @param delimiter The delimiters, surrounding the TOML.
 * @param listKey The key of the list to parse.
 * @param emptyCheck The check to see if an item in the list is invalid.
 * @param perItemCallback The callback to perform on each item in the list.
 */
async function parse<T>(
	commitBody: string,
	commitObject: Commit,
	delimiter: string,
	listKey: string,
	emptyCheck: (item: T) => string,
	perItemCallback: (item: T) => void,
): Promise<void> {
	let messages: T[];
	let endMessage = "Skipping...";
	if (isTest) {
		endMessage = dedent`
			Try checking the TOML syntax in https://www.toml-lint.com/, checking https://toml.io/en/v1.0.0, and looking through https://github.com/Nomi-CEu/Nomi-CEu/blob/main/CONTRIBUTING.md!
			Also check that you have surrounded the TOML in ${delimiter}!`;
	}

	try {
		// Remove everything before first delimiter in body
		const list = commitBody.split(delimiter);
		list.shift();
		const body = `${delimiter} ${list.join(delimiter)}`;

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
		if (isTest) throw new Error("Failed Parsing TOML. See above.");
		return;
	}

	if (!messages || !Array.isArray(messages) || messages.length === 0) {
		console.error(dedent`
			Message List (key: '${listKey}') in body:
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

		if (isTest) throw new Error("Failed Parsing Message List. See Above.");
		return;
	}
	for (let i = 0; i < messages.length; i++) {
		const item = messages[i];
		if (!emptyCheck(item)) {
			console.error(dedent`
				No Message Title for entry ${i + 1} in body:
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

			if (isTest) throw new Error("Bad Entry. See Above.");
			continue;
		}
		perItemCallback(item);
	}
}
