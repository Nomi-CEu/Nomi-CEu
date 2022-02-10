import Bluebird from "bluebird";
import { modpackManifest } from "../../globals";
import { downloadOrRetrieveFileDef, getVersionManifest, libraryToPath } from "../../util/util";
import unzip from "unzipper";
import { ForgeProfile } from "../../types/forgeProfile";
import log from "fancy-log";
import sha1 from "sha1";
import { fetchFileInfo } from "../../util/curseForgeAPI";
import { VersionManifest } from "../../types/versionManifest";
import fs from "fs";
import upath from "upath";
import buildConfig from "../../buildConfig";

const FORGE_VERSION_REG = /forge-(.+)/;
const FORGE_MAVEN = "https://files.minecraftforge.net/maven/";

/**
 * Download the Forge jar.
 *
 * This is basically a carbon copy of the server Forge-fetching task,
 * except we only download/fetch the Forge jar and enumerate the libraries it has.
 */
async function getForgeURLs() {
	const minecraft = modpackManifest.minecraft;

	/**
	 * Break down the Forge version defined in manifest.json.
	 */
	const parsedForgeEntry = FORGE_VERSION_REG.exec(
		(minecraft.modLoaders.find((x) => x.id && x.id.indexOf("forge") != -1) || {}).id || "",
	);

	if (!parsedForgeEntry) {
		throw new Error("Malformed Forge version in manifest.json.");
	}

	/**
	 * Transform Forge version into Maven library path.
	 */
	const forgeMavenLibrary = `net.minecraftforge:forge:${minecraft.version}-${parsedForgeEntry[1]}`;
	const forgeInstallerPath = libraryToPath(forgeMavenLibrary) + "-installer.jar";

	/**
	 * Fetch the Forge installer
	 */
	const forgeJar = await fs.promises.readFile(
		(
			await downloadOrRetrieveFileDef({
				url: FORGE_MAVEN + forgeInstallerPath,
			})
		).cachePath,
	);

	/**
	 * Parse the profile manifest.
	 */
	let forgeProfile: ForgeProfile;
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
	const libraries = forgeProfile.libraries.filter((x) => Boolean(x?.downloads?.artifact?.url));

	return [FORGE_MAVEN + forgeInstallerPath, ...libraries.map((library) => library.downloads.artifact.url)];
}

/**
 * Removes ALL files from the cache directory that haven't been accessed during this run.
 */
export default async function pruneCache(): Promise<void> {
	const urls = [];

	// Push Forge URLs.
	urls.push(...(await getForgeURLs()).map((url) => url));

	// Fetch file infos.
	const fileInfos = await Bluebird.map(modpackManifest.files, (file) => fetchFileInfo(file.projectID, file.fileID));
	urls.push(...fileInfos.map((fileInfo) => fileInfo.downloadUrl));

	// Fetch the Minecraft server.
	const versionManifest: VersionManifest = await getVersionManifest(modpackManifest.minecraft.version);
	if (!versionManifest) {
		throw new Error(`No manifest found for Minecraft ${versionManifest.id}`);
	}
	urls.push(versionManifest.downloads.server.url);

	// Push external dependencies.
	if (modpackManifest.externalDependencies) {
		urls.push(...modpackManifest.externalDependencies.map((dep) => dep.url));
	}

	const cache = (await fs.promises.readdir(buildConfig.downloaderCacheDirectory)).filter((entity) =>
		fs.statSync(upath.join(buildConfig.downloaderCacheDirectory, entity)).isFile(),
	);

	const shaMap: { [key: string]: boolean } = urls.reduce((map, url) => ((map[sha1(url)] = true), map), {});

	let count = 0,
		bytes = 0;

	for (const sha of cache) {
		if (!shaMap[sha]) {
			const path = upath.join(buildConfig.downloaderCacheDirectory, sha);
			const stat = fs.existsSync(path) ? await fs.promises.stat(path) : null;

			if (stat && stat.isFile()) {
				count += 1;
				bytes += stat.size;
				log(`Pruning ${sha}...`);

				await fs.promises.unlink(path);
			}
		}
	}

	log(`Pruned ${count} files (${(bytes / 1024 / 1024).toFixed(3)} MiB)`);
}
