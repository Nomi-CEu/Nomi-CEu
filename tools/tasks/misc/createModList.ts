import log, { error } from "fancy-log";
import { fetchFileInfo, fetchFilesBulk, fetchProject, fetchProjectsBulk } from "../../util/curseForgeAPI";
import { modpackManifest, rootDirectory, templatesFolder } from "../../globals";
import { checkGitTag, cleanupVersion, getFileAtRevision, isEnvVariableSet } from "../../util/util";
import fs from "fs";
import upath from "upath";
import { ModpackManifest, ModpackManifestFile } from "../../types/modpackManifest";
import { InputReleaseType } from "../../types/changelogTypes";
import mustache from "mustache";
import dedent from "dedent-js";
import { CurseForgeFileInfo, CurseForgeModInfo } from "../../types/curseForge";

const inputPath: string = upath.join(templatesFolder, "MOD_INFO.md");
const outputPath: string = upath.join(rootDirectory, "MOD_INFO.md");

// noinspection JSUnusedGlobalSymbols
enum ModListReleaseType {
	Release = "Release",
	"Alpha Release" = "Alpha Release",
	"Beta Release" = "Beta Release",
}

/**
 * This is the key the given modlist should replace in the template file. Also the key for the files which stores the modlists for each release type.
 * <p>
 * The release type (Release, Alpha Release, Beta Release) or Cutting Edge is appended to this. (All caps)
 * <p>
 * Example: if set to MOD_LIST:
 * <p>
 * Release: RELEASE_MOD_LIST
 * <p>
 * Alpha Release: ALPHA_RELEASE_MOD_LIST
 * <p>
 * Beta Release: BETA_RELEASE_MOD_LIST
 */
const key = "MOD_LIST";

// If this is changed, all of the saved mod lists must be updated, as the Table of Contents generater relies on this!
const anchor = '<a id="{{{ type }}}"></a>';

const sectionTitleNoVersion = "## Latest {{{ type }}} Mod Information:";
const sectionTitleVersion = "## Latest {{{ type }}} (v{{{ version }}}) Mod Information:";

export interface ModFileInfo {
	modInfo: CurseForgeModInfo;
	fileInfo: CurseForgeFileInfo;
	inClient: boolean;
	inServer: boolean;
}

/**
 * Fetches mod links and builds a modlist, in Markdown format.
 */
export async function createModList(tag = ""): Promise<ModFileInfo[]> {
	log("Fetching mod & file infos...");

	let manifest: ModpackManifest = modpackManifest;

	if (tag) {
		checkGitTag(tag);
		manifest = JSON.parse(getFileAtRevision("manifest.json", tag));
	}

	manifest.files.sort((a, b) => a.projectID - b.projectID);

	// Fetch mod/addon & file infos, discard result. Further calls will hit cache.
	await fetchProjectsBulk(manifest.files.map((mod) => mod.projectID));
	await fetchFilesBulk(
		// Use this instead of referencing the original array, as .sort sorts the input array
		[...manifest.files]
			.sort((a, b) => a.fileID - b.fileID)
			.map((mod) => {
				return { projectID: mod.projectID, fileID: mod.fileID };
			}),
	);

	log("Fetched Infos. Creating modlist...");

	// Create modlist
	const output: ModFileInfo[] = [];

	for (const file of manifest.files) {
		const itemModInfo = await fetchProject(file.projectID);
		const itemFileInfo = await fetchFileInfo(file.projectID, file.fileID);

		let itemInClient = false;
		let itemInServer = false;
		if (file.sides) {
			if (file.sides.includes("client")) itemInClient = true;

			if (file.sides.includes("server")) itemInServer = true;
		} else {
			itemInClient = true;
			itemInServer = true;
		}

		output.push({
			modInfo: itemModInfo,
			fileInfo: itemFileInfo,
			inClient: itemInClient,
			inServer: itemInServer,
		});
	}
	return output;
}

/**
 * Updates a mod list in `MOD_INFO.md`, based on environment variables.
 */
export default async function updateModList(): Promise<void> {
	const releaseType: InputReleaseType = isEnvVariableSet("RELEASE_TYPE")
		? (process.env.RELEASE_TYPE as InputReleaseType)
		: "Release";

	if (releaseType === "Cutting Edge Build") {
		throw new Error(
			"Release Type cannot be 'Cutting Edge Build'! GitHub State is given as a list of mod changes, in CHANGELOG.md!",
		);
	}

	let checkoutTag = "";
	let version = "";
	if (isEnvVariableSet("GITHUB_TAG")) {
		// Updating a release type based on a Github Tag.
		checkoutTag = process.env.GITHUB_TAG;
		version = process.env.GITHUB_TAG;
	} else if (isEnvVariableSet("VERSION")) version = process.env.VERSION;

	return updateVersionModList(releaseType, version, checkoutTag);
}

/**
 * Updates a specified mod list in `MOD_INFO.md` Can also create the mod list from a particular tag.
 * @param releaseType The version type to update.
 * @param releaseVersion The newest Release Version. Defaults to empty string. If empty string, then will not include release version.
 * @param checkoutTag The tag to use files from. Defaults to empty string (will just use HEAD/current file state).
 */
export async function updateVersionModList(
	releaseType: InputReleaseType,
	releaseVersion = "",
	checkoutTag = "",
): Promise<void> {
	const modListType = ModListReleaseType[releaseType];
	const key = getKey(modListType);

	await fs.promises.writeFile(
		upath.join(templatesFolder, `${key}.txt`),
		getFormattedModList(await createModList(checkoutTag), modListType, releaseVersion),
	);
	log(`Created Mod List for ${modListType}.`);

	const modLists: Map<ModListReleaseType, string> = new Map<ModListReleaseType, string>();
	for (const type of Object.values(ModListReleaseType)) {
		const path = upath.join(templatesFolder, `${getKey(type)}.txt`);
		if (!fs.existsSync(path)) {
			error(`No saved mod list for ${type}! This may be an error!`);
			modLists.set(type, "");
		} else {
			modLists.set(type, await fs.promises.readFile(path, "utf8"));
			log(`Loaded ${type}'s Mod List.`);
		}
	}

	const tableOfContents = ["# Table Of Contents:"];
	let hasInfo = false;
	let numLists = 0;
	modLists.forEach((modList, type) => {
		if (modList) {
			hasInfo = true;
			numLists++;
			tableOfContents.push(` - [Latest ${type} Mod Information](#${getAnchorText(type)})`);
		}
	});

	if (!hasInfo) {
		error("No Info for any mod list found! Not writing a mod list file!");
		return fs.promises.rm(outputPath);
	}

	log(`Added ${numLists} Mod List(s)!`);

	const replacementObj = {};
	modLists.forEach((modList, type) => (replacementObj[getKey(type)] = modList));

	const data = await fs.promises.readFile(inputPath, "utf8");
	let modifiedData = mustache.render(data, replacementObj);

	// Add warning not to edit file
	modifiedData = dedent`
		[//]: # (DO NOT EDIT THIS FILE! EDIT THE TEMPlATES INSTEAD!)
		[//]: # (See https://github.com/Nomi-CEu/Nomi-CEu/blob/main/CONTRIBUTING.md#section-5-template-information!)
		
		${tableOfContents.join("\n")}
		
		${modifiedData}
  `;

	return fs.promises.writeFile(outputPath, modifiedData);
}

function getKey(modListType: ModListReleaseType): string {
	return `${modListType.toUpperCase().replace(/ /g, "_")}_${key}`;
}

function getAnchorText(modListType: ModListReleaseType): string {
	return modListType.toLowerCase().replace(/ /g, "-");
}

function getFormattedModList(
	modListOutput: ModFileInfo[],
	modListType: ModListReleaseType,
	releaseVersion = "",
): string {
	const output: string = modListOutput.toString();
	return output;
}
