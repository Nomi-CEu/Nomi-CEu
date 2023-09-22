import fs from "fs";
import upath from "upath";
import { modpackManifest, rootDirectory } from "../../globals";
import { compareAndExpandManifestDependencies, getChangelog, getFileAtRevision, getLastGitTag } from "../../util/util";
import { ModpackManifest } from "../../types/modpackManifest";
import { Category, ChangelogMessage, Commit, SubCategory } from "../../types/changelogTypes";
import marked from "marked";

const mdOptions = {
	pedantic: false,
	gfm: true,
	smartLists: true,
	smartypants: true,
	sanitize: true,
};

marked.setOptions(mdOptions);

// Final Builders
let builderGH: string[];
let builderCF: string[];

/* Keys */

/* Special Handling Keys */
const skipKey = "[SKIP]";
const expandKey = "[EXPAND]";
const detailsKey = "[DETAILS]";
const noCategoryKey = "[NO CATEGORY]";

/* Sub Category Keys */
// Mode Category Keys
const normalMode: SubCategory = { commitKey: "[NM]", keyName: "Normal Mode" };
const hardMode: SubCategory = { commitKey: "[HM]", keyName: "Hard Mode" };

/* Misc Sub Category Keys */
const qolChanges: SubCategory = { commitKey: "[QOL]", keyName: "Quality of Life" };

/* Set Sub Categories (Sub Categories that do not let any commit in) */
const bothModes: SubCategory = { keyName: "Both Modes" };
const modUpdates: SubCategory = { keyName: "Mod Updates" };
const modAdditions: SubCategory = { keyName: "Mod Additions" };
const modRemovals: SubCategory = { keyName: "Mod Removals" };

/* Default Sub Categories (Sub Categories that allow any commit in) */
const emptySubCategory: SubCategory = { commitKey: "", keyName: "" };
const other: SubCategory = { commitKey: "", keyName: "Other" };

/* Category Keys: */
const breakingCategory: Category = {
	commitKey: "[BREAKING]",
	categoryName: "Breaking Changes",
	subCategories: [emptySubCategory],
};
const balancingCategory: Category = {
	commitKey: "[BALANCING]",
	categoryName: "Balancing Changes",
	defaultSubCategory: bothModes,
	subCategories: [bothModes, normalMode, hardMode],
};
const featureCategory: Category = {
	commitKey: "[FEATURE]",
	categoryName: "Feature Additions",
	defaultSubCategory: bothModes,
	subCategories: [qolChanges, bothModes, normalMode, hardMode],
};
const questBookCategory: Category = {
	commitKey: "[QB]",
	categoryName: "Quest Book Changes",
	defaultSubCategory: bothModes,
	subCategories: [bothModes, normalMode, hardMode],
};
const bugCategory: Category = {
	commitKey: "[BUG]",
	categoryName: "Bug Fixes",
	defaultSubCategory: bothModes,
	subCategories: [bothModes, normalMode, hardMode],
};
const generalCategory: Category = {
	commitKey: "[GENERAL]",
	categoryName: "General Changes",
	subCategories: [modUpdates, modAdditions, modRemovals, other],
};
const internalCategory: Category = {
	commitKey: "[INTERNAL]",
	categoryName: "Internal Changes",
	subCategories: [emptySubCategory],
};
// TODO REMOVE THIS AFTER 1.7 PLEASE
const QBHMCompat: Category = {
	commitKey: "[QB HM]",
	categoryName: "QB HM Compat",
	subCategories: [emptySubCategory],
};

/**
 * Category List
 * <p>
 * The order that the categories appear here will be the order that they appear in the changelog, and their priority.
 */
const categories: Category[] = [
	breakingCategory,
	balancingCategory,
	featureCategory,
	questBookCategory,
	bugCategory,
	generalCategory,
	internalCategory,
	QBHMCompat,
];

/**
 * Generates a changelog based on environmental variables.
 */
export async function makeChangelog(): Promise<void> {
	let since = getLastGitTag(),
		to: string;

	// If this is a tagged build, fetch the tag before last.
	if (process.env.GITHUB_TAG) {
		since = getLastGitTag(process.env.GITHUB_TAG);
		to = process.env.GITHUB_TAG;
	}
	// Back-compat in case this crap is still around.
	else if (since == "latest-dev-preview") {
		since = getLastGitTag(since);
	}

	// Final Builders
	builderGH = [];
	builderCF = [];

	// Initialize Category Lists
	categories.forEach((categoryKey) => {
		initializeCategorySection(categoryKey);
	});

	// Formatted ChangelogTypes List
	const formattedCommits: string[] = [];

	// Get commit log of commits which change overrides and/or manifest file
	const commitList: Commit[] = await getChangelog(since, to, [modpackManifest.overrides, "manifest.json"]);

	// Parse Commit List
	commitList.forEach((commit) => {
		/* TODO Remove this after 1.7, when its no longer needed */
		// TODO Simply add the commit to formattedCommits, in an else block, after checking for `if(commit.body)`
		let skipParsingBody = false;

		if (!commit.message.includes(skipKey)) {
			// If contained keys
			const successParsingMessage = parseCommit(commit, true);
			if (successParsingMessage) {
				skipParsingBody = true;
				formattedCommits.push(formatCommit(commit));
			}
		} else {
			skipParsingBody = true;
		}

		if (commit.body && !skipParsingBody) {
			if (!commit.body.includes(skipKey)) {
				if (!parseCommit(commit)) {
					generalCategory.changelogSection.get(other).push({
						commitMessage: commit.message,
						commitObject: commit,
					});
				}
				formattedCommits.push(formatCommit(commit));
			}
		}
	});

	// Transform commit list into list of SHAs (to compare)
	const SHAList: string[] = [];
	commitList.forEach((commit) => {
		SHAList.push(commit.hash);
	});

	// Get all commits
	const secondaryCommitList: Commit[] = await getChangelog(since, to);

	// Parse commit list
	secondaryCommitList.forEach((commit) => {
		// If not in parsed SHA List, and has a body
		if (commit.body && !SHAList.includes(commit.hash)) {
			if (!commit.body.includes(skipKey)) {
				if (parseCommit(commit)) {
					formattedCommits.push(formatCommit(commit));
				}
			}
		}
	});

	// Push mod update blocks to General Changes.
	await pushModChangesToGenerals(since);

	// TODO REMOVE THIS AFTER 1.7 PLEASE
	// Push stupid key [QB HM] to QB's HM category
	QBHMCompat.changelogSection.get(emptySubCategory).forEach((changelogMessage) => {
		questBookCategory.changelogSection.get(hardMode).push(changelogMessage);
	});

	// Remove QB HN Compat Category from list.
	const index = categories.indexOf(QBHMCompat);
	if (index > -1) {
		categories.splice(index, 1);
	}

	// If the UPDATENOTES.md file is present, prepend it verbatim.
	if (fs.existsSync("../UPDATENOTES.md")) {
		pushToBuilders((await fs.promises.readFile("../UPDATENOTES.md")).toString());
	}

	// Push the title.
	pushToBuilders(`# Changes since ${since}`);

	// Push Sections of Changelog
	categories.forEach((category) => {
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
				list.sort((messageA, messageB): number => {
					const dateA = new Date(messageA.commitObject.date);
					const dateB = new Date(messageB.commitObject.date);
					return dateA.getTime() - dateB.getTime() !== 0
						? dateA.getTime() - dateB.getTime()
						: messageA.commitMessage.localeCompare(messageB.commitMessage);
				});

				// Push Log
				list.forEach((changelogMessage) => {
					categoryLog.push(formatChangelogMessage(changelogMessage));
				});
				categoryLog.push("");
				hasValues = true;
			}
		});
		if (hasValues) {
			// Push Title
			pushToBuilders(`## ${category.categoryName}:`);

			// Push previously made log
			pushToBuilders(...categoryLog);
		}
	});

	// Push the commit log
	if (formattedCommits) {
		pushToBuilders("");
		pushToBuilders("## Commits");
		pushToBuilders(formattedCommits.join("\n"));
	}

	// Check if the builder only contains the title.
	if (builderGH.length == 1) {
		pushToBuilders("");
		pushToBuilders("There haven't been any changes.");
	}

	// TODO allow changing of output dir
	await fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG.md"), builderGH.join("\n"));
	return fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG_CF.md"), builderCF.join("\n"));
}

/**
 * Initializes the categorySection field of the categoryKey.
 * @param categoryKey The Category Key to grab the Sub Categories from
 */
function initializeCategorySection(categoryKey: Category): void {
	const categorySection = new Map<SubCategory, ChangelogMessage[]>();
	categoryKey.subCategories.forEach((subCategory) => {
		categorySection.set(subCategory, []);
	});
	categoryKey.changelogSection = categorySection;
}

/**
 * Adds the strings to both builders, in the correct format.
 * @param markdownStrings The strings to add, formatted in markdown.
 */
function pushToBuilders(...markdownStrings: string[]) {
	let htmlString: string;
	markdownStrings.forEach((markdownString) => {
		htmlString = marked.parse(markdownString);
		builderGH.push(markdownString);
		builderCF.push(htmlString);
	});
}

// TODO remove useMessage after 1.7
function parseCommit(commit: Commit, useMessage = false): boolean {
	if (useMessage) {
		return sortCommit(commit.message, commit.message, commit, "", true);
	}
	if (commit.body.includes(expandKey)) {
		deCompExpand(commit.message, commit.body);
		return true;
	}
	if (commit.body.includes(detailsKey)) {
		deCompDetails(commit.message, commit.body);
		return true;
	}
	if (commit.body.includes(noCategoryKey)) {
		return true;
	}
	return sortCommit(commit.message, commit.body, commit);
}

// TODO Remove `compat` after 1.7
/**
 * Adds the (commit) message to its correct category. DO NOT CALL! Call `parseCommit`.
 * @param message The message to add
 * @param commitBody The body to use to sort
 * @param commit The commit object to grab date, author and SHA from
 * @param indentation The indentation of the message, if needed. Defaults to "".
 * @param compat If tag is found in message, whether to remove. REMOVE AFTER 1.7!
 * @return added If the commit message was added to a category
 */
function sortCommit(message: string, commitBody: string, commit: Commit, indentation = "", compat = false): boolean {
	for (const category of categories) {
		if (category.commitKey !== undefined) {
			if (commitBody.includes(category.commitKey)) {
				if (message.includes(category.commitKey) && compat) {
					message = message.replace(category.commitKey, "");
				}
				message = message.trim();
				const subCategory = findSubCategory(commitBody, category);
				if (subCategory) {
					category.changelogSection.get(subCategory).push({
						commitMessage: message,
						commitObject: commit,
						indentation: indentation,
					});
				}
				return true;
			}
		}
	}
	return false;
}

/**
 * Finds the correct Sub Category a commit should go in. Must be given the Category first!
 */
function findSubCategory(commitBody: string, category: Category): SubCategory | undefined {
	for (const subCategory of category.subCategories) {
		if (subCategory.commitKey !== undefined) {
			if (commitBody.includes(subCategory.commitKey)) {
				return subCategory;
			}
		}
	}
	if (category.defaultSubCategory) {
		return category.defaultSubCategory;
	}
	return undefined;
}

/**
 * Formats a Changelog Message
 * @param changelogMessage The message to format.
 * @return string Formatted Changelog Message
 */
function formatChangelogMessage(changelogMessage: ChangelogMessage): string {
	const indentation = changelogMessage.indentation == undefined ? "" : changelogMessage.indentation;
	const message = changelogMessage.commitMessage;

	if (changelogMessage.commitObject) {
		const commit = changelogMessage.commitObject;
		const date = new Date(commit.date).toLocaleDateString("en-us", { year: "numeric", month: "short", day: "numeric" });
		const shortSHA = commit.hash.substring(0, 7);
		const author = commit.author_name;

		return `${indentation}* ${message} - **${author}** ([\`${shortSHA}\`](${commitLinkFormat}${commit.hash}), ${date})`;
	}

	return `${indentation}* ${message}`;
}

/**
 * The link to a commit, without the commit hash itself
 */
const commitLinkFormat = "https://github.com/Nomi-CEu/Nomi-CEu/commit/";

/**
 * Returns a formatted commit
 */
function formatCommit(commit: Commit): string {
	const date = new Date(commit.date).toLocaleDateString("en-us", { year: "numeric", month: "short", day: "numeric" });
	const formattedCommit = `${commit.message} - **${commit.author_name}** (${date})`;

	const shortSHA = commit.hash.substring(0, 7);

	return `* [\`${shortSHA}\`](${commitLinkFormat}${commit.hash}): ${formattedCommit}`;
}

/**
 * Decompiles a commit with 'expand'.
 */
function deCompExpand(commitMessage: string, commitBody: string): void {
	//TODO This is going to be really hard...
}

/**
 * Decompiles a commit with 'details'.
 */
function deCompDetails(commitMessage: string, commitBody: string): void {
	//TODO This is going to be hard...
}

async function pushModChangesToGenerals(since: string) {
	const old = JSON.parse(getFileAtRevision("manifest.json", since)) as ModpackManifest;
	const comparisonResult = await compareAndExpandManifestDependencies(old, modpackManifest);
	// TODO add version of mods, and commit SHAs?
	[
		{
			subCategory: modAdditions,
			list: comparisonResult.added,
		},
		{
			subCategory: modUpdates,
			list: comparisonResult.modified,
		},
		{
			subCategory: modRemovals,
			list: comparisonResult.removed,
		},
	].forEach((block) => {
		if (block.list.length == 0) {
			return;
		}
		const list = block.list
			// Yeet invalid project names.
			.filter((project) => !/project-\d*/.test(project))
			.sort()
			.map((name) => name);

		list.forEach((message) => {
			generalCategory.changelogSection.get(block.subCategory).push({
				commitMessage: message,
			});
		});
	});
}
