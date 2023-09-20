import fs from "fs";
import upath from "upath";
import { modpackManifest, rootDirectory } from "../../globals";
import { compareAndExpandManifestDependencies, getFileAtRevision, getLastGitTag, getChangelog } from "../../util/util";
import { ModpackManifest } from "../../types/modpackManifest";
import { Commit } from "../../types/commit";
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

	// Get commit log of commits which change overrides and/or manifest file
	const commitList: Commit[] = await getChangelog(since, to, [modpackManifest.overrides, "manifest.json"]);

	// Final Builders
	builderGH = [];
	builderCF = [];

	// Balancing Changes
	const balancing: string[] = [];

	// Bug Fixes
	const bug: string[] = [];

	// Feature Additions
	const features: string[] = [];

	// Formatted Commit List
	const formattedCommits: string[] = [];

	commitList.forEach((commit) => {
		console.log(commit.message);
		if (commit.body) {
			console.log(commit.body);
			if (commit.body.includes("[SKIP]")) {
				console.log("SKIP THIS COMMIT");
			}
		}

		/* TODO Remove this after 1.7, when its no longer needed */
		if (commit.message) {
			if (commit.message.includes("[SKIP]")) {
				console.warn("SKIP THIS COMMIT");
			}
		}
		formattedCommits.push(formatCommit(commit));
	});

	// If the UPDATENOTES.md file is present, prepend it verbatim.
	if (fs.existsSync("../UPDATENOTES.md")) {
		pushToBuilders((await fs.promises.readFile("../UPDATENOTES.md")).toString());
	}

	// Push the title.
	pushToBuilders(`# Changes since ${since}`);

	// Push mod update blocks.
	await addModChangesToBuilders(since);

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

	await fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG.md"), builderGH.join("\n"));
	return fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG_CF.md"), builderCF.join("\n"));
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

function addChangeToCategory() {}

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

async function addModChangesToBuilders(since: string) {
	const old = JSON.parse(getFileAtRevision("manifest.json", since)) as ModpackManifest;
	const comparisonResult = await compareAndExpandManifestDependencies(old, modpackManifest);
	[
		{
			name: "## New mods",
			list: comparisonResult.added,
		},
		{
			name: "## Updated mods",
			list: comparisonResult.modified,
		},
		{
			name: "## Removed mods",
			list: comparisonResult.removed,
		},
	].forEach((block) => {
		if (block.list.length == 0) {
			return;
		}

		pushToBuilders("");
		pushToBuilders(block.name);
		pushToBuilders(
			...block.list
				// Yeet invalid project names.
				.filter((project) => !/project-\d*/.test(project))
				.sort()
				.map((name) => `* ${name}`),
		);
	});
}
