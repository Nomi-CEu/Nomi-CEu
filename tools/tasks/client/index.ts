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
import { promiseStream, shouldSkipChangelog } from "#utils/util.ts";
import { buildModList } from "#tasks/misc/createModList.ts";

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
 * Builds and writes a modlist.
 */
async function buildClientModList() {
	return buildModList(clientDestDirectory);
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
	buildClientModList,
);
