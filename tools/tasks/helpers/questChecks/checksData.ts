import ChecksCharProcessor from "#tasks/helpers/questChecks/checksCharProcessor.ts";

/* Patterns */
export const doubleSpace = / {2,}/g;
export const invalidFormatting = /§$|§[^0-9a-ek-or]/;
export const isSpaceOrNewLine = /[ \n]/;
export const isFormattingSignal = /§([0-9a-ek-or])/;

/* Constants */
export const formattingChar = "§";
export const resettingSignal = "r";

export default class ChecksData {
	public shouldCheck: boolean;
	public value: string;
	public id: number;
	public name: string;
	public key: string;
	public processor: ChecksCharProcessor;

	constructor(
		shouldCheck: boolean,
		value: string,
		id: number,
		name: string,
		key: string,
	) {
		this.shouldCheck = shouldCheck;
		this.value = value;
		this.id = id;
		this.name = name;
		this.key = key;
		this.processor = new ChecksCharProcessor(value);
	}

	public saveValue() {
		this.value = this.processor.getResult();
	}
}
