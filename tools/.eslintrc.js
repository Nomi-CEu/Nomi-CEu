module.exports = {
	parser: "@typescript-eslint/parser",
	parserOptions: {
		ecmaVersion: 2020,
		sourceType: "module",
		ecmaFeatures: {
			jsx: true,
		},
	},
	plugins: ["@typescript-eslint"],
	extends: ["plugin:@typescript-eslint/recommended", "plugin:prettier/recommended"],
	rules: {
		quotes: [2, "double", { avoidEscape: true }],
		semi: [2, "always"],
		"eol-last": [2, "always"],
	},
};
