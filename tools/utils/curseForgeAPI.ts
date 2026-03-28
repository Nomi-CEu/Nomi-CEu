import {
	CurseForgeFileInfo,
	CurseForgeModInfo,
	CurseForgeModInfo as CurseForgeProject,
} from "#types/curseForge.ts";
import { ModpackManifestFile } from "#types/modpackManifest.ts";
import buildConfig from "#buildConfig";
import upath from "upath";
import fs from "fs";
import { FileDef } from "#types/fileDef.ts";
import {
	downloadOrRetrieveFileDef,
	getAxios,
	RetrievedFileDefReason,
} from "./util.ts";
import logInfo, { logError, logWarn } from "./log.ts";

type CFResponse =
	| {
			data: unknown;
	  }
	| undefined;

function getCurseForgeToken() {
	const vari = "CFCORE_API_TOKEN";
	const val = process.env[vari];

	if (!process.env[vari]) {
		throw new Error(`Environmental variable ${vari} is unset.`);
	}

	return val;
}

const curseForgeProjectCache: { [key: number]: CurseForgeProject } = {};
export async function fetchProject(
	toFetch: number,
): Promise<CurseForgeProject> {
	if (curseForgeProjectCache[toFetch]) {
		return curseForgeProjectCache[toFetch];
	}

	const project = (
		(
			await getAxios()({
				url: `${buildConfig.cfCoreApiEndpoint}/v1/mods/${toFetch}`,
				method: "get",
				responseType: "json",
				headers: {
					"X-Api-Key": getCurseForgeToken(),
				},
			})
		).data as CFResponse
	)?.data as CurseForgeProject | undefined;

	if (!project) {
		throw new Error(`Failed to fetch project ${toFetch}`);
	}

	curseForgeProjectCache[toFetch] = project;

	return project;
}

const fetchedFileInfoCache: { [key: string]: CurseForgeFileInfo } = {};
export async function fetchFileInfo(
	projectID: number,
	fileID: number,
): Promise<CurseForgeFileInfo> {
	const slug = `${projectID}/${fileID}`;

	if (fetchedFileInfoCache[slug]) {
		return fetchedFileInfoCache[slug];
	}

	let fileInfo: CurseForgeFileInfo | undefined;
	try {
		fileInfo = (
			(
				await getAxios()({
					url: `${buildConfig.cfCoreApiEndpoint}/v1/mods/${projectID}/files/${fileID}`,
					method: "get",
					responseType: "json",
					headers: {
						"X-Api-Key": getCurseForgeToken(),
					},
				})
			).data as CFResponse
		)?.data as CurseForgeFileInfo | undefined;
	} catch (e) {
		// Usually a 404, aka bad json
		throw new Error(
			`Failed to get info of file from project ${projectID} with fileID ${fileID}!`,
			{
				cause: e,
			},
		);
	}

	if (!fileInfo) {
		throw new Error(
			`Failed to get info of file from project ${projectID} with fileID ${fileID}!`,
		);
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
export async function fetchFilesBulk(
	toFetch: ProjectToFileId[],
): Promise<CurseForgeFileInfo[]> {
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
		const fetched = (
			(
				await getAxios()({
					url: `${buildConfig.cfCoreApiEndpoint}/v1/mods/files`,
					method: "post",
					data: {
						fileIds: unfetched.map((file) => file.fileID),
					},
					headers: {
						"X-Api-Key": getCurseForgeToken(),
					},
				})
			).data as CFResponse
		)?.data as CurseForgeFileInfo[];

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
			const toFetchMissing = [
				...new Set(toFetch.filter((x) => !fileInfoIDs.has(x.fileID))),
			];

			if (toFetchMissing.length > 0) {
				logWarn(
					`Couldn't fetch next project IDs in bulk:\n${toFetchMissing
						.map((file) => `File ${file.fileID} of mod ${file.projectID},`)
						.join("\n")}`,
				);

				// Try fetching files individually, in case they've been deleted.
				let count = 0;
				const missingFileInfos: Promise<CurseForgeFileInfo>[] = [];
				for (const file of toFetchMissing) {
					logInfo(
						`Fetching file ${file.fileID} of mod ${file.projectID} directly... (${++count} / ${toFetchMissing.length})`,
					);

					try {
						// In case something fails to download; catch, rewrite, rethrow.
						missingFileInfos.push(fetchFileInfo(file.projectID, file.fileID));
					} catch (err) {
						logError(
							`Couldn't fetch file ${file.fileID} of mod ${file.projectID}. See Below.`,
						);
						throw err;
					}
				}

				// The code above is expected to throw and terminate the further execution,
				// so we can just do this.
				fileInfos.push(...(await Promise.all(missingFileInfos)));
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
export async function fetchProjectsBulk(
	toFetch: number[],
): Promise<CurseForgeProject[]> {
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
		const fetched = (
			(
				await getAxios()({
					url: `${buildConfig.cfCoreApiEndpoint}/v1/mods`,
					method: "post",
					data: {
						modIds: unfetched,
					},
					headers: {
						"X-Api-Key": getCurseForgeToken(),
					},
				})
			).data as CFResponse
		)?.data as CurseForgeProject[];

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
			const toFetchMissing = [
				...new Set(toFetch.filter((x) => !modInfoIDs.has(x))),
			];

			logWarn(
				`Couldn't fetch some project IDs in bulk: ${toFetchMissing.join(", ")}`,
			);

			// Try fetching mods individually, in case they've been deleted.
			let count = 0;
			const missingModInfos: Promise<CurseForgeModInfo>[] = [];
			for (const id of toFetchMissing) {
				logInfo(
					`Fetching project ID ${id} directly... (${++count} / ${toFetchMissing.length})`,
				);

				try {
					// In case something fails to download; catch, rewrite, rethrow.
					missingModInfos.push(fetchProject(id));
				} catch (err) {
					logError(`Couldn't fetch project ID ${id}. See Below.`);
					throw err;
				}
			}

			// The code above is expected to throw and terminate the further execution,
			// so we can just do this.
			modInfos.push(...(await Promise.all(missingModInfos)));
		}
	}

	return modInfos;
}

/**
 * Downloads mods from the manifest.
 * @param toFetch The files to fetch
 * @param destination The dir to put all the mods in. The mods will go into that dir, and not into a sub dir!
 */
export async function fetchMods(
	toFetch: ModpackManifestFile[],
	destination: string,
): Promise<void> {
	if (toFetch.length > 0) {
		logInfo(`Fetching ${toFetch.length} mods...`);

		let fetched = 0;

		await Promise.all(
			toFetch.map(async (file): Promise<void> => {
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
					logInfo(
						`Downloaded ${upath.basename(fileDef.url)}... (${fetched} / ${toFetch.length})`,
					);
				} else if (modFile.reason == RetrievedFileDefReason.CacheHit) {
					logInfo(
						`Fetched ${upath.basename(fileDef.url)} from cache... (${fetched} / ${toFetch.length})`,
					);
				}

				const dest = upath.join(destination, fileInfo.fileName);

				await fs.promises.symlink(upath.resolve(modFile.cachePath), dest);
			}),
		);
	} else {
		logInfo("No mods to fetch.");
	}
}
