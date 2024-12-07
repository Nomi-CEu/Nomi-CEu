import ChecksData, { formattingChar, resettingSignal } from "./checksData.ts";
import { logWarn } from "#utils/log.ts";

let data: ChecksData;

export function setupUtil(dataIn: ChecksData) {
	data = dataIn;
}

/**
 * Either throws, if checking, or logs a fixing notice.
 * <br><br>
 * Error Msg formatted as: `${name} with ID ${id} at ${key} has ${describer} ${problem} ${conditionBefore}!`,<br>
 * Fixing Msg formatted as: `${verb} ${problem} ${conditionAfter} in ${name} with ID ${id} at ${key}...`,
 */
export function logOrThrowProblem(
	problem: string,
	describer = "",
	verb: string = "Removing",
	conditionBefore = "",
	conditionAfter = "",
) {
	if (data.shouldCheck)
		throw new Error(
			`${data.name} with ID ${data.id} at ${data.key} has ${describer}${describer ? ` ${describer}` : ""}
			${problem}${conditionBefore ? ` ${conditionBefore}` : ""}!`,
		);

	logWarn(
		`${verb} ${problem}${conditionAfter ? ` ${conditionAfter}` : ""} in ${data.name} with ID ${data.id} at ${data.key}...`,
	);
}

export function isResettingSignal(char: string): boolean {
	return char === formattingChar + resettingSignal;
}
