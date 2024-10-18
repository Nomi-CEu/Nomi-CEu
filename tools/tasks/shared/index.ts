import fs from "fs";
import gulp, { dest, src } from "gulp";
import upath from "upath";
import buildConfig from "#buildConfig";
import {
	modDestDirectory,
	modpackManifest,
	overridesFolder,
	rootDirectory,
	sharedDestDirectory,
	tempDirectory,
} from "#globals";
import { deleteAsync } from "del";
import { FileDef } from "#types/fileDef.ts";
import {
	downloadFileDef,
	downloadOrRetrieveFileDef,
	isEnvVariableSet,
	promiseStream,
	shouldSkipChangelog,
} from "#utils/util.ts";
import transformVersion from "./transformVersion.ts";
import { createBuildChangelog } from "../changelog/index.ts";
import mustache from "mustache";
import {
	updateFilesBuildSetup,
	updateLabsVersion,
} from "../misc/transformFiles.ts";
import { transformQuestBook } from "./quest.ts";
import logInfo from "#utils/log.ts";

async function sharedCleanUp() {
	await deleteAsync(upath.join(sharedDestDirectory, "*"), { force: true });
	await deleteAsync(upath.join(tempDirectory, "*"), { force: true });
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
	// Copy, not Symlink, so we can transform the files as we wish
	return promiseStream(
		src(buildConfig.copyToSharedDirGlobs, {
			cwd: upath.join(rootDirectory),
			encoding: false,
		}).pipe(dest(upath.join(sharedDestDirectory, overridesFolder))),
	);
}

/**
 * Copies Modpack Pack Mode Switcher Scripts.
 */
async function copyPackModeSwitchers() {
	return promiseStream(
		src(buildConfig.packModeSwitcherGlobs, {
			cwd: upath.join(rootDirectory),
		}).pipe(dest(upath.join(sharedDestDirectory, overridesFolder))),
	);
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

		await Promise.all(
			depDefs.map(async (depDef) => {
				const dest = upath.join(destDirectory, upath.basename(depDef.url));
				const cachePath = (await downloadOrRetrieveFileDef(depDef)).cachePath;

				return fs.promises.symlink(upath.resolve(dest, cachePath), dest);
			}),
		);
	}
}

/**
 * Either fetches the Changelog File, or makes one. Does nothing if 'SKIP_CHANGELOG' is set to a truthy value.
 */
async function fetchOrMakeChangelog() {
	if (shouldSkipChangelog()) return;

	if (isEnvVariableSet("MADE_CHANGELOG")) {
		let made = false;
		try {
			made = JSON.parse((process.env.MADE_CHANGELOG ?? "false").toLowerCase());
		} catch (err) {
			throw new Error("Made Changelog Env Variable set to Invalid Value.");
		}

		if (made) {
			logInfo("Already Made Changelogs...");
			return;
		}
	}

	if (
		isEnvVariableSet("CHANGELOG_URL") &&
		isEnvVariableSet("CHANGELOG_CF_URL")
	) {
		logInfo("Using Changelog Files from URL.");
		await downloadChangelogs(
			process.env.CHANGELOG_URL ?? "",
			process.env.CHANGELOG_CF_URL ?? "",
		);
		return;
	}
	if (isEnvVariableSet("CHANGELOG_BRANCH")) {
		logInfo("Using Changelog Files from Branch.");
		const url =
			"https://raw.githubusercontent.com/Nomi-CEu/Nomi-CEu/{{ branch }}/{{ filename }}";
		await downloadChangelogs(
			mustache.render(url, {
				branch: process.env.CHANGELOG_BRANCH,
				filename: "CHANGELOG.md",
			}),
			mustache.render(url, {
				branch: process.env.CHANGELOG_BRANCH,
				filename: "CHANGELOG_CF.md",
			}),
		);
		return;
	}
	logInfo("Creating Changelog Files.");
	await createBuildChangelog();
}

async function downloadChangelogs(
	changelogURL: string,
	changelogCFURL: string,
) {
	const changelog = await downloadFileDef({ url: changelogURL });
	const changelogCF = await downloadFileDef({ url: changelogCFURL });

	await writeToChangelog(changelog, "CHANGELOG.md", changelogURL);
	await writeToChangelog(changelogCF, "CHANGELOG_CF.md", changelogCFURL);
}

async function writeToChangelog(
	buffer: Buffer,
	changelogFile: string,
	url: string,
) {
	let handle: fs.promises.FileHandle | undefined = undefined;
	try {
		handle = await fs.promises.open(
			upath.join(buildConfig.buildDestinationDirectory, changelogFile),
			"w",
		);

		await handle.write(buffer);
		await handle.close();
	} catch (err) {
		if (handle && (await handle.stat()).isFile()) {
			logInfo(`Couldn't download changelog from URL ${url}, cleaning up...`);

			await handle.close();
		}
		throw err;
	}
}

const updateBuildLabsVersion = async () => {
	await updateLabsVersion(sharedDestDirectory);
};

export default gulp.series(
	sharedCleanUp,
	createSharedDirs,
	copyOverrides,
	copyPackModeSwitchers,
	fetchOrMakeChangelog,
	fetchExternalDependencies,
	updateFilesBuildSetup,
	updateBuildLabsVersion,
	transformVersion,
	transformQuestBook,
);

export const buildChangelog = gulp.series(
	sharedCleanUp,
	createSharedDirs,
	fetchOrMakeChangelog,
);
