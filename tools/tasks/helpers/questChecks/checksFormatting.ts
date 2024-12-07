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
	let prevChar = data.processor.getLast();

	// Check for redundant formatting at end
	if (isFormattingSignal.test(prevChar.char)) {
		// If not resetting change, or we have no need to reset
		// Note the second case should be caught by redundant formatting check, so no need to check
		if (!isResettingSignal(prevChar.char)) {
			logOrThrowProblem("Redundant Formatting At End");
			data.processor.removeLast();
		}

		// For continued processing, refresh prevChar
		prevChar = data.processor.getLast();
	}

	data.saveValue();

	// Check for missing resetting signal at end
	if (
		!isResettingSignal(prevChar.char) &&
		prevChar.formatBefore !== resettingSignal
	) {
		logOrThrowProblem("Resetting Formatting At End", "Missing", "Adding");

		// Trim value, then add §r to it
		data.value = data.value.trim() + formattingChar + resettingSignal;
	}
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

		let signal = "";

		// Check for invalid formatting, including legacy 'f' signal
		if (invalidFormatting.test(char.char)) {
			logOrThrowProblem(
				`Invalid Formatting Signal '${char.char}'`,
				"",
				"Replacing",
				"",
				"with '§r'",
			);

			// BQu treats signals like §z as a resetting signal, so make them reset
			// Yes, even ones followed after by `'`, a space, or a newline
			signal = "r";
		} else signal = char.char.replace(isFormattingSignal, "$1");

		// Note: Do not use char.char past this point, use signal instead!

		// Check if formatting is right after another (ignoring spaces, newlines, etc.)
		let prevIgnoreSpaces = data.processor.getLastNonSpaceLike();
		if (isFormattingSignal.test(prevIgnoreSpaces.char.char)) {
			logOrThrowProblem("Redundant Formatting");

			// Remove previous formatting
			// Note: this won't be called if not found, as empty string is not a formatting signal
			// Instead of splicing, remove all, then add back, so we ensure correct formatting of spaces
			const empties = data.processor.result.slice(prevIgnoreSpaces.index + 1);
			data.processor.removeLast(
				data.processor.result.length - prevIgnoreSpaces.index,
			);

			empties.forEach((char) => data.processor.add(char.char));
		}

		/* Redundant Formatting Checks */
		// Check if formatting does nothing
		if (data.processor.getCurrentFormat() === signal) {
			logOrThrowProblem("Redundant Formatting");

			// No need to do anything, just continue
			continue;
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

				// Move in before spaces (Add after existing character, so use index + 1)
				// Instead of splicing, remove all, then add back, so we ensure correct formatting of spaces
				const empties = data.processor.result.slice(prevIgnoreSpaces.index + 1);
				data.processor.removeLast(
					data.processor.result.length - prevIgnoreSpaces.index - 1, // -1, we don't want to remove last-non-space char itself
				);

				data.processor.addFormat(signal);
				empties.forEach((char) => data.processor.add(char.char));
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
