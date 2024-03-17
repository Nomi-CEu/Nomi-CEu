import { categories } from "./definitions";
import { Category, ChangelogMessage, SubCategory } from "../../types/changelogTypes";

export function categoriesSetup(): void {
	// Initialize Category Lists
	categories.forEach((categoryKey) => {
		initializeCategorySection(categoryKey);
	});
}

/**
 * Initializes the categorySection field of the categoryKey.
 * @param category The Category to initialize the categorySection of.
 */
function initializeCategorySection(category: Category): void {
	const categorySection = new Map<SubCategory, ChangelogMessage[]>();
	category.subCategories.forEach((subCategory) => {
		categorySection.set(subCategory, []);
	});
	category.changelogSection = categorySection;
}
