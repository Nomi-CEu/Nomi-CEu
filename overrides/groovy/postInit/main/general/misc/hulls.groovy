package postInit.main.general.misc

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilderCollection
import gregtech.api.recipes.RecipeBuilder

import static gregtech.api.GTValues.*
import static gregtech.loaders.recipe.CraftingComponent.*

// Allows Higher Tier Fluids (PTFE/PBI) for Hulls' Assembler Recipes
var peHulls = [ULV, LV, MV, HV, EV]
var ptfeHulls = [IV, LuV]

var ptfe = fluid('polytetrafluoroethylene')
var pbi = fluid('polybenzimidazole')

for (var tier : peHulls) {
	ChangeRecipeBuilderCollection peRecipes = mods.gregtech.assembler.changeByOutput([HULL.getIngredient(tier)], null)
	peRecipes.forEach { ChangeRecipeBuilder it ->
		it.builder { RecipeBuilder builder ->
			builder.clearFluidInputs()
				.fluidInputs(ptfe * 144)
		}.buildAndRegister()
	}

	peRecipes.copy().forEach { ChangeRecipeBuilder it ->
		it.builder { RecipeBuilder builder ->
			builder.clearFluidInputs()
				.fluidInputs(pbi * 72)
		}.buildAndRegister()
	}
}

for (var tier : ptfeHulls) {
	mods.gregtech.assembler.changeByOutput([HULL.getIngredient(tier)], null)
		.forEach { ChangeRecipeBuilder it ->
			it.builder { RecipeBuilder builder ->
				builder.clearFluidInputs()
					.fluidInputs(pbi * 144)
			}.buildAndRegister()
		}
}
