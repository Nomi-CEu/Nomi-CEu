import { modpackManifest } from "#globals";
import { FORGE_MAVEN, getForgeJar, getVersionManifest } from "#utils/util.ts";
import unzip from "unzipper";
import { ForgeProfile } from "#types/forgeProfile.ts";
import { sha1 } from "hash-wasm";
import { fetchFileInfo } from "#utils/curseForgeAPI.ts";
import fs from "fs";
import upath from "upath";
import buildConfig from "#buildConfig";
import logInfo from "#utils/log.ts";

/**
 * Download the Forge jar.
 *
 * This is basically a carbon copy of the server Forge-fetching task,
 * except we only download/fetch the Forge jar and enumerate the libraries it has.
 */
async function getForgeURLs() {
	const { forgeJar, forgeInstallerPath } = await getForgeJar();

	/**
	 * Parse the profile manifest.
	 */
	let forgeProfile: ForgeProfile | undefined = undefined;
	const files = (await unzip.Open.buffer(forgeJar))?.files;

	if (!files) {
		throw new Error("Malformed Forge installation jar.");
	}

	for (const file of files) {
		// Look for the installation profile.
		if (!forgeProfile && file.path == "version.json") {
			forgeProfile = JSON.parse((await file.buffer()).toString());
		}
	}

	if (!forgeProfile || !forgeProfile.libraries) {
		throw new Error("Malformed Forge installation profile.");
	}

	/**
	 * Finally, fetch libraries.
	 */
	const libraries = forgeProfile.libraries.filter((x) =>
		Boolean(x?.downloads?.artifact?.url),
	);

	return [
		FORGE_MAVEN + forgeInstallerPath,
		...libraries.map((library) => library.downloads.artifact.url),
	];
}

/**
 * Removes ALL files from the cache directory that haven't been accessed during this run.
 */
export default async function pruneCache(): Promise<void> {
	const urls = [];

	// Push Forge URLs.
	urls.push(...(await getForgeURLs()).map((url) => url));

	// Fetch file infos.
	const fileInfos = await Promise.all(
		modpackManifest.files.map(async (file) =>
			fetchFileInfo(file.projectID, file.fileID),
		),
	);
	urls.push(...fileInfos.map((fileInfo) => fileInfo.downloadUrl));

	// Fetch the Minecraft server.
	const versionManifest = await getVersionManifest(
		modpackManifest.minecraft.version,
	);
	if (!versionManifest) {
		throw new Error(`No manifest found for Minecraft ${versionManifest}`);
	}
	urls.push(versionManifest.downloads.server.url);

	// Push external dependencies.
	if (modpackManifest.externalDependencies) {
		urls.push(...modpackManifest.externalDependencies.map((dep) => dep.url));
	}

	const cache = (
		await fs.promises.readdir(buildConfig.downloaderCacheDirectory)
	).filter((entity) =>
		fs
			.statSync(upath.join(buildConfig.downloaderCacheDirectory, entity))
			.isFile(),
	);

	const shaMap: { [key: string]: boolean } = {};
	const hashes = await Promise.all(urls.map((url) => sha1(url)));
	for (const hash of hashes) {
		shaMap[hash] = true;
	}

	let count = 0;
	let bytes = 0;

	for (const sha of cache) {
		if (!shaMap[sha]) {
			const path = upath.join(buildConfig.downloaderCacheDirectory, sha);
			const stat = fs.existsSync(path) ? await fs.promises.stat(path) : null;

			if (stat && stat.isFile()) {
				count += 1;
				bytes += stat.size;
				logInfo(`Pruning ${sha}...`);

				await fs.promises.unlink(path);
			}
		}
	}

	logInfo(`Pruned ${count} files (${(bytes / 1024 / 1024).toFixed(3)} MiB)`);
}
