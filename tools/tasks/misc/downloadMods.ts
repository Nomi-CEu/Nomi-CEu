import { modDestDirectory, modpackManifest } from "#globals";
import { fetchMods } from "#utils/curseForgeAPI.ts";
import upath from "upath";
import fs from "fs";
import { deleteAsync } from "del";
import gulp from "gulp";
import logInfo from "#utils/log.ts";

async function modCleanUp() {
	return deleteAsync(upath.join(modDestDirectory, "*"), { force: true });
}

/**
 * Checks and creates all necessary directories so we can download the mods safely.
 */
async function createModDirs() {
	// This also makes the base dir, as it is recursive.
	if (!fs.existsSync(upath.join(modDestDirectory, "client"))) {
		await fs.promises.mkdir(upath.join(modDestDirectory, "client"), {
			recursive: true,
		});
	}

	if (!fs.existsSync(upath.join(modDestDirectory, "server"))) {
		await fs.promises.mkdir(upath.join(modDestDirectory, "server"), {
			recursive: true,
		});
	}
}

/**
 * Downloads mods according to manifest.json and checks hashes.
 */
export async function downloadMods(): Promise<void> {
	logInfo("Fetching Shared Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => !f.sides),
		modDestDirectory,
	);

	logInfo("Fetching Client Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => f.sides && f.sides.includes("client")),
		upath.join(modDestDirectory, "client"),
	);

	logInfo("Fetching Server Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => f.sides && f.sides.includes("server")),
		upath.join(modDestDirectory, "server"),
	);
}

export default gulp.series(modCleanUp, createModDirs, downloadMods);
