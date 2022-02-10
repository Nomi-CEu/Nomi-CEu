import bluebird from "bluebird";
import { CurseForgeFetchedFileInfo, CurseForgeModInfo as CurseForgeProject } from "../types/curseForge";
import log from "fancy-log";
import request from "requestretry";
import { ModpackManifestFile } from "../types/modpackManifest";
import Bluebird from "bluebird";
import buildConfig from "../buildConfig";
import upath from "upath";
import fs from "fs";
import { FileDef } from "../types/fileDef";
import { downloadOrRetrieveFileDef, relative, RetrievedFileDefReason } from "./util";

const curseForgeProjectCache: { [key: number]: CurseForgeProject } = {};
export async function fetchProject(toFetch: number): Promise<CurseForgeProject> {
	if (curseForgeProjectCache[toFetch]) {
		return curseForgeProjectCache[toFetch];
	}

	const project: CurseForgeProject = await request({
		uri: `https://addons-ecs.forgesvc.net/api/v2/addon/${toFetch}`,
		json: true,
		fullResponse: false,
		maxAttempts: 5,
	});

	if (project) {
		curseForgeProjectCache[toFetch] = project;
	}
	return project;
}

const fetchedFileInfoCache: { [key: string]: CurseForgeFetchedFileInfo } = {};
export async function fetchFileInfo(projectID: number, fileID: number): Promise<CurseForgeFetchedFileInfo> {
	const slug = `${projectID}/${fileID}`;

	if (fetchedFileInfoCache[slug]) {
		return fetchedFileInfoCache[slug];
	}

	const fileInfo: CurseForgeFetchedFileInfo = await request({
		uri: `https://addons-ecs.forgesvc.net/api/v2/addon/${projectID}/file/${fileID}`,
		json: true,
		fullResponse: false,
	});

	if (fileInfo) {
		fetchedFileInfoCache[slug] = fileInfo;
	}

	return fileInfo;
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
		const fetched: CurseForgeProject[] = await request.post({
			uri: "https://addons-ecs.forgesvc.net/api/v2/addon/",
			json: unfetched,
			fullResponse: false,
			maxAttempts: 5,
		});

		modInfos.push(...fetched);

		// Cache fetched stuff.
		fetched.forEach((mi) => {
			curseForgeProjectCache[mi.id] = mi;
		});

		// In case we haven't received the proper amount of mod infos,
		// try requesting them individually.
		if (unfetched.length !== toFetch.length) {
			const modInfoIDs = new Set(modInfos.map((mi) => mi.id));
			const toFetchMissing = [...new Set(toFetch.filter((x) => !modInfoIDs.has(x)))];

			log.warn(`Couldn't fetch next project IDs in bulk: ${toFetchMissing.join(", ")}`);

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

export async function fetchMods(toFetch: ModpackManifestFile[], destination: string): Promise<void[]> {
	if (toFetch.length > 0) {
		log(`Fetching ${toFetch.length} mods...`);

		const modsPath = upath.join(destination, "mods");
		await fs.promises.mkdir(modsPath, { recursive: true });

		let fetched = 0;
		return Bluebird.map(
			toFetch,
			async (file) => {
				const fileInfo = await fetchFileInfo(file.projectID, file.fileID);

				const fileDef: FileDef = {
					url: fileInfo.downloadUrl,
					hashes: [{ id: "murmurhash", hashes: fileInfo.packageFingerprint }],
				};

				const modFile = await downloadOrRetrieveFileDef(fileDef);
				fetched += 1;

				if (modFile.reason == RetrievedFileDefReason.Downloaded) {
					log(`Downloaded ${upath.basename(fileInfo.downloadUrl)}... (${fetched} / ${toFetch.length})`);
				} else if (modFile.reason == RetrievedFileDefReason.CacheHit) {
					log(`Fetched ${upath.basename(fileInfo.downloadUrl)} from cache... (${fetched} / ${toFetch.length})`);
				}

				const dest = upath.join(destination, "mods", fileInfo.fileName);

				await fs.promises.symlink(relative(dest, modFile.cachePath), dest);
			},
			{ concurrency: buildConfig.downloaderConcurrency },
		);
	} else {
		log("No mods to fetch.");
	}
}
