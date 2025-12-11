import { modpackManifest } from "#globals";
import sanitize from "sanitize-filename";
import { setOutput } from "@actions/core";
import logInfo from "#utils/log.js";
import { BuildData } from "#types/transformFiles.ts";

export async function makeArtifactNames(): Promise<void> {
	const buildData = new BuildData();
	const body = `${modpackManifest.name}-${buildData.rawVersion}`;

	const names: Record<string, string> = {
		client: body + "-client",
		server: body + "-server",
		lang: body + "-lang",
		mmc: body + "-mmc",
	};

	Object.keys(names).forEach((name) => {
		setOutput(name, sanitize(names[name].toLowerCase()));
		logInfo(`Made Name for Type '${name}': '${names[name].toLowerCase()}'`);
	});

	setOutput("discordVersionName", buildData.discordVersion);

	return Promise.resolve();
}
