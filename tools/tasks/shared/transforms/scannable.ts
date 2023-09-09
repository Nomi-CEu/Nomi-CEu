import { overridesFolder, sharedDestDirectory } from "../../../globals";

import upath from "upath";
import fs from "fs";

const scannableConfigFile = "config/scannable.cfg";

/**
 * Transform the scannable config.
 * Trim excess newlines and remove comments.
 */
export default async function transformScannable(): Promise<void> {
	const configPath = upath.join(sharedDestDirectory, overridesFolder, scannableConfigFile);

	const contents = (await fs.promises.readFile(configPath))
		.toString()
		// Match arrays (S:array < ... >)
		.replace(/([ \t]+)(S:\w+) <([^>]+)>/g, (_, g0, g1, g2) => {
			const body = g2
				.replace(/#[^\r\n]+/gm, "") // Comments
				.replace(/^\s+$/gm, "") // Trailing whitespaces
				.replace(/[\r\n]{2,}/gm, "\n"); // Extra newlines

			return g0 + g1 + " <" + body + (body ? "" : "\n") + g0 + " >";
		});

	return fs.promises.writeFile(configPath, contents);
}
