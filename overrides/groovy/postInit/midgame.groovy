import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.ingredients.nbtmatch.NBTCondition
import gregtech.api.recipes.ingredients.nbtmatch.NBTMatcher

import static gregtech.api.GTValues.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

if (LabsModeHelper.normal) {
	// Assembly Control Casing (Change from Output 2 to Output 4)
	replaceRecipeOutput(item('gregtech:multiblock_casing', 3) * 2, item('gregtech:multiblock_casing', 3) * 4)

	// Sterilizing Filter
	crafting.replaceShaped(metaitem('blacklight'), [
			[metaitem('screwTungstenCarbide'), metaitem('plateTungstenCarbide'), metaitem('screwTungstenCarbide')],
			[null, metaitem('springHssg'), null],
			[ore('circuitIv'), metaitem('plateTungstenCarbide'), metaitem('cableGtSinglePlatinum')]
	])

	replaceRecipeShaped(item('gregtech:cleanroom_casing', 2) * 2, item('gregtech:cleanroom_casing', 2) * 1, [
			[metaitem('pipeLargeFluidPolybenzimidazole'), metaitem('emitter.luv'), metaitem('pipeLargeFluidPolybenzimidazole')],
			[metaitem('item_filter'), metaitem('blacklight'), metaitem('item_filter')],
			[metaitem('electric.motor.luv'), ore('frameGtBlackSteel'), metaitem('rotorIridium')]
	])
}

// Ore Drilling Plants
if (LabsModeHelper.expert) {
	mods.gregtech.assembler.removeByOutput([metaitem('large_miner.ev')], null, null, null)
	mods.gregtech.assembler.removeByOutput([metaitem('large_miner.iv')], null, null, null)
	mods.gregtech.assembler.removeByOutput([metaitem('large_miner.luv')], null, null, null)

	mods.gregtech.assembler.recipeBuilder()
			.inputs(metaitem('hull.iv'))
			.inputNBT(item('redstonearsenal:tool.pickaxe_flux').item, NBTMatcher.ANY, NBTCondition.ANY)
			.inputs(item('nomilabs:t3laser') * 12, metaitem('frameStainlessSteel') * 12, metaitem('sensor.iv') * 6, metaitem('conveyor.module.iv') * 12, metaitem('fluid.regulator.iv') * 12, metaitem('gearTungstenSteel') * 12)
			.outputs(metaitem('large_miner.ev'))
			.duration(400).EUt(VA[IV]).buildAndRegister()

	mods.gregtech.assembly_line.recipeBuilder()
			.inputs(metaitem('hull.zpm'))
			.inputNBT(item('thermalinnovation:drill').item, 1, 4, NBTMatcher.ANY, NBTCondition.ANY)
			.inputNBT(item('thermalinnovation:drill').item, 1, 4, NBTMatcher.ANY, NBTCondition.ANY)
			.inputNBT(item('thermalinnovation:drill').item, 1, 4, NBTMatcher.ANY, NBTCondition.ANY)
			.inputs(item('nomilabs:t3laser') * 12, metaitem('frameNaquadahAlloy') * 12, metaitem('sensor.zpm') * 6, metaitem('conveyor.module.zpm') * 12, metaitem('fluid.regulator.zpm') * 12, metaitem('cableGtSingleVanadiumGallium') * 12, item('moreplates:empowered_void_gear') * 12)
			.fluidInputs(fluid('concrete') * 2304)
			.outputs(metaitem('large_miner.iv'))
			.duration(800).EUt(VA[ZPM]).buildAndRegister()

	mods.gregtech.assembly_line.recipeBuilder()
			.inputs(metaitem('hull.uhv'))
			.inputNBT(item('draconicevolution:draconic_staff_of_power').item, NBTMatcher.ANY, NBTCondition.ANY)
			.inputs(item('nomilabs:t3laser') * 12, metaitem('frameBerkelium') * 12, metaitem('sensor.uv') * 12, metaitem('conveyor.module.uv') * 24, metaitem('fluid.regulator.uv') * 24, metaitem('cableGtSingleEuropium') * 12, metaitem('nomilabs:gearAwakenedDraconium') * 12)
			.fluidInputs(fluid('concrete') * 2304, fluid('taranium') * 576)
			.outputs(metaitem('large_miner.luv'))
			.duration(800).EUt(VA[UHV]).buildAndRegister()
}