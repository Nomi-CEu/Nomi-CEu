import { src, dest, series } from "gulp";
import {
	clientDestDirectory,
	modpackManifest,
	sharedDestDirectory,
} from "#globals";
import fs from "fs";
import upath from "upath";
import buildConfig from "#buildConfig";
import { deleteAsync } from "del";
import { createModList, ModFileInfo } from "../misc/createModList.ts";
import dedent from "dedent-js";
import {
	cleanupVersion,
	promiseStream,
	shouldSkipChangelog,
} from "#utils/util.ts";

async function clientCleanUp() {
	return deleteAsync(upath.join(clientDestDirectory, "*"), { force: true });
}

/**
 * Checks and creates all necessary directories so we can build the client safely.
 */
async function createClientDirs() {
	if (!fs.existsSync(clientDestDirectory)) {
		return fs.promises.mkdir(clientDestDirectory, { recursive: true });
	}
}

/**
 * Exports the modpack manifest.
 */
async function exportModpackManifest() {
	const manifestPath = upath.join(clientDestDirectory, "manifest.json");

	// Filter client side files only and prune build-specific fields.
	const newFiles = modpackManifest.files
		.map((file) => {
			if (file.sides) {
				if (!file.sides.includes("client")) return;

				const newFile = Object.assign({}, file);
				delete newFile.sides;

				return newFile;
			}

			return file;
		})
		.filter(Boolean);

	return fs.promises.writeFile(
		manifestPath,
		JSON.stringify(
			{
				...modpackManifest,
				files: newFiles,
			},
			null,
			"  ",
		),
	);
}

/**
 * Copies the license file.
 */
async function copyClientLicense() {
	return promiseStream(src("../LICENSE").pipe(dest(clientDestDirectory)));
}

/**
 * Copies the update notes file.
 */
async function copyClientUpdateNotes() {
	return promiseStream(
		src("../UPDATENOTES.md", { allowEmpty: true }).pipe(
			dest(clientDestDirectory),
		),
	);
}

/**
 * Copies the changelog file.
 */
async function copyClientChangelog() {
	if (shouldSkipChangelog()) return;

	return promiseStream(
		src(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md")).pipe(
			dest(clientDestDirectory),
		),
	);
}

/**
 * Copies modpack overrides.
 */
async function copyClientOverrides() {
	return promiseStream(
		src(buildConfig.copyFromSharedClientGlobs, {
			cwd: sharedDestDirectory,
			allowEmpty: true,
			resolveSymlinks: true,
			encoding: false,
		}).pipe(dest(upath.join(clientDestDirectory, "overrides"))),
	);
}

/**
 * Fetches mod links and builds modlist.html.
 */
async function fetchModList() {
	const modList = await createModList();

	const formattedModList = dedent`
		<!DOCTYPE html>
		<html lang="en">
			<head>
				<title>Nomi-CEu Mod Information</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel = "icon" href =  "https://github.com/Nomi-CEu/Nomi-CEu/assets/103940576/672808a8-0ad0-4d07-809e-08336a928909" type = "image/x-icon"> 
				<style>
					caption {
						font-size: 30px;
						color: #fff;
						font-family: "Comic Sans MS", "sans-serif";
						font-weight: 700;
						border-radius: 10px;
						border-collapse: collapse;
						background-color: #795B97;
					}
					table {
						border-collapse: collapse;
						width: 100%;
						color: #333;
						font-family: "Comic Sans MS", "sans-serif";
						font-size: 13px;
						text-align: left;
						border-radius: 10px;
						overflow: hidden;
						box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
					}
					table th {
						background-color: #9973BD;
						color: #fff;
						font-family: "Comic Sans MS", "sans-serif";
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
						font-weight: bold;
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
		upath.join(clientDestDirectory, "modlist.html"),
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
				<td><a href="${modFile.fileInfo.downloadUrl}">v${cleanupVersion(modFile.fileInfo.displayName)}</a></td>
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

export default series(
	clientCleanUp,
	createClientDirs,
	copyClientOverrides,
	exportModpackManifest,
	copyClientLicense,
	copyClientOverrides,
	copyClientChangelog,
	copyClientUpdateNotes,
	fetchModList,
);
