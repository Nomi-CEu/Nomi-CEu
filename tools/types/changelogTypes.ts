import ChangelogData from "#tasks/changelog/changelogData.ts";

export interface Commit {
	hash: string;
	date: string;
	message: string;
	refs: string;
	body: string;
	author_name: string;
	author_email: string;
	priority?: number;
}

/**
 * A Changelog Category.
 */
export interface Category {
	/**
	 * Commit Key: The key used in the commit's body.
	 * <p>
	 * Optional. If not set, then commits cannot be added to this category during the parse commit task.
	 * Can still be added manually.
	 */
	commitKey?: string;

	/**
	 * Key Name: The title of this Category in the changelog.
	 * <p>
	 * Can be set to "" to have no title.
	 */
	categoryName: string;

	/**
	 * Changelog Section: The changelog section map that the key should push to.
	 * <p>
	 * Will be initialized later, if put into categoryKeys.
	 */
	changelogSection?: Map<SubCategory, ChangelogMessage[]>;

	/**
	 * Default Sub Category. Any commits not placed into other sub-categories will be placed in here.
	 * <p>
	 * Should be a Sub Category added to subCategoryKeys, as otherwise the category would not appear in the changelog.
	 * <p>
	 * This can also be done with a SubCategoryKey placed at the end, with the commitKey set to `""`.
	 * However, this is useful for places where the Default Sub Category should not be at the end.
	 * <p>
	 * This is also needed for certain parsing operations.
	 */
	defaultSubCategory: SubCategory;

	/**
	 * Sub Category Keys: The list of sub-category keys.
	 * <p>
	 * Commits being added can only be in one sub-category, and the priority will be in the order provided.
	 * Furthermore, the order provided will also be the order the commits appear in.
	 * <p>
	 * The last item on this list should have the `commitKey` set to "", to allow any commits not put into previous sub categories in, otherwise they would be ignored.
	 * However, this can also be done by setting the defaultSubCategory.
	 */
	subCategories: SubCategory[];
}

/**
 * A Sub Category.
 */
export interface SubCategory {
	/**
	 * Commit Key: The key used in the commit's body.
	 * <p>
	 * This can be set to "" to allow any commit in.
	 * <p>
	 * Optional. If not set, then no commit will be allowed in during the parse commit task.
	 * Can still be added to by DefaultSubCategory, or manually.
	 */
	commitKey?: string;

	/**
	 * Key Name: The key to be used in the changelogSection. Also will be the title of this subCategory in the changelog.
	 * <p>
	 * Can be set to "" to have no title.
	 */
	keyName: string;
}

/**
 * A Changelog Message Object.
 */
export interface ChangelogMessage {
	/**
	 * Commit Message
	 */
	commitMessage: string;

	/**
	 * Commit Object
	 * <p>
	 * Provides the Commit SHA, the Commit Author, and the Commit Date.
	 */
	commitObject?: Commit;

	/**
	 * Sub Changelog Messages
	 */
	subChangelogMessages?: ChangelogMessage[];

	/**
	 * Indentation
	 * <p>
	 * Optional. Defaults to "".
	 */
	indentation?: string;

	/**
	 * If this changelog message is special. This is special formatting for it.
	 */
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	specialFormatting?: SpecialChangelogFormatting<any>;
}

/**
 * A special changelog message object, for special formatting.
 */
export interface SpecialChangelogFormatting<T> {
	/**
	 * Formatting Function
	 * @param message The transformed message (trimmed, transformed issue/pr tags)
	 * @param subMessage Whether this message is a sub message (true if yes)
	 * @param indentation The indentation level to use
	 * @param storage May be null, is the defined storage in this interface
	 */
	formatting: (
		message: string,
		subMessage: boolean,
		indentation: string,
		storage?: T,
	) => Promise<string>;

	/**
	 * Storage
	 */
	storage: T;
}

/**
 * A parsing category, which defines parsing rules and callbacks for different dirs.
 */
export interface Parser {
	/**
	 * Dirs to parse. If not set, will just parse commit list of all changes.
	 */
	dirs?: string[];

	/**
	 * Callback to determine whether a commit should be skipped.
	 * <p>
	 * If skipped, then all further parsing for the commit will stop. This condition does not include commits which are in the sha list, they are automatically skipped.
	 * <p>
	 * Expanded Commits from parseExpand go here too!<p><p>
	 * commit: The commit object.<p>
	 * commitMessage: The message of the commit.<p>
	 * commitBody: The body of the commit. Might be undefined.<p>
	 * return: True to skip, false to not.
	 */
	skipCallback: (
		commit: Commit,
		commitMessage: string,
		commitBody?: string,
	) => boolean;

	/**
	 * Callback per item.
	 * <p>
	 * Expanded Commits from parseExpand go here too!<p><p>
	 * parser: This parser object, for convenience of use when calling parseCommitBody.
	 * commit: The commit object.
	 * commitMessage: The message of the commit.<p>
	 * commitBody: The body of the commit. Might be undefined.<p>
	 * fix: The fix, if it is not already applied. Usually undefined. Always undefined if applyFixCallback is unset.<p>
	 * return: True if parsing was successful, false if not. Can return Ignored if commit was ignored (not skipped).
	 */
	itemCallback: (
		parser: Parser,
		commit: Commit,
		commitMessage: string,
		commitBody?: string,
		fix?: FixUpInfo,
	) => Promise<boolean | Ignored>;

	/**
	 * The callback to perform on any commits, which did not pass parsing. If not set, no callback will be performed, and those commits will be discarded.
	 * <p>
	 * Expanded Commits from parseExpand and parseDetails go here too!<p><p>
	 * commit: The commit object.<p>
	 * commitMessage: The message of the commit.<p>
	 * commitBody: The body of the commit. Might be undefined.<p>
	 * subMessages: Any sub-messages, coming from parseDetails. Might be undefined.
	 */
	leftOverCallback?: (
		commit: Commit,
		commitMessage: string,
		commitBody?: string,
		subMessages?: ChangelogMessage[],
	) => void;

	/**
	 * Callback to determine whether to add the sha of that commit into the sha list, forbidding further parsing of it.
	 * <p>
	 * If not set, will just add SHA of every commit included in `dirs`.<p><p>
	 * commit: The commit object.<p>
	 * parsed: If parsing was successful. This is also true if the commit was skipped.<p>
	 * return: True if to add sha, false if to not.<p>
	 */
	addSHACallback?: (commit: Commit, parsed: boolean) => boolean;

	/**
	 * Callback to determine whether or not the commit should be added to the commit list.
	 * <p><p>
	 * commit: The commit to determine.<p>
	 * parsed: If parsing was successful.<p>
	 * return: True if to add, false if not.
	 */
	addCommitListCallback: (commit: Commit, parsed: boolean) => boolean;

	/**
	 * Callback to determine whether fixes should be applied to this commit.
	 * Optional. If not provided, assumes yes.
	 * <p><p>
	 * fix: The FixUpInfo Object.<p>
	 * return: True if to fix, false if not.
	 */
	applyFixCalback?: (fix: FixUpInfo) => boolean;
}

export interface IgnoreInfo {
	checks: Record<string, string>;
	logic?: string;
	addCommitList?: boolean;
}

/**
 * Check to determine whether to ignore.
 * @return ignore True to Ignore (if check is true), False to continue
 */
export type IgnoreCheck = (tag: string, data: ChangelogData) => boolean;

/**
 * Ignore Logic
 * @param checkResults The results of the checks.
 * @return ignore True to ignore, false to continue
 */
export type IgnoreLogic = (checkResults: boolean[]) => boolean;

export class Ignored {
	private readonly addCommitList: boolean | undefined;

	constructor(addCommitList?: boolean) {
		this.addCommitList = addCommitList;
	}

	getCommitList(): boolean {
		if (this.addCommitList === undefined) return false;
		return this.addCommitList;
	}
}

export interface ModChangeInfo {
	modName: string;
	projectID?: number;
	oldVersion?: string;
	newVersion?: string;
}

export interface ExpandedMessage {
	messageTitle: string;
	messageBody?: string;
}

export interface FixUpInfo {
	sha: string;
	newTitle?: string;
	newBody?: string;
	mode: FixUpMode; // Auto Filled in If Not Provided
	// Whether this fix should replace that other commit's fixes as well.
	changeFixes?: boolean;
}

export interface ModInfo {
	projectID: number;
	info?: string;
	detail?: string;
	details?: string[];
}

export interface ParsedModInfo {
	info?: string;
	details?: ChangelogMessage[];
}

export interface PriorityInfo {
	priority: number;
}

export interface AuthorInfo {
	name: string;
	email: string;
}

export type FixUpMode = "REPLACE" | "ADDITION";

export type InputReleaseType =
	| "Release"
	| "Beta Release"
	| "Alpha Release"
	| "Cutting Edge Build";

export interface DeployReleaseType {
	isPreRelease: boolean;
	cfReleaseType: "release" | "beta" | "alpha";
}

// Cutting Edge Build is not needed here, as this type is only used for deploying, and not building.
export const inputToDeployReleaseTypes: Record<
	InputReleaseType,
	DeployReleaseType
> = {
	Release: {
		isPreRelease: false,
		cfReleaseType: "release",
	},
	"Beta Release": {
		isPreRelease: true,
		cfReleaseType: "beta",
	},
	"Alpha Release": {
		isPreRelease: true,
		cfReleaseType: "alpha",
	},
	"Cutting Edge Build": {
		isPreRelease: true,
		cfReleaseType: "alpha",
	},
};
