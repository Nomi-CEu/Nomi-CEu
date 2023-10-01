export interface Commit {
	hash: string;
	date: string;
	message: string;
	refs: string;
	body: string;
	author_name: string;
	author_email: string;
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
	 * Commit Object(s)
	 * <p>
	 * Provides the Commit SHA, the Commit Author, and the Commit Date.
	 * <p>
	 * Multiple are allowed!
	 */
	commitObjects?: Commit[];

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

export type InputReleaseType = "Release" | "Beta Release" | "Alpha Release";
