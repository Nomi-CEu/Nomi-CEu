import { modpackManifest, sharedDestDirectory } from "../../globals";

import request from "requestretry";
import fs from "fs";
import log from "fancy-log";
import upath from "upath";
import buildConfig from "../../buildConfig";
import { makeArtifactNameBody } from "../../util/util";
import sanitize from "sanitize-filename";

const CURSEFORGE_LEGACY_ENDPOINT = "https://minecraft.curseforge.com/";
const variablesToCheck = ["CURSEFORGE_API_TOKEN", "CURSEFORGE_PROJECT_ID"];

interface CFUploadOptions {
	releaseType?: "release" | "beta";
}

/**
 * Uploads beta artifacts to CurseForge.
 */
export async function deployCurseForgeBeta(): Promise<void> {
	/**
	 * Obligatory variable check.
	 */
	["RC_VERSION", ...variablesToCheck].forEach((vari) => {
		if (!process.env[vari]) {
			throw new Error(`Environmental variable ${vari} is unset.`);
		}
	});

	const version = process.env.RC_VERSION;
	const flavorTitle = process.env.BUILD_FLAVOR_TITLE;
	const displayName = [modpackManifest.name, [version.replace(/^v/, ""), "Release Candidate"].join(" "), flavorTitle]
		.filter(Boolean)
		.join(" - ");

	const files = [
		{
			name: sanitize((makeArtifactNameBody(modpackManifest.name) + "-client.zip").toLowerCase()),
			displayName: displayName,
		},
		{
			name: sanitize((makeArtifactNameBody(modpackManifest.name) + "-server.zip").toLowerCase()),
			displayName: `${displayName} Server`,
		},
	];

	/**
	 * Obligatory file check.
	 */
	await upload(files, {
		releaseType: "beta",
	});
}

async function upload(files: { name: string; displayName: string }[], opts?: CFUploadOptions) {
	opts = opts || {};

	files.forEach((file) => {
		const path = upath.join(buildConfig.buildDestinationDirectory, file.name);
		if (!fs.existsSync(path)) {
			throw new Error(`File ${path} doesn't exist!`);
		}
	});

	// Since we've built everything beforehand, the changelog must be available in the shared directory.
	const changelog = await (await fs.promises.readFile(upath.join(sharedDestDirectory, "CHANGELOG.md")))
		.toString()
		.replace(/\n/g, "  \n")
		.replace(/\n\*/g, "\n•");

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
					changelogType: "markdown",
					releaseType: opts.releaseType || "release",
					parentFileID: clientFileID,
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

	const tag = process.env.GITHUB_TAG;
	const flavorTitle = process.env.BUILD_FLAVOR_TITLE;
	const displayName = [modpackManifest.name, tag.replace(/^v/, ""), flavorTitle].filter(Boolean).join(" - ");

	const files = [
		{
			name: sanitize((makeArtifactNameBody(modpackManifest.name) + "-client.zip").toLowerCase()),
			displayName: displayName,
		},
		{
			name: sanitize((makeArtifactNameBody(modpackManifest.name) + "-server.zip").toLowerCase()),
			displayName: `${displayName} Server`,
		},
	];

	upload(files);
}
