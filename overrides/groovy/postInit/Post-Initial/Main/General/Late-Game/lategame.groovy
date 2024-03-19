import com.nomiceu.nomilabs.util.LabsModeHelper

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*
import static gregtech.api.GTValues.*

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

// Universal Crystallizer (HM Only)
if (LabsModeHelper.expert) {
	mods.gregtech.assembly_line.recipeBuilder()
			.inputs(metaitem('gcym:large_autoclave') * 24, item('packagedexcrafting:combination_crafter') * 24, metaitem('emitter.uv') * 24, metaitem('field.generator.uv') * 24, ore('circuitUhv') * 64, item('gregtech:wire_coil', 7) * 64, item('draconicevolution:reactor_component') * 24, item('draconicevolution:crafting_injector', 3) * 8, item('moreplates:infinity_plate') * 12)
			.fluidInputs(fluid('cryotheum') * 36864, fluid('moltenempowereddiamatine') * 18432, fluid('naquadria') * 63216, fluid('taranium') * 4608)
			.outputs(metaitem('nomilabs:universal_crystallizer'))
			.changeRecycling()
			.stationResearch(b -> b.researchStack(item('gregtech:wire_coil', 7)).CWUt(128))
			.duration(900).EUt(VA[UHV])
			.buildAndRegister()
}