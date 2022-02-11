import { HashDef } from "./hashDef";

export type FileDef = {
	url: string;
	hashes?: HashDef[];
};
