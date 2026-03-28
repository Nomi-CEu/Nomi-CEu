import { glob } from "glob";
import buildConfig from "#buildConfig";
import { rootDirectory } from "#globals";
import fs from "fs";
import logInfo from "#utils/log.ts";
import upath from "upath";

const packageDef = /^package\s[a-z]+/;
const commentDef = /^\/\/\s\S+/;
const describerDef = /^\/\/\s\^,\s\S+/;
const preProcValidators: {
	name: string;
	regex: RegExp;
	validate: (file: string, comment: string) => void;
}[] = [
	{
		name: "Side Only Preprocessor (SIDE)",
		regex: /^\/\/\sSIDE/,
		validate: (_, comment) => {
			if (!comment.match(/^\/\/\sSIDE:\s\S+/)) {
				throw new Error(
					"Side only preprocessor must have 'SIDE' followed by a ':' and a space, and then a specified side (CLIENT or SERVER)!",
				);
			}

			if (!comment.trim().match(/^\/\/\sSIDE:\s(CLIENT|SERVER)$/)) {
				throw new Error(
					"Side only preprocessor only accepts sides CLIENT and SERVER, and must not be followed by other characters!",
				);
			}
		},
	},
	{
		name: "Mod Loaded Preprocessor (MODS_LOADED)",
		regex: /^\/\/\sMODS_LOADED/,
		validate: (file, comment) => {
			if (!file.includes("addon")) {
				throw new Error(
					"Mod loaded preprocessor must only be used in the `addon` folder or its subdirectories!",
				);
			}

			if (!comment.match(/^\/\/\sMODS_LOADED:\s\S+/)) {
				throw new Error(
					"Mod loaded preprocessor must have 'MODS_LOADED' followed by a ':' and a space, and then a specified mod!",
				);
			}

			if (!comment.trim().match(/^\/\/\sMODS_LOADED:\s[a-z1-9]+$/)) {
				throw new Error(
					"Mod loaded preprocessor must be followed by a modid in all lowercase, with no non-alphanumerical characters!",
				);
			}
		},
	},
	{
		name: "No Reload Preprocessor (NO_RELOAD)",
		regex: /^\/\/\sNO_RELOAD/,
		validate: (comment: string) => {
			if (!comment.trim().match(/^\/\/\sNO_RELOAD$/)) {
				throw new Error(
					"No reload processor must not be followed by other characters!",
				);
			}
		},
	},
];

const commonClassImport = /^import\spost\.classes\.Common/m;
const logGlobalUse =
	/^\s*log\.(msg|exception|format|(debug|info|warn|error|fatal)(MC)?)/m;

export default async function checkGrsFiles(): Promise<void> {
	const grsFiles = await glob(buildConfig.grsGlobs, {
		cwd: rootDirectory,
	});

	// We could do this in async; but this is fairly fast, and async could cause log confusion
	for (const file of grsFiles) {
		await checkGrsFile(file);
	}
}

async function checkGrsFile(file: string): Promise<void> {
	logInfo(`Checking File ${file}...`);

	const contents = await fs.promises.readFile(
		upath.join(rootDirectory, file),
		"utf-8",
	);
	const lines = contents.split("\n");

	// Two cases: either a preprocessor, or a package
	// Ignore correctness of package specification, duplicate package def, formatting, etc.; left to groovy-lint
	if (!lines[0].match(packageDef)) {
		// Check preprocessor
		if (!lines[0].match(commentDef)) {
			throw new Error(
				"The first line of a file must be a package declaration or a preprocessor comment! " +
					"If a preprocessor comment is present, check that it is defined using `//` and not `/*`, and that a space follows the `//`!",
			);
		}

		const preProc = preProcValidators.find((proc) =>
			lines[0].match(proc.regex),
		);
		if (!preProc) {
			throw new Error(
				`Preprocessor in ${lines[0]} not recognised! ` +
					"Check that the preprocessor is in all caps, and that it is one of the accepted preprocessors: " +
					`${preProcValidators.map((proc) => proc.name).join(", ")}!`,
			);
		}
		preProc.validate(file, lines[0]);

		// Check comment after
		if (!lines[1].match(describerDef)) {
			throw new Error(
				"The line after a preprocessor must describe its purpose! " +
					"This must be in the format `// ^, DESCRIPTION`! " +
					"Example: '// ^, Tooltips should not be processed on the server'.",
			);
		}

		// Check for a blank line
		if (lines[2].trim()) {
			throw new Error("The line after processor descriptions must be empty!");
		}

		// Check for package def
		if (!lines[3].match(packageDef)) {
			throw new Error(
				"Package declarations must follow preprocessor descriptions after exactly one blank line!",
			);
		}
	}

	// Check for usage of grs global variable log, and non-static import of common class
	if (commonClassImport.test(contents)) {
		throw new Error(
			"The `Common` class should not be imported as instance! Import all static fields instead (`import static post.classes.Common.*`)",
		);
	}

	if (logGlobalUse.test(contents)) {
		throw new Error(
			"The GroovyScript global `log` variable should not be used! Use the static `GRS_LOG` field in the Common class instead!",
		);
	}
}
