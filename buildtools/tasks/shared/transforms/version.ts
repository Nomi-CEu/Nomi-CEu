import fs from "fs";
import upath from "path";
import mustache from "mustache";
import { modpackManifest, overridesFolder, sharedDestDirectory } from "../../../globals";

const randomPatchesConfigFile = "config/randompatches.cfg";

/**
 * Transform the version field of manifest.json.
 */
export default async function transformManifestVersion(): Promise<void> {
	let versionTitle;

	// We're building a tag.
	if (process.env.GITHUB_TAG) {
		const flavorTitle = process.env.BUILD_FLAVOR_TITLE;
		const tag = process.env.GITHUB_TAG.replace(/^v/, "");

		versionTitle = [modpackManifest.name, tag, flavorTitle].filter(Boolean).join(" - ");

		modpackManifest.version = tag;
	}
	// If we're buildig a release candidate, transform it appropriately.
	else if (process.env.RC_VERSION) {
		const rcVer = process.env.RC_VERSION;
		const flavorTitle = process.env.BUILD_FLAVOR_TITLE;
		const tag = rcVer.replace(/^v/, "");

		versionTitle = [modpackManifest.name, [tag, "Release Candidate"].join(" "), flavorTitle]
			.filter(Boolean)
			.join(" - ");

		modpackManifest.version = [rcVer, "rc"].join("-");
	}
	// If SHA is provided and the build isn't tagged, append both the branch and short SHA.
	else if (process.env.GITHUB_SHA && process.env.GITHUB_REF && process.env.GITHUB_REF.startsWith("refs/heads/")) {
		const shortCommit = process.env.GITHUB_SHA.substr(0, 7);
		const branch = /refs\/heads\/(.+)/.exec(process.env.GITHUB_REF)?.[1];
		if (!branch) {
			throw new Error(`Invalid git ref: ${process.env.GITHUB_REF}`);
		}

		versionTitle = `${modpackManifest.name} (${branch} branch, ${shortCommit})`;

		modpackManifest.version = `${branch}-${shortCommit}`;
	} else {
		versionTitle = `${modpackManifest.name} (manual build)`;

		modpackManifest.version = "manual-build";
	}

	modpackManifest.name = versionTitle;

	const randomPatchesConfigFilePath = upath.join(sharedDestDirectory, overridesFolder, randomPatchesConfigFile);
	const randomPatchesFile = (await fs.promises.readFile(randomPatchesConfigFilePath)).toString();

	return fs.promises.writeFile(
		randomPatchesConfigFilePath,
		mustache.render(randomPatchesFile, {
			title: versionTitle,
		}),
	);
}
