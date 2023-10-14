import { Commit, FixUpInfo, InputReleaseType } from "../../types/changelogTypes";
import { getLastGitTag, isEnvVariableSet } from "../../util/util";

export default class ChangelogData {
	since: string;
	to: string;
	releaseType: InputReleaseType;
	isTest: boolean;

	builder: string[];
	commitList: Commit[];

	commitFixes: Map<string, FixUpInfo>;
	shaList: Set<string>;

	constructor() {
		this.since = getLastGitTag();
		this.to = "HEAD";

		// If this is a tagged build, fetch the tag before last.
		if (isEnvVariableSet("GITHUB_TAG")) {
			this.since = getLastGitTag(process.env.GITHUB_TAG);
			this.to = process.env.GITHUB_TAG;
		}
		// Back-compat in case this crap is still around.
		else if (this.since == "latest-dev-preview") {
			this.since = getLastGitTag(this.since);
		}

		// Get Release Type
		this.releaseType = "Release";
		if (isEnvVariableSet("RELEASE_TYPE")) this.releaseType = process.env.RELEASE_TYPE as InputReleaseType;

		// See if current run is test
		if (isEnvVariableSet("TEST_CHANGELOG")) {
			try {
				this.isTest = JSON.parse(process.env.TEST_CHANGELOG);
			} catch (err) {
				throw new Error("Test Changelog Env Variable set to Invalid Value.");
			}
		}

		// Initialise Final Builder
		this.builder = [];

		// List of all commits to put into changelog commit section
		this.commitList = [];

		this.commitFixes = new Map<string, FixUpInfo>();
		this.shaList = new Set<string>();
	}
}