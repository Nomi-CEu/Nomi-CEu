import { Quest } from "./bqQuestBook.ts";
import { Operation } from "just-diff";
import { Matcher } from "picomatch";

// QB Porting From.
export type PortingType = "NORMAL" | "EXPERT";

// Which File to Source From
export type SourceOption = "CFG" | "CFG-OVERRIDE";

// Is Right Quest?
export type CorrectQuest = "YES" | "IGNORE" | "NO";

// How should we apply description change?
export type DescriptionChange = "APPLY" | "REPLACE" | "CUSTOM" | "IGNORE";
export type CustomDescriptionTemplate = "APPLY" | "REPLACE" | "ORIGINAL";

export interface Changed {
	added: Quest[];
	modified: Modified[];
	removed: Quest[];
}

export interface Modified {
	currentQuest: Quest;
	oldQuest: Quest;
	change: QuestChange[];
}

export interface QuestChange {
	op: Operation;
	path: number[] | string[];
	value?: unknown;
}

export interface Replacements {
	search: RegExp;
	replacement: string;
}

export interface Parser {
	id: string;
	name: string;
	formattedName?: (path: string[], op: Operation) => string;
	condition: Matcher;
	logic: SimpleLogic | BunchedLogic;
}

export enum LogicType {
	Simple = "SIMPLE",
	Bunched = "BUNCHED",
}

export interface SimpleLogic {
	type: LogicType.Simple;
	applyOnce: boolean;
	func: (
		questToModify: Quest,
		modify: Modified,
		change: QuestChange,
		path: string[],
	) => Promise<void>;
}

export interface BunchedLogic {
	type: LogicType.Bunched;
	applyTogether: (path1: string[], path2: string[]) => boolean;
	func: (
		questToModify: Quest,
		modify: Modified,
		changeAndPaths: ChangeAndPath[],
	) => Promise<void>;
}

export interface SavedPorter {
	savedQuestMap: SavedQuestPath[];
	alwaysAskQuestsNormal: number[];
	alwaysAskQuestsExpert: number[];
	ignoreQuestsNormal: number[];
	ignoreQuestsExpert: number[];
}

export interface SavedQuestPath {
	normal: number;
	expert: number;
}

export interface BunchedParserPath {
	logic: BunchedLogic;
	changeAndPath: ChangeAndPath[];
}

export type ChangeAndPath = {
	change: QuestChange;
	path: string[];
};

export type SpecialModifierHandler = (
	oldQuest: Quest,
	currentQuest: Quest,
	questDiff: QuestChange[],
) => void;

export class Message {
	private readonly message: string;
	private repeats: number;

	constructor(message: string) {
		this.message = message;
		this.repeats = 1;
	}

	incrementRepeats(): void {
		this.repeats++;
	}

	toFormattedString(): string {
		if (this.repeats === 1) return this.message;
		else return `${this.message} (x${this.repeats})`;
	}
}
