import fs from "fs";
import upath from "upath";
import { modpackManifest, rootDirectory } from "../../globals";
import { compareAndExpandManifestDependencies, getFileAtRevision, getLastGitTag, getChangelog } from "../../util/util";
import { ModpackManifest } from "../../types/modpackManifest";
import { Commit, Category, SubCategory } from "../../types/changelogTypes";
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
		if (commit.body) {
			if (!commit.body.includes(skipKey)) {
				parseCommit(commit);
				formattedCommits.push(formatCommit(commit));
			}
		}

		/* TODO Remove this after 1.7, when its no longer needed */
		// TODO Simply add the commit to formattedCommits
		if (commit.message) {
			if (!commit.message.includes(skipKey)) {
				if (!commit.body.includes(noCategoryKey)) {
					// If does not contain any keys
					if (!parseCommit(commit)) {
						addMessageToCategory(commit.message, commit, generalCategory, other);
					}
				}
				formattedCommits.push(formatCommit(commit));
			}
		}
	});

	// Get all commit lists
	const secondaryCommitList: Commit[] = await getChangelog(since, to);

	// Parse commit list
	secondaryCommitList.forEach((commit) => {
		// If not in other commit list, and has a body
		if (commit.body && !commitList.includes(commit)) {
			// TODO remove check of message after 1.7, when its no longer needed
			if (!commit.message.includes(skipKey) && !commit.body.includes(skipKey)) {
				if (commit.body.includes(noCategoryKey)) {
					formattedCommits.push(formatCommit(commit));
				}
				if (parseCommit(commit)) {
					formattedCommits.push(formatCommit(commit));
				}
			}
		}
	});

	// Push mod update blocks to General Changes.
	await pushModChangesToGenerals(since);

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

				// Push Log
				categoryLog.push(list.join("\n"));
				categoryLog.push("");

				hasValues = true;
			}
		});
		if (hasValues) {
			// Push Title
			pushToBuilders(`## ${category.categoryName}:`);

			// Push previously made log
			pushToBuilders(categoryLog.join("\n"))
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
	const categorySection = new Map<SubCategory, string[]>();
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

function parseCommit(commit: Commit): boolean {
	if (commit.body.includes(expandKey)) {
		deCompExpand(commit.message, commit.body);
		return true;
	}
	if (commit.body.includes(detailsKey)) {
		deCompDetails(commit.message, commit.body);
		return true;
	}
	return sortCommit(commit.message, commit.body, commit);
}

/**
 * Adds the commit message to its correct category. DO NOT CALL! Call `parseCommit`.
 * @param commitMessage The message to add
 * @param commitBody The body to use to sort
 * @param commit The commit object to grab date, author and SHA from
 * @return added If the commit message was added to a category
 */
function sortCommit(commitMessage: string, commitBody: string, commit: Commit): boolean {
	// TODO add to breaking, balancing, features,
	return false;
}

/**
 * Adds a (commit) message to a category.
 * @param message The message to add.
 * @param commit The commit object to grab date, author and SHA from.
 * @param category The category to put it into.
 * @param subCategory The sub-category to put it into.
 * @param indentation The indentation to put it in. Defaults to "".
 */
function addMessageToCategory(
	message: string,
	commit: Commit,
	category: Category,
	subCategory: SubCategory,
	indentation = "",
): void {
	const date = new Date(commit.date).toLocaleDateString("en-us", { year: "numeric", month: "short", day: "numeric" });
	const shortSHA = commit.hash.substring(0, 7);
	const author = commit.author_name;
	const formattedMessage = `${indentation}* ${message} - **${author}([\`${shortSHA}\`](${commitLinkFormat}${commit.hash}), ${date})`;
	pushToSection(category, subCategory, formattedMessage);
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
			name: "### New mods",
			list: comparisonResult.added,
		},
		{
			name: "### Updated mods",
			list: comparisonResult.modified,
		},
		{
			name: "### Removed mods",
			list: comparisonResult.removed,
		},
	].forEach((block) => {
		if (block.list.length == 0) {
			return;
		}

		pushToSection(generalCategory, other, "\n");
		pushToSection(generalCategory, other, block.name);
		pushToSection(
			generalCategory,
			other,
			...block.list
				// Yeet invalid project names.
				.filter((project) => !/project-\d*/.test(project))
				.sort()
				.map((name) => `* ${name}`),
		);
	});
}

/**
 * Pushes the string(s) to a Category, with a specified Sub Category.
 * @param category The category to push to
 * @param subCategory The Sub Category to push to.
 * @param strings The strings to push.
 */
function pushToSection(category: Category, subCategory: SubCategory, ...strings: string[]) {
	strings.forEach((string) => {
		category.changelogSection.get(subCategory).push(string);
	});
}
