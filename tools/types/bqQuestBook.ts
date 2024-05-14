export interface QuestBook {
	"format:8": string;
	"questDatabase:9": { [key: string]: Quest };
	"questLines:9": { [key: string]: QuestLine };
	"questSettings:10": QuestSettings;
}

export interface Quest {
	"preRequisiteTypes:7"?: number[];
	"preRequisites:11": number[];
	"properties:10": QuestProperties;
	"questID:3": number;
	"rewards:9": { [key: string]: Rewards };
	"tasks:9": { [key: string]: Task };
}

export interface Task {
	"index:3": number;
	"taskID:8": string;
}

export interface QuestProperties {
	"betterquesting:10": QuestPropertiesBQ;
}

export interface QuestPropertiesBQ {
	"autoclaim:1": number;
	"desc:8": string;
	"globalshare:1": number;
	"icon:10": Icon;
	"ignoresview:1": number;
	"ismain:1": number;
	"issilent:1": number;
	"lockedprogress:1": number;
	"name:8": string;
	"partysinglereward:1"?: number;
	"questlogic:8": QuestLogic;
	"repeat_relative:1": number;
	"repeattime:3": number;
	"simultaneous:1": number;
	"snd_complete:8": string;
	"snd_update:8": string;
	"tasklogic:8": QuestLogic;
	"visibility:8": QuestVisibility;
}

export interface Icon {
	"Count:3": number;
	"Damage:2": number;
	"OreDict:8": string;
	"id:8": string;
	"tag:10"?: unknown;
}

export type QuestLogic = "AND" | "OR";

export type QuestVisibility =
	| "ALWAYS"
	| "CHAIN"
	| "HIDDEN"
	| "NORMAL"
	| "UNLOCKED";

export interface Rewards {
	"index:3": number;
	"rewardID:8": string;
	"rewards:9"?: { [key: string]: Icon };
	"choices:9"?: { [key: string]: Icon };
}

export interface QuestLine {
	"lineID:3": number;
	"order:3": number;
	"properties:10": QuestLines9_Properties10;
	"quests:9": { [key: string]: QuestLinesQuest };
}

export interface QuestLinesQuest {
	"id:3": number;
	"sizeX:3": number;
	"sizeY:3": number;
	"x:3": number;
	"y:3": number;
}

export interface QuestLines9_Properties10 {
	"betterquesting:10": FluffyBetterquesting10;
}

export interface FluffyBetterquesting10 {
	"bg_image:8": string;
	"bg_size:3": number;
	"desc:8": string;
	"icon:10": Icon;
	"name:8": string;
	"visibility:8": QuestVisibility;
}

export interface QuestSettings {
	"betterquesting:10": QuestSettings10_Betterquesting10;
}

export interface QuestSettings10_Betterquesting10 {
	"editmode:1": number;
	"hardcore:1": number;
	"home_anchor_x:5": number;
	"home_anchor_y:5": number;
	"home_image:8": string;
	"home_offset_x:3": number;
	"home_offset_y:3": number;
	"livesdef:3": number;
	"livesmax:3": number;
	"pack_name:8": string;
	"pack_version:3": number;
	"party_enable:1": number;
}
