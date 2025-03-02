package postInit.main.modSpecific.ae2

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilderCollection
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.ingredients.GTRecipeItemInput
import gregtech.api.recipes.ingredients.nbtmatch.NBTCondition
import gregtech.api.recipes.ingredients.nbtmatch.NBTMatcher
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack

import static gregtech.api.GTValues.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.*

/* Usable Items */
// Meteorite Compass
crafting.shapedBuilder()
	.output(item('appliedenergistics2:sky_compass'))
	.matrix(
		'VPV',
		'PCP',
		'VPV')
	.key('V', item('actuallyadditions:item_crystal', 3))
	.key('P', metaitem('nomilabs:plateDarkSteel'))
	.key('C', item('appliedenergistics2:material', 1))
	.replace().register()

// Memory Card
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:memory_card'))
	.input(item('appliedenergistics2:material', 25))
	.input(ore('circuitHv'))
	.replace().register()

// Network Tool
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:network_tool'))
	.input(ore('itemIlluminatedPanel'), item('actuallyadditions:item_laser_wrench'))
	.replace().register()

/* Materials */
// Pattern
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 52) * 8)
	.matrix(
		'WWW',
		'PCP',
		'PPP')
	.key('W', metaitem('wireFineSilver'))
	.key('P', metaitem('platePlastic'))
	.key('C', ore('circuitHv'))
	.replace().register()

// Fluix Plate
mods.gregtech.compressor.recipeBuilder()
	.inputs(item('appliedenergistics2:material', 7))
	.outputs(item('moreplates:fluix_plate'))
	.duration(20).EUt(VHA[LV])
	.buildAndRegister()

mods.gregtech.compressor.recipeBuilder()
	.inputs(item('appliedenergistics2:material', 12))
	.outputs(item('moreplates:fluix_plate'))
	.duration(20).EUt(VHA[LV])
	.buildAndRegister()

// Wireless Part
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 41))
	.matrix(
		' E ',
		'PFP',
		' P ')
	.key('E', metaitem('emitter.ev'))
	.key('P', metaitem('plateTitanium'))
	.key('F', item('appliedenergistics2:material', 9))
	.replace().register()

// Basic Card
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 25))
	.matrix(
		'WP ',
		'WCP',
		'WP ')
	.key('W', ore('wireFineCopper'))
	.key('P', ore('plateIron'))
	.key('C', item('appliedenergistics2:material', 23))
	.replace().register()

// Advanced Card
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 28))
	.matrix(
		'WP ',
		'WCP',
		'WP ')
	.key('W', ore('wireFineAluminium'))
	.key('P', ore('plateElectricalSteel'))
	.key('C', item('appliedenergistics2:material', 23))
	.replace().register()

/* Storage */
// Storage Cell Removals
crafting.remove('appliedenergistics2:network/cells/storage_cell_1k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_4k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_16k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_64k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_1k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_4k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_16k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_64k')

// Storage Housing
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 39))
	.matrix(
		'WPW',
		'P P',
		'WPW')
	.key('W', metaitem('wireFineRedAlloy'))
	.key('P', metaitem('nomilabs:plateElectricalSteel'))
	.replace().register()

// 1k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 35))
	.matrix('GPG',
		'PCP',
		'GPG')
	.key('G', item('minecraft:glass'))
	.key('P', metaitem('plateRedAlloy'))
	.key('C', ore('circuitLv'))
	.replace().register()

// 4k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 36))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('minecraft:glass'))
	.key('B', item('appliedenergistics2:material', 22))
	.key('C', item('appliedenergistics2:material', 35))
	.key('D', ore('circuitMv'))
	.replace().register()

// 16k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 37))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('minecraft:glass'))
	.key('B', item('appliedenergistics2:material', 24))
	.key('C', item('appliedenergistics2:material', 36))
	.key('D', ore('circuitHv'))
	.replace().register()

// 64k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material', 38))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('appliedenergistics2:material', 22))
	.key('B', item('appliedenergistics2:material', 24))
	.key('C', item('appliedenergistics2:material', 37))
	.key('D', ore('circuitEv'))
	.replace().register()

/* Fluid Storage (Different Across NM and HM) */

if (LabsModeHelper.normal) {
	// 1k Fluid Storage
	crafting.shapedBuilder()
		.output(item('appliedenergistics2:material', 54))
		.matrix(
			'GPG',
			'PCP',
			'GPG')
		.key('G', item('minecraft:glass'))
		.key('P', metaitem('plateLapis'))
		.key('C', ore('circuitLv'))
		.replace().register()

	// 4k Fluid Storage
	crafting.shapedBuilder()
		.output(item('appliedenergistics2:material', 55))
		.matrix(
			'ABA',
			'CDC',
			'ACA')
		.key('A', item('minecraft:glass'))
		.key('B', item('appliedenergistics2:material', 22))
		.key('C', item('appliedenergistics2:material', 54))
		.key('D', ore('circuitMv'))
		.replace().register()

	// 16k Fluid Storage
	crafting.shapedBuilder()
		.output(item('appliedenergistics2:material', 56))
		.matrix(
			'ABA',
			'CDC',
			'ACA')
		.key('A', item('minecraft:glass'))
		.key('B', item('appliedenergistics2:material', 24))
		.key('C', item('appliedenergistics2:material', 55))
		.key('D', ore('circuitHv'))
		.replace().register()

	// 64k Fluid Storage
	crafting.shapedBuilder()
		.output(item('appliedenergistics2:material', 57))
		.matrix(
			'ABA',
			'CDC',
			'ACA')
		.key('A', item('appliedenergistics2:material', 22))
		.key('B', item('appliedenergistics2:material', 24))
		.key('C', item('appliedenergistics2:material', 56))
		.key('D', ore('circuitEv'))
		.replace().register()
} else {
	// 1k Fluid Storage
	crafting.removeByOutput(item('appliedenergistics2:material', 54))
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('gemExquisiteLapis') * 2, ore('crystalPureCertusQuartz') * 4, item('appliedenergistics2:material', 22), ore('circuitEv') * 2)
		.outputs(item('appliedenergistics2:material', 54))
		.duration(100).EUt(VHA[EV])
		.buildAndRegister()

	// 4k Fluid Storage
	crafting.removeByOutput(item('appliedenergistics2:material', 55))
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('gemExquisiteLapis') * 2, ore('crystalPureCertusQuartz') * 4, item('appliedenergistics2:material', 23), item('appliedenergistics2:material', 54) * 3)
		.outputs(item('appliedenergistics2:material', 55))
		.duration(100).EUt(VHA[EV])
		.buildAndRegister()

	// 16k Fluid Storage
	crafting.removeByOutput(item('appliedenergistics2:material', 56))
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('gemExquisiteLapis') * 2, ore('crystalPureCertusQuartz') * 4, item('appliedenergistics2:material', 23), item('appliedenergistics2:material', 55) * 3)
		.outputs(item('appliedenergistics2:material', 56))
		.duration(100).EUt(VHA[EV])
		.buildAndRegister()

	// 64k Fluid Storage
	crafting.removeByOutput(item('appliedenergistics2:material', 57))
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('gemExquisiteLapis') * 2, ore('crystalPureCertusQuartz') * 4, item('appliedenergistics2:material', 23), item('appliedenergistics2:material', 56) * 3)
		.outputs(item('appliedenergistics2:material', 57))
		.duration(100).EUt(VHA[EV])
		.buildAndRegister()
}

// AE2 Processor Shortcut
for (FluidStack joiningFluid : [fluid('tin') * 576, fluid('soldering_alloy') * 288]) {
	// Logic Processor
	mods.gregtech.circuit_assembler.recipeBuilder()
		.inputs(ore('circuitEv'), metaitem('plate.nand_memory_chip') * 8, metaitem('wireFineElectrum') * 16, item('appliedenergistics2:part', 16) * 2)
		.fluidInputs(joiningFluid)
		.outputs(item('appliedenergistics2:material', 22) * 16)
		.duration(400).EUt(VA[IV])
		.buildAndRegister()

	// Calculation Processor
	mods.gregtech.circuit_assembler.recipeBuilder()
		.inputs(ore('circuitEv'), metaitem('plate.central_processing_unit') * 8, metaitem('wireFineElectrum') * 16, item('appliedenergistics2:part', 16) * 2)
		.fluidInputs(joiningFluid)
		.outputs(item('appliedenergistics2:material', 23) * 16)
		.duration(400).EUt(VA[IV])
		.buildAndRegister()

	// Engineering Processor
	mods.gregtech.circuit_assembler.recipeBuilder()
		.inputs(ore('circuitEv'), metaitem('plate.nor_memory_chip') * 8, metaitem('wireFineElectrum') * 16, item('appliedenergistics2:part', 16) * 2)
		.fluidInputs(joiningFluid)
		.outputs(item('appliedenergistics2:material', 24) * 16)
		.duration(400).EUt(VA[IV])
		.buildAndRegister()
}

// Add Circuits to Quartz and Certus Quartz Autoclave Recipes (So Doesn't Conflict with Purified Shortcut)

// 2D List of Recipes, Each List is Seperate Quartz Type
List<ChangeRecipeBuilderCollection> quartzRecipes = []

for (ItemStack quartz : [item('minecraft:quartz'), metaitem('gemCertusQuartz')]) {
	quartzRecipes.add(mods.gregtech.autoclave.changeByOutput(null, null, [chanced(quartz, 7000, 1000)], null)
		.with(mods.gregtech.autoclave.changeByOutput([quartz], null)))
}

quartzRecipes.forEach { ChangeRecipeBuilderCollection builders ->
	builders.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.circuitMeta(1)
		}.replaceAndRegister()
	}
}

// Copy a Quartz Recipe for Fluix
quartzRecipes[0].copy().forEach { ChangeRecipeBuilder builder ->
	builder.builder { RecipeBuilder recipe ->
		recipe.clearInputs()
			.inputs(item('appliedenergistics2:material', 8))
			.circuitMeta(1)
	}.changeEachOutput { output ->
		return item('appliedenergistics2:material', 7) * output.count
	}.changeEachChancedOutput { output ->
		return chanced(item('appliedenergistics2:material', 7), output.chance, output.chanceBoost)
	}.buildAndRegister()
}

// Purified AE2 Crystal Shortcut
mods.gregtech.autoclave.recipeBuilder()
	.inputNBT(new GTRecipeItemInput(item('appliedenergistics2:crystal_seed')).setNonConsumable(),
		NBTMatcher.ANY, NBTCondition.ANY)
	.inputs(ore('dustCertusQuartz') * 64)
	.fluidInputs(fluid('distilled_water') * 8000)
	.outputs(item('appliedenergistics2:material', 10) * 64, item('appliedenergistics2:material', 10) * 64)
	.duration(2560).EUt(VA[EV])
	.buildAndRegister()

mods.gregtech.autoclave.recipeBuilder()
	.inputNBT(new GTRecipeItemInput(item('appliedenergistics2:crystal_seed', 1200)).setNonConsumable(),
		NBTMatcher.ANY, NBTCondition.ANY)
	.inputs(ore('dustFluix') * 64)
	.fluidInputs(fluid('distilled_water') * 8000)
	.outputs(item('appliedenergistics2:material', 12) * 64, item('appliedenergistics2:material', 12) * 64)
	.duration(2560).EUt(VA[EV])
	.buildAndRegister()

mods.gregtech.autoclave.recipeBuilder()
	.inputNBT(new GTRecipeItemInput(item('appliedenergistics2:crystal_seed', 600)).setNonConsumable(),
		NBTMatcher.ANY, NBTCondition.ANY)
	.inputs(ore('dustNetherQuartz') * 64)
	.fluidInputs(fluid('distilled_water') * 8000)
	.outputs(item('appliedenergistics2:material', 11) * 64, item('appliedenergistics2:material', 11) * 64)
	.duration(2560).EUt(VA[EV])
	.buildAndRegister()

// Fluix + Charged Certus Shortcut
mods.gregtech.autoclave.recipeBuilder()
	.inputs(ore('dustCertusQuartz') * 8, ore('dustNetherQuartz') * 8)
	.fluidInputs(fluid('redstone') * 1152)
	.outputs(item('appliedenergistics2:material', 7) * 16)
	.duration(160).EUt(VA[EV])
	.buildAndRegister()

