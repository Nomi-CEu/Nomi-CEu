import { modDestDirectory, modpackManifest } from "../../globals";
import { fetchMods } from "../../util/curseForgeAPI";
import upath from "upath";
import fs from "fs";
import log from "fancy-log";
import del from "del";
import gulp from "gulp";

async function modCleanUp() {
	return del(upath.join(modDestDirectory, "*"), { force: true });
}

/**
 * Checks and creates all necessary directories so we can download the mods safely.
 */
async function createModDirs() {
	// This also makes the base dir, as it is recursive.
	if (!fs.existsSync(upath.join(modDestDirectory, "client"))) {
		await fs.promises.mkdir(upath.join(modDestDirectory, "client"), { recursive: true });
	}

	if (!fs.existsSync(upath.join(modDestDirectory, "server"))) {
		await fs.promises.mkdir(upath.join(modDestDirectory, "server"), { recursive: true });
	}
}

/**
 * Downloads mods according to manifest.json and checks hashes.
 */
export async function downloadMods(): Promise<void> {
	log("Fetching Shared Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => !f.sides),
		modDestDirectory,
	);

	log("Fetching Client Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => f.sides && f.sides.includes("client")),
		upath.join(modDestDirectory, "client"),
	);

	log("Fetching Server Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => f.sides && f.sides.includes("server")),
		upath.join(modDestDirectory, "server"),
	);
}

export default gulp.series(modCleanUp, createModDirs, downloadMods);
