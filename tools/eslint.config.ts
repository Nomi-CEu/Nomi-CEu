import { defineConfig } from "eslint/config";

import eslint from "@eslint/js";
import tsEslint from "typescript-eslint";
import prettierEslint from "eslint-plugin-prettier/recommended";

export default defineConfig(
	eslint.configs.recommended,
	tsEslint.configs.recommendedTypeChecked,
	prettierEslint,
	[
		{
			languageOptions: {
				parserOptions: {
					projectService: {
						allowDefaultProject: [
							"eslint.config.ts",
							".prettierrc.ts",
							"tsNodeESMRegister.mjs",
						],
					},
				},
			},
			rules: {
				quotes: [
					2,
					"double",
					{
						avoidEscape: true,
					},
				],

				semi: [2, "always"],
				"eol-last": [2, "always"],
			},
		},
	],
);
