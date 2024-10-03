import {
	mmcDestDirectory,
	modDestDirectory,
	modpackManifest,
	sharedDestDirectory,
} from "#globals";
import upath from "upath";
import fs from "fs";
import { dest, series, src } from "gulp";
import buildConfig from "#buildConfig";
import { promiseStream, shouldSkipChangelog } from "#utils/util.ts";

async function mmcCleanUp() {
	if (fs.existsSync(mmcDestDirectory)) {
		await fs.promises.rm(mmcDestDirectory, { recursive: true });
	}
}

/**
 * Checks and creates all necessary directories so we can build the MMC zip safely.
 */
async function createMMCDirs() {
	if (!fs.existsSync(mmcDestDirectory)) {
		await fs.promises.mkdir(mmcDestDirectory, { recursive: true });
	}
}

/**
 * Copies the update notes file.
 */
async function copyMMCUpdateNotes() {
	return promiseStream(
		src("../UPDATENOTES.md", { allowEmpty: true }).pipe(dest(mmcDestDirectory)),
	);
}

/**
 * Copies the license file.
 */
async function copyMMCLicense() {
	return promiseStream(src("../LICENSE").pipe(dest(mmcDestDirectory)));
}

/**
 * Copies the changelog file.
 */
async function copyMMCChangelog() {
	if (shouldSkipChangelog()) return;

	return promiseStream(
		src(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md")).pipe(
			dest(mmcDestDirectory),
		),
	);
}

/**
 * Copies modpack overrides.
 */
async function copyOverrides() {
	return promiseStream(
		src("**/*", {
			resolveSymlinks: true,
			encoding: false,
			cwd: upath.join(sharedDestDirectory, "overrides"),
		}).pipe(dest(upath.join(mmcDestDirectory, ".minecraft"))),
	);
}

/**
 * Copies client & shared mods.
 */
async function copyMMCModJars() {
	return promiseStream(
		src(["*", upath.join("client", "*")], {
			cwd: modDestDirectory,
			resolveSymlinks: true,
			encoding: false,
		}).pipe(dest(upath.join(mmcDestDirectory, ".minecraft", "mods"))),
	);
}

async function createMMCConfig() {
	const cfg: Record<string, string> = {
		InstanceType: "OneSix",
		iconKey: "default",
		name: modpackManifest.name,
	};

	return fs.promises.writeFile(
		upath.join(mmcDestDirectory, "instance.cfg"),
		Object.keys(cfg)
			.map((key) => {
				return `${key}=${cfg[key]}`;
			})
			.join("\n"),
	);
}

async function createMMCManifest() {
	const manifest = {
		components: [],
		formatVersion: 1,
	} as { components: unknown[]; formatVersion: number };

	manifest.components.push({
		cachedName: "Minecraft",
		cachedVersion: modpackManifest.minecraft.version,
		important: true,
		uid: "net.minecraft",
		version: modpackManifest.minecraft.version,
	});

	const forgeLoader = modpackManifest.minecraft.modLoaders
		.map((x) => x.id.match(/forge-(.+)/))
		.filter(Boolean)
		.shift();

	if (forgeLoader) {
		const ver = forgeLoader[1];

		manifest.components.push({
			cachedName: "Forge",
			cachedRequires: [
				{
					equals: `${modpackManifest.minecraft.version}`,
					uid: "net.minecraft",
				},
			],
			cachedVersion: ver,
			uid: "net.minecraftforge",
			version: ver,
		});
	}

	return fs.promises.writeFile(
		upath.join(mmcDestDirectory, "mmc-pack.json"),
		JSON.stringify(manifest, null, "\t"),
	);
}

export default series(
	mmcCleanUp,
	createMMCDirs,
	copyMMCChangelog,
	copyMMCLicense,
	copyMMCUpdateNotes,
	copyOverrides,
	createMMCConfig,
	createMMCManifest,
	copyMMCModJars,
);
