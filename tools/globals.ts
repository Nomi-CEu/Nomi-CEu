import buildConfig from "#buildConfig";
import upath from "upath";
import manifest from "./../manifest.json" with { type: "json" };
import { ModpackManifest } from "#types/modpackManifest.ts";

export const sharedDestDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"shared",
);
export const modDestDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"mods",
);
export const clientDestDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"client",
);
export const mmcDestDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"mmc",
);
export const serverDestDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"server",
);
export const langDestDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"lang",
);
export const tempDirectory = upath.join(
	buildConfig.buildDestinationDirectory,
	"temp",
);
export const modpackManifest = manifest as ModpackManifest;
export const overridesFolder = modpackManifest.overrides || "overrides";
export const configFolder = upath.join(overridesFolder, "config");
export const configOverridesFolder = upath.join(
	overridesFolder,
	"config-overrides",
);
export const rootDirectory = "..";
export const templatesFolder = "templates";
export const storageFolder = "storage";

// The GitHub Repository Owner
export const repoOwner = "Nomi-CEu";

// The GitHub Repository Name
export const repoName = "Nomi-CEu";
