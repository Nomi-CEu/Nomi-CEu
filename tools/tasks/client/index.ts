import gulp from "gulp";
import { clientDestDirectory, modpackManifest, overridesFolder, sharedDestDirectory } from "../../globals";
import fs from "fs";
import upath from "upath";
import buildConfig from "../../buildConfig";
import rename from "gulp-rename";
import imagemin from "gulp-imagemin";
import pngToJpeg from "png-to-jpeg";
import { MainMenuConfig } from "../../types/mainMenuConfig";
import del from "del";
import { createModList, ModFileInfo } from "../misc/createModList";
import dedent from "dedent-js";
import { cleanupVersion } from "../../util/util";

async function clientCleanUp() {
	return del(upath.join(clientDestDirectory, "*"), { force: true });
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
	return gulp.src("../LICENSE.md").pipe(gulp.dest(clientDestDirectory));
}

/**
 * Copies the update notes file.
 */
function copyClientUpdateNotes() {
	return gulp.src("../UPDATENOTES.md", { allowEmpty: true }).pipe(gulp.dest(clientDestDirectory));
}

/**
 * Copies the changelog file.
 */
function copyClientChangelog() {
	return gulp
		.src(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md"))
		.pipe(gulp.dest(clientDestDirectory));
}

/**
 * Copies modpack overrides.
 */
function copyClientOverrides() {
	return gulp
		.src(buildConfig.copyFromSharedClientGlobs, { nodir: true, cwd: sharedDestDirectory, allowEmpty: true })
		.pipe(gulp.symlink(upath.join(clientDestDirectory, "overrides")));
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

	return fs.promises.writeFile(upath.join(clientDestDirectory, "modlist.html"), formattedModList);
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

const bgImageNamespace = "minecraft";
const bgImagePath = "textures/gui/title/background";
const mainMenuConfigPath = "config/CustomMainMenu/mainmenu.json";

/**
 * Minifies (converts to jpeg) main menu files so they don't take up 60% of the pack size.
 */
async function compressMainMenuImages() {
	const mainMenuImages = [];
	const bgImagePathReal = upath.join("resources", bgImageNamespace, bgImagePath);

	// Convert each slideshow image to 80% jpg.
	await new Promise((resolve) => {
		gulp
			.src(upath.join(sharedDestDirectory, overridesFolder, bgImagePathReal, "**/*"))
			.pipe(imagemin([pngToJpeg({ quality: buildConfig.screenshotsQuality })]))
			.pipe(
				rename((f) => {
					// xd
					f.extname = ".jpg";

					// Ping back the file name so we don't have to scan the folder again.
					mainMenuImages.push(`${f.basename}${f.extname}`);
				}),
			)
			.pipe(gulp.dest(upath.join(clientDestDirectory, overridesFolder, bgImagePathReal)))
			.on("end", resolve);
	});

	if (mainMenuImages.length > 0) {
		// Read the CustomMainMenu config and parse it.
		const mainMenuConfig: MainMenuConfig = JSON.parse(
			(await fs.promises.readFile(upath.join(clientDestDirectory, overridesFolder, mainMenuConfigPath))).toString(),
		);

		// Fill the config with image paths using the weird "namespace:path" scheme.
		mainMenuConfig.other.background.slideshow.images = mainMenuImages.map(
			(img) => bgImageNamespace + ":" + upath.join(bgImagePath, img),
		);

		// Write it back.
		return fs.promises.writeFile(
			upath.join(clientDestDirectory, overridesFolder, mainMenuConfigPath),
			JSON.stringify(mainMenuConfig, null, "  "),
		);
	}
}

export default gulp.series(
	clientCleanUp,
	createClientDirs,
	copyClientOverrides,
	exportModpackManifest,
	copyClientLicense,
	copyClientOverrides,
	copyClientChangelog,
	copyClientUpdateNotes,
	fetchModList,
	compressMainMenuImages,
);
