export type BuildType = "GITHUB_TAG" | "HEAD_REF" | "GITHUB_SHA" | "MANUAL_BUILD";

export class BuildData {
	public type: BuildType;
	public transformedVersion: string;
	public rawVersion: string;

	constructor() {
		// We're building a tag/version.
		if (process.env.GITHUB_TAG) {
			this.type = "GITHUB_TAG";
			this.rawVersion = process.env.GITHUB_TAG.replace(/^v/, "");
			this.transformedVersion =
				process.env.GITHUB_TAG.search(/^v/) === -1 ? `v${process.env.GITHUB_TAG}` : process.env.GITHUB_TAG;
		}
		// If Pull Request Branch Name is provided and a 'True SHA' is provided
		else if (process.env.GITHUB_HEAD_REF && process.env.TRUE_SHA) {
			const shortCommit = process.env.TRUE_SHA.substring(0, 7);
			this.type = "HEAD_REF";
			this.rawVersion = `${process.env.GITHUB_HEAD_REF}-${shortCommit}`;
			this.transformedVersion = `PR Build (${process.env.GITHUB_HEAD_REF} branch, ${shortCommit})`;
		}
		// If SHA and ref is provided, append both the branch and short SHA.
		else if (process.env.GITHUB_SHA && process.env.GITHUB_REF && process.env.GITHUB_REF.startsWith("refs/heads/")) {
			const shortCommit = process.env.GITHUB_SHA.substring(0, 7);
			const branch = /refs\/heads\/(.+)/.exec(process.env.GITHUB_REF)?.[1];
			if (!branch) {
				throw new Error(`Invalid git ref: ${process.env.GITHUB_REF}`);
			}

			this.type = "GITHUB_SHA";
			this.rawVersion = `${branch}-${shortCommit}`;
			this.transformedVersion = `Nightly Build (${branch} branch, ${shortCommit})`;
		}
		// Manual Build
		else {
			this.type = "MANUAL_BUILD";
			this.rawVersion = "manual-build";
			this.transformedVersion = "Manual Build";
		}
	}

	public isVersionBuild(): boolean {
		return this.type === "GITHUB_TAG";
	}
}
