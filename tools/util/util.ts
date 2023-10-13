import sha1 from "sha1";
import { FileDef } from "../types/fileDef";
import fs from "fs";
import buildConfig from "../buildConfig";
import upath from "upath";
import requestretry from "requestretry";
import request from "requestretry";
import http from "http";
import { compareBufferToHashDef } from "./hashes";
import { execSync } from "child_process";
import { ExternalDependency, ModpackManifest, ModpackManifestFile } from "../types/modpackManifest";
import { fetchFileInfo, fetchProject, fetchProjectsBulk } from "./curseForgeAPI";
import Bluebird from "bluebird";
import { VersionManifest } from "../types/versionManifest";
import { VersionsManifest } from "../types/versionsManifest";
import log from "fancy-log";
import { pathspec, SimpleGit, simpleGit } from "simple-git";
import { Commit, ModChangeInfo } from "../types/changelogTypes";
import { rootDirectory } from "../globals";

const LIBRARY_REG = /^(.+?):(.+?):(.+?)$/;

// Make git commands run in root dir
const git: SimpleGit = simpleGit(rootDirectory);

/**
 * Parses the library name into path following the standard package naming convention.
 *
 * Turns `package:name:version` into `package/name/version/name-version`.
 */
export const libraryToPath = (library: string): string => {
	const parsedLibrary = LIBRARY_REG.exec(library);
	if (parsedLibrary) {
		const pkg = parsedLibrary[1].replace(/\./g, "/");
		const name = parsedLibrary[2];
		const version = parsedLibrary[3];

		return `${pkg}/${name}/${version}/${name}-${version}`;
	}
};

/**
 * Checks if given environmental variables are set. Throws otherwise.
 */
export const checkEnvironmentalVariables = (vars: string[]): void => {
	vars.forEach((vari) => {
		if (!isEnvVariableSet(vari)) {
			throw new Error(`Environmental variable ${vari} is unset.`);
		}
	});
};

/**
 * Returns true if given variable set, false otherwise.
 */
export const isEnvVariableSet = (env: string): boolean => {
	return process.env[env] && process.env[env] != "";
};

/**
 * Check if given git tag exists. Throws otherwise.
 */
export const checkGitTag = (tag: string): void => {
	// The below command returns an empty buffer if the given tag does not exist.
	const tagBuffer = execSync(`git tag --list ${tag}`);

	if (!tagBuffer || tagBuffer.toString().trim() != tag) {
		throw new Error(`Tag ${tag} could not be found.`);
	}
};

export enum RetrievedFileDefReason {
	Downloaded,
	CacheHit,
}

export interface RetrievedFileDef {
	reason: RetrievedFileDefReason;
	cachePath: string;
}

/**
 * Downloads/fetches files from the Interwebs.
 *
 * Internally hashes the URL of the provided FileDef and looks it up in the cache directory.
 * In case of no cache hit, downloads the file and stores within the cache directory for later use.
 * <p>
 * @param fileDef The file def to download or retrieve.
 */
export async function downloadOrRetrieveFileDef(fileDef: FileDef): Promise<RetrievedFileDef> {
	const fileNameSha = sha1(fileDef.url);

	const cachedFilePath = upath.join(buildConfig.downloaderCacheDirectory, fileNameSha);
	if (fs.existsSync(cachedFilePath)) {
		const file = await fs.promises.readFile(cachedFilePath);

		if (file.length !== 0) {
			const rFileDef = {
				reason: RetrievedFileDefReason.CacheHit,
				cachePath: cachedFilePath,
			};

			// Check hashes.
			if (fileDef.hashes) {
				if (
					fileDef.hashes.every((hashDef) => {
						return compareBufferToHashDef(file, hashDef);
					})
				) {
					return rFileDef;
				}
			} else {
				return rFileDef;
			}
		}
	}

	if (!fs.existsSync(buildConfig.downloaderCacheDirectory)) {
		await fs.promises.mkdir(buildConfig.downloaderCacheDirectory, { recursive: true });
	}

	let handle: fs.promises.FileHandle;
	try {
		handle = await fs.promises.open(cachedFilePath, "w");

		await handle.write(await downloadFileDef(fileDef));
		await handle.close();

		return {
			reason: RetrievedFileDefReason.Downloaded,
			cachePath: cachedFilePath,
		};
	} catch (err) {
		if (handle && (await handle.stat()).isFile()) {
			log(`Couldn't download ${upath.basename(fileDef.url)}, cleaning up ${fileNameSha}...`);

			await handle.close();
			await fs.promises.unlink(cachedFilePath);
		}

		throw err;
	}
}

/**
 * Similar to downloadOrRetrieveFileDef, but does not check cache.
 */
export async function downloadFileDef(fileDef: FileDef): Promise<Buffer> {
	let hashFailed = false;
	const retryStrategy = (err: Error, response: http.IncomingMessage, body: unknown) => {
		if (response.statusCode === 404) {
			throw new Error(`URL ${fileDef.url} returned status 404.`);
		}
		// Verify hashes.
		if (!err && fileDef.hashes && body) {
			const success = fileDef.hashes.every((hashDef) => {
				return compareBufferToHashDef(body as Buffer, hashDef);
			});

			if (!success) {
				if (hashFailed) {
					throw new Error(`Couldn't verify checksums of ${upath.basename(fileDef.url)}`);
				}

				hashFailed = true;
				return true;
			}
		}
		return requestretry.RetryStrategies.HTTPOrNetworkError(err, response, body);
	};

	return Buffer.from(
		await requestretry({
			url: fileDef.url,
			fullResponse: false,
			encoding: null,
			retryStrategy: retryStrategy,
			maxAttempts: 5,
		}),
	);
}

/**
 * Returns artifact name body depending on environment variables.
 * Mostly intended to be called by CI/CD.
 */
export function makeArtifactNameBody(baseName: string): string {
	// If the tag is provided by CI, simply just glue it to the base name.
	if (process.env.GITHUB_TAG) {
		return `${baseName}-${process.env.GITHUB_TAG}`;
	}
	// If SHA is provided and the build isn't tagged, append both the branch and short SHA.
	else if (process.env.GITHUB_SHA && process.env.GITHUB_REF && process.env.GITHUB_REF.startsWith("refs/heads/")) {
		const shortCommit = process.env.GITHUB_SHA.substring(0, 7);
		const branch = /refs\/heads\/(.+)/.exec(process.env.GITHUB_REF);
		return `${baseName}-${branch[1]}-${shortCommit}`;
	} else {
		return baseName;
	}
}

/**
 * Returns the COMPARE_TAG env if set, else fetches the last tag known to Git using the current branch.
 * @param before Tag to get the tag before.
 * @returns string Git tag.
 * @throws
 */
export function getLastGitTag(before?: string): string {
	if (isEnvVariableSet("COMPARE_TAG")) {
		checkGitTag(process.env["COMPARE_TAG"]);

		return process.env["COMPARE_TAG"];
	}

	if (before) {
		before = `"${before}^"`;
	}

	return execSync(`git describe --abbrev=0 --tags ${before || ""}`)
		.toString()
		.trim();
}

/**
 * Generates a changelog based on the two provided Git refs.
 * @param since Lower boundary Git ref.
 * @param to Upper boundary Git ref.
 * @param dirs Optional scopes. These are of the perspective of the root dir.
 * @returns changelog Object Array of Changelog
 */
export async function getChangelog(since = "HEAD", to = "HEAD", dirs: string[] = undefined): Promise<Commit[]> {
	const options: string[] = ["--no-merges", `${since}..${to}`];
	if (dirs) {
		dirs.forEach((dir) => {
			options.push(pathspec(dir));
		});
	}

	const commitList: Commit[] = [];
	await git.log(options, (err, output) => {
		if (err) {
			console.error(err);
			throw new Error();
		}

		// Cannot simply set commitList as output.all as is read only, must do this
		output.all.forEach((commit) => commitList.push(commit));
	});

	return commitList;
}

/**
 * Gets the file at a certain point in time.
 * @param path The path to the file
 * @param revision The git ref point. Can also be a commit SHA
 */
export function getFileAtRevision(path: string, revision = "HEAD"): string {
	return execSync(`git show ${revision}:"${path}"`).toString().trim();
}

export interface ManifestFileListComparisonResult {
	removed: ModChangeInfo[];
	modified: ModChangeInfo[];
	added: ModChangeInfo[];
}

export async function compareAndExpandManifestDependencies(
	oldFiles: ModpackManifest,
	newFiles: ModpackManifest,
): Promise<ManifestFileListComparisonResult> {
	// Map inputs for efficient joining.
	const oldFileMap: { [key: number]: ModpackManifestFile } = oldFiles.files.reduce((map, file) => {
		map[file.projectID] = file;
		return map;
	}, {});
	const newFileMap: { [key: number]: ModpackManifestFile } = newFiles.files.reduce((map, file) => {
		map[file.projectID] = file;
		return map;
	}, {});

	const removed: ModChangeInfo[] = [],
		modified: ModChangeInfo[] = [],
		added: ModChangeInfo[] = [];

	// Create a distinct map of project IDs.
	const projectIDs = Array.from(
		new Set([...oldFiles.files.map((f) => f.projectID), ...newFiles.files.map((f) => f.projectID)]),
	);

	// Fetch projects in bulk and discard the result.
	// Future calls to fetchProject() and fetchProjectsBulk() will hit the cache.
	await fetchProjectsBulk(projectIDs);

	await Bluebird.map(
		projectIDs,
		async (projectID) => {
			const oldFileInfo = oldFileMap[projectID];
			const newFileInfo = newFileMap[projectID];

			// Doesn't exist in new, but exists in old. Removed. Left outer join.
			if (!newFileInfo && oldFileInfo) {
				removed.push({
					modName: (await fetchProject(oldFileInfo.projectID)).name,
					projectID: projectID,
					oldVersion: (await fetchFileInfo(oldFileInfo.projectID, oldFileInfo.fileID)).displayName,
				});
			}
			// Doesn't exist in old, but exists in new. Added. Right outer join.
			else if (newFileMap[projectID] && !oldFileMap[projectID]) {
				added.push({
					modName: (await fetchProject(newFileInfo.projectID)).name,
					projectID: projectID,
					newVersion: (await fetchFileInfo(newFileInfo.projectID, newFileInfo.fileID)).displayName,
				});
			}
			// Exists in both. Modified? Inner join.
			else if (oldFileInfo.fileID != newFileInfo.fileID) {
				modified.push({
					modName: (await fetchProject(newFileInfo.projectID)).name,
					projectID: projectID,
					oldVersion: (await fetchFileInfo(newFileInfo.projectID, oldFileInfo.fileID)).displayName,
					newVersion: (await fetchFileInfo(newFileInfo.projectID, newFileInfo.fileID)).displayName,
				});
			}
		},
		{ concurrency: buildConfig.downloaderConcurrency },
	);

	// Compare external dependencies the same way.
	const oldExternalMap: { [key: string]: ExternalDependency } = (oldFiles.externalDependencies || []).reduce(
		(map, file) => {
			map[file.name] = file;
			return map;
		},
		{},
	);
	const newExternalMap: { [key: string]: ExternalDependency } = (newFiles.externalDependencies || []).reduce(
		(map, file) => {
			map[file.name] = file;
			return map;
		},
		{},
	);

	const externalNames = Array.from(
		new Set([
			...(oldFiles.externalDependencies || []).map((dep) => dep.name),
			...(newFiles.externalDependencies || []).map((dep) => dep.name),
		]),
	);

	externalNames.forEach((name) => {
		const oldDep = oldExternalMap[name];
		const newDep = newExternalMap[name];

		// Doesn't exist in new, but exists in old. Removed. Left outer join.
		if (!newDep && oldDep) {
			removed.push({ modName: oldDep.name });
		}
		// Doesn't exist in old, but exists in new. Added. Right outer join.
		else if (newDep && !oldDep) {
			added.push({ modName: newDep.name });
		}
		// Exists in both. Modified? Inner join.
		else if (oldDep.url != newDep.url || oldDep.name != newDep.name) {
			modified.push({ modName: newDep.name });
		}
	});

	return {
		removed: removed,
		modified: modified,
		added: added,
	};
}

const LAUNCHERMETA_VERSION_MANIFEST = "https://launchermeta.mojang.com/mc/game/version_manifest.json";

/**
 * Fetches the version manifest associated with the provided Minecraft version.
 *
 * @param minecraftVersion Minecraft version. (e. g., "1.12.2")
 */
export async function getVersionManifest(minecraftVersion: string): Promise<VersionManifest> {
	/**
	 * Fetch the manifest file of all Minecraft versions.
	 */
	const manifest: VersionsManifest = await request({
		uri: LAUNCHERMETA_VERSION_MANIFEST,
		json: true,
		fullResponse: false,
		maxAttempts: 5,
	});

	const version = manifest.versions.find((x) => x.id == minecraftVersion);
	if (!version) {
		return null;
	}

	return request({
		uri: version.url,
		json: true,
		fullResponse: false,
		maxAttempts: 5,
	});
}

/**
 * Returns a relative posix path from the first argument to the second.
 */
export function relative(from: string, to: string): string {
	const broken = [from.split(upath.sep), to.split(upath.sep)];

	while (broken.every((x) => x.length > 0) && broken[0][0] == broken[1][0]) {
		broken.forEach((x) => x.shift());
	}

	if (broken.some((x) => x.length === 0)) {
		throw new Error("Paths are not relative.");
	}

	return upath.join(...Array(broken[0].length - 1).fill(".."), ...broken[1]);
}

/**
 * Cleans up a file's display name, and returns the version. Works for all tested mods!
 * @param version The filename/version to cleanup.
 */
export function cleanupVersion(version: string): string {
	if (!version) return "";
	version = version.replace(/1\.12\.2|1\.12|\.jar/g, "");
	const list = version.match(/[\d+.?]+/g);
	return list[list.length - 1];
}
