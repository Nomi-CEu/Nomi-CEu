import {
	AuthorInfo,
	Commit,
	FixUpInfo,
	InputReleaseType,
	ParsedModInfo,
} from "#types/changelogTypes.ts";
import { getLastGitTag, getTags, isEnvVariableSet } from "#utils/util.ts";

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

	// Set of tags before 'to' (Target)
	tags: Set<string>;

	// Set of tags before 'since' (Compare)
	compareTags: Set<string>;

	// Map of project IDs to info text and/or details
	modInfoList: Map<number, ParsedModInfo>;

	// Map of commit sha to specified coauthors for that commit
	coAuthorList: Map<string, AuthorInfo[]>;

	/**
	 * Constructor. Non-Async Inits are performed here.
	 */
	constructor() {
		this.since = getLastGitTag();
		this.to = "HEAD";

		// If this is a tagged build, fetch the tag before last.
		if (isEnvVariableSet("GITHUB_TAG")) {
			this.since = getLastGitTag(process.env.GITHUB_TAG);
			this.to = process.env.GITHUB_TAG ?? "HEAD";
		}

		// Get Release Type
		this.releaseType = "Release";
		if (isEnvVariableSet("RELEASE_TYPE"))
			this.releaseType = process.env.RELEASE_TYPE as InputReleaseType;

		// See if current run is test
		if (isEnvVariableSet("TEST_CHANGELOG")) {
			try {
				this.isTest = JSON.parse(
					(process.env.TEST_CHANGELOG ?? "false").toLowerCase(),
				);
			} catch (err) {
				throw new Error("Test Changelog Env Variable set to Invalid Value.");
			}
		} else this.isTest = false;

		// Initialise Final Builder
		this.builder = [];

		// List of all commits to put into changelog commit section
		this.commitList = [];

		this.commitFixes = new Map<string, FixUpInfo>();
		this.shaList = new Set<string>();
		this.combineList = new Map<string, Commit[]>();

		this.modInfoList = new Map<number, ParsedModInfo>();
		this.coAuthorList = new Map<string, AuthorInfo[]>();

		// Init Tag Sets for Now, so we don't have to deal with nullable params
		this.tags = new Set<string>();
		this.compareTags = new Set<string>();
	}
	/**
	 * A normal initialisation. Async Inits are called here.
	 */
	async init(): Promise<void> {
		this.tags = new Set<string>(await getTags(this.to));
		this.compareTags = new Set<string>(await getTags(this.since));
	}

	shouldIterate(): boolean {
		return isEnvVariableSet("COMPARE_TAG");
	}

	/**
	 * Gets the compare tags, or iterations. Also sets up the iteration environment.
	 * @return tags The Compare Tags
	 */
	getIterations(): string[] {
		const iterations = process.env.COMPARE_TAG ?? "";
		return iterations.split(",").map((tag) => tag.trim());
	}

	/**
	 * Setups the state for a iteration. Init must be called first.
	 */
	async setupIteration(compareTag: string): Promise<void> {
		this.since = compareTag;
		this.compareTags = new Set<string>(await getTags(this.since));
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
		this.coAuthorList = new Map<string, AuthorInfo[]>();

		// Tags list is fine because the 'to' (Target) stays the same
		// Other Tags list is generated at setup
	}
}
