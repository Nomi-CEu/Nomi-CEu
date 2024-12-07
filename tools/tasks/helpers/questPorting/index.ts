import fs from "fs";
import upath from "upath";
import { rootDirectory } from "#globals";
import { Quest, QuestBook, QuestLine } from "#types/bqQuestBook.ts";
import { getFileAtRevision, git } from "#utils/util.ts";
import { getChanged, id, save, setupUtils } from "../actionQBUtils.ts";
import PortQBData from "./portQBData.ts";
import {
	additions,
	modifications,
	removals,
	setupLogic,
} from "./portQBLogic.ts";
import { setupModifications } from "./portQBModifications.ts";
import logInfo, { logError, logNotImportant } from "#utils/log.ts";

let data: PortQBData;

export default async function portQBChanges(): Promise<void> {
	data = new PortQBData();
	await data.setup();
	setupLogic(data);
	setupModifications(data);
	setupUtils(data);

	const current = JSON.parse(
		await fs.promises.readFile(
			upath.join(rootDirectory, data.srcPath),
			"utf-8",
		),
	) as QuestBook;
	const old = JSON.parse(
		await getFileAtRevision(data.srcPath, data.ref),
	) as QuestBook;

	// Now we have used the ref, delete branch
	if (data.createdBranch) {
		await git.deleteLocalBranch(data.ref);
		logNotImportant(`Deleted Temp Branch ${data.ref}`);
	}

	const currentQuests = Object.values(current["questDatabase:9"]);
	const oldQuests = Object.values(old["questDatabase:9"]);

	const toChange = JSON.parse(
		await fs.promises.readFile(
			upath.join(rootDirectory, data.srcPathToChange),
			"utf-8",
		),
	) as QuestBook;

	const quests = Object.values(toChange["questDatabase:9"]);

	data.currentIDsToQuests = new Map<number, Quest>(
		currentQuests.map((quest) => [id(quest), quest]),
	);
	data.toChangeIDsToQuests = new Map<number, Quest>(
		quests.map((quest) => [id(quest), quest]),
	);

	await data.readSavedPorter();

	data.changed = getChanged(currentQuests, oldQuests);
	const addedQuestIDs = data.changed.added.map((quest) => id(quest));
	const modifiedQuestIDs = data.changed.modified.map((mod) => id(mod.oldQuest));
	const removedQuestIDs = data.changed.removed.map((quest) => id(quest));
	logInfo(`Quests Added: [${addedQuestIDs.join(", ")}]`);
	logInfo(`Quests Modified: [${modifiedQuestIDs.join(", ")}]`);
	logInfo(`Quests Removed: [${removedQuestIDs.join(", ")}]`);

	if (
		addedQuestIDs.length === 0 &&
		modifiedQuestIDs.length === 0 &&
		removedQuestIDs.length === 0
	) {
		logError("Files are the Same! No Changes Detected! Exiting...");
		return;
	}

	if (addedQuestIDs.length > 0) await additions();
	if (modifiedQuestIDs.length > 0) await modifications();
	if (removedQuestIDs.length > 0) {
		// Set the Old IDs to Quests
		data.oldIDsToQuests = new Map<number, Quest>(
			oldQuests.map((quest) => [id(quest), quest]),
		);
		// Set the Quest Line Changeable
		data.questLines = Object.values(toChange["questLines:9"]);
		await removals();
	}

	// Save Quest Database
	const obj = {} as { [key: string]: Quest };
	const iter = data.toChangeIDsToQuests.values();
	for (let i = 0; i < data.toChangeIDsToQuests.size; i++) {
		const quest = iter.next().value;
		if (!quest) continue;
		obj[`${i}:10`] = quest;
	}
	toChange["questDatabase:9"] = obj;

	// Save Quest Lines, if Changed
	if (data.questLines) {
		const obj = {} as { [key: string]: QuestLine };
		for (let i = 0; i < data.questLines.length; i++) {
			obj[`${i}:10`] = data.questLines[i];
		}
		toChange["questLines:9"] = obj;
	}

	return save(toChange);
}
