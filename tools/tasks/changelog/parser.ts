import {
	Category,
	Commit,
	FixUpInfo,
	Ignored,
	Parser,
	SubCategory,
} from "#types/changelogTypes.ts";
import {
	categories,
	coAuthorsKey,
	combineKey,
	defaultIndentation,
	detailsKey,
	expandKey,
	ignoreKey,
	modInfoKey,
	noCategoryKey,
	priorityKey,
} from "./definitions.ts";
import {
	parseCoAuthor,
	parseCombine,
	parseDetails,
	parseExpand,
	parseIgnore,
	parseModInfo,
	parsePriority,
} from "./specialParser.ts";
import { getChangelog } from "#utils/util.ts";
import ChangelogData from "./changelogData.ts";

export default async function parseParser(
	data: ChangelogData,
	parser: Parser,
): Promise<void> {
	const commits = await getChangelog(data.since, data.to, parser.dirs);

	for (const commit of commits) {
		if (data.shaList.has(commit.hash)) continue;

		let savedFix: FixUpInfo | undefined = undefined;
		if (data.commitFixes.has(commit.hash)) {
			const fixUpInfo = data.commitFixes.get(commit.hash);
			if (fixUpInfo) {
				if (!parser.applyFixCalback || parser.applyFixCalback(fixUpInfo)) {
					applyFix(commit, fixUpInfo);
				} else {
					savedFix = fixUpInfo;
				}
			}
		}

		if (parser.skipCallback(commit, commit.message, commit.body)) {
			if (!parser.addSHACallback || parser.addSHACallback(commit, true))
				data.shaList.add(commit.hash);
			continue;
		}

		const parsed = await parser.itemCallback(
			parser,
			commit,
			commit.message,
			commit.body,
			savedFix,
		);
		if (parsed instanceof Ignored) {
			if (parsed.getCommitList() && parser.addCommitListCallback) {
				if (parser.addCommitListCallback(commit, true))
					data.commitList.push(commit);
			}
			continue;
		}

		if (!parsed && parser.leftOverCallback)
			parser.leftOverCallback(commit, commit.message, commit.body, []);
		if (!parser.addSHACallback || parser.addSHACallback(commit, parsed))
			data.shaList.add(commit.hash);

		if (parser.addCommitListCallback(commit, parsed))
			data.commitList.push(commit);
	}
}

function applyFix(commit: Commit, fix: FixUpInfo) {
	if (fix.newTitle) commit.message = fix.newTitle;
	if (fix.newBody) {
		switch (fix.mode) {
			case "REPLACE":
				commit.body = fix.newBody;
				break;
			case "ADDITION":
				commit.body = commit.body.concat(`\n\n${fix.newBody}`);
				break;
		}
	}
}

/**
 * Parses a commit body.
 * @param commitMessage The commit message to put into the changelog.
 * @param commitBody The commit body to parse with.
 * @param commitObject The commit object.
 * @param parser The parser object to use for parse expand/details.
 * @return parsed Returns true if contains parsing keys, false if not.
 */
export async function parseCommitBody(
	commitMessage: string,
	commitBody: string,
	commitObject: Commit,
	parser: Parser,
): Promise<boolean | Ignored> {
	if (commitBody.includes(modInfoKey))
		await parseModInfo(commitBody, commitObject);

	if (commitBody.includes(coAuthorsKey))
		await parseCoAuthor(commitBody, commitObject);

	if (commitBody.includes(expandKey)) {
		await parseExpand(commitBody, commitObject, parser);
		return true;
	}
	if (commitBody.includes(ignoreKey)) {
		const ignore = await parseIgnore(commitBody, commitObject);

		// Only return if ignore is not undefined
		if (ignore) return ignore;
	}

	let newPriority = 0;
	if (commitBody.includes(priorityKey)) {
		const priority = await parsePriority(commitBody, commitObject);

		// Only set if priority is not undefined or 0
		if (priority) newPriority = priority;
	}
	// Copy commit if new priority (don't mess it up for other changelog messages when using expand)
	if (commitObject.priority !== newPriority) {
		commitObject = { ...commitObject };
		commitObject.priority = newPriority;
	}

	if (commitBody.includes(detailsKey)) {
		await parseDetails(commitMessage, commitBody, commitObject, parser);
		return true;
	}
	if (commitBody.includes(noCategoryKey)) {
		return true;
	}
	if (commitBody.includes(combineKey)) {
		await parseCombine(commitBody, commitObject);
		return true;
	}
	return sortCommit(commitMessage, commitBody, commitObject);
}

/**
 * Adds the (commit) message to its correct category. Does not parse special effect tags.
 * @param message The message to add
 * @param commitBody The body to use to sort
 * @param commit The commit object to grab date, author and SHA from
 * @param indentation The indentation of the message, if needed. Defaults to "".
 * @return added If the commit message was added to a category
 */
function sortCommit(
	message: string,
	commitBody: string,
	commit: Commit,
	indentation = defaultIndentation,
): boolean {
	const sortedCategories: Category[] = findCategories(commitBody);
	if (sortedCategories.length === 0) return false;

	sortedCategories.forEach((category) => {
		const subCategory = findSubCategory(commitBody, category);
		category.changelogSection?.get(subCategory)?.push({
			commitMessage: message,
			commitObject: commit,
			indentation: indentation,
		});
	});
	return true;
}

/**
 * Finds the categories that a commit fits in.
 * @param commitBody The commit body to sort with
 * @return categoryList The categories that the commit belongs in. Return undefined if no category specified via keys.
 */
export function findCategories(commitBody: string): Category[] {
	const sortedCategories: Category[] = [];
	for (const category of categories) {
		if (category.commitKey !== undefined) {
			if (commitBody.includes(category.commitKey)) {
				sortedCategories.push(category);
			}
		}
	}
	return sortedCategories;
}

/**
 * Finds the correct Sub Category a commit should go in. Must be given the Category first!
 */
export function findSubCategory(
	commitBody: string,
	category: Category,
): SubCategory {
	for (const subCategory of category.subCategories) {
		if (subCategory.commitKey !== undefined) {
			if (commitBody.includes(subCategory.commitKey)) {
				return subCategory;
			}
		}
	}
	return category.defaultSubCategory;
}
