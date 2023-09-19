// noinspection JSUnusedGlobalSymbols

import * as gulp from "gulp";

import pruneCacheTask from "./tasks/misc/pruneCache";
export const pruneCache = pruneCacheTask;

import * as quest from "./tasks/github/quest";
export const transformQB = quest.transformQuestBook;

import * as releaseCommit from "./tasks/misc/releaseCommit";
export const checkReleaseEnv = releaseCommit.check;

// Normal Tasks
export const addVersionIssue = gulp.series(checkReleaseEnv, releaseCommit.updateIssueTemplates);
export const addVersionRandomPatches = gulp.series(checkReleaseEnv, releaseCommit.updateRandomPatchesConfig);
export const addVersionServer = gulp.series(checkReleaseEnv, releaseCommit.updateServerProperties);
export const addVersionAll = gulp.series(checkReleaseEnv, releaseCommit.updateAll);

// Non Release Tasks
const setNotRelease = releaseCommit.setNotRelease;
export const updateIssue = gulp.series(setNotRelease, addVersionIssue);
export const updateRandomPatches = gulp.series(setNotRelease, addVersionRandomPatches);
export const updateServer = gulp.series(setNotRelease, addVersionServer);
export const updateAll = gulp.series(setNotRelease, addVersionAll);

import sharedTasks from "./tasks/shared";
import clientTasks from "./tasks/client";
import serverTasks from "./tasks/server";
import langTasks from "./tasks/lang";
import mmcTasks from "./tasks/mmc";

export const buildClient = gulp.series(sharedTasks, clientTasks);
export const buildServer = gulp.series(sharedTasks, serverTasks);
export const buildLang = gulp.series(sharedTasks, langTasks);
export const buildAll = gulp.series(sharedTasks, gulp.series(clientTasks, serverTasks, langTasks));
export const buildMMC = gulp.series(sharedTasks, clientTasks, mmcTasks);

import checkTasks from "./tasks/checks";
export const check = gulp.series(checkTasks);

import * as zip from "./tasks/misc/zip";
export const zipClient = zip.zipClient;
export const zipServer = zip.zipServer;
export const zipLang = zip.zipLang;
export const zipAll = zip.zipAll;
export const zipMMC = zip.zipMMC;

import * as gha from "./tasks/misc/gha";
export const makeArtifactNames = gha.makeArtifactNames;

export { deployCurseForge, deployCurseForgeBeta } from "./tasks/deploy/curseforge";

import deployReleasesTask from "./tasks/deploy/releases";
export const deployReleases = deployReleasesTask;

import fireNightlyWebhookTask from "./tasks/misc/webhook";
export const fireNightlyWebhook = fireNightlyWebhookTask;
