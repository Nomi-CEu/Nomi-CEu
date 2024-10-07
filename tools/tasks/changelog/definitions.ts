import {
	Category,
	Commit,
	FixUpInfo,
	IgnoreCheck,
	Ignored,
	IgnoreLogic,
	Parser,
	SubCategory,
} from "#types/changelogTypes.ts";
import { modpackManifest } from "#globals";
import { parseCommitBody } from "./parser.ts";
import { parseFixUp } from "./specialParser.ts";

/* Values */
export const defaultIndentation = "";
export const indentationLevel = "  ";

/*
  Link to the repo, with a slash at the end.
  All URLs will be appended to this.
 */
export const repoLink = "https://github.com/Nomi-CEu/Nomi-CEu/";

/* Keys */

/* Special Handling Keys */
export const skipKey = "[SKIP]";
export const expandKey = "[EXPAND]";
export const expandList = "messages";
export const detailsKey = "[DETAILS]";
export const detailsList = "details";
export const detailsRoot = "detail";
export const noCategoryKey = "[NO CATEGORY]";
export const combineKey = "[COMBINE]";
export const combineList = "commits";
export const combineRoot = "commit";
export const fixUpKey = "[FIXUP]";
export const fixUpList = "fixes";
export const ignoreKey = "[IGNORE]";
export const modInfoKey = "[MOD INFO]";
export const modInfoList = "infos";
export const priorityKey = "[PRIORITY]";
export const coAuthorsKey = "[AUTHORS]";
export const coAuthorsList = "authors";

/* Sub Category Keys */
// Mode Category Keys
const normalMode: SubCategory = { commitKey: "[NM]", keyName: "Normal Mode" };
const hardMode: SubCategory = { commitKey: "[HM]", keyName: "Hard Mode" };

/* Misc Sub Category Keys */
const qolChanges: SubCategory = {
	commitKey: "[QOL]",
	keyName: "Quality of Life",
};

/* Set Sub Categories (Sub Categories that do not let any commit in) */
const bothModes: SubCategory = { keyName: "Both Modes" };
const modUpdates: SubCategory = { keyName: "Mod Updates" };
const modAdditions: SubCategory = { keyName: "Mod Additions" };
const modRemovals: SubCategory = { keyName: "Mod Removals" };

/* Default Sub Categories (Sub Categories that allow any commit in) */
const emptySubCategory: SubCategory = { commitKey: "", keyName: "" };
const other: SubCategory = { commitKey: "", keyName: "Other" };

/* Category Keys: */
const breakingCategory: Category = {
	commitKey: "[BREAKING]",
	categoryName: "Breaking Changes",
	defaultSubCategory: emptySubCategory,
	subCategories: [emptySubCategory],
};
const balancingCategory: Category = {
	commitKey: "[BALANCING]",
	categoryName: "Balancing Changes",
	defaultSubCategory: bothModes,
	subCategories: [bothModes, normalMode, hardMode],
};
const performanceCategory: Category = {
	commitKey: "[PERFORMANCE]",
	categoryName: "Performance Improvements",
	defaultSubCategory: emptySubCategory,
	subCategories: [emptySubCategory],
};
const featureCategory: Category = {
	commitKey: "[FEATURE]",
	categoryName: "Feature Additions",
	defaultSubCategory: bothModes,
	subCategories: [qolChanges, bothModes, normalMode, hardMode],
};
const questBookCategory: Category = {
	commitKey: "[QB]",
	categoryName: "Quest Book Changes",
	defaultSubCategory: bothModes,
	subCategories: [bothModes, normalMode, hardMode],
};
const bugCategory: Category = {
	commitKey: "[BUG]",
	categoryName: "Bug Fixes",
	defaultSubCategory: bothModes,
	subCategories: [bothModes, normalMode, hardMode],
};
const generalCategory: Category = {
	commitKey: "[GENERAL]",
	categoryName: "General Changes",
	defaultSubCategory: other,
	subCategories: [modUpdates, modAdditions, modRemovals, other],
};
const internalCategory: Category = {
	commitKey: "[INTERNAL]",
	categoryName: "Internal Changes",
	defaultSubCategory: emptySubCategory,
	subCategories: [emptySubCategory],
};

/**
 * Category List
 * <p>
 * The order that the categories appear here will be the order that they appear in the changelog, and their priority.
 */
export const categories: Category[] = [
	breakingCategory,
	balancingCategory,
	performanceCategory,
	featureCategory,
	questBookCategory,
	bugCategory,
	generalCategory,
	internalCategory,
];

/* Parsing Util Methods */
const defaultSkipCallback = (
	_commit: Commit,
	_commitMessage: string,
	commitBody?: string,
): boolean => {
	if (!commitBody) return false;
	return commitBody.includes(skipKey);
};
const defaultParsingCallback = async (
	parser: Parser,
	commit: Commit,
	commitMessage: string,
	commitBody?: string,
): Promise<boolean | Ignored> => {
	if (!commitBody) return false;
	return parseCommitBody(commitMessage, commitBody, commit, parser);
};

/* Parsing Categories */

const fixupParsing: Parser = {
	skipCallback: () => false,
	// No need to care about message/body, never parse expand/details commits
	itemCallback: (
		_parser,
		commit,
		_commitMessage: string,
		_commitBody?: string,
		fix?: FixUpInfo,
	) => parseFixUp(commit, fix),
	addCommitListCallback: () => false,
	addSHACallback: () => false,
	// Don't apply fixup if it is not meant to apply to fixes
	applyFixCalback: (fix) =>
		fix.changeFixes === undefined ||
		fix.changeFixes === null ||
		(fix.changeFixes as boolean),
};

const overridesParsing: Parser = {
	dirs: [modpackManifest.overrides],
	skipCallback: defaultSkipCallback,
	itemCallback: defaultParsingCallback,
	leftOverCallback: (commit, commitMessage, _commitBody, subMessages) => {
		generalCategory.changelogSection
			?.get(generalCategory.defaultSubCategory)
			?.push({
				commitMessage: commitMessage,
				commitObject: commit,
				subChangelogMessages: subMessages,
			});
	},
	addCommitListCallback: () => true,
};

const manifestParsing: Parser = {
	dirs: ["manifest.json"],
	skipCallback: defaultSkipCallback,
	itemCallback: defaultParsingCallback,
	addCommitListCallback: () => true,
};

const finalParsing: Parser = {
	skipCallback: defaultSkipCallback,
	itemCallback: defaultParsingCallback,
	addCommitListCallback: (_commit, parsed) => parsed,
};

/**
 * Parsers
 * <p>
 * The order that the categories appear here will be the order that they are parsed in.<p>
 * Note that unless `addSHA` of the category is set to false, a commit parsed in a previous category will not be allowed to be parsed in future categories,
 * even if they fit in the dirs.
 */
export const changelogParsers: Parser[] = [
	fixupParsing,
	overridesParsing,
	manifestParsing,
	finalParsing,
];

/* Parsing Information / Allocations for Mod Changes */

export type ModChangesType = "added" | "removed" | "updated";

/**
 * An Allocation for mod changes categories to grab from.
 */
export interface ModChangesAllocation {
	/**
	 * Category to put in.
	 */
	category: Category;

	/**
	 * Sub category of the category to put in.
	 */
	subCategory: SubCategory;

	/**
	 * The template to use.<p><p>
	 * Keys:<p>
	 * `{{{ modName }}}` replaced by mod name,<p>
	 * `{{{ oldVersion }}}` replaced by the old version (if applicable)<p>
	 * `{{{ newVersion }}}` replaced by the new version (if applicable)
	 */
	template: string;
}

// These templates must be triple bracketed, because we don't want these to be html safe
export const modChangesAllocations: Record<
	ModChangesType,
	ModChangesAllocation
> = {
	added: {
		category: generalCategory,
		subCategory: modAdditions,
		template: "{{{ modName }}}: *v{{{ newVersion }}}*",
	},
	updated: {
		category: generalCategory,
		subCategory: modUpdates,
		template: "{{{ modName }}}: *v{{{ oldVersion }}} ⇥ v{{{ newVersion }}}*",
	},
	removed: {
		category: generalCategory,
		subCategory: modRemovals,
		template: "{{{ modName }}}: *v{{{ oldVersion }}}*",
	},
};

// Ignore Allocations

/* Ignore Checks */
const targetBeforeCheck: IgnoreCheck = (tag, data) => !data.tags.has(tag);
const targetAfterCheck: IgnoreCheck = (tag, data) => data.tags.has(tag);
const compareBeforeCheck: IgnoreCheck = (tag, data) =>
	!data.compareTags.has(tag);
const compareAfterCheck: IgnoreCheck = (tag, data) => data.compareTags.has(tag);
const compareIsCheck: IgnoreCheck = (tag, data) => data.since === tag;
const compareNotCheck: IgnoreCheck = (tag, data) => data.since !== tag;
const targetIsCheck: IgnoreCheck = (tag, data) => data.to === tag;
const targetNotCheck: IgnoreCheck = (tag, data) => data.to !== tag;

/* Ignore Checks Map */
export const ignoreChecks: Record<string, IgnoreCheck> = {
	targetBefore: targetBeforeCheck,
	targetAfter: targetAfterCheck,
	compareBefore: compareBeforeCheck,
	compareAfter: compareAfterCheck,
	compareIs: compareIsCheck,
	compareNot: compareNotCheck,
	targetIs: targetIsCheck,
	targetNot: targetNotCheck,
};

/* Ignore Logic */
const andLogic: IgnoreLogic = (checkResults) =>
	checkResults.filter((result) => !result).length === 0;
const orLogic: IgnoreLogic = (checkResults) =>
	checkResults.filter((result) => result).length > 0;
const nandLogic: IgnoreLogic = (checkResults) => !andLogic(checkResults);
const norLogic: IgnoreLogic = (checkResults) => !orLogic(checkResults);

/* Ignore Logic Map */
export const ignoreLogics: Record<string, IgnoreLogic> = {
	and: andLogic,
	or: orLogic,
	nand: nandLogic,
	nor: norLogic,
};

/* Default Ignore Logic */
export const defaultIgnoreLogic: IgnoreLogic = andLogic;
