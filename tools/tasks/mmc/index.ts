import { clientDestDirectory, mmcDestDirectory, modDestDirectory, modpackManifest } from "../../globals";
import { fetchMods } from "../../util/curseForgeAPI";
import * as upath from "upath";
import { series, src, symlink } from "gulp";
import * as fs from "fs";
import gulp from "gulp";
import buildConfig from "../../buildConfig";

async function mmcCleanUp(cb) {
	if (fs.existsSync(mmcDestDirectory)) {
		await fs.promises.rm(mmcDestDirectory, { recursive: true });
	}

	cb();
}

/**
 * Checks and creates all necessary directories so we can build the MMC zip safely.
 */
async function createMMCDirs(cb) {
	if (!fs.existsSync(mmcDestDirectory)) {
		await fs.promises.mkdir(mmcDestDirectory, { recursive: true });
	}

	cb();
}

/**
 * Copies the update notes file.
 */
function copyMMCUpdateNotes() {
	return gulp.src("../UPDATENOTES.md", { allowEmpty: true }).pipe(gulp.dest(mmcDestDirectory));
}


/**
 * Copies the license file.
 */
async function copyMMCLicense() {
	return gulp.src("../LICENSE.md").pipe(gulp.dest(mmcDestDirectory));
}

/**
 * Copies the changelog file.
 */
function copyMMCChangelog() {
	return gulp.src(upath.join(buildConfig.buildDestinationDirectory, "CHANGELOG.md")).pipe(gulp.dest(mmcDestDirectory));
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
 * Renames copied overrides to '.minecraft'.
 */
async function renameOverrides() {
	await fs.promises.rename(upath.join(mmcDestDirectory, "overrides"), upath.join(mmcDestDirectory, ".minecraft"));
	return fs.promises.rm(upath.join(mmcDestDirectory, "manifest.json"));
}

/**
 * Copies client & shared mods.
 */
async function copyMMCModJars() {
	return src([upath.join(modDestDirectory, "*"), upath.join(modDestDirectory, "client", "*")], {
		nodir: true,
		resolveSymlinks: false,
	}).pipe(symlink(upath.join(mmcDestDirectory, ".minecraft", "mods")));
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
	copyMMCModJars,
);
