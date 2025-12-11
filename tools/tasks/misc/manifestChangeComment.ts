import fs from "fs";
import upath from "upath";
import { modpackManifest, rootDirectory } from "#globals";
import { ModpackManifest } from "#types/modpackManifest.ts";
import {
	cleanupVersion,
	compareAndExpandManifestDependencies,
	getFileUrl,
} from "#utils/util.ts";
import buildConfig from "#buildConfig";
import { ModChangeInfo } from "#types/changelogTypes.ts";
import mustache from "mustache";

/**
 * Compares the manifest.json in the `temp` directory (on the same level as root) to the current manifest.json.
 * Writes the resultant change description in markdown format in `build/modChanges.md`.
 */
export async function makeManifestChangeComment() {
	const changedManifest = JSON.parse(
		await fs.promises.readFile(
			upath.join(rootDirectory, "..", "temp", "manifest.json"),
			"utf-8",
		),
	) as ModpackManifest;

	const changes = await compareAndExpandManifestDependencies(
		modpackManifest,
		changedManifest,
	);

	// Prepare build dir
	const outputFilePath = upath.join(
		buildConfig.buildDestinationDirectory,
		"modChanges.md",
	);
	if (!fs.existsSync(buildConfig.buildDestinationDirectory)) {
		await fs.promises.mkdir(buildConfig.buildDestinationDirectory, {
			recursive: true,
		});
	} else {
		if (fs.existsSync(outputFilePath)) {
			await fs.promises.rm(outputFilePath);
		}
	}

	if (
		changes.added.length == 0 &&
		changes.removed.length == 0 &&
		changes.modified.length == 0
	) {
		return;
	}

	const description = [];
	description.push("## PR Mod Changes");
	description.push(
		"*This comment is automatically updated with PR changes (when the workflow runs).*",
	);

	printChange(
		changes.added,
		description,
		"[{{{ modName }}}]({{{ modUrl}}}): *[v{{{ newVersion }}}]({{{ newUrl }}})*",
		"Additions",
	);
	printChange(
		changes.removed,
		description,
		"[{{{ modName }}}]({{{ modUrl}}}): *[v{{{ oldVersion }}}]({{{ oldUrl }}})*",
		"Removals",
	);
	printChange(
		changes.modified,
		description,
		"[{{{ modName }}}]({{{ modUrl}}}): *[v{{{ oldVersion }}}]({{{ oldUrl }}}) ⇥ [v{{{ newVersion }}}]({{{ newUrl }}})*",
		"Removals",
	);

	return fs.promises.writeFile(outputFilePath, description.join("\n"));
}

function printChange(
	changes: ModChangeInfo[],
	description: string[],
	template: string,
	type: string,
) {
	if (changes.length === 0) return;

	description.push("", `### Mod ${type}:`);
	changes.sort();

	for (const change of changes) {
		const oldVersion = cleanupVersion(change.old?.displayName);
		const newVersion = cleanupVersion(change.new?.displayName);

		const replacementObj = {
			modName: change.mod.name,
			modUrl: change.mod.links.websiteUrl,
			oldVersion,
			oldUrl: getFileUrl(change.mod, change.old),
			newVersion,
			newUrl: getFileUrl(change.mod, change.new),
		};

		description.push(`- ${mustache.render(template, replacementObj)}`);
	}
}
