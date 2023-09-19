import fs from "fs";
import gulp from "gulp";
import upath from "upath";
import buildConfig from "../../buildConfig";
import { modpackManifest, overridesFolder, sharedDestDirectory, tempDirectory } from "../../globals";
import del from "del";
import { FileDef } from "../../types/fileDef";
import Bluebird from "bluebird";
import { downloadOrRetrieveFileDef, relative } from "../../util/util";

async function sharedCleanUp() {
	await del(upath.join(sharedDestDirectory, "*"), { force: true });
	await del(upath.join(tempDirectory, "*"), { force: true });
}

/**
 * Checks and creates all necessary directories so we can build everything safely.
 */
async function createSharedDirs() {
	if (!fs.existsSync(sharedDestDirectory)) {
		await fs.promises.mkdir(sharedDestDirectory, { recursive: true });
	}

	if (!fs.existsSync(tempDirectory)) {
		await fs.promises.mkdir(tempDirectory, { recursive: true });
	}
}

/**
 * Copies modpack overrides.
 */
async function copyOverrides() {
	return new Promise((resolve) => {
		gulp
			.src(upath.join(buildConfig.buildSourceDirectory, overridesFolder, "**/*"))
			.pipe(gulp.dest(upath.join(sharedDestDirectory, overridesFolder)))
			.on("end", resolve);
	});
}

/**
 * Fetch external dependencies and remove the field from the manifest file.
 */
async function fetchExternalDependencies() {
	const dependencies = modpackManifest.externalDependencies;
	if (dependencies) {
		const destDirectory = upath.join(sharedDestDirectory, overridesFolder, "mods");

		if (!fs.existsSync(destDirectory)) {
			await fs.promises.mkdir(destDirectory, { recursive: true });
		}

		// Map dependencies to FileDefs.
		const depDefs: FileDef[] = dependencies.map((dep) => {
			return {
				url: dep.url,
				hashes: [
					{
						hashes: [dep.sha],
						id: "sha1",
					},
				],
			};
		});

		delete modpackManifest.externalDependencies;

		return Bluebird.map(
			depDefs,
			async (depDef) => {
				const dest = upath.join(destDirectory, upath.basename(depDef.url));
				const cachePath = (await downloadOrRetrieveFileDef(depDef)).cachePath;

				const rel = relative(dest, cachePath);

				await fs.promises.symlink(rel, dest);
			},
			{ concurrency: buildConfig.downloaderConcurrency },
		);
	}
}

import transforms from "./transforms";
export default gulp.series(sharedCleanUp, createSharedDirs, copyOverrides, fetchExternalDependencies, ...transforms);
