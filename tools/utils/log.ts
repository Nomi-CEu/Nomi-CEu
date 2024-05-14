import logger from "fancy-log";
import colors from "colors";

export function logNotImportant(message: string): void {
	logger.info(colors.dim(message));
}

export default function logInfo(message: string): void {
	logger.info(message);
}

export function logWarn(message: string): void {
	logger.warn(colors.yellow(message));
}

export function logError(message: string): void {
	logger.error(colors.red(colors.bold(message)));
}
