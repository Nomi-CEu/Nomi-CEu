import { modDestDirectory, modpackManifest } from "#globals";
import { fetchMods } from "#utils/curseForgeAPI.ts";
import upath from "upath";
import fs from "fs";
import { deleteAsync } from "del";
import { parallel, series } from "gulp";
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
async function downloadMods(): Promise<void> {
	logInfo("Fetching Shared Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => !f.sides),
		modDestDirectory,
	);
}

/**
 * Downloads mods according to manifest.json and checks hashes.
 */
async function downloadClientMods(): Promise<void> {
	logInfo("Fetching Client Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => f.sides && f.sides.includes("client")),
		upath.join(modDestDirectory, "client"),
	);
}

/**
 * Downloads mods according to manifest.json and checks hashes.
 */
async function downloadServerMods(): Promise<void> {
	logInfo("Fetching Server Mods...");
	await fetchMods(
		modpackManifest.files.filter((f) => f.sides && f.sides.includes("server")),
		upath.join(modDestDirectory, "server"),
	);
}

export const downloadSharedAndServer = series(
	modCleanUp,
	createModDirs,
	parallel(downloadMods, downloadServerMods),
);

export const downloadSharedAndClient = series(
	modCleanUp,
	createModDirs,
	parallel(downloadMods, downloadClientMods),
);
