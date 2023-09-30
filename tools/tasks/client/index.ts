import gulp from "gulp";
import { clientDestDirectory, modpackManifest, overridesFolder, sharedDestDirectory } from "../../globals";
import fs from "fs";
import upath from "upath";
import buildConfig from "../../buildConfig";
import { fetchProjectsBulk } from "../../util/curseForgeAPI";
import log from "fancy-log";
import rename from "gulp-rename";
import imagemin from "gulp-imagemin";
import pngToJpeg from "png-to-jpeg";
import { MainMenuConfig } from "../../types/mainMenuConfig";
import del from "del";

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
	return gulp.src(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md")).pipe(gulp.dest(clientDestDirectory));
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
	log("Fetching mod infos...");

	// Fetch project/addon infos.
	const modInfos = await fetchProjectsBulk(modpackManifest.files.map((mod) => mod.projectID));

	log(`Fetched ${modInfos.length} mod infos`);

	// Create modlist.html
	const output = [
		"<ul>\r\n",
		...modInfos
			// Sort mods by their project IDs.
			.sort((a, b) => a.id - b.id)

			// Create a <li> node for each mod.
			.map((modInfo) => {
				return `\t<li><a href="${modInfo.websiteUrl}">${modInfo.name || "Unknown"} (by ${modInfo.authors
					.map((author) => author.name || "Someone")
					.join(", ")})</a></li>\r\n`;
			}),
		"</ul>",
	];

	return fs.promises.writeFile(upath.join(clientDestDirectory, "modlist.html"), output.join(""));
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
			.pipe(imagemin([pngToJpeg({ quality: 80 })]))
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
