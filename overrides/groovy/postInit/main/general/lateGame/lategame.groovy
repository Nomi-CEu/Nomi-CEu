package postInit.main.general.lateGame

import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.builders.ImplosionRecipeBuilder
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static gregtech.api.GTValues.*

// Omnium Implosion Compressor Recipes
ImplosionRecipeBuilder builder = mods.gregtech.implosion_compressor.recipeBuilder()
	.inputs(item('extendedcrafting:singularity_ultimate'))
	.outputs(item('extendedcrafting:material:33'))
	.chancedOutput(item('gregtech:meta_dust', 275), 2500, 0)
	.duration(20).EUt(VA[LV])

// TNT
builder.copy()
	.explosivesAmount(8)
	.buildAndRegister()

// Other Explosives
for (ItemStack explosive : [item('gregtech:powderbarrel') * 16, metaitem('dynamite') * 4, item('gregtech:itnt') * 2]) {
	builder.copy()
		.explosivesType(explosive)
		.buildAndRegister()
}

if (LabsModeHelper.normal) {
	// Assembly Control Casing (Change from Output 2 to Output 4)
	replaceRecipeOutput(item('gregtech:multiblock_casing', 3) * 2, item('gregtech:multiblock_casing', 3) * 4)

	// Sterilizing Filter
	crafting.replaceShaped(metaitem('blacklight'), [
		[metaitem('screwTungstenCarbide'), metaitem('plateTungstenCarbide'), metaitem('screwTungstenCarbide')],
		[null, metaitem('springHssg'), null],
		[ore('circuitIv'), metaitem('plateTungstenCarbide'), metaitem('cableGtSinglePlatinum')]
	])

	// Sterilizing Filter Casing
	replaceRecipeShaped(item('gregtech:cleanroom_casing', 2) * 2, item('gregtech:cleanroom_casing', 2) * 1, [
		[metaitem('pipeLargeFluidPolybenzimidazole'), metaitem('emitter.luv'), metaitem('pipeLargeFluidPolybenzimidazole')],
		[metaitem('item_filter'), metaitem('blacklight'), metaitem('item_filter')],
		[metaitem('electric.motor.luv'), ore('frameGtBlackSteel'), metaitem('rotorIridium')]
	])

	// Computer Casing
	mods.gregtech.assembler.recipeBuilder()
		.inputs(metaitem('frameIridium'), metaitem('plateIridium') * 6, ore('circuitLuv') * 2, metaitem('wireFineCobalt') * 64, metaitem('wireFineCopper') * 64, metaitem('wireGtSingleVanadiumGallium') * 4)
		.outputs(item('gregtech:computer_casing') * 4)
		.changeRecycling()
		.duration(400).EUt(VA[LuV])
		.replace().buildAndRegister()
}

// UHV Batbufs
createRecipe(metaitem('battery_buffer.uhv.4'), [
	[metaitem('wireGtQuadrupleEuropium'), ore('chestWood'), metaitem('wireGtQuadrupleEuropium')],
	[metaitem('wireGtQuadrupleEuropium'), metaitem('hull.uhv'), metaitem('wireGtQuadrupleEuropium')]
])
createRecipe(metaitem('battery_buffer.uhv.8'), [
	[metaitem('wireGtOctalEuropium'), ore('chestWood'), metaitem('wireGtOctalEuropium')],
	[metaitem('wireGtOctalEuropium'), metaitem('hull.uhv'), metaitem('wireGtOctalEuropium')]
])
createRecipe(metaitem('battery_buffer.uhv.16'), [
	[metaitem('wireGtHexEuropium'), ore('chestWood'), metaitem('wireGtHexEuropium')],
	[metaitem('wireGtHexEuropium'), metaitem('hull.uhv'), metaitem('wireGtHexEuropium')]
])
// UHV Turbo Charger
createRecipe(metaitem('charger.uhv'), [
	[metaitem('wireGtQuadrupleEuropium'), ore('chestWood'), metaitem('wireGtQuadrupleEuropium')],
	[metaitem('wireGtQuadrupleEuropium'), metaitem('hull.uhv'), metaitem('wireGtQuadrupleEuropium')],
	[metaitem('cableGtSingleEuropium'), ore('circuitUhv'), metaitem('cableGtSingleEuropium')]
])

// HM Ore Drilling Plants
if (LabsModeHelper.expert) {
	// Must Remove Manually as RecipeMap changed
	mods.gregtech.assembler.removeByOutput([metaitem('large_miner.iv')], null)
	mods.gregtech.assembler.removeByOutput([metaitem('large_miner.luv')], null)

	mods.gregtech.assembler.recipeBuilder()
		.inputs(metaitem('hull.iv'))
		.inputWildNBT(item('redstonearsenal:tool.pickaxe_flux'))
		.inputs(item('nomilabs:t3laser') * 12, metaitem('frameStainlessSteel') * 12, metaitem('sensor.iv') * 6, metaitem('conveyor.module.iv') * 12, metaitem('fluid.regulator.iv') * 12, metaitem('gearTungstenSteel') * 12)
		.outputs(metaitem('large_miner.ev'))
		.duration(400).EUt(VA[IV])
		.replace().buildAndRegister()

	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('hull.zpm'))
		.inputWildNBT(item('thermalinnovation:drill', 4))
		.inputWildNBT(item('thermalinnovation:drill', 4))
		.inputWildNBT(item('thermalinnovation:drill', 4))
		.inputs(item('nomilabs:t3laser') * 12, metaitem('frameNaquadahAlloy') * 12, metaitem('sensor.zpm') * 6, metaitem('conveyor.module.zpm') * 12, metaitem('fluid.regulator.zpm') * 12, metaitem('cableGtSingleVanadiumGallium') * 12, item('moreplates:empowered_void_gear') * 12)
		.fluidInputs(fluid('concrete') * 2304)
		.outputs(metaitem('large_miner.iv'))
		.stationResearch(b -> b.researchStack(metaitem('large_miner.ev')).CWUt(16))
		.duration(800).EUt(VA[ZPM])
		.buildAndRegister()

	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('hull.uhv'))
		.inputWildNBT(item('draconicevolution:draconic_staff_of_power'))
		.inputs(item('nomilabs:t3laser') * 12, metaitem('frameBerkelium') * 12, metaitem('sensor.uv') * 12, metaitem('conveyor.module.uv') * 24, metaitem('fluid.regulator.uv') * 24, metaitem('cableGtSingleEuropium') * 12, metaitem('nomilabs:gearAwakenedDraconium') * 12)
		.fluidInputs(fluid('concrete') * 2304, fluid('taranium') * 576)
		.outputs(metaitem('large_miner.luv'))
		.stationResearch(b -> b.researchStack(metaitem('large_miner.iv')).CWUt(128))
		.duration(800).EUt(VA[UHV])
		.buildAndRegister()
}

// World Accelerator HV
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('hull.luv'), metaitem('field.generator.luv') * 64, metaitem('field.generator.luv') * 16, metaitem('sensor.luv') * 20, metaitem('emitter.luv') * 20, ore('circuitLuv') * 16, metaitem('plateDoubleIridium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
	.outputs(metaitem('world_accelerator.hv'))
	.changeRecycling()
	.stationResearch(b -> b.researchStack(item('minecraft:clock')).CWUt(4))
	.duration(6000).EUt(VA[LuV])
	.buildAndRegister()

// World Accelerator EV
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('hull.zpm'), metaitem('field.generator.zpm') * 64, metaitem('field.generator.zpm') * 16, metaitem('sensor.zpm') * 20, metaitem('emitter.zpm') * 20, ore('circuitZpm') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
	.outputs(metaitem('world_accelerator.ev'))
	.changeRecycling()
	.stationResearch(b -> b.researchStack(metaitem('world_accelerator.hv')).CWUt(32).EUt(VH[ZPM]))
	.duration(12000).EUt(VA[ZPM])
	.buildAndRegister()

// World Accelerator IV
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('hull.uv'), metaitem('field.generator.uv') * 64, metaitem('field.generator.uv') * 16, metaitem('sensor.uv') * 20, metaitem('emitter.uv') * 20, ore('circuitUv') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('plateDenseNeutronium') * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152, fluid('naquadria') * 576)
	.outputs(metaitem('world_accelerator.iv'))
	.changeRecycling()
	.stationResearch(b -> b.researchStack(metaitem('world_accelerator.ev')).CWUt(128).EUt(VA[UV]))
	.duration(12000).EUt(VA[UV])
	.buildAndRegister()
