import ChangelogData from "./changelogData.ts";
import { categories, defaultIndentation } from "./definitions.ts";
import { Category, ChangelogMessage, Commit } from "#types/changelogTypes.ts";
import { repoLink } from "./definitions.ts";
import {
	formatAuthor,
	getIssueURL,
	getCommitAuthors,
	getIssueURLs,
} from "#utils/util.ts";
import logInfo from "#utils/log.ts";

let data: ChangelogData;

// How many lines the changelog (excluding the commit log) can be before the commit log is excluded.
const sectionLinesBeforeCommitLogExcluded = 50;

// How many lines the commit log can be before its is excluded.
const logLinesBeforeCommitLogExcluded = 20;

// How many commits to include after a message.
const maxIncludeCommits = 3;

export default async function pushAll(inputData: ChangelogData): Promise<void> {
	pushTitle(inputData);
	await pushChangelog(inputData);
}

export async function pushSetup(): Promise<void> {
	// Fill Caches
	logInfo("Filling Caches...");
	await getIssueURLs();
	await getCommitAuthors();
}

export function pushTitle(inputData: ChangelogData): void {
	data = inputData;

	// Push the titles.
	// Center Align is replaced by the correct center align style in the respective deployments.
	// Must be triple bracketed, to make mustache not html escape it.
	if (data.releaseType === "Cutting Edge Build") {
		const date = new Date().toLocaleDateString("en-us", {
			year: "numeric",
			month: "short",
			day: "numeric",
			hour12: true,
			hour: "numeric",
			minute: "numeric",
			timeZoneName: "short",
		});
		// noinspection HtmlDeprecatedAttribute
		data.builder.push(
			`<h1 align="center">${data.releaseType} (${date})</h1>`,
			"",
		);
	} else {
		// noinspection HtmlUnknownAttribute
		data.builder.push(
			`<h1 {{{ CENTER_ALIGN }}}>${data.releaseType} ${data.to}</h1>`,
			"",
		);
		data.builder.push("{{{ CF_REDIRECT }}}", "");
	}
}

export async function pushChangelog(inputData: ChangelogData): Promise<void> {
	data = inputData;

	data.builder.push(`# Changes Since ${data.since}`, "");

	// Push Sections of Changelog
	for (const category of categories) {
		await pushCategory(category);
	}

	// Push the commit log
	if (data.commitList.length > 0) {
		if (
			data.builder.length < sectionLinesBeforeCommitLogExcluded &&
			data.commitList.length < logLinesBeforeCommitLogExcluded
		) {
			// Commit List is relatively short, and most commits would have been handled via category pushing anyway.
			// Just retrieve each author info sequentially.
			sortCommitList(data.commitList, (commit) => commit);

			data.builder.push("## Commits");
			for (const commit of data.commitList) {
				data.builder.push(await formatCommit(commit));
			}
		}
	} else {
		// No Commit List = No Changes
		data.builder.push("");
		data.builder.push("**There haven't been any changes.**");
	}

	// Push link
	data.builder.push(
		"",
		`**Full Changelog**: [\`${data.since}...${data.to}\`](${repoLink}compare/${data.since}...${data.to})`,
	);
}

export function pushSeperator(inputData: ChangelogData): void {
	data = inputData;

	data.builder.push("", "<hr>", "");
}

/**
 * Pushes a given category to the builders.
 */
async function pushCategory(category: Category) {
	const categoryLog: string[] = [];
	let hasValues = false;

	// Push All Sub Categories
	for (const subCategory of category.subCategories) {
		// Loop through key list instead of map to produce correct order
		const list = category.changelogSection?.get(subCategory);
		if (list && list.length != 0) {
			// Push Key Name (only pushes if Key Name is not "")
			if (subCategory.keyName) {
				categoryLog.push(`### ${subCategory.keyName}:`);
			}

			// Format Main Messages (Async so Author Fetch is Fast)
			const formatted: { message: ChangelogMessage; formatted: string }[] =
				await Promise.all(
					list.map((message) =>
						formatChangelogMessage(message).then((formatted) => {
							return { message, formatted };
						}),
					),
				);

			// Sort Log
			sortCommitList(
				formatted,
				(formatted) => formatted.message.commitObject,
				(a, b) =>
					a.message.commitMessage.localeCompare(b.message.commitMessage),
			);

			// Push Log
			for (const format of formatted) {
				categoryLog.push(format.formatted);
				// Push Sub Messages (No need for Async, Author Info Not Calculated in Sub Messages)
				if (format.message.subChangelogMessages) {
					for (const subMessage of format.message.subChangelogMessages)
						categoryLog.push(await formatChangelogMessage(subMessage, true));
				}
			}
			categoryLog.push("");
			hasValues = true;
		}
	}
	await transformAllIssueURLs(categoryLog);
	if (hasValues) {
		// Push Title
		data.builder.push(`## ${category.categoryName}:`);

		// Push previously made log
		data.builder.push(...categoryLog);
	}
}

/**
 * Sorts a list that contains commit data
 * @param list A list of type T that contains commit data
 * @param transform A function to turn each element of type T into an element of type Commit
 * @param backup A backup sort, to call when either element does not have a commit object, or when the commit objects' times are the same. Optional, if not set, will just return 0 (equal) or will compare commit messages.
 */
function sortCommitList<T>(
	list: T[],
	transform: (obj: T) => Commit | undefined,
	backup?: (a: T, b: T) => number,
) {
	list.sort((a, b): number => {
		const commitA = transform(a);
		const commitB = transform(b);
		if (!commitA || !commitB) {
			// If either commit is undefined
			if (backup) return backup(a, b);
			return 0;
		}
		const dateA = new Date(commitA.date);
		const dateB = new Date(commitB.date);

		// This is reversed, so higher priorities go on top
		if (commitB.priority !== commitA.priority)
			return (commitB.priority ?? 0) - (commitA.priority ?? 0);
		// This is reversed, so the newest commits go on top
		if (dateB.getTime() - dateA.getTime() !== 0)
			return dateB.getTime() - dateA.getTime();
		if (backup) return backup(a, b);
		return commitA.message.localeCompare(commitB.message);
	});
}

/**
 * Sorts a commits list so that newest commits are on the bottom.
 * @param list The commit list.
 */
export function sortCommitListReverse(list: Commit[]): void {
	list.sort((a, b) => {
		const dateA = new Date(a.date);
		const dateB = new Date(b.date);

		// This is reversed, so higher priorities go on top
		if (b.priority !== a.priority) return (b.priority ?? 0) - (a.priority ?? 0); // Priority is still highest first
		if (dateA.getTime() - dateB.getTime() !== 0)
			return dateA.getTime() - dateB.getTime();
		return a.message.localeCompare(b.message);
	});
}

/**
 * Formats a Changelog Message
 * @param changelogMessage The message to format.
 * @param subMessage Whether this message is a subMessage (used in details). Set to true to make it a subMessage (different parsing). Defaults to false.
 * @return string Formatted Changelog Message
 */
async function formatChangelogMessage(
	changelogMessage: ChangelogMessage,
	subMessage = false,
): Promise<string> {
	const indentation =
		changelogMessage.indentation == undefined
			? defaultIndentation
			: changelogMessage.indentation;
	const message = changelogMessage.commitMessage.trim();

	if (changelogMessage.specialFormatting)
		return changelogMessage.specialFormatting.formatting(
			message,
			subMessage,
			indentation,
			changelogMessage.specialFormatting.storage,
		);

	if (!changelogMessage.commitObject || subMessage) {
		return formatMessage(message, indentation, undefined, subMessage);
	}

	if (data.combineList.has(changelogMessage.commitObject.hash)) {
		const commits =
			data.combineList.get(changelogMessage.commitObject.hash) ?? [];
		commits.push(changelogMessage.commitObject);

		return formatMessage(message, indentation, commits, subMessage);
	}

	return formatMessage(
		message,
		indentation,
		[changelogMessage.commitObject],
		subMessage,
	);
}

/**
 * Formats a Changelog Message
 * @param message The message to format.
 * @param indentation Indentation to use.
 * @param commits List of Commits
 * @param subMessage Whether this message is a subMessage (used in details). Set to true to make it a subMessage (different parsing). Defaults to false.
 * @return string Formatted Changelog Message
 */
export async function formatMessage(
	message: string,
	indentation: string,
	commits?: Commit[],
	subMessage = false,
): Promise<string> {
	if (!commits || commits.length == 0 || subMessage) {
		return `${indentation}* ${message}`;
	}

	if (commits.length === 1) {
		const commit = commits[0];
		const shortSHA = commit.hash.substring(0, 7);
		const formattedCommit = `[\`${shortSHA}\`](${repoLink}commit/${commit.hash})`;
		const author = await formatAuthor(commit);

		return `${indentation}* ${message} - ${author} (${formattedCommit})`;
	}

	const formattedCommits: string[] = [];
	const authors: string[] = [];
	const retrievedAuthors: { commit: Commit; name: string; email: string }[] =
		await Promise.all(
			commits.map((commit) =>
				formatAuthor(commit).then((name) => {
					return { commit, name, email: commit.author_email };
				}),
			),
		);

	const processedSHAs: Set<string> = new Set<string>();

	sortCommitList(commits, (commit) => commit);

	// Co-Authors for Each Commit, Format Commits
	commits.forEach((commit) => {
		if (processedSHAs.has(commit.hash)) return;
		formattedCommits.push(
			`[\`${commit.hash.substring(0, 7)}\`](${repoLink}commit/${commit.hash})`,
		);
		processedSHAs.add(commit.hash);

		const authors = data.coAuthorList.get(commit.hash);
		if (!authors || authors.length === 0) return;

		retrievedAuthors.push(
			...authors.map((author) => {
				return { commit, name: `@${author.name}`, email: author.email };
			}),
		);
	});

	const processedAuthors: Set<string> = new Set<string>();
	const processedEmails: Set<string> = new Set<string>();

	sortCommitList(
		retrievedAuthors,
		(author) => author.commit,
		(a, b) => a.name.localeCompare(b.name),
	);
	retrievedAuthors.forEach((pAuthor) => {
		// Author
		if (
			!processedAuthors.has(pAuthor.name) &&
			!processedEmails.has(pAuthor.email)
		) {
			authors.push(pAuthor.name);
			processedAuthors.add(pAuthor.name);
			processedEmails.add(pAuthor.email);
		}
	});

	// Delete all Formatted Commits after MaxIncludeCommits elements, replace with '...'
	if (formattedCommits.length > maxIncludeCommits) {
		formattedCommits.splice(maxIncludeCommits, Infinity, "...");
	}

	return `${indentation}* ${message} - ${authors.join(", ")} (${formattedCommits.join(", ")})`;
}

/**
 * Returns a formatted commit
 */
async function formatCommit(commit: Commit): Promise<string> {
	const date = new Date(commit.date).toLocaleDateString("en-us", {
		year: "numeric",
		month: "short",
		day: "numeric",
	});
	const formattedCommit = `${commit.message} - ${await formatAuthor(commit)} (${date})`;

	const shortSHA = commit.hash.substring(0, 7);

	return `* [\`${shortSHA}\`](${repoLink}commit/${commit.hash}): ${formattedCommit}`;
}

/**
 * Transforms PR/Issue Tags in all strings of the generated changelog.
 * @param changelog The list to transform all PR/Issue Tags of.
 */
async function transformAllIssueURLs(changelog: string[]) {
	const promises: Promise<string>[] = [];
	for (let i = 0; i < changelog.length; i++) {
		const categoryFormatted = changelog[i];
		// Transform PR and/or Issue tags into a link.
		promises.push(
			transformTags(categoryFormatted).then(
				(categoryTransformed) => (changelog[i] = categoryTransformed),
			),
		);
	}
	// Apply all Link Changes
	await Promise.all(promises);
}

/**
 * Transforms PR/Issue Tags into Links.
 */
async function transformTags(message: string): Promise<string> {
	const promises: Promise<string>[] = [];
	const transformed: Set<number> = new Set<number>();
	if (message.search(/#\d+/) !== -1) {
		const matched = message.match(/#\d+/g) ?? [];
		for (const match of matched) {
			// Extract digits
			const digitsMatch = match.match(/\d+/);
			if (!digitsMatch) continue;
			const digits = Number.parseInt(digitsMatch[0]);

			if (transformed.has(digits)) continue;
			transformed.add(digits);

			// Get PR/Issue Info (PRs are listed in the Issue API Endpoint)
			promises.push(
				getIssueURL(digits).then(
					(url) =>
						(message = message.replaceAll(match, `[#${digits}](${url})`)),
				),
			);
		}
	}

	// Resolve all Issue URL Replacements
	await Promise.all(promises);
	return message;
}
