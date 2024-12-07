import { logWarn } from "#utils/log.ts";

/* Patterns */
const doubleSpacePtn = / {2,}/g;
const invalidFormattingPtn = /§$|§([^0-9a-ek-or])/;
const isEmptyPtn = /\s/;
const isFormattingSignal = /§([0-9a-ek-or])/;

/* Parameters */
let shouldCheck = true;
let value = "";
let id = 0;
let name = "";
let key = "";

/* Storage for Per Char Checks */
// Builder for per character
let builder: string[] = [];
// Current format style
let currFormat = "r";
// Format before this character occurred
let formatBeforeChar = "r";

export default function stripOrThrowInvalidSpacesOrFormatting(
	shouldCheckIn: boolean,
	valueIn: string,
	idIn: number,
	nameIn: string,
	keyIn: string,
): string {
	shouldCheck = shouldCheckIn;
	value = valueIn;
	id = idIn;
	name = nameIn;
	key = keyIn;

	stripOrThrowInvalidFormatting();

	if (doubleSpacePtn.test(value)) {
		logOrThrowProblem("Double Space(s)");
		value = value.replace(doubleSpacePtn, " ");
	}

	const trimmedResult = value.trim();

	if (trimmedResult !== value) {
		logOrThrowProblem("Extra Spaces or New Lines at Beginning or End");
		value = trimmedResult;
	}

	if (!value.includes("\n")) return value;

	const lineBuilder: string[] = [];
	for (const bit of value.split("\n")) {
		const trimmedBit = bit.trim();

		if (trimmedBit !== bit)
			logOrThrowProblem("Extra Spaces at Beginning or End of a Line");

		lineBuilder.push(trimmedBit);
	}
	return lineBuilder.join("\n");
}

/**
 * Whole string formatting check.
 */
function stripOrThrowInvalidFormatting() {
	if (!value.includes("§")) return;

	// Reset Storage
	builder = [];
	currFormat = "r";
	formatBeforeChar = "r";

	checkInvalidFormattingChar();

	/* End of String Checks */
	const prevChar = builder.at(-1);
	if (!prevChar) {
		value = builder.join("");
		return;
	}

	// Check for redundant formatting at end, only if text being reset from a non-normal formatting
	if (formatBeforeChar === "r") {
		if (isFormattingSignal.test(prevChar)) {
			logOrThrowProblem("Redundant Formatting At End");
			builder = builder.slice(0, -1);
		}

		value = builder.join("");
		return;
	}

	// Check for missing resetting signal at end
	if (!isResettingSignal(prevChar)) {
		logOrThrowProblem("Resetting Formatting At End", "Missing", "Adding");
		if (isFormattingSignal.test(prevChar)) builder = builder.slice(0, -1);

		builder.push("§r");
	}

	value = builder.join("");
}

/**
 * Per character formatting check.
 */
function checkInvalidFormattingChar() {
	const iter = value[Symbol.iterator]();
	let char: string | undefined;
	let emptyAmt = 0;

	// Breaks when char returns undefined or empty
	for (char = getWorkingChar(iter); char; char = getWorkingChar(iter)) {
		// Check for invalid formatting
		if (invalidFormattingPtn.test(char)) {
			logOrThrowProblem("Lone Formatting Signal");
			char = char.replace(invalidFormattingPtn, "$1");

			// in the case char is just '§', with nothing afterwards, now char is empty
			// break if this is the case, as this means that we've processed entire string
			if (!char) break;
			continue;
		}

		// Handle Spaces or New Lines
		if (isEmptyPtn.test(char)) {
			// This only applies for non 'r' formatting, which should be after spaces
			if (isFormattingSignal.test(char) && !isResettingSignal(char)) {
				logOrThrowProblem(
					"Non-Resetting Formatting",
					"",
					"Moving",
					"Before Space(s)",
					"After Space(s)",
				);
				const code = builder.at(-1);
				if (!code) continue;

				// Remove last formatting
				builder = builder.slice(0, -1);

				// Push space, then code
				builder.push(char);
				builder.push(code);

				// Reset empty amount, its no longer empty
				emptyAmt = 0;
				continue;
			}

			// No need to continue processing, return and add to empty amt
			emptyAmt++;
			builder.push(char);
			continue;
		}

		// Else, reset empty amt
		const oldEmptyAmt = emptyAmt;
		emptyAmt = 0;

		// If not formatting signal, ignore
		if (!isFormattingSignal.test(char)) {
			builder.push(char);

			// Set formatBeforeChar
			formatBeforeChar = currFormat;
			continue;
		}
		let signal = getFormattingSignal(char);

		// Check for legacy 'f' signal
		if (signal === "f") {
			logOrThrowProblem("Formatting Code 'f'", "", "Replacing", "", "with 'r'");
			signal = "r";
			char = "§r";
		}

		// Check for 'r' formatting, which should be BEFORE spaces
		if (signal === "r" && oldEmptyAmt > 0) {
			logOrThrowProblem(
				"Resetting Formatting",
				"",
				"Moving",
				"After Space(s)",
				"Before Space(s)",
			);

			const empties = builder.slice(-oldEmptyAmt);
			builder = builder.slice(0, -1 - oldEmptyAmt);

			// Add Code then Spaces
			builder.push(char);
			builder.push(...empties);

			// Reset Empty Amt and currFormat
			emptyAmt = oldEmptyAmt;
			formatBeforeChar = currFormat;
			currFormat = signal;
			continue;
		}

		// Check Prev Format
		if (currFormat === signal) {
			logOrThrowProblem("Redundant Formatting");

			// No need to do anything, just continue
			continue;
		}

		formatBeforeChar = currFormat;
		currFormat = signal;

		// If previous character before was § (if builder length < 1, `.at` returns undefined)
		// (Ignoring Spaces or New Lines)
		const prevProper = builder.at(-1 - oldEmptyAmt);
		if (prevProper && isFormattingSignal.test(prevProper)) {
			logOrThrowProblem("Redundant Formatting");

			// Remove Previous Formatting + Spaces
			const empties = builder.slice(-oldEmptyAmt);
			builder = builder.slice(0, -1 - oldEmptyAmt);

			// Add Empty Amount Spaces
			builder.push(...empties);
		}

		builder.push(char);
	}
}

/* Helpers */

/**
 * Either throws, if checking, or logs a fixing notice.
 * <br><br>
 * Error Msg formatted as: `${name} with ID ${id} at ${key} has ${describer} ${problem} ${conditionBefore}!`,<br>
 * Fixing Msg formatted as: `${verb} ${problem} ${conditionAfter} in ${name} with ID ${id} at ${key}...`,
 */
function logOrThrowProblem(
	problem: string,
	describer = "",
	verb: string = "Removing",
	conditionBefore = "",
	conditionAfter = "",
) {
	if (shouldCheck)
		throw new Error(
			`${name} with ID ${id} at ${key} has ${describer}${describer ? ` ${describer}` : ""}
			${problem}${conditionBefore ? ` ${conditionBefore}` : ""}!`,
		);

	logWarn(
		`${verb} ${problem}${conditionAfter ? ` ${conditionAfter}` : ""} in ${name} with ID ${id} at ${key}...`,
	);
}

/**
 * Get the character we want to process, or undefined is iter is done. Also clumps together formatting signals.
 */
function getWorkingChar(iter: IterableIterator<string>): string | undefined {
	const next = iter.next();

	if (!next.value || next.done) return undefined;

	if (next.value === "§") {
		// Combine Characters
		return next.value + (iter.next().value ?? "");
	}
	return next.value;
}

function isResettingSignal(char: string): boolean {
	return char === "§r";
}

function getFormattingSignal(char: string): string {
	if (!isFormattingSignal.test(char)) return "";

	return char.replace(isFormattingSignal, "$1");
}
