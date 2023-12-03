import { modpackManifest } from "../../globals";
import { makeArtifactNameBody } from "../../util/util";
import sanitize from "sanitize-filename";

export async function makeArtifactNames(): Promise<void> {
	const body = makeArtifactNameBody(modpackManifest.name);
	const names = {
		CLIENT: body + "-client",
		SERVER: body + "-server",
		LANG: body + "-lang",
		MMC: body + "-mmc",
	};

	Object.keys(names).forEach((name) => {
		console.log(`"${name}=${sanitize(names[name].toLowerCase())}" >> $GITHUB_OUTPUT`);
	});
}
