package postInit.main.general.misc

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.ingredients.GTRecipeInput
import net.minecraftforge.fluids.FluidStack

import static gregtech.api.GTValues.*

// Rhodium Plated Palladium -> Rhodium Plated Lumium-Palladium
material('rhodium_plated_palladium')
	.changeComposition()
	.setComponents([materialstack('palladium') * 3, materialstack('rhodium'), materialstack('nomilabs:lumium') * 2])
	.changeABS()
	.changeMixer()
	.changeDecompositionRecipes()
	.changeChemicalFormula()
	.change()

// Remove Glowstone Decomp (No Glowstone -> Phosphorous)
material('glowstone')
	.changeComposition()
	.removeComponents()
	.changeDecompositionRecipes()
	.change()

// Change Glowstone Chem Formula
material('glowstone')
	.changeComposition()
	.setComponents([metaitem('dustGold'), metaitem('dustTricalciumPhosphate')])
	.changeChemicalFormula()
	.change()

/* Black Steel */

// Can't use change composition to remove, as that is only performed at the end of running scripts, and if not removed, conflicts will occur.
// TODO Make this use change composition when that accepts non-material Item Stacks

// Change ABS Recipes
mods.gregtech.alloy_blast_smelter.changeByOutput(null, [fluid('black_steel')])
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.clearInputs()
				.inputs(metaitem('dustSteel') * 3, metaitem('dustBlackBronze') * 2, item('actuallyadditions:item_crystal', 3) * 2, item('extrautils2:ingredients', 4) * 2)
		}.changeCircuitMeta { meta -> meta } // Copy Circuit
		.changeEachFluidOutput { FluidStack fluid -> return fluid * (L * 9) }
		.replaceAndRegister()
	}

/* Change Mixer Recipes */
mods.gregtech.mixer.removeByOutput([metaitem('dustBlackSteel')], null)

// Normal Mixer Recipe
mods.gregtech.mixer.recipeBuilder()
	.inputs(metaitem('dustSteel') * 3, metaitem('dustBlackBronze') * 2, item('actuallyadditions:item_crystal', 3) * 2, item('extrautils2:ingredients', 4) * 2)
	.outputs(metaitem('dustBlackSteel') * 9)
	.duration(200).EUt(VHA[LV])
	.buildAndRegister()

// Shortcut Mixer Recipe
mods.gregtech.mixer.recipeBuilder()
	.inputs(metaitem('dustSteel') * 15, metaitem('dustCopper') * 6, metaitem('dustGold') * 2, metaitem('dustSilver') * 2, item('actuallyadditions:item_crystal', 3) * 10, item('extrautils2:ingredients', 4) * 10)
	.outputs(metaitem('dustBlackSteel') * 45)
	.duration(300).EUt(VHA[HV])
	.buildAndRegister()

// Change Decomp Recipe
mods.gregtech.centrifuge.changeByInput([metaitem('dustBlackSteel')], null)
	.changeEachInput { GTRecipeInput input -> input.copyWithAmount(9) }
	.builder { RecipeBuilder recipe ->
		recipe.clearOutputs()
			.outputs(metaitem('dustSteel') * 3, metaitem('dustBlackBronze') * 2, item('actuallyadditions:item_crystal', 3) * 2, item('extrautils2:ingredients', 4) * 2)
	}.replaceAndRegister()

// Change Chem Formula
material('black_steel')
	.changeComposition()
	.setComponents([materialstack('black_bronze') * 2, materialstack('steel') * 3])
	.changeChemicalFormula()
	.change()
