import { modpackManifest } from "../../globals";
import { makeArtifactNameBody } from "../../util/util";
import sanitize from "sanitize-filename";
import { setOutput } from "@actions/core";

export async function makeArtifactNames(): Promise<void> {
	const body = makeArtifactNameBody(modpackManifest.name);
	const names = {
		client: body + "-client",
		server: body + "-server",
		lang: body + "-lang",
		mmc: body + "-mmc",
	};

	Object.keys(names).forEach((name) => {
		setOutput(name, sanitize(names[name].toLowerCase()));
	});
}
