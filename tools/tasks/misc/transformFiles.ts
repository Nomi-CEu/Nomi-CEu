import fs from "fs";
import upath from "upath";
import {
	configFolder,
	configOverridesFolder,
	rootDirectory,
	serverDestDirectory,
	sharedDestDirectory,
	templatesFolder,
} from "../../globals";
import mustache from "mustache";
import gulp from "gulp";
import dedent from "dedent-js";
import { isEnvVariableSet } from "../../util/util";
import sortedStringify from "json-stable-stringify-without-jsonify";
import { error } from "fancy-log";
import { BuildData } from "../../types/transformFiles";

// This updates all the files, for a release.

// If it is not a release or build, and thus no changes to versions need to be made.
// This occurs when the files are to be updated from the templates outside of a release or a build.
let updateFiles: boolean;
let updateFileVersion: string;
let updateFileTransformedVersion: string;

let buildData: BuildData;

async function updateFilesSetup(): Promise<void> {
	updateFiles = false;
	// See if current run is to update files
	if (isEnvVariableSet("UPDATE_FILES")) {
		try {
			updateFiles = JSON.parse(process.env.UPDATE_FILES.toLowerCase());
		} catch (err) {
			throw new Error("Update Files Env Variable set to Invalid Value.");
		}
	}
	buildData = new BuildData();

	const versionsFilePath: string = upath.join(templatesFolder, "versions.txt");
	updateFileVersion = "";

	if (!buildData.isVersionBuild() && !updateFiles) return;

	// Versions.txt handling
	if (!fs.existsSync(versionsFilePath)) {
		if (updateFiles) {
			if (!buildData.isVersionBuild())
				throw new Error(
					"In order to update files, needs versions.txt to exist and have values, or the version to be set via the GITHUB_TAG environmental variable.",
				);
			updateFileVersion = buildData.rawVersion;
			updateFileTransformedVersion = buildData.transformedVersion;
			return;
		}
		error("Version.txt does not exist. Creating empty file. This may be an error.");

		// Create Versions.txt
		fs.closeSync(fs.openSync(versionsFilePath, "w"));
	} else {
		const versionList = await fs.promises.readFile(versionsFilePath, "utf8");

		if (updateFiles) {
			if (!versionList) {
				if (!buildData.isVersionBuild())
					throw new Error(
						"In order to update files, needs versions.txt to exist and have values, or the version to be set via the GITHUB_TAG environmental variable.",
					);
				updateFileVersion = buildData.rawVersion;
				updateFileTransformedVersion = buildData.transformedVersion;
				return;
			}
			updateFileVersion = versionList.split("\n")[0].replace("-", "").trim();
			updateFileTransformedVersion = `v${updateFileVersion}`;
			return;
		}

		// Duplicate Key
		if (versionList.includes(`${buildData.rawVersion}\n`)) {
			throw new Error("Version already exists in version.txt. Exiting...");
		}
	}
}

async function updateFilesBuildSetup() {
	updateFiles = true;
	buildData = new BuildData();
	updateFileVersion = buildData.rawVersion;
	updateFileTransformedVersion = buildData.transformedVersion;
}

export async function updateBuildServerProperties(): Promise<void> {
	await updateFilesBuildSetup();

	// Note we can't use the `configOverridesFolder` variable as that includes `overrides/`

	// File name of the output files
	const fileName = "server.properties";

	// File name of the Normal Template File
	const fileNameNormal = "server_normal.properties";

	// File name of the Expert Template File
	const fileNameExpert = "server_expert.properties";

	// Replacement Object
	const replacementObject: Record<string, unknown> = {
		versionTitle: updateFiles ? updateFileTransformedVersion : buildData.transformedVersion,
	};

	// Read and Write paths for normal
	const readPathNormal: string = upath.join(templatesFolder, fileNameNormal);
	const writePathsNormal: string[] = [
		upath.join(serverDestDirectory, fileName),
		upath.join(serverDestDirectory, "config-overrides", "normal", fileName),
	];

	// Modify Normal File
	await modifyFile(readPathNormal, writePathsNormal, replacementObject, false);

	// Read and Write paths for expert
	const readPathExpert: string = upath.join(templatesFolder, fileNameExpert);
	const writePathExpert: string = upath.join(serverDestDirectory, "config-overrides", "expert", fileName);

	// Modify Expert File
	await modifyFile(readPathExpert, [writePathExpert], replacementObject, false);
}

export async function updateBuildRandomPatches(): Promise<void> {
	await updateFilesBuildSetup();

	// Filename & paths
	const fileName = "randompatches.cfg";
	const readPath: string = upath.join(templatesFolder, fileName);
	const writePathsNormal: string[] = [
		upath.join(sharedDestDirectory, configFolder, fileName),
		upath.join(sharedDestDirectory, configOverridesFolder, "normal", fileName),
	];

	// Replacement object
	const replacementObject: Record<string, unknown> = {
		versionTitle: updateFiles ? updateFileTransformedVersion : buildData.transformedVersion,
		mode: "Normal",
	};

	// Modify Normal File
	await modifyFile(readPath, writePathsNormal, replacementObject, false);

	// Change values for Expert Config
	replacementObject["mode"] = "Expert";
	const writePathExpert = upath.join(sharedDestDirectory, configOverridesFolder, "expert", fileName);

	// Modify Expert File
	await modifyFile(readPath, [writePathExpert], replacementObject, false);
}

/**
 * @param readPath The filepath to read from. (Template)
 * @param writePaths The filepaths to write to.
 * @param replacementObject A record, of type string to type unknown, containing the keys, and replacement for those keys
 * @param addWarning whether to add warning not to edit file
 * <p>
 * <p>
 * A warning not to edit the file will also be added to the start of the file.
 */
async function modifyFile(
	readPath: string,
	writePaths: string[],
	replacementObject: Record<string, unknown>,
	addWarning = true,
) {
	// Read the file content
	const data: string = await fs.promises.readFile(readPath, "utf8");

	// Moustache Render
	let modifiedData: string = mustache.render(data, replacementObject);

	// Add warning to not edit file
	if (addWarning)
		modifiedData = dedent`# DO NOT EDIT THIS FILE! EDIT THE TEMPlATES INSTEAD!
			# See https://github.com/Nomi-CEu/Nomi-CEu/wiki/Part-1:-Contributing-Information#section-5-template-information!
			${modifiedData}`;

	// Write the modified content back to the file
	for (const filename of writePaths) {
		await fs.promises.writeFile(filename, modifiedData, "utf8");
	}
}

async function updateIssueTemplates(): Promise<void> {
	// Filenames
	const fileNames: string[] = ["001-bug-report.yml", "002-feature-request.yml"];

	const versionsFilePath: string = upath.join(templatesFolder, "versions.txt");

	let versionList: string = await fs.promises.readFile(versionsFilePath, "utf8");

	if (!updateFiles) {
		if (!buildData.isVersionBuild())
			throw new Error(
				"In order to update Issue Templates, the version must be set via the GITHUB_TAG environmental variable.",
			);
		// Add new version to list, with indent
		versionList = `        - ${buildData.rawVersion}\n${versionList}`;
	}

	// Replacement Object
	const replacementObject: Record<string, unknown> = {
		versions: versionList,
	};

	// Write updated Version List
	await fs.promises.writeFile(versionsFilePath, versionList);

	const issueTemplatesFolder: string = upath.join(rootDirectory, ".github", "ISSUE_TEMPLATE");

	// Write to issue templates
	for (const fileName of fileNames) {
		const readPath = upath.join(templatesFolder, fileName);
		const writePath = upath.join(issueTemplatesFolder, fileName);
		await modifyFile(readPath, [writePath], replacementObject);
	}
}

async function updateRandomPatchesConfig(): Promise<void> {
	// Filename & paths
	const fileName = "randompatches.cfg";
	const readPath: string = upath.join(templatesFolder, fileName);
	const writePathsNormal: string[] = [
		upath.join(rootDirectory, configFolder, fileName),
		upath.join(rootDirectory, configOverridesFolder, "normal", fileName),
	];

	// Replacement object
	const replacementObject: Record<string, unknown> = {
		versionTitle: updateFiles ? updateFileTransformedVersion : buildData.transformedVersion,
		mode: "Normal",
	};

	// Modify Normal File
	await modifyFile(readPath, writePathsNormal, replacementObject);

	// Change values for Expert Config
	replacementObject["mode"] = "Expert";
	const writePathExpert = upath.join(rootDirectory, configOverridesFolder, "expert", fileName);

	// Modify Expert File
	await modifyFile(readPath, [writePathExpert], replacementObject);
}

async function updateServerProperties(): Promise<void> {
	// File name of the output files
	const fileName = "server.properties";

	// File name of the Normal Template File
	const fileNameNormal = "server_normal.properties";

	// File name of the Expert Template File
	const fileNameExpert = "server_expert.properties";

	// Replacement Object
	const replacementObject: Record<string, unknown> = {
		versionTitle: updateFiles ? updateFileTransformedVersion : buildData.transformedVersion,
	};

	// Read and Write paths for normal
	const readPathNormal: string = upath.join(templatesFolder, fileNameNormal);
	const writePathsNormal: string[] = [
		upath.join(rootDirectory, "serverfiles", fileName),
		upath.join(rootDirectory, configOverridesFolder, "normal", fileName),
	];

	// Modify Normal File
	await modifyFile(readPathNormal, writePathsNormal, replacementObject);

	// Read and Write paths for expert
	const readPathExpert: string = upath.join(templatesFolder, fileNameExpert);
	const writePathExpert: string = upath.join(rootDirectory, configOverridesFolder, "expert", fileName);

	// Modify Expert File
	await modifyFile(readPathExpert, [writePathExpert], replacementObject);
}

async function updateMainMenuConfig(): Promise<void> {
	// Filename & paths
	const fileName = "mainmenu.json";
	const readPath: string = upath.join(templatesFolder, fileName);
	const writePath: string = upath.join(rootDirectory, configFolder, "CustomMainMenu", fileName);

	if (!updateFiles && !buildData.isVersionBuild())
		throw new Error(
			"The main menu should only be updated if the version is set via the GITHUB_TAG environmental variable.",
		);

	// Replacement object
	const replacementObject: Record<string, unknown> = {
		version: updateFiles ? updateFileVersion : buildData.rawVersion,
	};

	// Read file
	const data: string = await fs.promises.readFile(readPath, "utf8");

	// Moustache Render
	const modifiedData = JSON.parse(mustache.render(data, replacementObject));

	// Add warning to not edit file
	modifiedData["_comment"] =
		"DO NOT EDIT THIS FILE! EDIT THE TEMPlATES INSTEAD! See https://github.com/Nomi-CEu/Nomi-CEu/wiki/Part-1:-Contributing-Information#section-5-template-information!";

	// Sort keys so that comment appears first
	return await fs.promises.writeFile(writePath, sortedStringify(modifiedData, { space: 2 }), "utf8");
}

export const updateFilesIssue = gulp.series(updateFilesSetup, updateIssueTemplates);
export const updateFilesRandomPatches = gulp.series(updateFilesSetup, updateRandomPatchesConfig);
export const updateFilesServer = gulp.series(updateFilesSetup, updateServerProperties);
export const updateFilesMainMenu = gulp.series(updateFilesSetup, updateMainMenuConfig);

export const updateAll = gulp.series(
	updateFilesSetup,
	updateIssueTemplates,
	updateRandomPatchesConfig,
	updateServerProperties,
	updateMainMenuConfig,
);
