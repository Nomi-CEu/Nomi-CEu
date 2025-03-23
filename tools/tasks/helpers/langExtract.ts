/* Extracts Lang Files without Formatting Marks, for Typo Checking */

import { langDestDirectory, typoCheckDirectory } from "#globals";
import { allFiles } from "async-folder-walker";
import fs from "fs";
import upath from "upath";
import { deleteAsync } from "del";

const extractor = /^(.*?)=(.*)$/gm;

export async function extractTypoCheckFiles() {
	await deleteAsync(upath.join(typoCheckDirectory, "*"), { force: true });

	if (!fs.existsSync(typoCheckDirectory)) {
		await fs.promises.mkdir(typoCheckDirectory, { recursive: true });
	}

	const files = await allFiles(upath.join(langDestDirectory, "assets"), {
		statFilter: (st) => !st.isDirectory(),
		shaper: (fwData) => fwData,
	});

	for (const file of files) {
		let contents = await fs.promises.readFile(file.filepath, "utf8");
		contents = contents.replaceAll(extractor, (match, p1, p2) => {
			if (!p2 || typeof p2 !== "string") return match;

			return `${p1}=${removeFormatting(p2)}`;
		});

		const directory = upath.dirname(
			upath.join(typoCheckDirectory, file.relname),
		);
		if (!fs.existsSync(directory))
			await fs.promises.mkdir(directory, { recursive: true });

		await fs.promises.writeFile(
			upath.join(typoCheckDirectory, file.relname),
			contents,
		);
	}
}

export function removeFormatting(input: string): string {
	if (!input.includes("§") && !input.includes("%")) return input;

	const builder: string[] = [];
	for (let i = 0; i < input.length; i++) {
		const char = input.charAt(i);

		let found = false;
		for (const exclusion of ["§", "%"]) {
			if (char === exclusion) {
				if (input.charAt(i + 1) === exclusion) builder.push(exclusion); // Only include one

				i++; // Skip Next Character

				found = true;
				break;
			}
		}

		if (!found) builder.push(char);
	}
	return builder.join("");
}
