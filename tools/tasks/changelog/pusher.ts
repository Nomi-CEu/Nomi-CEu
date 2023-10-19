import ChangelogData from "./changelogData";
import { categories, defaultIndentation } from "./definitions";
import { Category, ChangelogMessage, Commit } from "../../types/changelogTypes";
import { repoLink } from "./definitions";

let data: ChangelogData;

export default function pushAll(inputData: ChangelogData): void {
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
		});
		// noinspection HtmlUnknownAttribute
		data.builder.push(`<h1 {{{ CENTER_ALIGN }}}>${data.releaseType} (${date})</h1>`, "");
	} else {
		// noinspection HtmlUnknownAttribute
		data.builder.push(`<h1 {{{ CENTER_ALIGN }}}>${data.releaseType} ${data.to}</h1>`, "");
	}
	data.builder.push("{{{ CF_REDIRECT }}}", "");
	data.builder.push(`# Changes Since ${data.since}`, "");

	// Push Sections of Changelog
	categories.forEach((category) => {
		pushCategory(category);
	});

	// Push the commit log
	if (data.commitList) {
		sortCommitList(data.commitList, (commit) => commit);

		data.builder.push("## Commits");
		data.commitList.forEach((commit) => {
			data.builder.push(formatCommit(commit));
		});
	}

	// Check if the builder only contains the title.
	if (data.builder.length <= 3) {
		data.builder.push("");
		data.builder.push("There haven't been any changes.");
	}

	// Push link
	data.builder.push(
		"",
		`**Full Changelog**: [\`${data.since}...${data.to}\`](${repoLink}compare/${data.since}...${data.to})`,
	);
}

/**
 * Pushes a given category to the builders.
 */
function pushCategory(category: Category) {
	const categoryLog: string[] = [];
	let hasValues = false;

	// Push All Sub Categories
	category.subCategories.forEach((subCategory) => {
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
			list.forEach((changelogMessage) => {
				categoryLog.push(formatChangelogMessage(changelogMessage));
				// Push Sub Messages
				if (changelogMessage.subChangelogMessages) {
					changelogMessage.subChangelogMessages.forEach((subMessage) => {
						categoryLog.push(formatChangelogMessage(subMessage, true));
					});
				}
			});
			categoryLog.push("");
			hasValues = true;
		}
	});
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
 * @param backup A backup sort, to call when either element does not have a commit object, or when the commit objects' times are the same. Optional, if not set, will just return 0 (equal).
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
 * Formats a Changelog Message
 * @param changelogMessage The message to format.
 * @param subMessage Whether this message is a subMessage (used in details). Set to true to make it a subMessage (different parsing). Defaults to false.
 * @return string Formatted Changelog Message
 */
function formatChangelogMessage(changelogMessage: ChangelogMessage, subMessage = false): string {
	if (changelogMessage.specialFormatting)
		return changelogMessage.specialFormatting.formatting(changelogMessage, changelogMessage.specialFormatting.storage);

	const indentation = changelogMessage.indentation == undefined ? defaultIndentation : changelogMessage.indentation;
	const message = changelogMessage.commitMessage.trim();

	if (changelogMessage.commitObject && !subMessage) {
		if (data.combineList.has(changelogMessage.commitObject.hash)) {
			const commits = data.combineList.get(changelogMessage.commitObject.hash);
			commits.unshift(changelogMessage.commitObject);

			const formattedCommits: string[] = [];
			const authors: string[] = [];
			const processedSHAs: Set<string> = new Set<string>();

			commits.forEach((commit) => {
				if (processedSHAs.has(commit.hash)) return;
				if (!authors.includes(commit.author_name)) authors.push(commit.author_name);
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
