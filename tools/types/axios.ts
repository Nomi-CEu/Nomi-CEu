import { FileDef } from "#types/fileDef.js";

declare module "axios" {
	export interface AxiosRequestConfig {
		nomiCfg?: NomiConfig;
	}
}

export interface NomiConfig {
	fileDef?: FileDef;
}
