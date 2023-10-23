import { cleanupVersion, compareAndExpandManifestDependencies, getChangelog, getFileAtRevision } from "../../util/util";
import { ModpackManifest, ModpackManifestFile } from "../../types/modpackManifest";
import { Commit, ModChangeInfo } from "../../types/changelogTypes";
import ListDiffer, { DiffResult } from "@egjs/list-differ";
import dedent from "dedent-js";
import mustache from "mustache";
import { defaultIndentation, modChangesAllocations, repoLink } from "./definitions";
import ChangelogData from "./changelogData";
import { SpecialChangelogFormatting } from "../../types/changelogTypes";
import { sortCommitListReverse } from "./pusher";

/**
 * Mod Changes special formatting
 */
const getModChangesFormatting: (commits: Commit[]) => SpecialChangelogFormatting<Commit[]> = (commits) => {
	return {
		formatting: (changelogMessage, commits) => {
			const indentation = changelogMessage.indentation == undefined ? defaultIndentation : changelogMessage.indentation;
			const message = changelogMessage.commitMessage.trim();
			if (commits.length > 1) {
				const authors: string[] = [];
				const formattedCommits: string[] = [];
				commits.forEach((commit) => {
					if (!authors.includes(commit.author_name)) authors.push(commit.author_name);
					formattedCommits.push(`[\`${commit.hash.substring(0, 7)}\`](${repoLink}commit/${commit.hash})`);
				});
				authors.sort();
				return `${indentation}* ${message} - **${authors.join("**, **")}** (${formattedCommits.join(", ")})`;
			}

			const commit = commits[0];
			const shortSHA = commit.hash.substring(0, 7);
			const author = commit.author_name;

			return `${indentation}* ${message} - **${author}** ([\`${shortSHA}\`](${repoLink}commit/${commit.hash}))`;
		},
		storage: commits,
	} as SpecialChangelogFormatting<Commit[]>;
};

/**
 * Pushes the mod changes, with their relative commits, to their respective sub categories in the specified category.
 */
export default async function generateModChanges(data: ChangelogData): Promise<void> {
	const oldManifest: ModpackManifest = JSON.parse(getFileAtRevision("manifest.json", data.since));
	const newManifest: ModpackManifest = JSON.parse(getFileAtRevision("manifest.json", data.to));
	const comparisonResult = await compareAndExpandManifestDependencies(oldManifest, newManifest);

	const commitList = await getChangelog(data.since, data.to, ["manifest.json"]);
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

				// Sort array so newest commits appear at end instead of start of commit string
				sortCommitListReverse(commits);
			}
			block.allocation.category.changelogSection.get(block.allocation.subCategory).push({
				commitMessage: getModChangeMessage(info, block.allocation.template),
				specialFormatting: getModChangesFormatting(commits),
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
