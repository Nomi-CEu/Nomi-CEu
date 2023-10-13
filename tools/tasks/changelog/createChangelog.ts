import { getLastGitTag, isEnvVariableSet } from "../../util/util";
import fs from "fs";
import { rootDirectory } from "../../globals";
import upath from "upath";
import marked from "marked";
import buildConfig from "../../buildConfig";
import { categoriesInit } from "./categoryManagement";
import { Commit } from "../../types/changelogTypes";
import { parserSetup } from "./parser";

// Whether the current run is to test a commit. If this is true, then errors will be thrown, and error messages will be slightly changed.
export let isTest = false;

// Final Builders
let builder: string[];

/**
 * Generates a changelog based on environmental variables, and saves it to the builder.
 */
async function createChangelog(): Promise<string[]> {
	changelogSetup();
	categoriesInit();
  parserSetup();


	return builder;
}

function changelogSetup() {
	let since = getLastGitTag();
	let to = "HEAD";

	// If this is a tagged build, fetch the tag before last.
	if (isEnvVariableSet("GITHUB_TAG")) {
		since = getLastGitTag(process.env.GITHUB_TAG);
		to = process.env.GITHUB_TAG;
	}
	// Back-compat in case this crap is still around.
	else if (since == "latest-dev-preview") {
		since = getLastGitTag(since);
	}

	// Get Release Type
	let releaseType = "Release";
	if (isEnvVariableSet("RELEASE_TYPE")) releaseType = process.env.RELEASE_TYPE;

	// See if current run is test
	if (isEnvVariableSet("TEST_CHANGELOG")) isTest = true;

	// Initialise Final Builder
	builder = [];

	// List of all commits to put into changelog commit section
	const changelogCommitList: Commit[] = [];
}

/**
 * Creates a changelog based on environment variables, and saves it to the root directory.
 */
export const createRootChangelog = async (): Promise<void> => {
	// Make a changelog, and save it to the builder.
	await createChangelog();

	// Write files.
	await fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG.md"), builder.join("\n"));
	return fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG_CF.md"), marked.parse(builder.join("\n")));
};

/**
 * Creates a changelog based on environment variables, and saves it to the build directory.
 */
export const createBuildChangelog = async (): Promise<void> => {
	// Make a changelog, and save it to the builder.
	await createChangelog();

	// Write files.
	await fs.promises.writeFile(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md"), builder.join("\n"));
	return fs.promises.writeFile(
		upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG_CF.md"),
		marked.parse(builder.join("\n")),
	);
};
