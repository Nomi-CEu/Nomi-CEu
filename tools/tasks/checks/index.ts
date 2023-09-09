import gulp from "gulp";
import { checkEnvironmentalVariables } from "../../util/util";

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
 * Check required env. variables for vailidity and cancel
 * the build if something is unset.
 */
async function checkEnv() {
	checkEnvironmentalVariables(vars);

	if (!/.+\/.+/.exec(process.env.GITHUB_REPOSITORY)) {
		throw new Error("Malformed repository slug.");
	}
}

export default gulp.series(checkEnv);
