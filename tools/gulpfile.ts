// noinspection JSUnusedGlobalSymbols

import * as gulp from "gulp";

import pruneCacheTask from "./tasks/misc/pruneCache";
export const pruneCache = pruneCacheTask;

import * as quest from "./tasks/github/quest";
export const transformQB = quest.transformQuestBook;

import * as releaseCommit from "./tasks/misc/releaseCommit";
export const checkRelease = releaseCommit.check;

// Normal Tasks
export const addVersionIssue = gulp.series(checkRelease, releaseCommit.updateIssueTemplates);
export const addVersionRandomPatches = gulp.series(checkRelease, releaseCommit.updateRandomPatchesConfig);
export const addVersionServer = gulp.series(checkRelease, releaseCommit.updateServerProperties);
export const addVersionMainMenu = gulp.series(checkRelease, releaseCommit.updateMainMenuConfig);
export const addVersionAll = gulp.series(checkRelease, releaseCommit.updateAll);

// Non Release Tasks
const setNotRelease = releaseCommit.setNotRelease;
export const updateTemplatesIssue = gulp.series(setNotRelease, addVersionIssue);
export const updateTemplatesRandomPatches = gulp.series(setNotRelease, addVersionRandomPatches);
export const updateTemplatesServer = gulp.series(setNotRelease, addVersionServer);
export const updateTemplatesMainMenu = gulp.series(setNotRelease, addVersionMainMenu);
export const updateTemplatesAll = gulp.series(setNotRelease, addVersionAll);

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
