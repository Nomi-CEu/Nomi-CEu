import { fetchFileInfo, fetchFilesBulk, fetchProject, fetchProjectsBulk } from "#utils/curseForgeAPI.ts";
import { modpackManifest } from "#globals";
import { checkGitTag, getFileAtRevision } from "#utils/util.ts";
import { ModpackManifest } from "#types/modpackManifest.ts";
import { CurseForgeFileInfo, CurseForgeModInfo } from "#types/curseForge.ts";
import logInfo from "#utils/log.ts";

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
	logInfo("Fetching mod & file infos...");

	let manifest: ModpackManifest = modpackManifest;

	if (tag) {
		checkGitTag(tag);
		manifest = JSON.parse(await getFileAtRevision("manifest.json", tag));
	}

	manifest.files.sort((a, b) => a.projectID - b.projectID);

	// Fetch mod/addon & file infos, discard result. Further calls will hit cache.
	await fetchProjectsBulk(manifest.files.map((mod) => mod.projectID));
	await fetchFilesBulk(
		manifest.files
			.map((mod) => {
				return { projectID: mod.projectID, fileID: mod.fileID };
			})
			.sort((a, b) => a.fileID - b.fileID),
	);

	logInfo("Fetched Infos. Creating modlist...");

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
