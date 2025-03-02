package postInit.main.general.midGame

import com.cleanroommc.groovyscript.api.IIngredient
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.ingredients.GTRecipeInput
import net.minecraft.item.ItemStack

import static gregtech.api.GTValues.*

// Thermal Dusts Related Recipes

// Blaze Powder (pre-elemental reduction)
// Decrease voltage to MV (from HV), by reducing EUt by 4, and increasing duration by 4
mods.gregtech.chemical_reactor.changeByInput([metaitem('dustCarbon'), metaitem('dustSulfur')], null)
	.changeEUt { it -> (int) (it / 4) }
	.changeDuration { it -> (int) (it * 4) }
	.replaceAndRegister()

/* Elemental Reduction Fluid */

// Normal
mods.gregtech.chemical_reactor.recipeBuilder()
	.inputs(ore('dustPulsating'))
	.fluidInputs(fluid('hydrofluoric_acid') * 1000)
	.fluidOutputs(fluid('elementalreduction') * 1000)
	.duration(80).EUt(VA[MV])
	.buildAndRegister()

if (LabsModeHelper.expert) {
	// Fluoroantimonic Acid (3x Pulsating and Fluorine Efficiency)
	mods.gregtech.chemical_reactor.recipeBuilder()
		.inputs(ore('dustPulsating') * 4)
		.fluidInputs(fluid('fluoroantimonic_acid') * 1000)
		.fluidOutputs(fluid('elementalreduction') * 12000)
		.duration(540).EUt(VA[HV])
		.buildAndRegister()

	// Naphthalene, Copper and Ender Pearl Versions
	mods.gregtech.large_chemical_reactor.recipeBuilder()
		.inputs(ore('dustCalcium') * 9, ore('dustAnnealedCopper'), ore('dustEnderPearl'))
		.fluidInputs(fluid('naphthalene') * 2000, fluid('hydrofluoric_acid') * 18000)
		.fluidOutputs(fluid('elementalreduction') * 36000)
		.duration(1620).EUt(VA[MV])
		.buildAndRegister()

	mods.gregtech.large_chemical_reactor.recipeBuilder()
		.inputs(ore('dustCalcium') * 9, ore('dustAnnealedCopper'), ore('dustEnderPearl'))
		.fluidInputs(fluid('naphthalene') * 2000, fluid('fluoroantimonic_acid') * 4500)
		.fluidOutputs(fluid('elementalreduction') * 108000)
		.duration(2700).EUt(VA[HV])
		.buildAndRegister()
}

/* Powder from Elemental Reduction */
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

/* Rod Compression (5 -> 1) and Maceration (1 -> 4) */

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

rodsToDusts.forEach { int rodMeta, int dustMeta ->
	ItemStack rod = item('thermalfoundation:material', rodMeta)
	ItemStack dust = item('thermalfoundation:material', dustMeta)

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

var nameToDust = [
    "pyrotheum" : item('thermalfoundation:material', 1024),
	"cryotheum" : item('thermalfoundation:material', 1025),
	"aerotheum" : item('thermalfoundation:material', 1026),
	"petrotheum" : item('thermalfoundation:material', 1027),
]

// Extraction
nameToDust.forEach { String name, ItemStack dust ->
	mods.gregtech.extractor.recipeBuilder()
		.inputs(dust)
		.fluidOutputs(fluid(name) * 250)
		.duration(40).EUt(VA[LV])
		.buildAndRegister()
}

/* HM Processing from Powder to Dust (Complicated, but Redstone Free) */

if (LabsModeHelper.expert) {
	// Remove powder -> dust recipes
	nameToDust.values().forEach {
		crafting.removeByOutput(it)
	}

	// Pyrotheum
	mods.gregtech.chemical_reactor.recipeBuilder()
		.inputs(item('minecraft:blaze_powder') * 2, ore('dustSulfur'))
		.fluidInputs(fluid('lava') * 250)
		.fluidOutputs(fluid('pyrotheum') * 500)
		.duration(20).EUt(VA[HV])
		.buildAndRegister()

	// Cryotheum
	mods.gregtech.chemical_reactor.recipeBuilder()
		.inputs(ore('dustBlizz') * 2, ore('dustIce'))
		.fluidInputs(fluid('liquid_nitrogen') * 250)
		.fluidOutputs(fluid('cryotheum') * 500)
		.duration(20).EUt(VA[HV])
		.buildAndRegister()

	// Aerotheum
	mods.gregtech.chemical_reactor.recipeBuilder()
		.inputs(ore('dustBlitz') * 2, ore('dustSaltpeter'))
		.fluidInputs(fluid('nitric_acid') * 250)
		.fluidOutputs(fluid('aerotheum') * 500)
		.duration(20).EUt(VA[HV])
		.buildAndRegister()

	// Petrotheum
	for (var oil : [fluid('oil'), fluid('oil_medium'), fluid('oil_light'), fluid('oil_heavy')]) {
		mods.gregtech.chemical_reactor.recipeBuilder()
			.inputs(ore('dustBasalz') * 2, ore('dustObsidian'))
			.fluidInputs(oil * 250)
			.fluidOutputs(fluid('petrotheum') * 500)
			.duration(20).EUt(VA[HV])
			.buildAndRegister()
	}

	// Liquid -> Dust Recipes
	nameToDust.forEach { String name, ItemStack dust ->
		mods.gregtech.chemical_bath.recipeBuilder()
			.fluidInputs(fluid(name) * 250)
			.notConsumable(item('nuclearcraft:block_ice'))
			.outputs(dust)
			.duration(100).EUt(VHA[ULV])
			.buildAndRegister()
	}
}
