import fs from "fs";
import gulp from "gulp";
import upath from "upath";
import buildConfig from "../../buildConfig";
import { modpackManifest, overridesFolder, sharedDestDirectory, tempDirectory } from "../../globals";
import del from "del";
import { FileDef } from "../../types/fileDef";
import Bluebird from "bluebird";
import { downloadOrRetrieveFileDef, isEnvVariableSet, relative } from "../../util/util";

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

/**
 * Either fetches the Changelog File, or makes one.
 */
async function fetchOrMakeChangelog() {
	if (isEnvVariableSet("CHANGELOG_URL") && isEnvVariableSet("CHANGELOG_CF_URL")) {
		console.log("Using Changelog Files from URL.");
		await fs.promises.writeFile(
			upath.join(sharedDestDirectory, "CHANGELOG.md"),
			await fs.promises.readFile(
				(
					await downloadOrRetrieveFileDef({
						url: process.env.CHANGELOG_URL,
					})
				).cachePath,
			),
		);

		await fs.promises.writeFile(
			upath.join(sharedDestDirectory, "CHANGELOG_CF.md"),
			await fs.promises.readFile(
				(
					await downloadOrRetrieveFileDef({
						url: process.env.CHANGELOG_CF_URL,
					})
				).cachePath,
			),
		);
		return;
	}
	if (isEnvVariableSet("CHANGELOG_BRANCH")) {
		console.log("Using Changelog Files from Branch.");
		const url = "https://raw.githubusercontent.com/Nomi-CEu/Nomi-CEu/{{ branch }}/{{ filename }}";
		const test = await fs.promises.readFile(
			(
				await downloadOrRetrieveFileDef({
					url: mustache.render(url, {
						branch: process.env.CHANGELOG_BRANCH,
						filename: "CHANGELOG.md",
					}),
				})
			).cachePath,
		);
		console.log(test.toString());
		await fs.promises.writeFile(
			upath.join(sharedDestDirectory, "CHANGELOG.md"),
			await fs.promises.readFile(
				(
					await downloadOrRetrieveFileDef({
						url: mustache.render(url, {
							branch: process.env.CHANGELOG_BRANCH,
							filename: "CHANGELOG.md",
						}),
					})
				).cachePath,
			),
		);

		await fs.promises.writeFile(
			upath.join(sharedDestDirectory, "CHANGELOG_CF.md"),
			await fs.promises.readFile(
				(
					await downloadOrRetrieveFileDef({
						url: mustache.render(url, {
							branch: process.env.CHANGELOG_BRNACH,
							filename: "CHANGELOG_CF.md",
						}),
					})
				).cachePath,
			),
		);
		return;
	}
	console.log("Making Changelog.");
	await makeChangelog(true);
}

import transforms from "./transforms";
import { makeChangelog } from "../misc/makeChangelog";
import mustache from "mustache";
export default gulp.series(
	sharedCleanUp,
	createSharedDirs,
	copyOverrides,
	fetchOrMakeChangelog,
	fetchExternalDependencies,
	...transforms,
);
