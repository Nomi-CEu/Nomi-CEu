import { Icon, Quest, QuestBook, QuestVisibility } from "#types/bqQuestBook.ts";
import { diff } from "just-diff";
import {
	Changed,
	YesIgnoreNo,
	QuestChange,
	Replacements,
	SavedPorter,
	SpecialModifierHandler,
} from "#types/actionQBTypes.ts";
import upath from "upath";
import fs from "fs";
import PortQBData from "./questPorting/portQBData.ts";
import { input, select } from "@inquirer/prompts";
import {
	configFolder,
	configOverridesFolder,
	rootDirectory,
	storageFolder,
} from "#globals";
import logInfo, { logError, logWarn } from "#utils/log.ts";
import colors from "colors";
import { getUniqueToArray } from "#utils/util.ts";
import sortKeys from "sort-keys";
import lodash from "lodash";

let data: PortQBData;

export const emptyQuestName = "Gap";
export const emptyQuestDescription =
	"Unused Gap Quest. Prevents Overriding Of IDs.";
export const emptyQuestVisibility: QuestVisibility = "HIDDEN";
export const emptyQuestIconId = "minecraft:air";
export const emptyQuestTaskId = "bq_standard:checkbox";

export const emptyQuest: Quest = {
	"preRequisites:11": [],
	"properties:10": {
		"betterquesting:10": {
			"autoclaim:1": 0,
			"desc:8": "Unused Gap Quest. Prevents Overriding Of IDs.",
			"globalshare:1": 0,
			"icon:10": {
				"Count:3": 0,
				"Damage:2": 0,
				"OreDict:8": "",
				"id:8": "minecraft:air",
			},
			"ignoresview:1": 0,
			"ismain:1": 0,
			"issilent:1": 1,
			"lockedprogress:1": 0,
			"name:8": "Gap",
			"partysinglereward:1": 0,
			"questlogic:8": "AND",
			"repeat_relative:1": 1,
			"repeattime:3": -1,
			"simultaneous:1": 0,
			"snd_complete:8": "minecraft:entity.player.levelup",
			"snd_update:8": "minecraft:entity.player.levelup",
			"tasklogic:8": "AND",
			"visibility:8": "HIDDEN",
		},
	},
	"questID:3": 0,
	"rewards:9": {},
	"tasks:9": {
		"0:10": {
			"index:3": 0,
			"taskID:8": "bq_standard:checkbox",
		},
	},
};

export const defaultPorter = {
	savedQuestMap: [],
	ignoreQuestsNormal: [],
	ignoreQuestsExpert: [],
	alwaysAskQuestsNormal: [],
	alwaysAskQuestsExpert: [],
} as SavedPorter;

/* Paths */
export const cfgNormalPath = upath.join(
	configFolder,
	"betterquesting",
	"DefaultQuests.json",
);
export const cfgExpertPath = upath.join(
	configFolder,
	"betterquesting",
	"saved_quests",
	"ExpertQuests.json",
);

export const cfgOverrideNormalPath = upath.join(
	configOverridesFolder,
	"normal",
	"betterquesting",
	"DefaultQuests.json",
);
export const cfgOverrideExpertPath = upath.join(
	configOverridesFolder,
	"expert",
	"betterquesting",
	"DefaultQuests.json",
);

export const savedQuestPorter = upath.join(storageFolder, "savedQBPorter.json");

const nomiCoinMatcher = /^nomilabs:nomicoin[0-9]*$/;

export function setupUtils(dataIn: PortQBData): void {
	data = dataIn;
}

export function removeFormatting(input: string): string {
	if (!input.includes("§")) return input;

	const builder: string[] = [];
	for (let i = 0; i < input.length; i++) {
		const char = input.charAt(i);
		if (char === "§") {
			i++; // Skip Next Character
			continue;
		}
		builder.push(char);
	}
	return builder.join("");
}

export function stripRewards(quest: Quest, shouldCheck = false, log = false) {
	for (const rewardKey of Object.keys(quest["rewards:9"])) {
		const reward = quest["rewards:9"][rewardKey];
		if (
			!reward ||
			reward["rewardID:8"] !== "bq_standard:item" ||
			!reward["rewards:9"]
		)
			continue;

		for (const itemKey of Object.keys(reward["rewards:9"])) {
			const item: Icon = reward["rewards:9"][itemKey];
			if (item && item["id:8"] && nomiCoinMatcher.test(item["id:8"])) {
				if (shouldCheck)
					throw new Error(
						`Expert Quest with ID ${quest["questID:3"]} has Nomi Coin Reward!`,
					);
				if (log)
					logWarn(
						`Removing Nomi Coin Reward for Expert Quest with ID ${quest["questID:3"]}...`,
					);
				delete reward["rewards:9"][itemKey];
			}
		}
		if (Object.keys(reward["rewards:9"]).length === 0)
			delete quest["rewards:9"][rewardKey];
		else quest["rewards:9"][rewardKey] = reward;
	}
}

let cachedQuestByName: Map<string, Quest>;

/**
 * Finds the corresponding quest on the qb to change, using the data cache. If object is not found in the data cache, asks the client questions to determine the quest.
 * @param sourceId The id of the quest on the source qb.
 * @param sourceQuest The Source Quest, if it is not just `data.currentIDsToQuests.get(sourceId)`.
 * @return Returns the quest that is found, or undefined if the quest should be skipped.
 */
export async function findQuest(
	sourceId: number,
	sourceQuest?: Quest,
): Promise<Quest | undefined> {
	if (data.ignoreQuests.has(sourceId)) return undefined;
	if (data.foundQuests.has(sourceId)) return data.foundQuests.get(sourceId);

	// If no source quest, default behaviour
	if (!sourceQuest) sourceQuest = data.currentIDsToQuests.get(sourceId);
	// If still no source quest, throw
	if (!sourceQuest)
		throw new Error(
			`Request Find Quest for id ${sourceId}, which is not in IDs to Quests!`,
		);

	logInfo(
		colors.magenta(
			`Finding Corresponding Quest for Source Quest with ID ${sourceId} and Name ${name(sourceQuest)}...`,
		),
	);

	// Try Find by ID
	const questById = data.toChangeIDsToQuests.get(sourceId);
	if (questById && !isEmptyQuest(questById)) {
		// Ask the client if the corresponding id on the corresponding qb is correct
		const correctQuestById = await isRightQuest(
			`Does the Corresponding Quest have ID ${sourceId} and Name ${name(questById)}?`,
		);
		if (correctQuestById === "YES") {
			logInfo("Using Quest...");
			await finalizeFoundQuest(sourceId, () =>
				data.foundQuests.set(sourceId, questById),
			);
			return questById;
		}
		if (correctQuestById === "IGNORE") {
			logInfo("Ignoring...");
			await finalizeFoundQuest(sourceId, () => data.ignoreQuests.add(sourceId));
			return undefined;
		}
	}

	// Generate Quest By Name if Needed
	if (!cachedQuestByName) {
		cachedQuestByName = new Map<string, Quest>();
		[...data.toChangeIDsToQuests.values()].forEach((item) =>
			cachedQuestByName.set(removeFormatting(name(item)), item),
		);
	}

	// Try Find by Name
	const removeFormattedName = removeFormatting(name(sourceQuest));
	const questByName = cachedQuestByName.get(removeFormattedName);
	if (questByName && !isEmptyQuest(questByName)) {
		// Ask the client if the corresponding id on the corresponding qb is correct
		const correctQuestByName = await isRightQuest(
			`Does the Corresponding Quest have ID ${id(questByName)} and Name ${name(questByName)}?`,
		);
		if (correctQuestByName === "YES") {
			logInfo("Using Quest...");
			await finalizeFoundQuest(sourceId, () =>
				data.foundQuests.set(sourceId, questByName),
			);
			return questByName;
		}
		if (correctQuestByName === "IGNORE") {
			logInfo("Cancelling...");
			await finalizeFoundQuest(sourceId, () => data.ignoreQuests.add(sourceId));
			return undefined;
		}
	}

	// Finally, ask for the specific ID
	let foundBySpecificID: YesIgnoreNo = "NO";
	let questBySpecificID: Quest | undefined = undefined;
	while (foundBySpecificID === "NO") {
		const specID = parseInt(
			await input({
				message:
					"Please Provide a Specific Quest ID to be used as the Corresponding Quest. Enter -1 to Skip/Cancel this Quest!",
				validate: (value) => {
					const numValue = parseInt(value);
					if (numValue === -1) return true; // Allow Cancelling
					if (isNaN(numValue) || numValue < 0) {
						return "Please Enter a Number Value >= 0!";
					}
					return true;
				},
			}),
		);
		if (specID === -1) {
			logInfo("Cancelling...");
			foundBySpecificID = "IGNORE";
			break;
		}
		questBySpecificID = data.toChangeIDsToQuests.get(specID);
		if (!questBySpecificID) {
			logError(`${specID} is not a Quest ID in the Quest Book being Changed!`);
			continue;
		}
		if (isEmptyQuest(questBySpecificID)) {
			logError(
				`${specID} is a Empty Quest! Enter -1 to Skip/Cancel this Quest, not the ID of an Empty Quest!`,
			);
			continue;
		}
		foundBySpecificID = await isRightQuest(
			`Are You Sure you Would Like to use Quest with ID ${specID} and Name ${name(questBySpecificID)}?`,
		);
	}

	if (foundBySpecificID === "IGNORE" || !questBySpecificID)
		await finalizeFoundQuest(sourceId, () => data.ignoreQuests.add(sourceId));
	else
		await finalizeFoundQuest(sourceId, () =>
			data.foundQuests.set(sourceId, questBySpecificID),
		);

	return questBySpecificID;
}

async function finalizeFoundQuest(sourceID: number, addToList: () => void) {
	if (data.alwaysAskQuests.has(sourceID)) {
		logInfo(
			"This Quest is set to Ask Each Time. If this is not Desirable, Change this in the Saved Porter!",
		);
		return;
	}
	const askEachTime = await booleanSelect(
		"Should we Ask the Corresponding ID for this Quest Every Time?",
		"Yes",
		"No",
		false,
	);
	if (askEachTime) data.alwaysAskQuests.add(sourceID);
	else addToList();
}

async function isRightQuest(message: string): Promise<YesIgnoreNo> {
	return (await select({
		message: message,
		choices: [
			{
				name: "Yes",
				value: "YES",
			},
			{
				name: "No",
				value: "NO",
			},
			{
				name: "Skip/Ignore this Quest",
				value: "IGNORE",
			},
		],
	})) as YesIgnoreNo;
}

export async function booleanSelect(
	message: string,
	trueMsg = "Yes",
	falseMsg = "No",
	defaultTo = true,
): Promise<boolean> {
	return (
		await select({
			message: message,
			choices: [
				{
					name: trueMsg,
					value: true,
				},
				{
					name: falseMsg,
					value: false,
				},
			],
			default: defaultTo,
		})
	).valueOf();
}

export function id(quest: Quest): number {
	return quest["questID:3"];
}

export function name(quest: Quest): string {
	return quest["properties:10"]["betterquesting:10"]["name:8"];
}

export function dependencies(quest: Quest): number[] {
	return quest["preRequisites:11"];
}

/**
 * Paths to Ignore in Quest Change Calculation.
 * Prerequisites handled separately.
 * Prerequisites Types handled by Prerequisites.
 * Rewards not ported (too different across Quest Books)
 **/
const ignoreRootPaths = new Set<string>([
	"preRequisites:11",
	"preRequisiteTypes:7",
	"rewards:9",
]);

/**
 * Special Handling in Modified. The Path that is added to the changes list should have -CUSTOM appended to the end, to distinguish this from other changes.
 */
const specialModifierHandlers: SpecialModifierHandler[] = [
	(old, current, changes) => {
		const diff = getUniqueToArray(
			old["preRequisites:11"],
			current["preRequisites:11"],
		);
		// Unique to old array: Removed
		if (diff.arr1Unique.length > 0 || diff.arr2Unique.length > 0) {
			changes.push({
				path: ["preRequisites-CUSTOM"],
				op: "replace",
				value: diff,
			});
		}
	},
];

export function getChanged(
	currentQuests: Quest[],
	oldQuests: Quest[],
): Changed {
	// i is current iter, j is old iter
	let i = 0;
	let j = 0;
	const changed: Changed = { added: [], modified: [], removed: [] };
	while (i < currentQuests.length && j < oldQuests.length) {
		const currentQuestID = id(currentQuests[i]);
		const oldQuestID = id(oldQuests[j]);
		if (currentQuestID == oldQuestID) {
			let questDiff = diff(oldQuests[j], currentQuests[i]) as QuestChange[];
			if (questDiff.length !== 0) {
				questDiff = questDiff.filter(
					(change) =>
						typeof change.path[0] !== "string" ||
						!ignoreRootPaths.has(change.path[0]),
				);
				for (const handler of specialModifierHandlers) {
					handler(oldQuests[j], currentQuests[i], questDiff);
				}
				if (isEmptyQuest(currentQuests[i])) changed.removed.push(oldQuests[j]);
				else
					changed.modified.push({
						currentQuest: currentQuests[i],
						oldQuest: oldQuests[j],
						change: questDiff,
					});
			}
			i++;
			j++;
			continue;
		}
		if (!data.currentIDsToQuests.has(oldQuestID)) {
			logWarn(
				`A quest has been removed directly! (ID ${id(oldQuests[j])}, Name '${name(
					oldQuests[j],
				)}') This is NOT recommended! IDs may overlay in the future! Replace quests with empty ones instead!`,
			);
			changed.removed.push(oldQuests[j]);
			j++;
			continue;
		}
		changed.added.push(currentQuests[i]);
		i++;
	}
	if (i < currentQuests.length) {
		changed.added.push(...currentQuests.slice(i));
	} else if (j < currentQuests.length) {
		changed.removed.push(...currentQuests.slice(i));
	}
	return changed;
}

export function isEmptyQuest(quest: Quest): boolean {
	return (
		questIsSilent(quest) &&
		emptyName(quest) &&
		emptyDesc(quest) &&
		emptyVisibility(quest) &&
		emptyIcon(quest) &&
		questHasNoRewards(quest) &&
		emptyTasks(quest)
	);
}

function emptyName(quest: Quest): boolean {
	const questName = name(quest);
	return questName === emptyQuestName || !questName;
}

function emptyDesc(quest: Quest): boolean {
	const questDesc = quest["properties:10"]["betterquesting:10"]["desc:8"];
	return questDesc === emptyQuestDescription || !questDesc;
}

function emptyVisibility(quest: Quest): boolean {
	const questVisibility =
		quest["properties:10"]["betterquesting:10"]["visibility:8"];
	return questVisibility === emptyQuestVisibility;
}

function emptyIcon(quest: Quest): boolean {
	const questIcon = quest["properties:10"]["betterquesting:10"]["icon:10"];
	return (
		!questIcon || questIcon["id:8"] === emptyQuestIconId || !questIcon["id:8"]
	);
}

function questIsSilent(quest: Quest): boolean {
	return quest["properties:10"]["betterquesting:10"]["issilent:1"] !== 0;
}

function questHasNoRewards(quest: Quest): boolean {
	return !quest["rewards:9"] || Object.keys(quest["rewards:9"]).length === 0;
}

function emptyTasks(quest: Quest): boolean {
	return (
		!quest["tasks:9"] ||
		Object.keys(quest["tasks:9"]).length === 0 ||
		(Object.keys(quest["tasks:9"]).length === 1 &&
			(!quest["tasks:9"]["0:10"] ||
				!quest["tasks:9"]["0:10"]["taskID:8"] ||
				quest["tasks:9"]["0:10"]["taskID:8"] === emptyQuestTaskId))
	);
}

export function stringifyQB(qb: QuestBook): string {
	// Formatting Changes
	const replacements: Replacements[] = [
		{
			search: /</g,
			replacement: "\\u003c",
		},
		{
			search: />/g,
			replacement: "\\u003e",
		},
		{
			search: /&/g,
			replacement: "\\u0026",
		},
		{
			search: /=/g,
			replacement: "\\u003d",
		},
		{
			search: /'/g,
			replacement: "\\u0027",
		},
	];
	qb = sortKeysRecursiveIgnoreArray(qb, (key1, key2): number => {
		const defaultVal = key2 < key1 ? 1 : -1;

		if (!key1.includes(":") || !key2.includes(":")) return defaultVal;

		const num1 = Number.parseInt(key1.split(":")[0]);
		const num2 = Number.parseInt(key2.split(":")[0]);

		if (Number.isNaN(num1) || Number.isNaN(num2)) return defaultVal;
		return num1 - num2;
	});
	let parsed = JSON.stringify(qb, null, 2).replace(
		/("[a-zA-Z_]+:[56]":\s)(-?[0-9]+)(,?)$/gm,
		"$1$2.0$3",
	); // Add '.0' to any Float/Double Values that are Integers

	for (const replacement of replacements) {
		parsed = parsed.replace(replacement.search, replacement.replacement);
	}
	return parsed;
}

/**
 * Use our own, instead of sortKeysRecursive, to ignore sorting of arrays.
 */
function sortKeysRecursiveIgnoreArray<T extends object>(
	object: T,
	compare: (a: string, b: string) => number,
): T {
	const result = sortKeys(object as Record<string, unknown>, { compare }) as T;

	// We can modify results, Object.Keys returns a static array
	Object.keys(result).forEach(function (key) {
		const current = lodash.get(result, key) as unknown;
		if (current) {
			if (typeof current === "object") {
				lodash.set(result, key, sortKeys(current, { compare }));
				return;
			}
		}
	});

	return result;
}

export async function save(toSave: QuestBook): Promise<void> {
	const save = await booleanSelect("Would you like to Save Changes?");
	if (!save) return;

	const shouldSavePorter = await booleanSelect(
		"Would you like to Save the Quest Porter?",
	);
	if (shouldSavePorter) await savePorter();

	const parsed = stringifyQB(toSave);

	for (const path of data.outputPaths) {
		await fs.promises.writeFile(upath.join(rootDirectory, path), parsed);
	}

	logInfo(`Saved Files: ${data.outputPaths.join(", ")}!`);
	logInfo(
		colors.green(
			colors.bold(
				"Remember to import the JSON Files into your Instance to format them!",
			),
		),
	);
}

async function savePorter() {
	logInfo("Saving Porter...");

	let porter: SavedPorter;

	// Keys of Porter Are Checked on Import
	// Porter Definitely Has a Value for Each Key
	if (!data.savedPorter) {
		if (fs.existsSync(savedQuestPorter)) {
			porter = await readFromPorter(false);
		} else porter = defaultPorter;
	} else porter = data.savedPorter;

	// Save Map
	porter.savedQuestMap = [];
	for (const sourceID of data.foundQuests.keys()) {
		const sourceQuest = data.foundQuests.get(sourceID);
		if (!sourceQuest) continue;
		const targetID = id(sourceQuest);

		let normalID: number, expertID: number;
		switch (data.type) {
			case "NORMAL":
				normalID = sourceID;
				expertID = targetID;
				break;
			case "EXPERT":
				normalID = targetID;
				expertID = sourceID;
				break;
		}

		porter.savedQuestMap.push({
			normal: normalID,
			expert: expertID,
		});

		porter.savedQuestMap.sort((a, b) => a.normal - b.normal);
	}

	// Save Ignore
	const ignoreArr = [...data.ignoreQuests];
	if (data.type === "NORMAL") porter.ignoreQuestsNormal = ignoreArr;
	else porter.ignoreQuestsExpert = ignoreArr;

	// Save Always Ask
	const alwaysAskArr = [...data.alwaysAskQuests];
	if (data.type === "NORMAL") porter.alwaysAskQuestsNormal = alwaysAskArr;
	else porter.alwaysAskQuestsExpert = alwaysAskArr;

	// Write Porter to File
	return fs.promises.writeFile(
		savedQuestPorter,
		JSON.stringify(porter, null, 2),
	);
}

export async function readFromPorter(
	replaceExisting: boolean,
): Promise<SavedPorter> {
	const savedPorter = JSON.parse(
		await fs.promises.readFile(savedQuestPorter, "utf-8"),
	) as SavedPorter;

	// Make Sure Porter has Every Key
	for (const key of Object.keys(defaultPorter)) {
		// @ts-expect-error Cannot use String as Key
		if (!savedPorter[key]) savedPorter[key] = defaultPorter[key] as unknown;
	}

	// Add in Map
	if (replaceExisting) data.foundQuests.clear();
	for (const savedQuestPath of savedPorter.savedQuestMap) {
		if (
			Number.isNaN(savedQuestPath.normal) ||
			Number.isNaN(savedQuestPath.expert)
		)
			throw new Error("ID must be a number!");

		let sourceID: number, targetID: number;
		switch (data.type) {
			case "NORMAL":
				sourceID = savedQuestPath.normal;
				targetID = savedQuestPath.expert;
				break;
			case "EXPERT":
				sourceID = savedQuestPath.expert;
				targetID = savedQuestPath.normal;
				break;
		}

		if (!data.currentIDsToQuests.has(sourceID))
			throw new Error("ID must be a valid quest!");
		const targetQuest = data.toChangeIDsToQuests.get(targetID);
		if (!targetQuest) throw new Error("ID must be a valid quest!");

		if (!data.foundQuests.has(sourceID))
			data.foundQuests.set(sourceID, targetQuest);
	}

	// Ignore & Always Ask
	data.ignoreQuests = addToOrReplaceSet(
		replaceExisting,
		data.type === "NORMAL"
			? savedPorter.ignoreQuestsNormal
			: savedPorter.ignoreQuestsExpert,
		data.ignoreQuests,
	);
	data.alwaysAskQuests = addToOrReplaceSet(
		replaceExisting,
		data.type === "NORMAL"
			? savedPorter.alwaysAskQuestsNormal
			: savedPorter.alwaysAskQuestsExpert,
		data.alwaysAskQuests,
	);

	data.savedPorter = savedPorter;
	return savedPorter;
}

function addToOrReplaceSet<T>(
	replaceExisting: boolean,
	array: T[],
	set: Set<T>,
): Set<T> {
	if (replaceExisting) return new Set<T>(array);

	array.forEach((value) => set.add(value));
	return set;
}
