import fs from "fs";
import upath from "upath";
import { rootDirectory } from "#globals";
import { ModpackManifest } from "#types/modpackManifest.js";

const labsProjectId = 932060;

export async function updateLabs(): Promise<void> {
	const id = process.env.ID;

	if (!id) {
		throw new Error("Labs ID not set.");
	}

	const numericalId = Number.parseInt(id);
	if (Number.isNaN(numericalId)) {
		throw new Error("Labs ID is not a number.");
	}

	const manifest = JSON.parse(
		await fs.promises.readFile(
			upath.join(rootDirectory, "manifest.json"),
			"utf-8",
		),
	) as ModpackManifest;

	for (const file of manifest.files) {
		if (file.projectID === labsProjectId) {
			file.fileID = numericalId;
		}
	}

	return fs.promises.writeFile(
		upath.join(rootDirectory, "manifest.json"),
		JSON.stringify(manifest, null, 2) + "\n",
	);
}
