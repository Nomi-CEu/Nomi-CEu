import buildConfig from "./buildConfig";
import upath from "upath";
import manifest from "./../manifest.json";
import { ModpackManifest } from "./types/modpackManifest";

export const sharedDestDirectory = upath.join(buildConfig.buildDestinationDirectory, "shared");
export const clientDestDirectory = upath.join(buildConfig.buildDestinationDirectory, "client");
export const mmcDestDirectory = upath.join(buildConfig.buildDestinationDirectory, "mmc");
export const serverDestDirectory = upath.join(buildConfig.buildDestinationDirectory, "server");
export const langDestDirectory = upath.join(buildConfig.buildDestinationDirectory, "lang");
export const tempDirectory = upath.join(buildConfig.buildDestinationDirectory, "temp");
export const modpackManifest = manifest as ModpackManifest;
export const overridesFolder = modpackManifest.overrides || "overrides";
export const configFolder = upath.join(overridesFolder, "config");
export const configOverridesFolder = upath.join(overridesFolder, "config-overrides");

export const issueTemplatesFolder = upath.join("..", ".github", "ISSUE_TEMPLATE")
