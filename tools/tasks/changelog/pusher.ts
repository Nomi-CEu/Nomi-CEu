import ChangelogData from "./changelogData";
import { categories, defaultIndentation } from "./definitions";
import { Category, ChangelogMessage, Commit } from "../../types/changelogTypes";
import { repoLink } from "./definitions";
import { Octokit } from "@octokit/rest";
import { getIssueURL, getNewestIssueURLs } from "../../util/util";

let data: ChangelogData;
let octokit: Octokit;

export default async function pushAll(inputData: ChangelogData): Promise<void> {
	pushTitle(inputData);
	await pushChangelog(inputData);
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
		data.builder.push(`<h1 align="center">${data.releaseType} (${date})</h1>`, "");
	} else {
		// noinspection HtmlUnknownAttribute
		data.builder.push(`<h1 {{{ CENTER_ALIGN }}}>${data.releaseType} ${data.to}</h1>`, "");
		data.builder.push("{{{ CF_REDIRECT }}}", "");
	}
}

export async function pushChangelog(inputData: ChangelogData): Promise<void> {
	data = inputData;

	octokit = new Octokit({
		auth: process.env.GITHUB_TOKEN,
	});

	// Save Issue/PR Info to Cache
	await getNewestIssueURLs(octokit);

	data.builder.push(`# Changes Since ${data.since}`, "");

	// Push Sections of Changelog
	for (const category of categories) {
		await pushCategory(category);
	}

	// Push the commit log
	if (data.commitList.length > 0) {
		sortCommitList(data.commitList, (commit) => commit);

		data.builder.push("## Commits");
		data.commitList.forEach((commit) => {
			data.builder.push(formatCommit(commit));
		});
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
		const list = category.changelogSection.get(subCategory);
		if (list && list.length != 0) {
			// Push Key Name (only pushes if Key Name is not "")
			if (subCategory.keyName) {
				categoryLog.push(`### ${subCategory.keyName}:`);
			}

			// Sort Log
			sortCommitList(
				list,
				(message) => message.commitObject,
				(a, b) => a.commitMessage.localeCompare(b.commitMessage),
			);

			// Push Log
			for (const changelogMessage of list) {
				categoryLog.push(await formatChangelogMessage(changelogMessage));
				// Push Sub Messages
				if (changelogMessage.subChangelogMessages) {
					for (const subMessage of changelogMessage.subChangelogMessages)
						categoryLog.push(await formatChangelogMessage(subMessage, true));
				}
			}
			categoryLog.push("");
			hasValues = true;
		}
	}
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
function sortCommitList<T>(list: T[], transform: (obj: T) => Commit | undefined, backup?: (a: T, b: T) => number) {
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

		// This is reversed, so the newest commits go on top
		if (dateB.getTime() - dateA.getTime() !== 0) return dateB.getTime() - dateA.getTime();
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

		if (dateB.getTime() - dateA.getTime() !== 0) return dateA.getTime() - dateB.getTime();
		return a.message.localeCompare(b.message);
	});
}

/**
 * Formats a Changelog Message
 * @param changelogMessage The message to format.
 * @param subMessage Whether this message is a subMessage (used in details). Set to true to make it a subMessage (different parsing). Defaults to false.
 * @return string Formatted Changelog Message
 */
async function formatChangelogMessage(changelogMessage: ChangelogMessage, subMessage = false): Promise<string> {
	const indentation = changelogMessage.indentation == undefined ? defaultIndentation : changelogMessage.indentation;
	let message = changelogMessage.commitMessage.trim();

	// Transform PR and/or Issue tags into a link.
	message = await transformTags(message);

	if (changelogMessage.specialFormatting)
		return changelogMessage.specialFormatting.formatting(
			message,
			subMessage,
			indentation,
			changelogMessage.specialFormatting.storage,
		);

	if (changelogMessage.commitObject && !subMessage) {
		if (data.combineList.has(changelogMessage.commitObject.hash)) {
			const commits = data.combineList.get(changelogMessage.commitObject.hash);
			commits.push(changelogMessage.commitObject);

			// Sort original array so newest commits appear at the end instead of start of commit string
			sortCommitListReverse(commits);

			const formattedCommits: string[] = [];
			const authors: string[] = [];
			const authorEmails: Set<string> = new Set<string>();
			const processedSHAs: Set<string> = new Set<string>();

			commits.forEach((commit) => {
				if (processedSHAs.has(commit.hash)) return;
				if (!authors.includes(commit.author_name) && !authorEmails.has(commit.author_email)) {
					authors.push(commit.author_name);
					authorEmails.add(commit.author_email);
				}
				formattedCommits.push(`[\`${commit.hash.substring(0, 7)}\`](${repoLink}commit/${commit.hash})`);
				processedSHAs.add(commit.hash);
			});

			authors.sort();
			return `${indentation}* ${message} - **${authors.join("**, **")}** (${formattedCommits.join(", ")})`;
		}
		const commit = changelogMessage.commitObject;
		const shortSHA = commit.hash.substring(0, 7);
		const author = commit.author_name;

		return `${indentation}* ${message} - **${author}** ([\`${shortSHA}\`](${repoLink}commit/${commit.hash}))`;
	}

	return `${indentation}* ${message}`;
}

/**
 * Returns a formatted commit
 */
function formatCommit(commit: Commit): string {
	const date = new Date(commit.date).toLocaleDateString("en-us", { year: "numeric", month: "short", day: "numeric" });
	const formattedCommit = `${commit.message} - **${commit.author_name}** (${date})`;

	const shortSHA = commit.hash.substring(0, 7);

	return `* [\`${shortSHA}\`](${repoLink}commit/${commit.hash}): ${formattedCommit}`;
}

/**
 * Transforms PR/Issue Tags into Links.
 */
async function transformTags(message: string): Promise<string> {
	if (message.search(/#\d+/) !== -1) {
		const matched = message.match(/#\d+/g);
		for (const match of matched) {
			// Extract digits
			const digits = Number.parseInt(match.match(/\d+/)[0]);

			// Get PR/Issue Info (PRs are listed in the Issue API Endpoint)
			const url = await getIssueURL(digits, octokit);
			if (url) {
				message = message.replace(match, `[#${digits}](${url})`);
			}
		}
	}
	return message;
}
