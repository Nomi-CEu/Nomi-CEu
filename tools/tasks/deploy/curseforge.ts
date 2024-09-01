import { modpackManifest } from "#globals";

import fs from "fs";
import upath from "upath";
import buildConfig from "#buildConfig";
import {
	getAxios,
	isEnvVariableSet,
	makeArtifactNameBody,
} from "#utils/util.ts";
import sanitize from "sanitize-filename";
import mustache from "mustache";
import {
	DeployReleaseType,
	InputReleaseType,
	inputToDeployReleaseTypes,
} from "#types/changelogTypes.ts";
import logInfo from "#utils/log.ts";
import { CurseForgeLegacyMCVersion } from "#types/curseForge.ts";
import * as core from "@actions/core";
import { AxiosRequestConfig } from "axios";
import { filesize } from "filesize";

const CURSEFORGE_LEGACY_ENDPOINT = "https://minecraft.curseforge.com/";
const variablesToCheck = [
	"CURSEFORGE_API_TOKEN",
	"CURSEFORGE_PROJECT_ID",
	"RELEASE_TYPE",
];

async function upload(files: { name: string; displayName: string }[]) {
	files.forEach((file) => {
		const path = upath.join(
			buildConfig.buildDestinationDirectory,
			"cf",
			file.name,
		);
		if (!fs.existsSync(path)) {
			throw new Error(`File ${path} doesn't exist!`);
		}
	});

	// Since we've built everything beforehand, the changelog must be available in the shared directory.
	let changelog = (
		await fs.promises.readFile(
			upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG_CF.md"),
		)
	).toString();

	changelog = mustache.render(changelog, {
		CENTER_ALIGN: 'style="text-align: center;"',
		CF_REDIRECT: `<h4 style="text-align: center;">Looks way better <a href="https://github.com/Nomi-CEu/Nomi-CEu/releases/tag/${process.env.GITHUB_TAG}">here.</a></h4>`,
	});

	const tokenHeaders = {
		"X-Api-Token": process.env.CURSEFORGE_API_TOKEN,
	};

	// Fetch the list of Minecraft versions from CurseForge.
	logInfo("Fetching CurseForge version manifest...");
	const versionsManifest: CurseForgeLegacyMCVersion[] | undefined = (
		await getAxios()({
			url: CURSEFORGE_LEGACY_ENDPOINT + "api/game/versions",
			method: "get",
			headers: tokenHeaders,
			responseType: "json",
		})
	).data;

	if (!versionsManifest) {
		throw new Error("Failed to fetch CurseForge version manifest.");
	}

	const version = versionsManifest.find(
		(m) => m.name == modpackManifest.minecraft.version,
	);

	if (!version) {
		throw new Error(
			`Version ${modpackManifest.minecraft.version} not found on CurseForge.`,
		);
	}

	const uploadedIDs: { filePath: string; displayName: string; id: number }[] =
		[];
	let parentID: number | undefined = undefined;

	const releaseType: DeployReleaseType =
		inputToDeployReleaseTypes[
			(process.env.RELEASE_TYPE ?? "Release") as InputReleaseType
		];

	// Upload artifacts.
	for (const file of files) {
		const path = upath.join(buildConfig.buildDestinationDirectory, file.name);
		const options: AxiosRequestConfig<unknown> = {
			url:
				CURSEFORGE_LEGACY_ENDPOINT +
				`api/projects/${process.env.CURSEFORGE_PROJECT_ID}/upload-file`,
			method: "post",
			headers: {
				...tokenHeaders,
				"Content-Type": "multipart/form-data",
			},
			data: {
				metadata: JSON.stringify({
					changelog: changelog,
					changelogType: "html",
					releaseType: releaseType ? releaseType.cfReleaseType : "release",
					parentFileID: parentID ? parentID : undefined,
					gameVersions: parentID ? undefined : [version.id],
					displayName: file.displayName,
				}),
				file: fs.createReadStream(path),
			},
			responseType: "json",
		};

		logInfo(
			`Uploading ${file.name} to CurseForge...` +
				(parentID ? `(child of ${parentID})` : ""),
		);

		const response: { id: number } = (await getAxios()(options)).data;

		if (response && response.id) {
			uploadedIDs.push({
				filePath: path,
				displayName: file.displayName,
				id: response.id,
			});
			if (!parentID) {
				parentID = response.id;
			}
		} else {
			throw new Error(`Failed to upload ${file.name}: Invalid Response.`);
		}
	}
	if (isEnvVariableSet("GITHUB_STEP_SUMMARY"))
		await core.summary
			.addHeading("Nomi-CEu CurseForge Deploy Summary:", 2)
			.addTable([
				[
					{ data: "File Name", header: true },
					{ data: "File ID", header: true },
					{ data: "File Size", header: true },
				],
				...uploadedIDs.map((uploaded) => [
					uploaded.displayName,
					uploaded.id.toString(),
					filesize(fs.statSync(uploaded.filePath).size),
				]),
			])
			.write();
}

/**
 * Uploads build artifacts to CurseForge.
 */
export async function deployCurseForge(): Promise<void> {
	/*
	 * Obligatory variable check.
	 */
	["GITHUB_TAG", ...variablesToCheck].forEach((vari) => {
		if (!process.env[vari]) {
			throw new Error(`Environmental variable ${vari} is unset.`);
		}
	});

	const displayName = process.env.GITHUB_TAG ?? "";

	const files = [
		{
			name: sanitize(
				(
					makeArtifactNameBody(modpackManifest.name) + "-client.zip"
				).toLowerCase(),
			),
			displayName: displayName,
		},
		{
			name: sanitize(
				(
					makeArtifactNameBody(modpackManifest.name) + "-server.zip"
				).toLowerCase(),
			),
			displayName: `${displayName}-server`,
		},
	];

	await upload(files);
}
