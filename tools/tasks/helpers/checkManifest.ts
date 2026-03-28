import { modpackManifest, rootDirectory } from "#globals";
import { logWarn } from "#utils/log.ts";
import { fetchFileInfo } from "#utils/curseForgeAPI.ts";
import fs from "fs";
import upath from "upath";
import buildConfig from "#buildConfig";
import { buildModList } from "#tasks/misc/createModList.ts";
import dedent from "dedent-js";

export async function checkManifestStructure(throwErrors: boolean) {
	let prevProjId = 0;

	// If we aren't throwing errors, we only need to notify the user the manifest isn't sorted once
	let notifiedUnSorted = false;
	let keysWrongOrder = false;

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

	const resultantFiles = [...modpackManifest.files];

	// Check that the file list is sorted
	modpackManifest.files.forEach((file, idx) => {
		// Check not duplicate proj. id
		if (projIds.has(file.projectID)) {
			throw new Error(
				`Duplicate project id ${file.projectID}!` +
					(throwErrors ? "" : " This is not fixable automatically!"),
			);
		}
		projIds.add(file.projectID);

		// Check file object key sorting
		const expectedOrder = ["projectID", "fileID", "required", "sides"];
		let wrongOrder = false;
		const keys = Object.keys(file);

		if (keys.length !== 3 && keys.length !== 4) {
			throw new Error(dedent`
			Manifest file object ${JSON.stringify(file, null, 2)} doesn't have 3 or 4 keys!
			Required: 'projectID', 'fileID', 'required', Optional: 'sides'. This is not fixable automatically!`);
		}

		for (let i = 0; i < keys.length; i++) {
			if (keys[i] !== expectedOrder[i]) {
				if (throwErrors) {
					throw new Error(
						`Manifest file object ${file.projectID} has keys in wrong order!`,
					);
				}

				logWarn(
					`Fixing key order of manifest file object ${file.projectID}...`,
				);
				wrongOrder = true;
				keysWrongOrder = true;
				break;
			}
		}

		// Sort keys (if needed)
		if (wrongOrder) {
			resultantFiles[idx] = {
				projectID: file.projectID,
				fileID: file.fileID,
				required: file.required,
				sides: file.sides,
			};
		}

		// Check sorted status
		if (prevProjId > file.projectID) {
			if (notifiedUnSorted) return;

			const errorMsg = "Manifest is not sorted!";
			if (throwErrors) {
				throw new Error(errorMsg);
			}

			if (!notifiedUnSorted) logWarn(errorMsg + " Sorting manifest...");
			notifiedUnSorted = true;
		} else prevProjId = file.projectID;
	});

	// Sort, if we need to auto-fix and unsorted
	if (notifiedUnSorted || keysWrongOrder) {
		modpackManifest.files = resultantFiles.sort(
			(a, b) => a.projectID - b.projectID,
		);
	}

	if (notifiedUnSorted || keysWrongOrder || requiresFormat) {
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
