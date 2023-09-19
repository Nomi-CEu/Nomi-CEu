import fs from "fs";
import upath from "upath";
import { modpackManifest, rootDirectory } from "../../globals";
import {
	compareAndExpandManifestDependencies,
	getFormattedChangeLog,
	getFileAtRevision,
	getLastGitTag,
} from "../../util/util";
import { ModpackManifest } from "../../types/modpackManifest";

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

	// Get formatted commit log, which change overrides and/or manifest file
	const commitList = getFormattedChangeLog(since, to, [upath.join("..", modpackManifest.overrides), "manifest.json"]);

	const builder: string[] = [];
	// If the UPDATENOTES.md file is present, prepend it verbatim.
	if (fs.existsSync("../UPDATENOTES.md")) {
		builder.push((await fs.promises.readFile("../UPDATENOTES.md")).toString());
	}

	// Push the title.
	builder.push(`# Changes since ${since}`);

	// Push mod update blocks.
	await addModUpdatesToBuilder(builder, since);

	// Push the changelog itself.
	if (commitList) {
		builder.push("");
		builder.push("## Commits");
		builder.push(commitList);
	}

	// Check if the builder only contains the title.
	if (builder.length == 1) {
		builder.push("");
		builder.push("There haven't been any changes.");
	}

	return fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG.md"), builder.join("\n"));
}

async function addModUpdatesToBuilder(builder: string[], since: string) {
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

		builder.push("");
		builder.push(block.name);
		builder.push(
			...block.list
				// Yeet invalid project names.
				.filter((project) => !/project-\d*/.test(project))
				.sort()
				.map((name) => `* ${name}`),
		);
	});
}
