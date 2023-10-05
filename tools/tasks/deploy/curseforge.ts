import { modpackManifest } from "../../globals";

import request from "requestretry";
import fs from "fs";
import log from "fancy-log";
import upath from "upath";
import buildConfig from "../../buildConfig";
import { makeArtifactNameBody } from "../../util/util";
import sanitize from "sanitize-filename";
import mustache from "mustache";
import { DeployReleaseType, inputToDeployReleaseTypes } from "../../types/changelogTypes";

const CURSEFORGE_LEGACY_ENDPOINT = "https://minecraft.curseforge.com/";
const variablesToCheck = ["CURSEFORGE_API_TOKEN", "CURSEFORGE_PROJECT_ID", "RELEASE_TYPE"];

async function upload(files: { name: string; displayName: string }[]) {
	files.forEach((file) => {
		const path = upath.join(buildConfig.buildDestinationDirectory, file.name);
		if (!fs.existsSync(path)) {
			throw new Error(`File ${path} doesn't exist!`);
		}
	});

	// Since we've built everything beforehand, the changelog must be available in the shared directory.
	let changelog = (
		await fs.promises.readFile(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG_CF.md"))
	).toString();

	changelog = mustache.render(changelog, {
		CENTER_ALIGN: 'style="text-align: center;"',
		CF_REDIRECT: `<h4 style="text-align: center;">Looks way better <a href="https://github.com/Nomi-CEu/Nomi-CEu/releases/tag/${process.env.GITHUB_TAG}">here.</a></h4>`,
	});

	const tokenHeaders = {
		"X-Api-Token": process.env.CURSEFORGE_API_TOKEN,
	};

	// Fetch the list of Minecraft versions from CurseForge.
	log("Fetching CurseForge version manifest...");
	const versionsManifest =
		(await request({
			uri: CURSEFORGE_LEGACY_ENDPOINT + "api/game/versions",
			headers: tokenHeaders,
			method: "GET",
			json: true,
			fullResponse: false,
			maxAttempts: 5,
		})) || [];

	if (!versionsManifest) {
		throw new Error("Failed to fetch CurseForge version manifest.");
	}

	const version = versionsManifest.find((m) => m.name == modpackManifest.minecraft.version);

	if (!version) {
		throw new Error(`Version ${modpackManifest.minecraft.version} not found on CurseForge.`);
	}

	let clientFileID: number | null;

	const releaseType: DeployReleaseType = inputToDeployReleaseTypes[process.env.RELEASE_TYPE];

	// Upload artifacts.
	for (const file of files) {
		const options = {
			uri: CURSEFORGE_LEGACY_ENDPOINT + `api/projects/${process.env.CURSEFORGE_PROJECT_ID}/upload-file`,
			method: "POST",
			headers: {
				...tokenHeaders,
				"Content-Type": "multipart/form-data",
			},
			formData: {
				metadata: JSON.stringify({
					changelog: changelog,
					changelogType: "html",
					releaseType: releaseType ? releaseType.cfReleaseType : "release",
					parentFileID: clientFileID ? clientFileID : undefined,
					gameVersions: clientFileID ? undefined : [version.id],
					displayName: file.displayName,
				}),
				file: fs.createReadStream(upath.join(buildConfig.buildDestinationDirectory, file.name)),
			},
			json: true,
			fullResponse: false,
		};

		log(`Uploading ${file.name} to CurseForge...` + (clientFileID ? `(child of ${clientFileID})` : ""));

		const response = await request(options);

		if (response && response.id) {
			if (!clientFileID) {
				clientFileID = response.id;
			}
		} else {
			throw new Error(`Failed to upload ${file.name}: Invalid Response.`);
		}
	}
}

/**
 * Uploads build artifacts to CurseForge.
 */
export async function deployCurseForge(): Promise<void> {
	/**
	 * Obligatory variable check.
	 */
	["GITHUB_TAG", ...variablesToCheck].forEach((vari) => {
		if (!process.env[vari]) {
			throw new Error(`Environmental variable ${vari} is unset.`);
		}
	});

	const displayName = process.env.GITHUB_TAG;

	const files = [
		{
			name: sanitize((makeArtifactNameBody(modpackManifest.name) + "-client.zip").toLowerCase()),
			displayName: displayName,
		},
		{
			name: sanitize((makeArtifactNameBody(modpackManifest.name) + "-server.zip").toLowerCase()),
			displayName: `${displayName}-server`,
		},
	];

	await upload(files);
}
