import upath from "upath";
import unzip from "unzipper";
import through from "through2";
import mustache from "mustache";
import { src, dest, series } from "gulp";
import fs from "fs";
import buildConfig from "#buildConfig";
import { ForgeProfile } from "#types/forgeProfile.ts";
import { FileDef } from "#types/fileDef.ts";
import {
	downloadOrRetrieveFileDef,
	getForgeJar,
	getVersionManifest,
	promiseStream,
	shouldSkipChangelog,
} from "#utils/util.ts";
import {
	modDestDirectory,
	modpackManifest,
	serverDestDirectory,
	sharedDestDirectory,
} from "#globals";
import { deleteAsync } from "del";
import logInfo, { logWarn } from "#utils/log.ts";

let g_forgeJar: string | undefined = undefined;

async function serverCleanUp() {
	return deleteAsync(upath.join(serverDestDirectory, "*"), { force: true });
}

/**
 * Checks and creates all necessary directories so we can build the server safely.
 */
async function createServerDirs() {
	if (!fs.existsSync(serverDestDirectory)) {
		return fs.promises.mkdir(serverDestDirectory, { recursive: true });
	}
}

/**
 * Download the Forge jar.
 *
 * Extract, parse the profile data and download required libraries.
 */
async function downloadForge() {
	const { forgeJar, forgeUniversalPath } = await getForgeJar();

	/**
	 * Parse the profile manifest.
	 */
	let forgeUniversalJar: Buffer | undefined = undefined;
	let forgeProfile: ForgeProfile | undefined = undefined;
	const files = (await unzip.Open.buffer(forgeJar))?.files;

	logInfo("Extracting Forge installation profile & jar...");

	if (!files) {
		throw new Error("Malformed Forge installation jar.");
	}

	for (const file of files) {
		// Look for the universal jar.
		if (!forgeUniversalJar && file.path == forgeUniversalPath) {
			forgeUniversalJar = await file.buffer();
		}
		// Look for the installation profile.
		else if (!forgeProfile && file.path == "version.json") {
			forgeProfile = JSON.parse((await file.buffer()).toString());
		}

		if (forgeUniversalJar && forgeProfile) {
			break;
		}
	}

	if (!forgeProfile || !forgeProfile.libraries) {
		throw new Error("Malformed Forge installation profile.");
	}

	if (!forgeUniversalJar) {
		throw new Error(
			"Couldn't find the universal Forge jar in the installation jar.",
		);
	}

	/**
	 * Move the universal jar into the dist folder.
	 */
	logInfo("Extracting the Forge jar...");
	await fs.promises.writeFile(
		upath.join(serverDestDirectory, upath.basename(forgeUniversalPath)),
		forgeUniversalJar,
	);

	/**
	 * Save the universal jar file name for later.
	 *
	 * We will need it to process launchscripts.
	 */
	g_forgeJar = upath.basename(forgeUniversalPath);

	/**
	 * Finally, fetch libraries.
	 */
	const libraries = forgeProfile.libraries.filter((x) =>
		Boolean(x?.downloads?.artifact?.url),
	);
	logInfo(`Fetching ${libraries.length} server libraries...`);

	await Promise.all(
		libraries.map(async (library) => {
			const libraryPath = library.downloads.artifact.path;

			const def: FileDef = {
				url: library.downloads.artifact.url,
			};

			if (library.downloads.artifact.sha1) {
				def.hashes = [
					{ id: "sha1", hashes: [library.downloads.artifact.sha1] },
				];
			}

			const destPath = upath.join(
				serverDestDirectory,
				"libraries",
				libraryPath,
			);

			await fs.promises.mkdir(upath.dirname(destPath), { recursive: true });
			return fs.promises.copyFile(
				(await downloadOrRetrieveFileDef(def)).cachePath,
				destPath,
			);
		}),
	);
}

/**
 * Download the server jar.
 */
async function downloadMinecraftServer() {
	logInfo("Fetching the Minecraft version manifest...");
	const versionManifest = await getVersionManifest(
		modpackManifest.minecraft.version,
	);
	if (!versionManifest) {
		throw new Error(`No manifest found for Minecraft ${versionManifest}`);
	}

	/**
	 * Fetch the server jar file.
	 *
	 * Pass SHA1 hash to compare against the downloaded file.
	 */
	const serverJar = await downloadOrRetrieveFileDef({
		url: versionManifest.downloads.server.url,
		hashes: [{ id: "sha1", hashes: versionManifest.downloads.server.sha1 }],
	});

	if (!(versionManifest.downloads && versionManifest.downloads.server)) {
		throw new Error(`No server jar file found for ${versionManifest.id}`);
	}

	const dest = upath.join(
		serverDestDirectory,
		`minecraft_server.${versionManifest.id}.jar`,
	);
	await fs.promises.copyFile(upath.resolve(serverJar.cachePath), dest);
}

/**
 * Copies server & shared mods.
 */
async function copyServerMods() {
	return promiseStream(
		src(["*", upath.join("server", "*")], {
			cwd: modDestDirectory,
			resolveSymlinks: true,
			encoding: false,
		}).pipe(dest(upath.join(serverDestDirectory, "mods"))),
	);
}

/**
 * Copies modpack overrides.
 */
async function copyServerOverrides() {
	return promiseStream(
		src(buildConfig.copyFromSharedServerGlobs, {
			cwd: sharedDestDirectory,
			allowEmpty: true,
			resolveSymlinks: true,
			encoding: false,
		}).pipe(dest(upath.join(serverDestDirectory))),
	);
}

/**
 * Copies files from ./serverfiles into dest folder.
 */
async function copyServerFiles() {
	return promiseStream(
		src(["../serverfiles/**"], {
			encoding: false, // Needed because of the Server Icon
		}).pipe(dest(serverDestDirectory)),
	);
}

/**
 * Copies the license file.
 */
async function copyServerLicense() {
	return promiseStream(src("../LICENSE").pipe(dest(serverDestDirectory)));
}

/**
 * Copies the update notes file.
 */
async function copyServerUpdateNotes() {
	return promiseStream(
		src("../UPDATENOTES.md", { allowEmpty: true }).pipe(
			dest(serverDestDirectory),
		),
	);
}

/**
 * Copies the changelog file.
 */
async function copyServerChangelog() {
	if (shouldSkipChangelog()) return;

	return promiseStream(
		src(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md")).pipe(
			dest(serverDestDirectory),
		),
	);
}

/**
 * Copies files from ./launchscripts into dest folder and processes them using mustache.
 *
 * Replaces jvmArgs, minRAM, maxRAM and forgeJar.
 */
async function processLaunchscripts() {
	const rules = {
		jvmArgs: buildConfig.launchscriptsJVMArgs,
		minRAM: buildConfig.launchscriptsMinRAM,
		maxRAM: buildConfig.launchscriptsMaxRAM,
		forgeJar: "",
	};

	if (g_forgeJar) {
		rules.forgeJar = g_forgeJar;
	} else {
		logWarn("No forgeJar specified!");
		logWarn("Did downloadForge task fail?");
	}

	return promiseStream(
		src(["../launchscripts/**"])
			.pipe(
				through.obj((file, _, callback) => {
					if (file.isBuffer()) {
						const rendered = mustache.render(file.contents.toString(), rules);
						file.contents = Buffer.from(rendered);
					}
					callback(null, file);
				}),
			)
			.pipe(dest(serverDestDirectory)),
	);
}

export default series(
	serverCleanUp,
	createServerDirs,
	downloadForge,
	downloadMinecraftServer,
	copyServerMods,
	copyServerOverrides,
	copyServerFiles,
	copyServerLicense,
	copyServerChangelog,
	copyServerUpdateNotes,
	processLaunchscripts,
);
