import { modpackManifest, rootDirectory } from "#globals";
import { logWarn } from "#utils/log.ts";
import { fetchFileInfo } from "#utils/curseForgeAPI.ts";
import fs from "fs";
import upath from "upath";
import buildConfig from "#buildConfig";
import {buildModList} from "#tasks/misc/createModList.ts";

export async function checkManifestStructure(throwErrors: boolean) {
	let prevProjId = 0;

	// If we aren't throwing errors, we only need to notify the user the manifest isn't sorted once
	let notifiedUnSorted = false;

	const projIds = new Set<number>();

	// Check formatting
	const fileString = await fs.promises.readFile(
		upath.join(rootDirectory, "manifest.json"),
		"utf-8",
	);
	const saveString = JSON.stringify(modpackManifest, null, 2) + "\n";

	let requiresFormat = false;
	if (fileString !== saveString) {
		const errorMsg = "Manifest is not formatted correctly!";
		if (throwErrors) {
			throw new Error(errorMsg);
		}
		logWarn(errorMsg + " Formatting manifest...");
		requiresFormat = true;
	}

	// Check that the file list is sorted
	for (const file of modpackManifest.files) {
		// Check not duplicate proj. id
		if (projIds.has(file.projectID)) {
			throw new Error(
				`Duplicate project id ${file.projectID}!` +
					(throwErrors ? "" : " This is not fixable automatically!"),
			);
		}
		projIds.add(file.projectID);

		// Check sorted status
		if (prevProjId > file.projectID) {
			if (notifiedUnSorted) continue;

			const errorMsg = "Manifest is not sorted!";
			if (throwErrors) {
				throw new Error(errorMsg);
			}

			if (!notifiedUnSorted) logWarn(errorMsg + " Sorting manifest...");
			notifiedUnSorted = true;
		} else prevProjId = file.projectID;
	}

	// Sort, if we need to auto-fix and unsorted
	if (notifiedUnSorted) {
		modpackManifest.files.sort((a, b) => a.projectID - b.projectID);
	}

	if (notifiedUnSorted || requiresFormat) {
		await fs.promises.writeFile(
			upath.join(rootDirectory, "manifest.json"),
			JSON.stringify(modpackManifest, null, 2) + "\n",
		);
	}
}

export async function checkManifestFilesExist() {
	// Check if the file exists to the given project id (will throw if invalid)
	await Promise.all(
		modpackManifest.files.map((file) =>
			fetchFileInfo(file.projectID, file.fileID),
		),
	);

	// Write a modlist
	if (!fs.existsSync(buildConfig.buildDestinationDirectory)) {
		await fs.promises.mkdir(buildConfig.buildDestinationDirectory, {
			recursive: true,
		});
	}

	return buildModList(buildConfig.buildDestinationDirectory);
}
