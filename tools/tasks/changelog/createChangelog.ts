import fs from "fs";
import { rootDirectory } from "../../globals";
import upath from "upath";
import marked from "marked";
import buildConfig from "../../buildConfig";
import { categoriesSetup } from "./categoryManagement";
import ChangelogData from "./changelogData";
import { parsers } from "./definitions";
import parse from "./parser";
import { specialParserSetup } from "./specialParser";
import generateModChanges from "./generateModChanges";
import pushAll, { pushChangelog, pushSeperator, pushTitle } from "./pusher";
import log from "fancy-log";

/**
 * Generates a changelog based on environmental variables, and saves it a changelog data class.
 */
async function createChangelog(): Promise<ChangelogData> {
	const data: ChangelogData = new ChangelogData();

	await data.init();

	// Handle Iterations
	if (data.shouldIterate()) {
		const tags = data.getIterations();
		pushTitle(data);
		for (const tag of tags) {
			const iteration = tags.indexOf(tag);
			log(`Iteration ${iteration + 1} of Changelog.`);
			data.setupIteration(tag);
			categoriesSetup();
			specialParserSetup(data);

			for (const parser of parsers) {
				await parse(data, parser);
			}

			await generateModChanges(data);

			await pushChangelog(data);
			if (iteration < tags.length - 1) {
				// More to go
				pushSeperator(data);
				data.resetForIteration();
			}
		}
		return data;
	}
	log("No Iterations Detected.");

	categoriesSetup();
	specialParserSetup(data);

	for (const parser of parsers) {
		await parse(data, parser);
	}

	await generateModChanges(data);

	await pushAll(data);

	return data;
}

/**
 * Creates a changelog based on environment variables, and saves it to the root directory.
 */
export const createRootChangelog = async (): Promise<void> => {
	// Make a changelog, and save it.
	const builder = (await createChangelog()).builder;

	// Write files.
	await fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG.md"), builder.join("\n"));
	return fs.promises.writeFile(upath.join(rootDirectory, "CHANGELOG_CF.md"), marked.parse(builder.join("\n")));
};

/**
 * Creates a changelog based on environment variables, and saves it to the build directory.
 */
export const createBuildChangelog = async (): Promise<void> => {
	// Make a changelog, and save it.
	const builder = (await createChangelog()).builder;

	// Write files.
	await fs.promises.writeFile(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md"), builder.join("\n"));
	return fs.promises.writeFile(
		upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG_CF.md"),
		marked.parse(builder.join("\n")),
	);
};
