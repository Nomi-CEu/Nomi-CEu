import buildConfig from "#buildConfig";
import { join } from "upath";
import manifest from "./../manifest.json" with { type: "json" };
import { ModpackManifest } from "#types/modpackManifest.ts";

export const sharedDestDirectory = join(
	buildConfig.buildDestinationDirectory,
	"shared",
);
export const modDestDirectory = join(
	buildConfig.buildDestinationDirectory,
	"mods",
);
export const clientDestDirectory = join(
	buildConfig.buildDestinationDirectory,
	"client",
);
export const mmcDestDirectory = join(
	buildConfig.buildDestinationDirectory,
	"mmc",
);
export const serverDestDirectory = join(
	buildConfig.buildDestinationDirectory,
	"server",
);
export const langDestDirectory = join(
	buildConfig.buildDestinationDirectory,
	"lang",
);
export const typoCheckDirectory = join(
	buildConfig.buildDestinationDirectory,
	"typo-check",
);
export const tempDirectory = join(
	buildConfig.buildDestinationDirectory,
	"temp",
);
export const modpackManifest = manifest as ModpackManifest;
export const overridesFolder = modpackManifest.overrides || "overrides";
export const configFolder = join(overridesFolder, "config");
export const configOverridesFolder = join(overridesFolder, "config-overrides");
export const rootDirectory = "..";
export const templatesFolder = "templates";
export const storageFolder = "storage";

// The GitHub Repository Owner
export const repoOwner = "Nomi-CEu";

// The GitHub Repository Name
export const repoName = "Nomi-CEu";
