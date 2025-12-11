import { checkEnvironmentalVariables } from "#utils/util.ts";

const vars = [
	"GITHUB_TOKEN",
	"GITHUB_REPOSITORY",
	"GITHUB_SHA",
	"GITHUB_REF",
	"CURSEFORGE_PROJECT_ID",
	"CURSEFORGE_API_TOKEN",
	"CFCORE_API_TOKEN",
];

/**
 * Check required env. variables for validity and cancel
 * the build if something is unset.
 */
export default async function checkEnv(): Promise<void> {
	checkEnvironmentalVariables(vars);

	if (!/.+\/.+/.exec(process.env.GITHUB_REPOSITORY ?? "")) {
		throw new Error("Malformed repository slug.");
	}
	return Promise.resolve();
}
