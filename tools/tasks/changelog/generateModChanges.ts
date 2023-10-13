import { cleanupVersion, compareAndExpandManifestDependencies, getChangelog, getFileAtRevision } from "../../util/util";
import { ModpackManifest, ModpackManifestFile } from "../../types/modpackManifest";
import { Commit, ModChangeInfo } from "../../types/changelogTypes";
import ListDiffer, { DiffResult } from "@egjs/list-differ";
import dedent from "dedent-js";
import mustache from "mustache";
import { modChangesAllocations } from "./definitions";

/**
 * Pushes the mod changes, with their relative commits, to their respective sub categories in the general category.
 * @param since The ref compare from
 * @param to The ref to compare to
 */
export default async function pushModChangesToGenerals(since: string, to: string): Promise<void> {
	const oldManifest: ModpackManifest = JSON.parse(getFileAtRevision("manifest.json", since));
	const newManifest: ModpackManifest = JSON.parse(getFileAtRevision("manifest.json", to));
	const comparisonResult = await compareAndExpandManifestDependencies(oldManifest, newManifest);

	const commitList = await getChangelog(since, to, ["manifest.json"]);
	const projectIDsToCommits: Map<number, Commit[]> = new Map();

	commitList.forEach((commit) => {
		const projectIDs = getChangedProjectIDs(commit.hash);
		projectIDs.forEach((id) => {
			if (projectIDsToCommits.has(id)) projectIDsToCommits.get(id).push(commit);
			else projectIDsToCommits.set(id, [commit]);
		});
	});

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
		const list = block.list
			// Yeet invalid project names.
			.filter((project) => !/project-\d*/.test(project.modName))
			.sort()
			.map((name) => name);

		list.forEach((info) => {
			let commits: Commit[] = undefined;
			if (info.projectID && projectIDsToCommits.has(info.projectID)) {
				commits = projectIDsToCommits.get(info.projectID);
			}
			block.allocation.category.changelogSection.get(block.allocation.subCategory).push({
				commitMessage: getModChangeMessage(info, block.allocation.template),
				commitObjects: commits,
			});
		});
	});
}

/**
 * Returns the message, determined by the parameters below.
 * @param info The mod change info, containing the mod name and versions.
 * @param template The message template to replace in.
 */
function getModChangeMessage(info: ModChangeInfo, template: string): string {
	const oldVersion = cleanupVersion(info.oldVersion);
	const newVersion = cleanupVersion(info.newVersion);

	// If not provided with either version, return just mod name
	if (!oldVersion && !newVersion) return info.modName;

	// Replace in template
	return mustache.render(template, {
		modName: info.modName,
		oldVersion: oldVersion,
		newVersion: newVersion,
	});
}

/**
 * Gets what project IDs, in manifest.json, a commit changed.
 * @param SHA The sha of the commit
 */
function getChangedProjectIDs(SHA: string): number[] {
	const change = getCommitChange(SHA);
	const projectIDs: number[] = [];

	if (!change || !change.diff) {
		return projectIDs;
	}

	// Add all unique IDs from both diff lists
	change.diff.added.forEach((index) => {
		const id = change.newManifest.files[index].projectID;
		if (!projectIDs.includes(id)) projectIDs.push(id);
	});

	change.diff.removed.forEach((index) => {
		const id = change.oldManifest.files[index].projectID;
		if (!projectIDs.includes(id)) projectIDs.push(id);
	});

	return projectIDs;
}

/**
 * A storage of what parts of the 'manifest.json' file a commit changed.
 */
interface CommitChange {
	diff: DiffResult<ModpackManifestFile>;
	oldManifest: ModpackManifest;
	newManifest: ModpackManifest;
}

/**
 * Gets what parts of the 'manifest.json' file a commit changed.
 * @param SHA The sha of the commit
 */
function getCommitChange(SHA: string): CommitChange {
	let oldManifest: ModpackManifest, newManifest: ModpackManifest;
	try {
		oldManifest = JSON.parse(getFileAtRevision("manifest.json", `${SHA}^`)) as ModpackManifest;
		newManifest = JSON.parse(getFileAtRevision("manifest.json", SHA)) as ModpackManifest;
	} catch (e) {
		console.error(dedent`
			Failed to parse the manifest.json file at commit ${SHA} or the commit before!
			Skipping...`);
		return;
	}

	let result: DiffResult<ModpackManifestFile>;
	if (oldManifest && newManifest) {
		const differ = new ListDiffer(oldManifest.files, (e) => e.fileID);
		result = differ.update(newManifest.files);
	}

	return {
		diff: result,
		oldManifest: oldManifest,
		newManifest: newManifest,
	};
}
