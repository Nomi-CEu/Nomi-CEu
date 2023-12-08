import fs from "fs";
import gulp from "gulp";
import upath from "upath";
import buildConfig from "../../buildConfig";
import {
	modDestDirectory,
	modpackManifest,
	overridesFolder,
	rootDirectory,
	sharedDestDirectory,
	tempDirectory
} from "../../globals";
import del from "del";
import { FileDef } from "../../types/fileDef";
import Bluebird from "bluebird";
import { downloadFileDef, downloadOrRetrieveFileDef, isEnvVariableSet, relative } from "../../util/util";

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
	// Don't copy server.properties files in config-overrides, it is auto transformed into the server build folder
	return new Promise((resolve) => {
		gulp
			.src(buildConfig.copyToSharedDirGlobs, { cwd: upath.join(buildConfig.buildSourceDirectory) })
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
		const destDirectory = upath.join(modDestDirectory, "mods");

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

/**
 * Either fetches the Changelog File, or makes one.
 */
async function fetchOrMakeChangelog() {
	if (isEnvVariableSet("CHANGELOG_URL") && isEnvVariableSet("CHANGELOG_CF_URL")) {
		log("Using Changelog Files from URL.");
		await downloadChangelogs(process.env.CHANGELOG_URL, process.env.CHANGELOG_CF_URL);
		return;
	}
	if (isEnvVariableSet("CHANGELOG_BRANCH")) {
		log("Using Changelog Files from Branch.");
		const url = "https://raw.githubusercontent.com/Nomi-CEu/Nomi-CEu/{{ branch }}/{{ filename }}";
		await downloadChangelogs(
			mustache.render(url, { branch: process.env.CHANGELOG_BRANCH, filename: "CHANGELOG.md" }),
			mustache.render(url, { branch: process.env.CHANGELOG_BRNACH, filename: "CHANGELOG_CF.md" }),
		);
		return;
	}
	log("Creating Changelog Files.");
	await createBuildChangelog();
}

async function downloadChangelogs(changelogURL: string, changelogCFURL: string) {
	const changelog = await downloadFileDef({ url: changelogURL });
	const changelogCF = await downloadFileDef({ url: changelogCFURL });

	await writeToChangelog(changelog, "CHANGELOG.md", changelogURL);
	await writeToChangelog(changelogCF, "CHANGELOG_CF.md", changelogCFURL);
}

async function writeToChangelog(buffer: Buffer, changelogFile: string, url: string) {
	let handle: fs.promises.FileHandle;
	try {
		handle = await fs.promises.open(upath.join(buildConfig.buildDestinationDirectory, changelogFile), "w");

		await handle.write(buffer);
		await handle.close();
	} catch (err) {
		if (handle && (await handle.stat()).isFile()) {
			log(`Couldn't download changelog from URL ${url}, cleaning up...`);

			await handle.close();
		}
		throw err;
	}
}

import transformVersion from "./transformVersion";
import { createBuildChangelog } from "../changelog/createChangelog";
import mustache from "mustache";
import log from "fancy-log";
import { updateBuildRandomPatches } from "../misc/transformFiles";
import { transformQuestBook } from "./quest";

export default gulp.series(
	sharedCleanUp,
	createSharedDirs,
	copyOverrides,
	fetchOrMakeChangelog,
	fetchExternalDependencies,
	updateBuildRandomPatches,
	transformVersion,
	transformQuestBook,
);
