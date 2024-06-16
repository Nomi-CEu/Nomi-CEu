import { modpackManifest } from "#globals";
import { BuildData } from "#types/transformFiles.js";

/**
 * Transform the version field of manifest.json.
 */
export default async function transformManifestVersion(): Promise<void> {
	modpackManifest.version = new BuildData().rawVersion;
}
