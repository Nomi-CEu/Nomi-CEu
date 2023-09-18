import fs from "fs";
import upath from "upath";
import { configFolder, configOverridesFolder, issueTemplatesFolder, templatesFolder } from "../../globals";
import mustache from "mustache";

// Regex and Replacement for Issue
const regexIssue = /pattern_to_match/g;
const replacementIssue = "replacement_text";

// Regex and Replacement for Random Tweaks Config Files
const regexCfg = /pattern_to_match/g;
const replacementCfg = "replacement_text";

// Regex and Replacement for Server Properties Files
const regexServer = /pattern_to_match/g;
const replacementServer = "replacement_text";

// Temp/Debug
const tempVersion = "2.0";

/**
 * @param readPath The filepath to read from. (Template)
 * @param writePaths The filepaths to write to.
 * @param replacementObject A record, of type string to type unknown, containing the keys, and replacement for those keys
 * <p>
 * <p>
 * Pattern regExps[0] will be replaced by replacements[0], etc.
 * <p>
 * <p>
 * A warning not to edit the file will also be added to the start of the file.
 */
async function modifyFile(readPath: string, writePaths: string[], replacementObject: Record<string, unknown>) {
	// Read the file content
	const data = await fs.promises.readFile(readPath, "utf8");

	// Moustache Render
	const modifiedData = mustache.render(data, replacementObject);

	// Write the modified content back to the file
	for (const filename of writePaths) {
		await fs.promises.writeFile(filename, modifiedData, "utf8");
	}
}

export async function updateIssueTemplates(): Promise<void> {
	const fileNames: string[] = ["001-bug-report.yml", "002-feature-request.yml"];

	const versionsFilePath = upath.join(templatesFolder, "versions.txt");
	const versionList = await fs.promises.readFile(versionsFilePath, "utf8");
	const newVersionList = `- ${tempVersion} \n ${versionList}`;

	const replacementObject: Record<string, unknown> = {
		versions: newVersionList,
	};

	await fs.promises.writeFile(versionsFilePath, newVersionList);

	for (const fileName of fileNames) {
		const readPath = upath.join(templatesFolder, fileName);
		const writePath = upath.join(issueTemplatesFolder, fileName);
		await modifyFile(readPath, [writePath], replacementObject);
	}
}

export async function updateRandomTweaksConfig(): Promise<void> {
	const fileName = "randompatches.cfg";
	const readPath = upath.join(templatesFolder, fileName);
	const writePathsNormal: string[] = [
		upath.join(configFolder, fileName),
		upath.join(configOverridesFolder, "normal", fileName),
	];

	const replacementObject: Record<string, unknown> = {
		version: tempVersion,
		mode: "Normal",
	};

	await modifyFile(readPath, writePathsNormal, replacementObject);

	replacementObject["mode"] = "Expert";
	const writePathExpert = upath.join(configOverridesFolder, "expert", fileName);

	await modifyFile(readPath, [writePathExpert], replacementObject);
}
