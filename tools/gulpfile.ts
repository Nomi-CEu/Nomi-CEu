// noinspection JSUnusedGlobalSymbols,UnnecessaryLocalVariableJS

import gulp from "gulp";

import pruneCacheTask from "./tasks/misc/pruneCache.ts";
export const pruneCache = pruneCacheTask;

import * as transformFiles from "./tasks/misc/transformFiles.ts";
export const updateFilesIssue = transformFiles.updateFilesIssue;
export const updateFilesLabsVersion = transformFiles.updateFilesVersion;
export const updateFilesMainMenu = transformFiles.updateFilesMainMenu;
export const updateFilesAll = transformFiles.updateAll;

import * as changelog from "./tasks/changelog/index.ts";
export const createChangelog = changelog.createRootChangelog;

import * as sharedTasks from "./tasks/shared/index.ts";
import clientTasks from "./tasks/client/index.ts";
import serverTasks from "./tasks/server/index.ts";
import langTasks from "./tasks/lang/index.ts";
import mmcTasks from "./tasks/mmc/index.ts";
import * as modTasks from "./tasks/misc/downloadMods.ts";

export const buildClient = gulp.series(
	sharedTasks.default,
	clientTasks,
	pruneCacheTask,
);
export const buildServer = gulp.series(
	gulp.parallel(sharedTasks.default, modTasks.downloadSharedAndServer),
	serverTasks,
	pruneCacheTask,
);
export const buildLang = gulp.series(
	sharedTasks.default,
	langTasks,
	pruneCacheTask,
);
export const buildMMC = gulp.series(
	gulp.parallel(sharedTasks.default, modTasks.downloadSharedAndClient),
	mmcTasks,
	pruneCacheTask,
);
export const buildAll = gulp.series(
	sharedTasks.default,
	gulp.parallel(
		clientTasks,
		langTasks,
		gulp.series(modTasks.downloadSharedAndServer, serverTasks),
	),
	pruneCacheTask,
);
export const buildChangelog = sharedTasks.buildChangelog;

import checkTasks from "./tasks/checks/index.ts";
export const check = gulp.series(checkTasks);

import * as zip from "./tasks/misc/zip.ts";
export const zipClient = zip.zipClient;
export const zipServer = zip.zipServer;
export const zipLang = zip.zipLang;
export const zipMMC = zip.zipMMC;
export const zipClientCF = zip.zipClientCF;
export const zipServerCF = zip.zipServerCF;
export const zipAll = zip.zipAll;

export default gulp.series(buildAll, zipAll);

import * as gha from "#tasks/misc/makeArtifactNames.ts";
export const makeArtifactNames = gha.makeArtifactNames;

export { deployCurseForge } from "./tasks/deploy/curseforge.ts";

import * as release from "./tasks/deploy/releases.ts";
export const deployReleases = release.default;

import * as checkFix from "./tasks/helpers/questChecks/index.ts";
export const checkQB = checkFix.check;
export const fixQB = checkFix.fix;

import * as qbPort from "./tasks/helpers/questPorting/index.ts";
export const portQB = gulp.series(qbPort.default, fixQB);
