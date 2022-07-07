import { clientDestDirectory, mmcDestDirectory, modpackManifest } from "../../globals";
import { fetchMods } from "../../util/curseForgeAPI";
import * as upath from "upath";
import { series, src, symlink } from "gulp";
import * as fs from "fs";

async function mmcCleanUp(cb) {
	if (fs.existsSync(mmcDestDirectory)) {
		await fs.promises.rm(mmcDestDirectory, { recursive: true });
	}

	cb();
}

/**
 * Checks and creates all necessary directories so we can build the client safely.
 */
async function createMMCDirs(cb) {
	if (!fs.existsSync(mmcDestDirectory)) {
		await fs.promises.mkdir(mmcDestDirectory, { recursive: true });
	}

	cb();
}

/**
 * Copies modpack overrides.
 */
function copyOverrides() {
	return src(upath.join(clientDestDirectory, "**/*"), {
		nodir: true,
		resolveSymlinks: false,
	}).pipe(symlink(upath.join(mmcDestDirectory)));
}

/**
 * Copies modpack overrides.
 */
async function renameOverrides() {
	await fs.promises.rename(upath.join(mmcDestDirectory, "overrides"), upath.join(mmcDestDirectory, ".minecraft"));
	return fs.promises.rm(upath.join(mmcDestDirectory, "manifest.json"));
}

/**
 * Downloads client mods according to manifest.json and checks hashes.
 */
async function fetchModJars() {
	return fetchMods(
		modpackManifest.files.filter((f) => !f.sides || f.sides.includes("client")),
		upath.join(mmcDestDirectory, ".minecraft"),
	);
}

async function createMMCConfig() {
	const cfg = {
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
	};

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

	return fs.promises.writeFile(upath.join(mmcDestDirectory, "mmc-pack.json"), JSON.stringify(manifest, null, "\t"));
}

export default series(
	mmcCleanUp,
	createMMCDirs,
	copyOverrides,
	renameOverrides,
	createMMCConfig,
	createMMCManifest,
	fetchModJars,
);
