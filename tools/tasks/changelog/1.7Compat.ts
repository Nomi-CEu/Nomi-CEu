// TODO remove this file post 1.7!

import { Category, Commit, Parser } from "../../types/changelogTypes";
import { parsingCategories, skipKey } from "./definitions";
import { modpackManifest } from "../../globals";
import { findCategories, parseCommitBody } from "./changelogParsing";

interface KeyLink {
	commitKey: string;
	linksToTags: string[];
}

const legacyTagCompat: KeyLink = {
	commitKey: "[QB HM]",
	linksToTags: ["[QB]", "[HM]"],
};

// These callbacks don't need to worry about message/body, as these won't ever handle expand commits.
const messageParsing: Parser = {
	dirs: [modpackManifest.overrides],
	skipCallback: (commit) => commit.message.includes(skipKey),
	itemCallback: (parser, commit) => legacyParsing(commit, parser),
	addSHACallback: (_commit, parsed) => parsed,
	addCommitListCallback: (_commit, parsed) => parsed,
};

export default function legacySetup(): void {
	parsingCategories.unshift(messageParsing);
}

async function legacyParsing(commit: Commit, parser: Parser): Promise<boolean> {
	const sortedCategories: Category[] = findCategories(commit.message);
	if (sortedCategories.length === 0) return false;

	let message = commit.message;
	const body: string[] = [];

	sortedCategories.forEach((category) => {
		message = legacyTagRemoval(message, category.commitKey);
		body.push(category.commitKey);
	});

	if (message.includes(legacyTagCompat.commitKey)) {
		message = legacyTagRemoval(message, legacyTagCompat.commitKey);
		body.push(...legacyTagCompat.linksToTags);
	}

	await parseCommitBody(message, body.join("\n"), commit, parser);
	return true;
}

function legacyTagRemoval(message: string, categoryKey: string): string {
	if (message.includes(categoryKey)) {
		return message.replace(categoryKey, "").trim();
	}
	return message;
}
