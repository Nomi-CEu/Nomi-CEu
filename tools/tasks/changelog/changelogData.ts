import { Commit, FixUpInfo, InputReleaseType, ParsedModInfo } from "../../types/changelogTypes";
import { getLastGitTag, getTags, isEnvVariableSet } from "../../util/util";

export default class ChangelogData {
	since: string;
	to: string;
	releaseType: InputReleaseType;
	isTest: boolean;

	builder: string[];
	commitList: Commit[];

	commitFixes: Map<string, FixUpInfo>;
	shaList: Set<string>;

	// Map of a commit SHA to the commits which need to be added to its commit list.
	combineList: Map<string, Commit[]>;

	// Set of tags
	tags: Set<string>;

	// Map of project IDs to info text and/or details
	modInfoList: Map<number, ParsedModInfo>;

	/**
	 * A normal initialisation.
	 */
	async init(): Promise<void> {
		this.since = getLastGitTag();
		this.to = "HEAD";

		// If this is a tagged build, fetch the tag before last.
		if (isEnvVariableSet("GITHUB_TAG")) {
			this.since = getLastGitTag(process.env.GITHUB_TAG);
			this.to = process.env.GITHUB_TAG;
		}

		// Get Release Type
		this.releaseType = "Release";
		if (isEnvVariableSet("RELEASE_TYPE")) this.releaseType = process.env.RELEASE_TYPE as InputReleaseType;

		// See if current run is test
		if (isEnvVariableSet("TEST_CHANGELOG")) {
			try {
				this.isTest = JSON.parse(process.env.TEST_CHANGELOG.toLowerCase());
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
		this.combineList = new Map<string, Commit[]>();

		this.tags = new Set<string>(await getTags(this.to));

		this.modInfoList = new Map<number, ParsedModInfo>();
	}

	shouldIterate(): boolean {
		return isEnvVariableSet("COMPARE_TAG");
	}

	/**
	 * Gets the compare tags, or iterations. Also sets up the iteration environment.
	 * @return tags The Compare Tags
	 */
	getIterations(): string[] {
		const iterations = process.env.COMPARE_TAG;
		return iterations.split(",").map((tag) => tag.trim());
	}

	/**
	 * Setups the state for a iteration. Init must be called first.
	 */
	setupIteration(compareTag: string): void {
		this.since = compareTag;
	}

	/**
	 * Resets the state for a future iteration. Init must be called first.
	 */
	resetForIteration(): void {
		// Reset all lists, except builder
		this.commitList = [];

		this.commitFixes = new Map<string, FixUpInfo>();
		this.shaList = new Set<string>();
		this.combineList = new Map<string, Commit[]>();

		this.modInfoList = new Map<number, ParsedModInfo>();

		// Tags list is fine because the `to` stays the same
	}
}
