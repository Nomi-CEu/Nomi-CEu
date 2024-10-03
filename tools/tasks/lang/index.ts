import { dest, series, src } from "gulp";
import upath from "upath";
import buildConfig from "#buildConfig";
import {
	langDestDirectory,
	overridesFolder,
	sharedDestDirectory,
} from "#globals";
import fs from "fs";
import { deleteAsync } from "del";
import { shouldSkipChangelog } from "#utils/util.ts";

const resourcesPath = upath.join(
	sharedDestDirectory,
	overridesFolder,
	"resources",
);

async function langCleanUp() {
	return deleteAsync(upath.join(langDestDirectory, "*"), { force: true });
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
	return src("../LICENSE").pipe(dest(langDestDirectory));
}

/**
 * Copies the update notes file.
 */
async function copyLangUpdateNotes() {
	return src("../UPDATENOTES.md", { allowEmpty: true }).pipe(
		dest(langDestDirectory),
	);
}

/**
 * Copies the changelog file.
 */
async function copyLangChangelog() {
	if (shouldSkipChangelog()) return;

	return src(
		upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md"),
	).pipe(dest(langDestDirectory));
}

async function copyLangFiles() {
	return src(upath.join("**", "*.lang"), { cwd: resourcesPath }).pipe(
		dest(upath.join(langDestDirectory, "assets")),
	);
}

async function copyLangMcMeta() {
	return src("pack.mcmeta", { cwd: resourcesPath }).pipe(
		dest(upath.join(langDestDirectory)),
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
