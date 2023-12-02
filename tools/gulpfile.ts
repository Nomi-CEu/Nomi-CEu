// noinspection JSUnusedGlobalSymbols

import * as gulp from "gulp";

import pruneCacheTask from "./tasks/misc/pruneCache";
export const pruneCache = pruneCacheTask;

import * as quest from "./tasks/github/quest";
export const transformQB = quest.transformQuestBook;

import * as transformFiles from "./tasks/misc/transformFiles";
export const updateFilesIssue = gulp.series(transformFiles.setup, transformFiles.updateIssueTemplates);
export const updateFilesRandomPatches = gulp.series(transformFiles.setup, transformFiles.updateRandomPatchesConfig);
export const updateFilesServer = gulp.series(transformFiles.setup, transformFiles.updateServerProperties);
export const updateFilesMainMenu = gulp.series(transformFiles.setup, transformFiles.updateMainMenuConfig);
export const updateFilesBuild = gulp.series(transformFiles.setup, transformFiles.updateFilesTestBuild);
export const updateFilesAll = gulp.series(transformFiles.setup, transformFiles.updateAll);

import * as changelog from "./tasks/changelog/createChangelog";
export const createChangelog = changelog.createRootChangelog;

import sharedTasks from "./tasks/shared";
import clientTasks from "./tasks/client";
import serverTasks from "./tasks/server";
import langTasks from "./tasks/lang";
import mmcTasks from "./tasks/mmc";
import modTasks from "./tasks/misc/downloadMods";

export const buildClient = gulp.series(sharedTasks, clientTasks);
export const buildServer = gulp.series(sharedTasks, modTasks, serverTasks);
export const buildLang = gulp.series(sharedTasks, langTasks);
export const buildMMC = gulp.series(sharedTasks, modTasks, clientTasks, mmcTasks);
export const buildAll = gulp.series(sharedTasks, modTasks, gulp.series(clientTasks, langTasks, serverTasks, mmcTasks));

import checkTasks from "./tasks/checks";
export const check = gulp.series(checkTasks);

import * as zip from "./tasks/misc/zip";
export const zipClient = zip.zipClient;
export const zipServer = zip.zipServer;
export const zipLang = zip.zipLang;
export const zipMMC = zip.zipMMC;
export const zipAll = zip.zipAll;

import * as gha from "./tasks/misc/gha";
export const makeArtifactNames = gha.makeArtifactNames;

export { deployCurseForge } from "./tasks/deploy/curseforge";

import deployReleasesTask from "./tasks/deploy/releases";
export const deployReleases = deployReleasesTask;

import fireNightlyWebhookTask from "./tasks/misc/webhook";
export const fireNightlyWebhook = fireNightlyWebhookTask;
