import bluebird from "bluebird";
import { CurseForgeFileInfo, CurseForgeModInfo as CurseForgeProject } from "../types/curseForge";
import log from "fancy-log";
import request from "requestretry";
import { ModpackManifestFile } from "../types/modpackManifest";
import Bluebird from "bluebird";
import buildConfig from "../buildConfig";
import upath from "upath";
import fs from "fs";
import { FileDef } from "../types/fileDef";
import { downloadOrRetrieveFileDef, relative, RetrievedFileDefReason } from "./util";

function getCurseForgeToken() {
	const vari = "CFCORE_API_TOKEN";
	const val = process.env[vari];

	if (!process.env[vari]) {
		throw new Error(`Environmental variable ${vari} is unset.`);
	}

	return val;
}

const curseForgeProjectCache: { [key: number]: CurseForgeProject } = {};
export async function fetchProject(toFetch: number): Promise<CurseForgeProject> {
	if (curseForgeProjectCache[toFetch]) {
		return curseForgeProjectCache[toFetch];
	}

	const project: CurseForgeProject | undefined = (
		await request({
			uri: `${buildConfig.cfCoreApiEndpoint}/v1/mods/${toFetch}`,
			json: true,
			fullResponse: false,
			maxAttempts: 5,
			headers: {
				"X-Api-Key": getCurseForgeToken(),
			},
		})
	)?.data;

	if (!project) {
		throw new Error(`Failed to fetch project ${toFetch}`);
	}

	curseForgeProjectCache[toFetch] = project;

	return project;
}

const fetchedFileInfoCache: { [key: string]: CurseForgeFileInfo } = {};
export async function fetchFileInfo(projectID: number, fileID: number): Promise<CurseForgeFileInfo> {
	const slug = `${projectID}/${fileID}`;

	if (fetchedFileInfoCache[slug]) {
		return fetchedFileInfoCache[slug];
	}

	const fileInfo: CurseForgeFileInfo = (
		await request({
			uri: `${buildConfig.cfCoreApiEndpoint}/v1/mods/${projectID}/files/${fileID}`,
			json: true,
			fullResponse: false,
			headers: {
				"X-Api-Key": getCurseForgeToken(),
			},
		})
	)?.data;

	if (!fileInfo) {
		throw new Error(`Failed to download file ${projectID}/file/${fileID}`);
	}

	fetchedFileInfoCache[slug] = fileInfo;

	return fileInfo;
}

export interface ProjectToFileId {
	projectID: number;
	fileID: number;
}

/**
 * Fetches multiple CurseForge files.
 * Falls back to fetchFileInfo in case it's impossible to bulk-fetch some files.
 *
 * @param toFetch List of Project IDs to File IDs, to fetch.
 * @returns CurseForge file infos.
 */
export async function fetchFilesBulk(toFetch: ProjectToFileId[]): Promise<CurseForgeFileInfo[]> {
	const fileInfos: CurseForgeFileInfo[] = [];
	// Map of file ids not fetched (project ID to file ID)
	const unfetched: ProjectToFileId[] = [];

	// Determine projects that have been fetched already.
	toFetch.forEach((file) => {
		const slug = `${file.projectID}/${file.fileID}`;
		const cached = fetchedFileInfoCache[slug];
		if (cached) fileInfos.push(cached);
		else unfetched.push(file);
	});

	// Sort list (reduces risk of duplicate entries)
	unfetched.sort((a, b) => a.fileID - b.fileID);

	if (unfetched.length > 0) {
		// Augment the array of known files with new info.
		const fetched: CurseForgeFileInfo[] = (
			await request.post({
				uri: `${buildConfig.cfCoreApiEndpoint}/v1/mods/files`,
				json: {
					fileIds: unfetched.map((file) => file.fileID),
				},
				fullResponse: false,
				maxAttempts: 5,
				headers: {
					"X-Api-Key": getCurseForgeToken(),
				},
			})
		)?.data;

		if (!fetched) {
			throw new Error(
				`Failed to bulk-fetch files:\n${unfetched
					.map((file) => `File ${file.fileID} of mod ${file.projectID},`)
					.join("\n")}`,
			);
		}

		// Remove duplicate entries (Batch Fetch sometimes returns duplicate inputs... for some reason)
		if (fetched.length > unfetched.length) {
			// Can't directly use Set, as Set compares object ref, not object data
			const uniqueFileIDs: number[] = [];
			fetched.forEach((file) => {
				if (!uniqueFileIDs.includes(file.id)) {
					fileInfos.push(file);
					uniqueFileIDs.push(file.id);
				}
			});
		} else {
			fileInfos.push(...fetched);
		}

		// Cache fetched stuff.
		fetched.forEach((info) => {
			fetchedFileInfoCache[`${info.modId}/${info.id}`] = info;
		});

		// In case we haven't received the proper amount of mod infos,
		// try requesting them individually.
		if (fileInfos.length < toFetch.length) {
			// Set of fetched fileIDs.
			const fileInfoIDs: Set<number> = new Set(
				fileInfos.map((file) => {
					return file.id;
				}),
			);
			const toFetchMissing = [...new Set(toFetch.filter((x) => !fileInfoIDs.has(x.fileID)))];

			if (toFetchMissing.length > 0) {
				log.warn(
					`Couldn't fetch next project IDs in bulk:\n${toFetchMissing
						.map((file) => `File ${file.fileID} of mod ${file.projectID},`)
						.join("\n")}`,
				);

				// Try fetching files individually, in case they've been deleted.
				let count = 0;
				const missingFileInfos: CurseForgeFileInfo[] = await bluebird.map(toFetchMissing, async (file) => {
					log.info(
						`Fetching file ${file.fileID} of mod ${file.projectID} directly... (${++count} / ${toFetchMissing.length})`,
					);

					try {
						// In case something fails to download; catch, rewrite, rethrow.
						return await fetchFileInfo(file.projectID, file.fileID);
					} catch (err) {
						err.message = `Couldn't fetch file ${file.fileID} of mod ${file.projectID}. ${
							err.message || "Unknown error"
						}`;
						throw err;
					}
				});

				// The code above is expected to throw and terminate the further execution,
				// so we can just do this.
				fileInfos.push(...missingFileInfos);
			}
		}
	}

	return fileInfos;
}

/**
 * Fetches multiple CurseForge projects.
 * Falls back to fetchModInfo in case it's impossible to bulk-fetch some projects.
 *
 * @param toFetch Project IDs to fetch.
 * @returns CurseForge project infos.
 */
export async function fetchProjectsBulk(toFetch: number[]): Promise<CurseForgeProject[]> {
	const modInfos: CurseForgeProject[] = [];
	const unfetched: number[] = [];

	// Determine projects that have been fetched already.
	toFetch.forEach((id) => {
		const cached = curseForgeProjectCache[id];
		if (cached) {
			modInfos.push(cached);
		} else {
			unfetched.push(id);
		}
	});

	if (unfetched.length > 0) {
		// Augment the array of known projects with new info.
		const fetched: CurseForgeProject[] = (
			await request.post({
				uri: `${buildConfig.cfCoreApiEndpoint}/v1/mods`,
				json: {
					modIds: unfetched,
				},
				fullResponse: false,
				maxAttempts: 5,
				headers: {
					"X-Api-Key": getCurseForgeToken(),
				},
			})
		)?.data;

		if (!fetched) {
			throw new Error(`Failed to bulk-fetch projects ${unfetched.join(", ")}`);
		}

		modInfos.push(...fetched);

		// Cache fetched stuff.
		fetched.forEach((mi) => {
			curseForgeProjectCache[mi.id] = mi;
		});

		// In case we haven't received the proper amount of mod infos,
		// try requesting them individually.
		if (modInfos.length !== toFetch.length) {
			const modInfoIDs = new Set(modInfos.map((mi) => mi.id));
			const toFetchMissing = [...new Set(toFetch.filter((x) => !modInfoIDs.has(x)))];

			log.warn(`Couldn't fetch some project IDs in bulk: ${toFetchMissing.join(", ")}`);

			// Try fetching mods individually, in case they've been deleted.
			let count = 0;
			const missingModInfos: CurseForgeProject[] = await bluebird.map(toFetchMissing, async (id) => {
				log.info(`Fetching project ID ${id} directly... (${++count} / ${toFetchMissing.length})`);

				try {
					// In case something fails to download; catch, rewrite, rethrow.
					return await fetchProject(id);
				} catch (err) {
					err.message = `Couldn't fetch project ID ${id}. ${err.message || "Unknown error"}`;
					throw err;
				}
			});

			// The code above is expected to throw and terminate the further execution,
			// so we can just do this.
			modInfos.push(...missingModInfos);
		}
	}

	return modInfos;
}

/**
 * Downloads mods from the manifest.
 * @param toFetch The files to fetch
 * @param destination The dir to put all the mods in. The mods will go into that dir, and not into a sub dir!
 */
export async function fetchMods(toFetch: ModpackManifestFile[], destination: string): Promise<void[]> {
	if (toFetch.length > 0) {
		log(`Fetching ${toFetch.length} mods...`);

		let fetched = 0;
		return Bluebird.map(
			toFetch,
			async (file) => {
				const fileInfo = await fetchFileInfo(file.projectID, file.fileID);
				const fileDef: FileDef = {
					url: fileInfo.downloadUrl,
				};

				// https://docs.curseforge.com/#tocS_GetModsByIdsListRequestBody
				if (fileInfo.hashes) {
					fileDef.hashes = fileInfo.hashes.map((hash) => ({
						hashes: hash.value,
						id: hash.algo == 1 ? "sha1" : "md5",
					}));
				}

				const modFile = await downloadOrRetrieveFileDef(fileDef);
				fetched += 1;

				if (modFile.reason == RetrievedFileDefReason.Downloaded) {
					log(`Downloaded ${upath.basename(fileDef.url)}... (${fetched} / ${toFetch.length})`);
				} else if (modFile.reason == RetrievedFileDefReason.CacheHit) {
					log(`Fetched ${upath.basename(fileDef.url)} from cache... (${fetched} / ${toFetch.length})`);
				}

				const dest = upath.join(destination, fileInfo.fileName);

				await fs.promises.symlink(relative(dest, modFile.cachePath), dest);
			},
			{ concurrency: buildConfig.downloaderConcurrency },
		);
	} else {
		log("No mods to fetch.");
	}
}
