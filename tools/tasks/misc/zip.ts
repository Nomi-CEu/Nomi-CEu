import {
	clientDestDirectory,
	langDestDirectory,
	mmcDestDirectory,
	modpackManifest,
	serverDestDirectory,
} from "#globals";
import upath from "upath";
import zip from "gulp-zip";
import gulp, { src } from "gulp";
import buildConfig from "#buildConfig";
import { makeArtifactNameBody, promiseStream } from "#utils/util.ts";
import sanitize from "sanitize-filename";

async function zipFolder(
	path: string,
	globs: string[],
	dest: string,
	zipName: string,
): Promise<void> {
	return promiseStream(
		src(globs, { cwd: path, dot: true, encoding: false })
			.pipe(zip(zipName))
			.pipe(gulp.dest(dest)),
	);
}

function makeZipper(src: string, artifactName: string, isCFZip = false) {
	const zipFn = () => {
		return zipFolder(
			src,
			isCFZip ? buildConfig.cfZipGlobs : buildConfig.normalZipGlobs,
			isCFZip
				? upath.join(buildConfig.buildDestinationDirectory, "cf")
				: buildConfig.buildDestinationDirectory,
			sanitize(
				(
					makeArtifactNameBody(modpackManifest.name) + `-${artifactName}.zip`
				).toLowerCase(),
			),
		);
	};

	Object.defineProperty(zipFn, "name", {
		value: `zip${artifactName}${isCFZip ? "CF" : ""}`,
		configurable: true,
	});

	return zipFn;
}

export const zipServer = makeZipper(serverDestDirectory, "Server");
export const zipClient = makeZipper(clientDestDirectory, "Client");
export const zipLang = makeZipper(langDestDirectory, "Lang");
export const zipMMC = makeZipper(mmcDestDirectory, "MMC");
export const zipServerCF = makeZipper(serverDestDirectory, "Server", true);
export const zipClientCF = makeZipper(clientDestDirectory, "Client", true);

export const zipAll = gulp.parallel(
	zipServer,
	zipClient,
	zipLang,
	zipServerCF,
	zipClientCF,
);
