import {
	fetchFileInfo,
	fetchFilesBulk,
	fetchProject,
	fetchProjectsBulk,
} from "#utils/curseForgeAPI.ts";
import { modpackManifest } from "#globals";
import {
	checkGitTag,
	cleanupVersion,
	getFileAtRevision,
	getFileUrl,
} from "#utils/util.ts";
import { ModpackManifest } from "#types/modpackManifest.ts";
import { CurseForgeFileInfo, CurseForgeModInfo } from "#types/curseForge.ts";
import logInfo from "#utils/log.ts";
import fs from "fs";
import upath from "upath";
import dedent from "dedent-js";

export interface ModFileInfo {
	modInfo: CurseForgeModInfo;
	fileInfo: CurseForgeFileInfo;
	inClient: boolean;
	inServer: boolean;
}

/**
 * Fetches mod links, builds a formatted mod list as html, and writes it to the specified destination directory.
 */
export async function buildModList(dest: string): Promise<void> {
	const modList = await getFileInfos();

	const formattedModList = dedent`
		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title>Nomi-CEu Mod Information</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel = "icon" href =  "https://github.com/Nomi-CEu/Nomi-CEu/assets/103940576/672808a8-0ad0-4d07-809e-08336a928909" type = "image/x-icon"> 
				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link href="https://fonts.googleapis.com/css2?family=Geologica:wght@100..900&display=swap" rel="stylesheet">
				<style>
					caption {
						font-size: 30px;
						color: #fff;
						font-family: "Geologica", "sans-serif";
						font-weight: 700;
						border-radius: 10px;
						border-collapse: collapse;
						background-color: #795B97;
						padding-top: 5px;
						padding-bottom: 5px;
					}
					table {
						border-collapse: collapse;
						width: 100%;
						color: #333;
						font-family: "ui-sans-serif", "system-ui", "sans-serif";
						font-size: 15px;
						text-align: left;
						border-radius: 10px;
						overflow: hidden;
						box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
					}
					table th {
						background-color: #9973BD;
						color: #fff;
						font-family: "Geologica", "sans-serif";
						font-weight: bold;
						padding: 10px;
						text-transform: uppercase;
						letter-spacing: 1px;
						border-top: 1px solid #fff;
						border-bottom: 1px solid #ccc;
						font-size: 15px;
					}
					table tr:nth-child(even) td {
						background-color: #E7E7E7;
					}
					table tr:hover td {
						background-color: rgba(160, 210, 235, 0.5);
					}
					table td {
						background-color: #fff;
						padding: 10px;
						border-bottom: 1px solid #ccc;
						font-weight: 600;
						letter-spacing: 0.03em;
					}
					table tr:last-of-type {
						border-bottom: 2px solid #9973BD;
					}
					.redCross {
						color: #ff0000;
						font-size: 20px;
					}
					.greenTick {
						color: #32cd32;
						font-size: 20px;
					}
				</style>
			</head>
			<body>
				<table>
					<caption>Nomi-CEu Mod List (${modList.length} Mods):</caption>
					<tr>
						<th>Mod Name</th>
						<th>Mod Version</th>
						<th>Client?</th>
						<th>Server?</th>
						<th>Author(s)</th>
					</tr>
					${formatModList(modList)}
				</table>
			</body>
		</html>
	`;

	return fs.promises.writeFile(
		upath.join(dest, "modlist.html"),
		formattedModList,
	);
}

/**
 * Formats the mod list.
 */
function formatModList(modList: ModFileInfo[]): string {
	const output: string[] = [];
	modList.forEach((modFile) => {
		output.push(dedent`
			<tr>
				<td><a href="${modFile.modInfo.links.websiteUrl}">${modFile.modInfo.name}</a></td>
				<td><a href=${getFileUrl(modFile.modInfo, modFile.fileInfo)}>v${cleanupVersion(modFile.fileInfo.displayName)}</a></td>
				${getTickCross(modFile.inClient)}
				${getTickCross(modFile.inServer)}
				<td>${modFile.modInfo.authors.map((author) => `<a href=${author.url}>${author.name}</a>`).join(", ")}</td>
			</tr>
		`);
	});
	return output.join("\n");
}

/**
 * Gets the tick/cross used in the mod list.
 */
function getTickCross(bool: boolean): string {
	if (bool) {
		return '<td class="greenTick">&#10004;</td>';
	}
	return '<td class="redCross">&#10006;</td>';
}

/**
 * Gets file infos, for use in creating a modlist.
 */
async function getFileInfos(tag = ""): Promise<ModFileInfo[]> {
	logInfo("Fetching mod & file infos...");

	let manifest: ModpackManifest = modpackManifest;

	if (tag) {
		checkGitTag(tag);
		manifest = JSON.parse(
			await getFileAtRevision("manifest.json", tag),
		) as ModpackManifest;
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
