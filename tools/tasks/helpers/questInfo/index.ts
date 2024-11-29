import { input, select } from "@inquirer/prompts";
import { InfoAction, InfoMode, Mode } from "#types/actionQBTypes.ts";
import fs from "fs";
import upath from "upath";
import { rootDirectory } from "#globals";
import {
	booleanSelect,
	cfgExpertPath,
	cfgNormalPath,
	id,
	name,
	stringifyQB,
} from "#tasks/helpers/actionQBUtils.ts";
import { Quest, QuestBook } from "#types/bqQuestBook.ts";
import logInfo from "#utils/log.ts";

let infoMode: InfoMode = "SAVE_INFO";
let saveString = "";

export default async function questInfo(): Promise<void> {
	const questsString = await input({
		message: "Quest IDs:",
	});
	const mode = (await select({
		message: "Which Quest Book?",
		choices: [
			{
				name: "Normal Mode",
				value: "NORMAL",
			},
			{
				name: "Expert Mode",
				value: "EXPERT",
			},
		],
	})) as Mode;

	const quests = questsString.split(",").map((s) => Number.parseInt(s.trim()));
	const qb = JSON.parse(
		await fs.promises.readFile(
			upath.join(
				rootDirectory,
				mode == "EXPERT" ? cfgExpertPath : cfgNormalPath,
			),
			"utf-8",
		),
	) as QuestBook;
	const questMap = new Map<number, Quest>(
		Object.keys(qb["questDatabase:9"])
			.map((key) => qb["questDatabase:9"][key])
			.map((quest) => [id(quest), quest]),
	);

	infoMode = (await select({
		message: "What to do?",
		choices: [
			{
				name: "Get Info and Save",
				value: "SAVE_INFO",
			},
			{
				name: "Modify Quests",
				value: "MODIFY",
			},
		],
	})) as InfoMode;
	saveString = "";

	for (const questID of quests) {
		saveOrLog(`Information for Quest ${questID}:`);

		let foundQuestKey: string | undefined = undefined;
		let foundQuest: Quest | undefined = undefined;
		const leadsTo: Quest[] = [];

		const database = qb["questDatabase:9"];
		for (const questKey of Object.keys(database)) {
			const quest = database[questKey];
			if (quest["questID:3"] === questID) {
				foundQuestKey = questKey;
				foundQuest = quest;
				continue;
			}

			for (const pre of quest["preRequisites:11"]) {
				if (pre === questID) {
					leadsTo.push(quest);
					break;
				}
			}
		}

		if (foundQuestKey === undefined || foundQuest === undefined) {
			saveOrLog("Quest not found.");
			return;
		}

		saveOrLog(
			`Name: ${foundQuest["properties:10"]["betterquesting:10"]["name:8"]}`,
		);
		saveOrLog(
			`Depends On: [${foundQuest["preRequisites:11"]
				.map((id) => questMap.get(id))
				.map((quest) =>
					quest ? `ID: ${id(quest)}, Name: ${name(quest)}` : "Not Found",
				)
				.join(", ")}]`,
		);
		saveOrLog(
			`Leads To: [${leadsTo
				.map((quest) => `ID: ${id(quest)}, Name: ${name(quest)}`)
				.join(", ")}]`,
		);

		if (infoMode === "MODIFY")
			await performActions(qb, database, questID, foundQuestKey);

		addSpaceToSave();
	}

	if (infoMode === "MODIFY") {
		const save = await booleanSelect("Would you like to Save Changes?");
		if (!save) return;

		const parsed = stringifyQB(qb);

		return fs.promises.writeFile(
			upath.join(
				rootDirectory,
				mode == "EXPERT" ? cfgExpertPath : cfgNormalPath,
			),
			parsed,
		);
	}

	logInfo("Saving to qbInfo.txt...");
	return fs.promises.writeFile("qbInfo.txt", saveString);
}

async function performActions(
	qb: QuestBook,
	database: { [key: string]: Quest },
	questID: number,
	questKey: string,
) {
	const action = (await select({
		message: `What to do (Quest Key ${questKey})?`,
		choices: [
			{
				name: "Delete Quest (Ignores Leading To Quests)",
				value: "DELETE",
			},
			{
				name: "Mass Dep Change of Leading To Quests",
				value: "MASS_DEPS",
			},
			{
				name: "Nothing",
				value: "NOTHING",
			},
		],
	})) as InfoAction;

	if (action === "NOTHING") return;

	if (action === "DELETE") {
		delete database[questKey];

		for (const questKey of Object.keys(database)) {
			const quest = database[questKey];

			const index = quest["preRequisites:11"].findIndex(
				(item) => item === questID,
			);
			if (index === -1) continue;

			quest["preRequisites:11"].splice(index, 1);
			quest["preRequisiteTypes:7"]?.splice(index, 1);
		}

		for (const lineKey of Object.keys(qb["questLines:9"])) {
			const line = qb["questLines:9"][lineKey];
			for (const key of Object.keys(line["quests:9"])) {
				const questInfo = line["quests:9"][key];
				if (questID === questInfo["id:3"]) delete line["quests:9"][key];
			}
		}
		return;
	}

	const id = Number.parseInt(
		(
			await input({
				message: `What to replace deps with?`,
			})
		).trim(),
	);

	for (const questKey of Object.keys(database)) {
		const quest = database[questKey];

		const index = quest["preRequisites:11"].findIndex(
			(item) => item === questID,
		);
		if (index === -1) continue;

		quest["preRequisites:11"].splice(index, 1, id);
	}

	await performActions(qb, database, questID, questKey);
}

function saveOrLog(str: string) {
	if (infoMode === "SAVE_INFO") saveString += str + "\n";
	else logInfo(str);
}

function addSpaceToSave() {
	if (infoMode === "SAVE_INFO") saveString += "\n";
}
