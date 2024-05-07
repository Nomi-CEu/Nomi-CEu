import {
	BunchedParserPath,
	ChangeAndPath,
	CustomDescriptionTemplate,
	DescriptionChange,
	LogicType,
	Message,
	Modified,
	Parser,
	QuestChange,
	SimpleLogic,
} from "#types/portQBTypes.ts";
import PortQBData from "./portQBData.ts";
import DiffMatchPatch from "diff-match-patch";
import picomatch from "picomatch";
import { booleanSelect, findQuest, id, name, navigateTo, setValue } from "./portQBUtils.ts";
import fakeDiff from "fake-diff";
import { Operation } from "just-diff";
import logInfo, { logNotImportant } from "#utils/log.ts";
import dedent from "dedent-js";
import { confirm, editor, select } from "@inquirer/prompts";
import colors from "colors";
import { stringify } from "javascript-stringify";
import { Quest } from "#types/bqQuestBook.ts";
import { ArrayUnique } from "#utils/util.js";

let data: PortQBData;
const dmp = new DiffMatchPatch();

export function setupModifications(dataIn: PortQBData): void {
	data = dataIn;
}

export async function performModification(modify: Modified): Promise<void> {
	const { formattedNames, callableFunctions } = findAllParsers(modify);
	if (formattedNames.length === 0 || callableFunctions.length === 0) {
		logNotImportant(
			`All Modification Changes on this Quest with ID ${id(modify.currentQuest)} and Name ${name(
				modify.currentQuest,
			)} were Skipped.`,
		);
		return;
	}

	// Relying on the fact that the messages are sorted, condense duplicates.
	const output: Message[] = [];
	let lastMsg: string | undefined = undefined;
	for (let i = 0; i < formattedNames.length; i++) {
		if (i !== 0 && formattedNames[i] === lastMsg) {
			output[i - 1].incrementRepeats();
			continue;
		}
		output.push(new Message(formattedNames[i]));
		lastMsg = formattedNames[i];
	}

	if (
		!(await booleanSelect(
			`Would you like to perform modifications on Quest with ID ${id(modify.currentQuest)} and Name ${name(
				modify.currentQuest,
			)}?\nChanges: ${output.map((msg) => msg.toFormattedString()).join(", ")}`,
		))
	) {
		logNotImportant("Skipping...");
		return;
	}
	const quest = await findQuest(id(modify.currentQuest));
	if (!quest) {
		logInfo("Skipping, Could not find Corresponding Quest...");
		return;
	}
	for (const func of callableFunctions) {
		await func(quest);
	}
}

function getFormattedParserName(parser: Parser, path: string[], op: Operation) {
	if (!parser.formattedName) return `${parser.name} ${formatOp(op)}`;
	return parser.formattedName(path, op);
}

function formatOp(operation: Operation): string {
	switch (operation) {
		case "add":
			return "Addition";

		default:
		case "replace":
			return "Modification";

		case "remove":
			return "Removal";
	}
}

function findAllParsers(modify: Modified): {
	formattedNames: string[];
	callableFunctions: ((questToModify: Quest) => Promise<void>)[];
} {
	const outputFunctions: ((questToModify: Quest) => Promise<void>)[] = [];
	const outputFormatted: string[] = [];

	const foundBuncableParsers = new Map<string, BunchedParserPath[]>();
	const foundSimpleParserIds = new Set<string>();
	for (const change of modify.change) {
		const pathList = (change.path as string[] | number[]).map((path: string | number): string => {
			if (typeof path === "number") path = (path as number).toString();
			return path.split(":")[0];
		});
		const path = pathList.join("/");

		// Instead of filtering out ignored parsers before, we must check if the parser match is one that is ignored
		// This is because otherwise the general parser would be called instead
		for (const parser of modificationParsers) {
			if (!parser.condition(path)) continue;

			// ID Checks and Handles
			if (parser.id) {
				if (data.modifyParsersIgnore.has(parser.id)) {
					logNotImportant(`Skipping Change with Parser with id '${parser.id}'...`);
					break;
				}
				if (parser.logic.type === LogicType.Simple) {
					if (foundSimpleParserIds.has(parser.id)) break;
					if (parser.logic.applyOnce) foundSimpleParserIds.add(parser.id);
				}
			}

			// Simple Parser Logic
			if (parser.logic.type === LogicType.Simple) {
				outputFunctions.push(
					async (quest) => await (parser.logic as SimpleLogic).func(quest, modify, change, pathList),
				);
				outputFormatted.push(getFormattedParserName(parser, pathList, change.op));
				break;
			}

			// Bunched Parser Logic
			if (!parser.id) throw new Error("All Bunched Parsers must have ID Set!");

			const changeAndPath: ChangeAndPath = { change: change, path: pathList };
			if (!foundBuncableParsers.has(parser.id)) {
				foundBuncableParsers.set(parser.id, [{ logic: parser.logic, changeAndPath: [changeAndPath] }]);
				outputFormatted.push(getFormattedParserName(parser, pathList, change.op));
				break;
			}

			let foundBunch = false;
			for (const parserBunch of foundBuncableParsers.get(parser.id) ?? []) {
				if (!parserBunch.logic.applyTogether(parserBunch.changeAndPath[0].path, pathList)) continue;
				parserBunch.changeAndPath.push(changeAndPath);
				foundBunch = true;
			}
			if (!foundBunch) {
				foundBuncableParsers.get(parser.id)?.push({ logic: parser.logic, changeAndPath: [changeAndPath] });
				outputFormatted.push(getFormattedParserName(parser, pathList, change.op));
			}
			break;
		}
	}

	// Change Bunched Parsers Into Function
	for (const bunchList of foundBuncableParsers.values()) {
		for (const bunch of bunchList) {
			outputFunctions.push(async (quest) => await bunch.logic.func(quest, modify, bunch.changeAndPath));
		}
	}

	return { formattedNames: outputFormatted.sort(), callableFunctions: outputFunctions };
}

function assertIsModification(change: QuestChange) {
	if (change.op !== "replace")
		throw new Error(dedent`
		  Runtime Exception: Addition/Removal Should Not Happen Here! Report this to the Core Devs of Nomi-CEu!
        Path: ${change.path.toString()}
		`);
}

const modifyDesc = async (questToModify: Quest, modify: Modified, change: QuestChange) => {
	assertIsModification(change);
	const oldQuest = modify.oldQuest["properties:10"]["betterquesting:10"]["desc:8"];
	const newQuest = modify.currentQuest["properties:10"]["betterquesting:10"]["desc:8"];
	const originalQuest = questToModify["properties:10"]["betterquesting:10"]["desc:8"];

	logInfo(colors.bold("Change in Source Quest:"));
	console.log(fakeDiff(oldQuest, newQuest));
	const apply = dmp.patch_apply(dmp.patch_make(oldQuest, newQuest), originalQuest)[0];
	logInfo(colors.bold("If Applied:"));
	console.log(fakeDiff(originalQuest, apply));
	logInfo(colors.bold("If Replaced:"));
	console.log(fakeDiff(originalQuest, newQuest));

	const applyMode = (await select({
		message: "How Should we Apply this Change to the Description?",
		choices: [
			{ name: "Apply Changes on top of Existing Description", value: "APPLY" },
			{ name: "Replace Existing Description", value: "REPLACE" },
			{ name: "Enter Own Description", value: "CUSTOM" },
			{ name: "Ignore this Change", value: "IGNORE" },
		],
	})) as DescriptionChange;
	if (applyMode === "IGNORE") {
		logInfo("Ignoring...");
		return;
	}

	let description: string;
	switch (applyMode) {
		case "APPLY":
			logInfo("Applying Description Change...");
			description = apply;
			break;
		case "REPLACE":
			logInfo("Replacing Description...");
			description = newQuest;
			break;
		case "CUSTOM":
			const template = (await select({
				message: "What Should the Original Text Be?",
				choices: [
					{ name: "Description with Changes Applied", value: "APPLY" },
					{ name: "Description with Changes Replaced", value: "REPLACE" },
					{ name: "Original Description", value: "ORIGINAL" },
				],
			})) as CustomDescriptionTemplate;
			const templateStr = template === "APPLY" ? apply : template === "REPLACE" ? newQuest : originalQuest;
			description = await editor({
				message: "Enter your Custom Description. Enter an Empty String to Cancel!",
				default: templateStr,
			});
			if (!description) {
				logInfo("Cancelling...");
				return;
			}
			break;
	}

	questToModify["properties:10"]["betterquesting:10"]["desc:8"] = description;
};

const modifyIcon = async (questToModify: Quest, modify: Modified, change: QuestChange) => {
	assertIsModification(change);
	const oldIcon = modify.oldQuest["properties:10"]["betterquesting:10"]["icon:10"];
	const newIcon = modify.currentQuest["properties:10"]["betterquesting:10"]["icon:10"];
	const currentIcon = questToModify["properties:10"]["betterquesting:10"]["icon:10"];

	const newIconString = stringify(newIcon, null, 2) ?? "";

	logInfo(colors.bold("Change in Source Quest:"));
	console.log(fakeDiff(stringify(oldIcon, null, 2) ?? "", newIconString));
	logInfo(colors.bold("If Applied to Current Quest:"));
	console.log(fakeDiff(stringify(currentIcon, null, 2) ?? "", newIconString));

	if (!(await booleanSelect("Should we Apply This Icon Change?"))) {
		logNotImportant("Skipping...");
		return;
	}

	logInfo("Applying Icon Change...");
	questToModify["properties:10"]["betterquesting:10"]["icon:10"] = newIcon;
};

const modifyTasks = async (questToModify: Quest, modify: Modified, changeAndPaths: ChangeAndPath[]) => {
	logInfo(`${stringify(changeAndPaths, null, 2)}`);
};

const modifyRewards = async (questToModify: Quest, modify: Modified, changeAndPaths: ChangeAndPath[]) => {
	logInfo(`${stringify(changeAndPaths, null, 2)}`);
};

const modifyPrerequisites = async (questToModify: Quest, modify: Modified, change: QuestChange) => {
	logInfo("Performing Prerequisite Modifications...");

	// Get Array Diff
	const arrayDiff = change.value as ArrayUnique<number>;

	const preRequisiteArrayCurrent = modify.currentQuest["preRequisites:11"];
	const preRequisiteTypeArrayCurrent = modify.currentQuest["preRequisiteTypes:7"];

	const preRequisiteArray = questToModify["preRequisites:11"];
	const preRequisiteTypeArray = questToModify["preRequisiteTypes:7"];

	const preRequisitesCurrent = new Map<number, number>();
	const preRequisites = new Map<number, number>();

	preRequisiteArrayCurrent.forEach((pre, index) =>
		preRequisitesCurrent.set(pre, preRequisiteTypeArrayCurrent ? preRequisiteTypeArrayCurrent[index] : 0),
	);
	preRequisiteArray.forEach((pre, index) =>
		preRequisites.set(pre, preRequisiteTypeArray ? preRequisiteTypeArray[index] : 0),
	);

	// Unique to Current: Added.
	for (const added of arrayDiff.arr2Unique) {
		const toAdd = await findQuest(added);
		if (!toAdd) {
			logInfo("Skipping, Could not find Corresponding Quest...");
			return;
		}
		if (preRequisites.has(id(toAdd))) {
			logNotImportant("Quest Already Contains Added Prerequisite.");
			return;
		}
		if (!(await booleanSelect(`Should we Add Quest with ID ${id(toAdd)} and Name ${name(toAdd)} as a Prerequisite?`))) {
			logNotImportant("Skipping...");
			return;
		}
		logInfo("Adding Prerequisite...");
		preRequisites.set(id(toAdd), preRequisitesCurrent.get(added) ?? 0);
	}

	// Unique to Old: Removed.
	for (const removed of arrayDiff.arr1Unique) {
		const toRemove = await findQuest(removed);
		if (!toRemove) {
			logInfo("Skipping, Could not find Corresponding Quest...");
			return;
		}
		if (!preRequisites.has(id(toRemove))) {
			logNotImportant("Quest Does Not Contain Removed Prerequisite.");
			return;
		}
		if (
			!(await booleanSelect(
				`Should we Remove Quest with ID ${id(toRemove)} and Name ${name(toRemove)} as a Prerequisite?`,
			))
		) {
			logNotImportant("Skipping...");
			return;
		}
		logInfo("Removing Prerequisite...");
		preRequisites.delete(id(toRemove));
	}

	// Save
	questToModify["preRequisites:11"] = Array.from(preRequisites.keys()).sort();
	if (Array.from(preRequisites.values()).findIndex((value) => value !== 0) === -1) return;
	const types: number[] = [];
	for (let i = 0; i < questToModify["preRequisites:11"].length; i++) {
		types[i] = preRequisites.get(questToModify["preRequisites:11"][i]) ?? 0;
	}
	questToModify["preRequisiteTypes:7"] = types;
};

const modifyGeneral = async (
	questToModify: Quest,
	modify: Modified,
	change: QuestChange,
	path: string[],
): Promise<void> => {
	assertIsModification(change);
	logInfo(`Change in '${path.pop()}':`);

	const newValue = navigateTo(modify.currentQuest, change.path);
	const newValueAsString = stringify(newValue) ?? "";

	logInfo(colors.bold("Change in Source Quest:"));
	console.log(fakeDiff(stringify(navigateTo(modify.oldQuest, change.path)) ?? "", newValueAsString))
	logInfo(colors.bold("Change if Applied:"));
	console.log(fakeDiff(stringify(navigateTo(questToModify, change.path)) ?? "", newValueAsString))

	const shouldContinue = await confirm({ message: "Would you like to apply the Change?" });
	if (!shouldContinue) {
		logNotImportant("Skipping...");
		return;
	}

	logInfo("Applying Change...");
	setValue(questToModify, change.path, newValue);
};

function isAddingOrReplacingComplexTask(path: string[]): boolean {
	return path.length === 2;
}

function getIndex(path: string[], pathKey: string): number {
	const index = path.indexOf(pathKey) + 1;
	if (index == 0 || index >= path.length) return -1; // indexOf returns -1 if not found, +1 = 0
	const num = path[index];
	if (Number.isNaN(num)) return -1;
	return Number.parseInt(num);
}

function getFormattedNameWithIndex(path: string[], op: Operation, pathKey: string, baseName: string): string {
	const defaultVal = `${baseName} ${formatOp(op)}`;

	if (op !== "replace") return defaultVal;
	const index = getIndex(path, pathKey);
	if (index === -1) return defaultVal;

	return `${baseName} No. ${index + 1} Modification`;
}

export const modificationParsers = [
	{
		id: "icon",
		name: "Icon",
		condition: picomatch("properties/betterquesting/icon/*"),
		logic: {
			type: LogicType.Simple,
			applyOnce: true,
			func: modifyIcon,
		},
	},
	{
		id: "desc",
		name: "Description",
		condition: picomatch("properties/betterquesting/desc"),
		logic: {
			type: LogicType.Simple,
			applyOnce: true,
			func: modifyDesc,
		},
	},
	{
		id: "tasks",
		name: "Task",
		formattedName: (path, op) => {
			if (!isAddingOrReplacingComplexTask(path) && op !== "replace") op = "replace";
			return getFormattedNameWithIndex(path, op, "tasks", "Task");
		},
		condition: picomatch("tasks/**/*"),
		logic: {
			type: LogicType.Bunched,
			applyTogether: (path1, path2) => getIndex(path1, "tasks") === getIndex(path2, "tasks"),
			func: modifyTasks,
		},
	},
	{
		id: "rewards",
		name: "Reward",
		formattedName: (path, op) => {
			if (!isAddingOrReplacingComplexTask(path) && op !== "replace") op = "replace";
			return getFormattedNameWithIndex(path, op, "rewards", "Reward");
		},
		condition: picomatch("rewards/**/*"),
		logic: {
			type: LogicType.Bunched,
			applyTogether: (path1, path2) => getIndex(path1, "rewards") === getIndex(path2, "rewards"),
			func: modifyRewards,
		},
	},
	{
		id: "prerequisites",
		name: "Prerequisite",
		condition: picomatch("preRequisites-CUSTOM"),
		logic: {
			type: LogicType.Simple,
			applyOnce: false,
			func: modifyPrerequisites,
		},
	},
	{
		formattedName: (path, op) => `'${path[path.length - 1]}' ${formatOp(op)}`,
		condition: picomatch("**/*"),
		logic: {
			type: LogicType.Simple,
			applyOnce: false,
			func: modifyGeneral,
		},
	},
] as Parser[];
