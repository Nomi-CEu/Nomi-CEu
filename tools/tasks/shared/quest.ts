import fs from "fs";
import upath from "upath";
import { overridesFolder, configFolder, configOverridesFolder, sharedDestDirectory } from "../../globals";
import { Quest, QuestBook, QuestLines as QuestLine } from "../../types/bqQuestBook";

const sharedQBDefaults = upath.join(sharedDestDirectory, configFolder, "betterquesting");
const sharedConfigOverrides = upath.join(sharedDestDirectory, configOverridesFolder);

const langFileLocation = "resources/questbook/lang";

function escapeString(string: string) {
	return string.replace(/%/g, "%%").replace(/\n/g, "%n");
}

function transformKeyPairs(
	database: { [key: string]: Quest } | { [key: string]: QuestLine },
	mode: string,
	namespace: string,
	lines: string[],
) {
	Object.keys(database).forEach((key) => {
		const storeKey = key.replace(/:10/g, "");
		const item = database[key];

		const properties = item["properties:10"]["betterquesting:10"];
		if (properties["name:8"] !== "Gap") {
			const titleKey = `nomifactory.quest.${mode}.${namespace}.${storeKey}.title`;
			const descKey = `nomifactory.quest.${mode}.${namespace}.${storeKey}.desc`;

			// Push lang file lines.
			lines.push(
				`# ${namespace} ${storeKey} of mode ${mode}`,
				`${titleKey}=${escapeString(properties["name:8"])}`,
				`${descKey}=${escapeString(properties["desc:8"])}`,
				"",
			);

			properties["name:8"] = titleKey;
			properties["desc:8"] = descKey;
		} else {
			properties["name:8"] = "";
			properties["desc:8"] = "";
		}
	});
}

/**
 * Trimming all that results in almost half the size of the original JSON file.
 *
 * Interesting, huh?
 */
const uselessProps = {
	"simultaneous:1": 0,
	"ismain:1": 0,
	"repeat_relative:1": 1,
	"globalshare:1": 0,
	"repeattime:3": -1,
	"issilent:1": 0,
	"snd_complete:8": "minecraft:entity.player.levelup",
	"snd_update:8": "minecraft:entity.player.levelup",
	"tasklogic:8": "AND",
	"questlogic:8": "AND",
	"visibility:8": "NORMAL",
	"partysinglereward:1": 0,
	"lockedprogress:1": 0,
	"OreDict:8": "",
	"Damage:2": 0,
	"Count:3": 0,
	"autoclaim:1": 0,
	"autoConsume:1": 0,
	"consume:1": 0,
	"groupDetect:1": 0,
	"ignoreNBT:1": 0,
	"index:3": 0,
	"partialMatch:1": 1,
	"ignoresview:1": 0,
};

function stripUselessMetadata(object: unknown) {
	Object.keys(object).forEach((propName) => {
		const prop = object[propName];
		if (prop === uselessProps[propName]) {
			return delete object[propName];
		}

		if (typeof prop === "object") {
			if (Array.isArray(prop) && prop.length === 0) {
				return delete object[propName];
			}

			stripUselessMetadata(prop);

			if (Object.keys(prop).length === 0) {
				return delete object[propName];
			}
		}
	});
}

/**
 * Extract lang entries from the quest book and transform the database.
 */
export async function transformQuestBook(): Promise<void> {
	// Source Quest Book File Locations
	const questPathNormalSource = upath.join(sharedQBDefaults, "DefaultQuests.json");
	const questPathExpertSource = upath.join(sharedQBDefaults, "saved_quests", "ExpertQuests.json");

	// Quest Book Objects
	const questBookNormal: QuestBook = JSON.parse((await fs.promises.readFile(questPathNormalSource)).toString());
	const questBookExpert: QuestBook = JSON.parse((await fs.promises.readFile(questPathExpertSource)).toString());

	// Quest Book Paths
	const questPathNormalDefault = upath.join(sharedQBDefaults, "DefaultQuests.json");
	const questPathNormalOverride = upath.join(sharedConfigOverrides, "normal", "betterquesting", "DefaultQuests.json");

	const questPathExpertDefault = upath.join(sharedQBDefaults, "saved_quests", "ExpertQuests.json");
	const questPathExpertOverride = upath.join(sharedConfigOverrides, "expert", "betterquesting", "DefaultQuests.json");

	// Quest Lang Location
	const questLangLocation = upath.join(sharedDestDirectory, overridesFolder, langFileLocation);

	// Traverse through the quest book and rewrite titles/descriptions.
	// Extract title/desc pairs into a lang file.
	const lines: string[] = [];

	lines.push("# Normal Quest Lang Entries:", "");

	// Normal Mode Quest lines.
	transformKeyPairs(questBookNormal["questLines:9"], "normal", "line", lines);

	// Normal Mode Quests themselves.
	transformKeyPairs(questBookNormal["questDatabase:9"], "normal", "db", lines);

	lines.push("# Expert Quest Lang Entries:", "");

	// Expert Mode Quest lines.
	transformKeyPairs(questBookExpert["questLines:9"], "expert", "line", lines);

	// Expert Mode Quests themselves.
	transformKeyPairs(questBookExpert["questDatabase:9"], "expert", "db", lines);

	// Write lang file.
	await fs.promises.mkdir(questLangLocation, { recursive: true });
	await fs.promises.writeFile(upath.join(questLangLocation, "en_us.lang"), lines.join("\n"));

	// Strip useless metadata.
	stripUselessMetadata(questBookNormal);
	stripUselessMetadata(questBookExpert);

	// Write QB files.
	await fs.promises.writeFile(questPathNormalDefault, JSON.stringify(questBookNormal, null, 2));
	await fs.promises.writeFile(questPathNormalOverride, JSON.stringify(questBookNormal, null, 2));

	await fs.promises.writeFile(questPathExpertDefault, JSON.stringify(questBookExpert, null, 2));
	return await fs.promises.writeFile(questPathExpertOverride, JSON.stringify(questBookExpert, null, 2));
}
