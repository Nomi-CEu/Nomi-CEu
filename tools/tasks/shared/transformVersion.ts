import { modpackManifest } from "../../globals";

/**
 * Transform the version field of manifest.json.
 */
export default async function transformManifestVersion(): Promise<void> {
	// We're building a tag.
	if (process.env.GITHUB_TAG) {
		modpackManifest.version = process.env.GITHUB_TAG.replace(/^v/, "");
	}
	// If Pull Request Branch Name is provided and a 'True SHA' is provided
	else if (process.env.GITHUB_HEAD_REF && process.env.TRUE_SHA) {
		const shortCommit = process.env.TRUE_SHA.substring(0, 7);
		modpackManifest.version = `${process.env.GITHUB_HEAD_REF}-${shortCommit}`;
	}
	// If SHA and ref is provided, append both the branch and short SHA.
	else if (process.env.GITHUB_SHA && process.env.GITHUB_REF && process.env.GITHUB_REF.startsWith("refs/heads/")) {
		const shortCommit = process.env.GITHUB_SHA.substring(0, 7);
		const branch = /refs\/heads\/(.+)/.exec(process.env.GITHUB_REF)?.[1];
		if (!branch) {
			throw new Error(`Invalid git ref: ${process.env.GITHUB_REF}`);
		}

		modpackManifest.version = `${branch}-${shortCommit}`;
	} else {
		modpackManifest.version = "manual-build";
	}
}
