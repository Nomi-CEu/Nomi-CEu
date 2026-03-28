import { formatDate } from "date-fns";
import { utc } from "@date-fns/utc";

export type BuildType =
	| "GITHUB_TAG"
	| "HEAD_REF"
	| "GITHUB_SHA"
	| "MANUAL_BUILD";

export class BuildData {
	public type: BuildType;
	public discordVersion: string;
	public transformedVersion: string;
	public rawVersion: string;

	constructor() {
		// Default values.
		this.type = "MANUAL_BUILD";
		this.rawVersion = "manual-build";
		this.transformedVersion = "Manual Build";
		this.discordVersion = this.transformedVersion;

		// We're building a tag/version.
		if (process.env.GITHUB_TAG) {
			this.type = "GITHUB_TAG";
			this.rawVersion = process.env.GITHUB_TAG.replace(/^v/, "");
			this.transformedVersion =
				process.env.GITHUB_TAG.search(/^v/) === -1
					? `v${process.env.GITHUB_TAG}`
					: process.env.GITHUB_TAG;
			this.discordVersion = this.transformedVersion;
			return;
		}

		const currDate = new Date();
		const fileFormattedDate = formatDate(currDate, "yyyy-MM-dd", {
			in: utc,
		});
		const titleFormattedDate = formatDate(currDate, "dd MMM yyyy", {
			in: utc,
		});

		let branchRef: string | undefined = undefined;
		let commitRef: string | undefined = undefined;

		// Only set if the branch ref in the title(transformed/discord) is different than in the file (raw)
		// Then, `branchRef` will be used for the file (raw),
		// and `branchTitleRef` will be used for the title (transformed/discord)
		let branchTitleRef: string | undefined = undefined;

		// If Pull Request Branch Name is provided and a 'True SHA' is provided
		if (process.env.HEAD_REF && process.env.TRUE_SHA) {
			this.type = "HEAD_REF";
			commitRef = process.env.TRUE_SHA.substring(0, 7);

			// If Head Repo is provided and this is a Fork PR
			if (process.env.HEAD_REPO && process.env.HEAD_REPO !== "Nomi-CEu") {
				branchRef = `[${process.env.HEAD_REPO.toLowerCase()}-${process.env.HEAD_REF}]`;
				branchTitleRef = `${process.env.HEAD_REPO}/${process.env.HEAD_REF}`;
			} else {
				branchRef = `${process.env.HEAD_REF}`;
			}
		}

		// If SHA and ref is provided, it is a build from push
		if (
			process.env.GITHUB_SHA &&
			process.env.GITHUB_REF &&
			process.env.GITHUB_REF.startsWith("refs/heads/")
		) {
			this.type = "GITHUB_SHA";
			commitRef = process.env.GITHUB_SHA.substring(0, 7);
			branchRef = /refs\/heads\/(.+)/.exec(process.env.GITHUB_REF)?.[1];
		}

		// Nightly Build
		if (commitRef && branchRef) {
			this.rawVersion = `${fileFormattedDate}-${branchRef}-${commitRef}`;

			const prIdentifier = this.type === "HEAD_REF" ? "(PR) " : "";
			this.discordVersion = `${titleFormattedDate} — ${branchTitleRef ?? branchRef}-${commitRef}`;
			this.transformedVersion = `Nightly ${prIdentifier}(${this.discordVersion})`;
		}
	}

	public isVersionBuild(): boolean {
		return this.type === "GITHUB_TAG";
	}
}
