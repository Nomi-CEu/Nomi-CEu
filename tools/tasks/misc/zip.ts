import {
	clientDestDirectory,
	langDestDirectory,
	mmcDestDirectory,
	modpackManifest,
	serverDestDirectory,
} from "../../globals";
import upath from "upath";
import zip from "gulp-zip";
import gulp from "gulp";
import buildConfig from "../../buildConfig";
import { makeArtifactNameBody } from "../../util/util";
import sanitize from "sanitize-filename";

async function zipFolder(path: string, zipName: string = upath.basename(path) + ".zip"): Promise<void> {
	return new Promise((resolve) => {
		gulp
			.src(upath.join(path, "**"), { nodir: true, base: path, dot: true })
			.pipe(zip(zipName))
			.pipe(gulp.dest(buildConfig.buildDestinationDirectory))
			.on("end", resolve);
	});
}

function makeZipper(src: string, artifactName: string) {
	const zipFn = () => {
		return zipFolder(
			upath.join(src),
			sanitize((makeArtifactNameBody(modpackManifest.name) + `-${artifactName}.zip`).toLowerCase()),
		);
	};

	Object.defineProperty(zipFn, "name", {
		value: `zip${artifactName}`,
		configurable: true,
	});

	return zipFn;
}

export const zipServer = makeZipper(serverDestDirectory, "Server");
export const zipClient = makeZipper(clientDestDirectory, "Client");
export const zipLang = makeZipper(langDestDirectory, "Lang");
export const zipMMC = makeZipper(mmcDestDirectory, "MMC");

export const zipAll = gulp.series(zipServer, zipClient, zipLang);
