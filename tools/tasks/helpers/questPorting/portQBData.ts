import { checkbox, input, select } from "@inquirer/prompts";
import { Changed, PortingType, SavedPorter, SourceOption } from "#types/portQBTypes.ts";
import {
	booleanSelect,
	cfgExpertPath,
	cfgNormalPath,
	cfgOverrideExpertPath,
	cfgOverrideNormalPath,
	readFromPorter,
	savedQuestPorter,
} from "./portQBUtils.ts";
import { Quest, QuestLine } from "#types/bqQuestBook.ts";
import fs from "fs";
import logInfo from "#utils/log.ts";
import { modificationParsers } from "./portQBModifications.ts";

export default class PortQBData {
	ref: string;
	type: PortingType;
	sourceOption: SourceOption;
	srcPath: string;
	srcPathToChange: string;
	outputPaths: string[];

	// Changed Maps b/w source qb and qb to change
	changed: Changed;

	// Map of quest id to quest on the old source qb (Only used in Remove)
	oldIDsToQuests?: Map<number, Quest>;

	// Map of quest id to quest on the source qb
	currentIDsToQuests: Map<number, Quest>;

	// Map of quest id to quest on the qb to change
	toChangeIDsToQuests: Map<number, Quest>;

	// Set of Quest IDs on the source qb to ignore
	ignoreQuests: Set<number>;

	// Set of Quest IDs on the source qb to always ask
	alwaysAskQuests: Set<number>;

	// Map from quest id on the source qb to the quest obj on the qb to change
	foundQuests: Map<number, Quest>;

	// Quest Lines Changeable (Only used in Remove)
	questLines?: QuestLine[];

	// The Porter that was read from.
	savedPorter?: SavedPorter;

	// Advanced Settings
	modifyParsersIgnore: Set<string>;

	/**
	 * Set some default values, so we don't have to deal with nullable values.
	 */
	constructor() {
		this.ref = "main";
		this.type = "NORMAL";
		this.sourceOption = "CFG";
		this.srcPath = "";
		this.srcPathToChange = "";
		this.outputPaths = [];

		this.changed = { added: [], modified: [], removed: [] };

		this.currentIDsToQuests = new Map<number, Quest>();
		this.toChangeIDsToQuests = new Map<number, Quest>();

		this.ignoreQuests = new Set<number>();
		this.foundQuests = new Map<number, Quest>();
		this.alwaysAskQuests = new Set<number>();

		this.modifyParsersIgnore = new Set<string>();
	}

	async setup(): Promise<void> {
		this.ref = await input({
			message: "What Commit SHA, Tag OR Branch should we compare to? (Defaults to 'main')",
			default: "main",
		});

		this.type = (await select({
			message: "How should we port?",
			choices: [
				{
					name: "Normal to Expert",
					value: "NORMAL",
				},
				{
					name: "Expert to Normal",
					value: "EXPERT",
				},
			],
		})) as PortingType;

		this.sourceOption = (await select({
			message: "Which version should we use, for both Source Files? (We need to check both Normal and Expert to Port!)",
			choices: [
				{
					name: "Main Config Dir",
					value: "CFG" as SourceOption,
				},
				{
					name: "Config Overrides",
					value: "CFG-OVERRIDE" as SourceOption,
				},
			],
		})) as SourceOption;

		switch (this.type) {
			case "NORMAL":
				this.srcPath = this.sourceOption === "CFG" ? cfgNormalPath : cfgOverrideNormalPath;
				this.srcPathToChange = this.sourceOption === "CFG" ? cfgExpertPath : cfgOverrideExpertPath;
				this.outputPaths = [cfgExpertPath, cfgOverrideExpertPath];
				break;
			case "EXPERT":
				this.srcPath = this.sourceOption === "CFG" ? cfgExpertPath : cfgOverrideExpertPath;
				this.srcPathToChange = this.sourceOption === "CFG" ? cfgNormalPath : cfgOverrideNormalPath;
				this.outputPaths = [cfgExpertPath, cfgOverrideExpertPath];
				break;
		}

		// If We Expand This to include a lot of Boolean Options, we can use https://github.com/Bartheleway/inquirer-table-multiple
		if (await booleanSelect("Open Advanced Modification Settings?", "Yes", "No", false)) {
			this.modifyParsersIgnore = new Set<string>(
				await checkbox({
					message:
						"What Modification Parsers Should We Ignore, If Any? (Other Small Logic And Value Changes are Handled Separately)",
					choices: modificationParsers.map((parser) => {
						return { name: parser.name, value: parser.id };
					}),
					required: false,
				}),
			);
		}
	}

	async readSavedPorter(): Promise<void> {
		if (!fs.existsSync(savedQuestPorter)) return;

		if (
			!(await booleanSelect(
				"Saved Quest Port Helper, Which Saves the ID Paths Between the Quest Books, is Available! Use it?",
			))
		) {
			logInfo("Not Using...");
			return;
		}
		await readFromPorter(true);
		return;
	}
}
