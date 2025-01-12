package postInit.main.general.misc

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.ingredients.GTRecipeInput
import gregtech.api.recipes.recipeproperties.TemperatureProperty

import static gregtech.api.GTValues.*

// Lumium
mods.gregtech.alloy_blast_smelter.changeByOutput(null, [fluid('molten.lumium')])
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.inputs(item('extendedcrafting:material', 7) * 2, ore('clathrateGlowstone')) // Luminessence
				.fluidInputs(fluid('mana') * 1000)
		}.changeDuration { duration -> (int) (duration / 6 * 4) } // Old recipe made 6, new recipe makes 4
		.changeCircuitMeta { meta -> meta + 2 }
		.changeEachFluidOutput { fluid -> fluid * (L * 4) }
		.copyProperties(TemperatureProperty.instance)
		.replaceAndRegister()
	}

// Signalum
mods.gregtech.alloy_blast_smelter.changeByOutput(null, [fluid('molten.signalum')])
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.inputs(ore('clathrateRedstone'))
				.fluidInputs(fluid('mana') * 1000)
		}.changeDuration { duration -> (int) (duration / 8 * 4) } // Old recipe made 8, new recipe makes 4
		.changeCircuitMeta { meta -> meta + 1 }
		.changeEachFluidOutput { fluid -> fluid * (L * 4) }
		.copyProperties(TemperatureProperty.instance)
		.replaceAndRegister()
	}

// Enderium
mods.gregtech.alloy_blast_smelter.changeByOutput(null, [fluid('molten.enderium')])
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.inputs(ore('clathrateEnder'))
				.fluidInputs(fluid('mana') * 1000)
		}.changeDuration { duration -> (int) (duration / 8 * 4) } // Old recipe made 8, new recipe makes 4
		.changeCircuitMeta { meta -> meta + 1 }
		.changeEachFluidOutput { fluid -> fluid * (L * 4) }
		.copyProperties(TemperatureProperty.instance)
		.replaceAndRegister()
	}

// Fluxed Electrum
mods.gregtech.alloy_blast_smelter.changeByOutput(null, [fluid('electrum_flux')])
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder {RecipeBuilder recipe ->
			recipe.inputs(ore('dustMana'))
		}.changeDuration { duration -> (int) (duration / 8 * 9) } // Old recipe made 8, new recipe makes 9
		.changeCircuitMeta { meta -> meta + 1 }
		.changeEachFluidOutput { fluid -> fluid * (L * 9) }
		.copyProperties(TemperatureProperty.instance)
		.replaceAndRegister()
	}

if (LabsModeHelper.normal) {
	// Red Alloy (Increases Output & Changes Copper/Redstone Ratio)
	mods.gregtech.alloy_blast_smelter.changeByOutput(null, [fluid('red_alloy')])
		.forEach { ChangeRecipeBuilder builder ->
			builder.clearCircuitMeta()
				.changeEachFluidOutput { fluid -> fluid * (L * 2) }
				.builder { RecipeBuilder recipe ->
					recipe.clearInputs()
						.inputs(ore('dustCopper') * 2, item('minecraft:redstone') * 3)
						.circuitMeta(2)
				}.replaceAndRegister()
		}

	mods.gregtech.centrifuge.changeByInput([metaitem('dustRedAlloy')], null)
		.changeEachInput { GTRecipeInput input ->
			return input.copyWithAmount(2)
		}.builder { RecipeBuilder recipe ->
			recipe.clearOutputs()
				.outputs(item('minecraft:redstone') * 3, metaitem('dustCopper') * 2)
		}.replaceAndRegister()
}
