import gulp from "gulp";
import rename from "gulp-rename";
import merge from "merge-stream";
import upath from "upath";
import buildConfig from "../../buildConfig";
import { langDestDirectory, overridesFolder, sharedDestDirectory } from "../../globals";
import fs from "fs";

/**
 * Checks and creates all necessary directories so we can build the client safely.
 */
async function createLangDirs() {
	if (!fs.existsSync(langDestDirectory)) {
		await fs.promises.mkdir(langDestDirectory, { recursive: true });
	}
}

async function copyLang() {
	const resourcesPath = upath.join(sharedDestDirectory, overridesFolder, "resources");

	const opts = { nodir: true, base: resourcesPath };
	const streams = [
		gulp.src(upath.join(resourcesPath, "pack.mcmeta"), opts),
		gulp.src(upath.join(resourcesPath, "**/*.lang"), opts).pipe(
			rename((f) => {
				f.dirname = upath.join("assets", f.dirname);
			}),
		),
	];

	return await new Promise((resolve) => {
		merge(...streams)
			.pipe(gulp.dest(upath.join(buildConfig.buildDestinationDirectory, langDestDirectory)))
			.on("end", resolve);
	});
}

export default gulp.series(createLangDirs, copyLang);
