import { FileDef } from "#types/fileDef.ts";

declare module "axios" {
	export interface AxiosRequestConfig {
		nomiCfg?: NomiConfig;
	}
}

export interface NomiConfig {
	fileDef?: FileDef;
}
