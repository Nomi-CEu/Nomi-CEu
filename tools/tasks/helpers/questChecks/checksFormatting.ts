/* Storage for Per Char Checks */
// Builder for per character
import ChecksData, {
	doubleSpace,
	formattingChar,
	invalidFormatting,
	isSpaceOrNewLine,
	isFormattingSignal,
	resettingSignal,
} from "./checksData.ts";
import {
	isResettingSignal,
	logOrThrowProblem,
	setupUtil,
} from "./checksUtil.ts";

/**
 * Makes various space and newline related checks, and checks formatting.
 */
export default function checkSpacesAndFormatting(
	shouldCheck: boolean,
	value: string,
	id: number,
	name: string,
	key: string,
): string {
	const data = new ChecksData(shouldCheck, value, id, name, key);
	setupUtil(data);

	checkFormatting(data);

	if (doubleSpace.test(data.value)) {
		logOrThrowProblem("Double Space(s)");
		data.value = data.value.replace(doubleSpace, " ");
	}

	const trimmedResult = data.value.trim();

	if (trimmedResult !== data.value) {
		logOrThrowProblem("Extra Spaces or New Lines at Beginning or End");
		data.value = trimmedResult;
	}

	if (!data.value.includes("\n")) return data.value;

	const lineBuilder: string[] = [];
	for (const bit of data.value.split("\n")) {
		const trimmedBit = bit.trim();

		if (trimmedBit !== bit)
			logOrThrowProblem("Extra Spaces at Beginning or End of a Line");

		lineBuilder.push(trimmedBit);
	}
	return lineBuilder.join("\n");
}

/**
 * Whole string formatting checks.
 */
function checkFormatting(data: ChecksData) {
	if (!data.value.includes(formattingChar)) return;

	checkFormattingChar(data);

	/* End of String Checks */
	const prevChar = data.processor.result.at(-1);
	if (!prevChar) {
		data.saveValue();
		return;
	}

	// Check for redundant formatting at end, only if text being reset from a non-normal formatting
	if (prevChar.formatBefore === resettingSignal) {
		if (isFormattingSignal.test(prevChar.char)) {
			logOrThrowProblem("Redundant Formatting At End");
			data.processor.removeLast(1);
		}

		data.saveValue();
		return;
	}

	// Check for missing resetting signal at end
	// At this point, we know the text ends at a non-normal state (ignoring a final resetting signal, if one exists)
	if (!isResettingSignal(prevChar.char)) {
		logOrThrowProblem("Resetting Formatting At End", "Missing", "Adding");

		// Remove any existing formatting signals
		if (isFormattingSignal.test(prevChar.char)) data.processor.removeLast(1);

		data.processor.addFormat(resettingSignal);
	}

	data.saveValue();
}

/**
 * Per character formatting checks.
 */
function checkFormattingChar(data: ChecksData) {
	while (data.processor.hasNext()) {
		const char = data.processor.toNext();

		// If not formatting signal, ignore
		if (!char.char.includes(formattingChar)) {
			data.processor.add(char.char);
			continue;
		}

		// Check for invalid formatting
		if (invalidFormatting.test(char.char)) {
			logOrThrowProblem("Lone Formatting Signal");
			const withoutSignal = char.char.replace(invalidFormatting, "$1");

			// In the case char is just '§', with nothing afterwards, now char is empty
			// This could either mean two § in a row, or end of string
			if (!withoutSignal) continue;

			data.processor.add(withoutSignal);
			continue;
		}

		let signal = char.char.replace(isFormattingSignal, "$1");

		// Check for legacy 'f' signal
		if (signal === "f") {
			logOrThrowProblem("Formatting Code 'f'", "", "Replacing", "", "with 'r'");
			signal = "r";
		}

		/* Redundant Formatting Checks */
		// Check if formatting does nothing
		if (char.formatBefore === char.formatAfter) {
			logOrThrowProblem("Redundant Formatting");

			// No need to do anything, just continue
			continue;
		}

		// Check if formatting is right after another (ignoring spaces, newlines, etc.)
		let prevIgnoreSpaces = data.processor.getLastNonSpaceLike();
		if (isFormattingSignal.test(prevIgnoreSpaces.char.char)) {
			logOrThrowProblem("Redundant Formatting");

			// Remove previous formatting
			// Note: this won't be called if not found, as empty string is not a formatting signal
			data.processor.result.splice(prevIgnoreSpaces.index, 1);
		}
		/* End Redundant Formatting Checks */

		/* Formatting Order Checks */
		// Make sure resetting formatting is BEFORE spaces
		if (signal === "r") {
			if (isSpaceOrNewLine.test(data.processor.getLast().char)) {
				logOrThrowProblem(
					"Resetting Formatting",
					"",
					"Moving",
					"After Space(s)",
					"Before Space(s)",
				);

				// Refetch ignore spaces, it may have changed
				prevIgnoreSpaces = data.processor.getLastNonSpaceLike();
				if (prevIgnoreSpaces.index === -1) {
					// We don't need to add resetting formatting at start of processor
					// Also, this condition should have already been caught through redundant checks
					// Ignore
					continue;
				}

				// Splice in before spaces (Add after existing character, so use index + 1)
				const currFormat = data.processor.getCurrentFormat();
				data.processor.result.splice(prevIgnoreSpaces.index + 1, 0, {
					char: formattingChar + signal,
					formatBefore: currFormat,
					formatAfter: signal,
				});
				continue;
			}
			data.processor.addFormat(signal);
			continue;
		}

		// Make sure non-resetting formatting is AFTER spaces
		// Note: we don't have to check if have next, as empty string is not space or newline
		if (!isSpaceOrNewLine.test(data.processor.getNext().char)) {
			data.processor.addFormat(signal);
			continue;
		}

		logOrThrowProblem(
			"Non-Resetting Formatting",
			"",
			"Moving",
			"Before Space(s)",
			"After Space(s)",
		);

		// Add all upcoming space/newline characters
		while (
			data.processor.hasNext() &&
			isSpaceOrNewLine.test(data.processor.getNext().char)
		) {
			data.processor.add(data.processor.toNext().char);
		}

		// Add formatting
		data.processor.addFormat(signal);
	}
}
