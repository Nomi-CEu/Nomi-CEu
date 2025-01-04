import com.cleanroommc.groovyscript.api.IIngredient
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.ingredients.GTRecipeInput
import net.minecraft.item.ItemStack

import static gregtech.api.GTValues.*

// Thermal Dusts Related Recipes

// Elemental Reduction Fluid

// Normal
mods.gregtech.chemical_reactor.recipeBuilder()
	.inputs(ore('dustPulsating'))
	.fluidInputs(fluid('hydrofluoric_acid') * 1000)
	.fluidOutputs(fluid('elementalreduction') * 1000)
	.duration(80).EUt(90).buildAndRegister()

if (LabsModeHelper.expert) {
	// Fluoroantimonic Acid (3x Pulsating and Fluorine Efficiency)
	mods.gregtech.chemical_reactor.recipeBuilder()
		.inputs(ore('dustPulsating') * 4)
		.fluidInputs(fluid('fluoroantimonic_acid') * 1000)
		.fluidOutputs(fluid('elementalreduction') * 12000)
		.duration(540).EUt(360).buildAndRegister()
}

// Powder from Elemental Reduction
var addPowderFromReduction = { IIngredient uniq, ItemStack out ->
	mods.gregtech.chemical_reactor.recipeBuilder()
		.inputs(uniq)
		.fluidInputs(fluid('elementalreduction') * 100)
		.outputs(out)
		.duration(160).EUt(VA[MV])
		.buildAndRegister()
}

var carbonLike = ore('dustCarbonLike')
carbonLike.add(metaitem('dustCoal'))
carbonLike.add(metaitem('dustCharcoal'))
carbonLike.add(metaitem('dustCarbon'))

addPowderFromReduction(ore('dustNetherrack'), item('minecraft:blaze_powder')) // Blaze
addPowderFromReduction(item('minecraft:snow'), item('thermalfoundation:material', 2049)) // Blizz
addPowderFromReduction(ore('dustEndstone'), item('thermalfoundation:material', 2051)) // Blitz
addPowderFromReduction(carbonLike, item('thermalfoundation:material', 2053)) // Basalz

// Rod Compression (5 -> 1) and Maceration (1 -> 4)

// Replace existing Blaze Rod recipe (4 -> 1)
mods.gregtech.compressor.changeByInput([item('minecraft:blaze_powder') * 4], null)
	.changeEachInput { GTRecipeInput it -> return it.withAmount(5) }
	.replaceAndRegister()

// Move Blaze Rod recipe out of recycling category
mods.gregtech.macerator.changeByInput([item('minecraft:blaze_rod')], null)
	.replaceAndRegister()

// Blizz, Blitz and Basalz Compression and Maceration
var rodsToDusts = [
	2048 : 2049, // Blizz
	2050 : 2051, // Blitz
	2052 : 2053, // Basalz
]

for (var rodToDust : rodsToDusts) {
	ItemStack rod = item('thermalfoundation:material', rodToDust.key)
	ItemStack dust = item('thermalfoundation:material', rodToDust.value)

	mods.gregtech.compressor.recipeBuilder()
		.inputs(dust * 5)
		.outputs(rod)
		.duration(200).EUt(2) // Special Exception: Not from GTValues, matches Blaze Rod EUt instead
		.buildAndRegister()

	mods.gregtech.macerator.recipeBuilder()
		.inputs(rod)
		.outputs(dust * 4)
		.duration(88).EUt(2) // Special Exception: Not from GTValues, matches Blaze Rod EUt instead
		.buildAndRegister()
}
