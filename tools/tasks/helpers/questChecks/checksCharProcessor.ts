import {
	formattingChar,
	invalidFormatting,
	isSpaceOrNewLine,
} from "./checksData.ts";

export type Character = {
	char: string;
	formatBefore: string;
	formatAfter: string;
};
export type Characters = Character[];

const emptyChar: Character = { char: "", formatBefore: "r", formatAfter: "r" };

export default class ChecksCharProcessor {
	// Filled up initially with all characters from value.
	public source: Characters;

	// Resultant list
	public result: Characters;

	private currIndex;

	constructor(value: string) {
		this.source = [];

		// Init source with characters
		for (let i = 0; i < value.length; i++) {
			let char = value.charAt(i);

			if (char !== formattingChar) {
				this.add(char, this.source);
				continue;
			}

			let next = value.charAt(++i) ?? "";

			// Don't add if next character is also formatting, just leave it as lone signal and have formatter deal with it
			// Newlines and spaces BQu ignores after a formatting char, so keep them
			if (next === formattingChar) {
				next = "";

				// Decrement i again, so the next character is added separately
				i--;
			}

			this.addFormat(next, this.source);
		}

		this.result = [];
		// Start index at -1, as we always use index to get the 'next' char, not the current char
		this.currIndex = -1;
	}

	/**
	 * Adds a normal character to the specified list. Defaults to result list.
	 */
	public add(char: string, list: Characters = this.result): void {
		if (!char) return;

		const fmt = this.getCurrentFormat(list);
		list.push({ char, formatBefore: fmt, formatAfter: fmt });
	}

	/**
	 * Adds a formatting signal to the specified list. Defaults to result list.
	 */
	public addFormat(signal: string, list: Characters = this.result): void {
		const result = formattingChar + signal;

		let formatAfter = signal;
		if (invalidFormatting.test(result)) {
			// Use previous
			formatAfter = this.getCurrentFormat(list);
		}

		list.push({
			char: result,
			formatBefore: this.getCurrentFormat(list),
			formatAfter,
		});
	}

	/**
	 * Gets the current format, in the specified list. Defaults to result list.
	 */
	public getCurrentFormat(list: Characters = this.result): string {
		return this.getLast(list).formatAfter;
	}

	/**
	 * Returns whether there are more characters to process in the source list.
	 */
	public hasNext(): boolean {
		return this.currIndex < this.source.length;
	}

	/**
	 * Gets the next character in the source list, and increments the current index.
	 * @return character Character in the source list. Returns empty character if out of bounds.
	 */
	public toNext(): Character {
		return this.at(++this.currIndex, this.source);
	}

	/**
	 * Gets the next character in the source list.
	 * @param amount The amount to get after currentIndex. This should never be less than 1. Defaults to 1
	 *               (the next character to process)
	 * @return character Character in the source list. Returns empty character if out of bounds.
	 */
	public getNext(amount: number = 1): Character {
		return this.at(this.currIndex + amount, this.source);
	}

	/**
	 * Gets the character at the index of the specified list safely. Defaults to result list.
	 * Returns empty character if out of bounds.
	 */
	public at(index: number, list = this.result): Character {
		return list.at(index) ?? emptyChar;
	}

	/**
	 * Gets the last character in the specified list. Defaults to result list.
	 */
	public getLast(list = this.result) {
		return this.at(-1, list);
	}

	/**
	 * Removes the last amt characters added to the results. Defaults to 1.
	 */
	public removeLast(amt: number = 1) {
		this.result = this.result.slice(0, -amt);
	}

	/**
	 * Finds the last non-space/newline character in the specified list. Defaults to results list.
	 * If none found, returns an empty character.
	 */
	public getLastNonSpaceLike(list = this.result): {
		char: Character;
		index: number;
	} {
		const index = list.findLastIndex(
			(char) => !isSpaceOrNewLine.test(char.char),
		);
		return index === -1
			? { char: emptyChar, index }
			: { char: this.at(index, list), index };
	}

	/**
	 * Gets the string this builder condenses into.
	 */
	public getResult(): string {
		return this.result.map((char) => char.char).join("");
	}
}
