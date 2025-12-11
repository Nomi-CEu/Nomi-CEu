import {
	ArrayUnique,
	cleanupVersion,
	compareAndExpandManifestDependencies,
	getChangelog,
	getFileAtRevision,
	getUniqueToArray,
} from "#utils/util.ts";
import {
	ModpackManifest,
	ModpackManifestFile,
} from "#types/modpackManifest.ts";
import {
	ChangelogMessage,
	Commit,
	ModChangeInfo,
} from "#types/changelogTypes.ts";
import dedent from "dedent-js";
import mustache from "mustache";
import { modChangesAllocations } from "./definitions.ts";
import ChangelogData from "./changelogData.ts";
import { SpecialChangelogFormatting } from "#types/changelogTypes.ts";
import { formatMessage, sortCommitListReverse } from "./pusher.ts";
import { logError } from "#utils/log.ts";

/**
 * Mod Changes special formatting
 */
const getModChangesFormatting: (
	commits?: Commit[],
) => SpecialChangelogFormatting<Commit[] | undefined> = (commits) => {
	return {
		formatting: async (message, subMessage, indentation, commits) => {
			// Sub messages are details, so make them bold & italic
			if (subMessage) return `${indentation}* ***${message}***`;

			return formatMessage(message, indentation, commits, subMessage);
		},
		storage: commits,
	} as SpecialChangelogFormatting<Commit[] | undefined>;
};

/**
 * Pushes the mod changes, with their relative commits, to their respective sub categories in the specified category.
 */
export default async function generateModChanges(
	data: ChangelogData,
): Promise<void> {
	const oldManifest = JSON.parse(
		await getFileAtRevision("manifest.json", data.since),
	) as ModpackManifest;
	const newManifest = JSON.parse(
		await getFileAtRevision("manifest.json", data.to),
	) as ModpackManifest;
	const comparisonResult = await compareAndExpandManifestDependencies(
		oldManifest,
		newManifest,
	);

	const commitList = await getChangelog(data.since, data.to, ["manifest.json"]);
	const projectIDsToCommits: Map<number, Commit[]> = new Map();

	for (const commit of commitList) {
		const projectIDs = await getChangedProjectIDs(commit.hash);
		projectIDs.forEach((id) => {
			if (projectIDsToCommits.has(id))
				projectIDsToCommits.get(id)?.push(commit);
			else projectIDsToCommits.set(id, [commit]);
		});
	}

	[
		{
			allocation: modChangesAllocations.added,
			list: comparisonResult.added,
		},
		{
			allocation: modChangesAllocations.updated,
			list: comparisonResult.modified,
		},
		{
			allocation: modChangesAllocations.removed,
			list: comparisonResult.removed,
		},
	].forEach((block) => {
		if (block.list.length == 0) {
			return;
		}
		const list = block.list.sort().map((name) => name);

		list.forEach((info) => {
			let commits: Commit[] | undefined = undefined;
			if (projectIDsToCommits.has(info.mod.id)) {
				commits = projectIDsToCommits.get(info.mod.id) ?? [];

				// Sort array so newest commits appear at end instead of start of commit string
				sortCommitListReverse(commits, (commit) => commit);
			}
			block.allocation.category.changelogSection
				?.get(block.allocation.subCategory)
				?.push(
					getModChangeMessage(info, block.allocation.template, data, commits),
				);
		});
	});
}

/**
 * Returns the changelog message, determined by the parameters below.
 * @param info The mod change info, containing the mod name and versions.
 * @param template The message template to replace in.
 * @param data The changelog data
 * @param commits The commits
 */
function getModChangeMessage(
	info: ModChangeInfo,
	template: string,
	data: ChangelogData,
	commits?: Commit[],
): ChangelogMessage {
	const oldVersion = cleanupVersion(info.old?.displayName);
	const newVersion = cleanupVersion(info.new?.displayName);

	// Replace in template
	let text = mustache.render(template, {
		modName: info.mod.name,
		oldVersion: oldVersion,
		newVersion: newVersion,
	});

	// Parse Info
	let subMessages: ChangelogMessage[] | undefined = undefined;
	if (data.modInfoList.has(info.mod.id)) {
		const modInfo = data.modInfoList.get(info.mod.id);
		if (modInfo?.info) text = `${text} ***(${modInfo.info})***`;
		if (modInfo?.details)
			subMessages = modInfo?.details.map((detail) => {
				detail.specialFormatting = getModChangesFormatting(commits);
				return detail;
			});
	}

	return {
		commitMessage: text,
		specialFormatting: getModChangesFormatting(commits),
		subChangelogMessages: subMessages,
	};
}

/**
 * Gets what project IDs, in manifest.json, a commit changed.
 * @param sha The sha of the commit
 */
async function getChangedProjectIDs(sha: string): Promise<number[]> {
	const change = await getCommitChange(sha);
	const projectIDs: number[] = [];

	if (!change) {
		return projectIDs;
	}

	// Add all unique IDs from both diff lists
	change.arr1Unique.forEach((file) => {
		if (!projectIDs.includes(file.projectID)) projectIDs.push(file.projectID);
	});
	change.arr2Unique.forEach((file) => {
		if (!projectIDs.includes(file.projectID)) projectIDs.push(file.projectID);
	});

	return projectIDs;
}

/**
 * Gets what parts of the 'manifest.json' file a commit changed.
 * @param sha The sha of the commit
 */
async function getCommitChange(
	sha: string,
): Promise<ArrayUnique<ModpackManifestFile> | undefined> {
	let oldManifest: ModpackManifest, newManifest: ModpackManifest;
	try {
		oldManifest = JSON.parse(
			await getFileAtRevision("manifest.json", `${sha}^`),
		) as ModpackManifest;
		newManifest = JSON.parse(
			await getFileAtRevision("manifest.json", sha),
		) as ModpackManifest;
	} catch {
		logError(dedent`
			Failed to parse the manifest.json file at commit ${sha} or the commit before!
			Skipping...`);
		return undefined;
	}

	let result: ArrayUnique<ModpackManifestFile> | undefined = undefined;
	if (oldManifest && newManifest)
		result = getUniqueToArray(
			oldManifest.files,
			newManifest.files,
			(e) => e.fileID,
		);

	return result;
}
