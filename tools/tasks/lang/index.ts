import { dest, series, src } from "gulp";
import { join } from "upath";
import buildConfig from "#buildConfig";
import {
	langDestDirectory,
	overridesFolder,
	sharedDestDirectory,
} from "#globals";
import fs from "fs";
import { deleteAsync } from "del";
import { promiseStream, shouldSkipChangelog } from "#utils/util.ts";

const resourcesPath = join(sharedDestDirectory, overridesFolder, "resources");

async function langCleanUp() {
	return deleteAsync(join(langDestDirectory, "*"), { force: true });
}

/**
 * Checks and creates all necessary directories so we can build the lang safely.
 */
async function createLangDirs() {
	if (!fs.existsSync(langDestDirectory)) {
		await fs.promises.mkdir(langDestDirectory, { recursive: true });
	}
}

/**
 * Copies the license file.
 */
async function copyLangLicense() {
	return promiseStream(src("../LICENSE").pipe(dest(langDestDirectory)));
}

/**
 * Copies the update notes file.
 */
async function copyLangUpdateNotes() {
	return promiseStream(
		src("../UPDATENOTES.md", { allowEmpty: true }).pipe(
			dest(langDestDirectory),
		),
	);
}

/**
 * Copies the changelog file.
 */
async function copyLangChangelog() {
	if (shouldSkipChangelog()) return;

	return promiseStream(
		src(join(buildConfig.buildDestinationDirectory, "CHANGELOG.md")).pipe(
			dest(langDestDirectory),
		),
	);
}

async function copyLangFiles() {
	return promiseStream(
		src(join("**", "*.lang"), { cwd: resourcesPath }).pipe(
			dest(join(langDestDirectory, "assets")),
		),
	);
}

async function copyLangMcMeta() {
	return promiseStream(
		src("pack.mcmeta", { cwd: resourcesPath }).pipe(
			dest(join(langDestDirectory)),
		),
	);
}

export default series(
	langCleanUp,
	createLangDirs,
	copyLangFiles,
	copyLangMcMeta,
	copyLangLicense,
	copyLangChangelog,
	copyLangUpdateNotes,
);

export const typoBuild = series(langCleanUp, createLangDirs, copyLangFiles);
