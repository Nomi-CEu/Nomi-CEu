import log from "fancy-log";
import { fetchFileInfo, fetchFilesBulk, fetchProject, fetchProjectsBulk } from "../../util/curseForgeAPI";
import { modpackManifest } from "../../globals";
import { checkGitTag, getFileAtRevision } from "../../util/util";
import { ModpackManifest } from "../../types/modpackManifest";
import { CurseForgeFileInfo, CurseForgeModInfo } from "../../types/curseForge";

export interface ModFileInfo {
	modInfo: CurseForgeModInfo;
	fileInfo: CurseForgeFileInfo;
	inClient: boolean;
	inServer: boolean;
}

/**
 * Fetches mod links and builds a modlist.
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
