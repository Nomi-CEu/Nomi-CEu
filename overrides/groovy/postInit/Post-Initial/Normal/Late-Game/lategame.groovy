import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*
import com.nomiceu.nomilabs.util.LabsModeHelper

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
		[[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
		 [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
		 [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])

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
		.duration(6000).EUt(30720)
		.buildAndRegister()

// World Accelerator EV
mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('hull.zpm'), metaitem('field.generator.zpm') * 64, metaitem('field.generator.zpm') * 16, metaitem('sensor.zpm') * 20, metaitem('emitter.zpm') * 20, ore('circuitZpm') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2)
		.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
		.outputs(metaitem('world_accelerator.ev'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(metaitem('world_accelerator.hv')).CWUt(32).EUt(122880))
		.duration(12000).EUt(122880)
		.buildAndRegister()

// World Accelerator IV
mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('hull.uv'), metaitem('field.generator.uv') * 64, metaitem('field.generator.uv') * 16, metaitem('sensor.uv') * 20, metaitem('emitter.uv') * 20, ore('circuitUv') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('plateDenseNeutronium') * 2)
		.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152, fluid('naquadria') * 576)
		.outputs(metaitem('world_accelerator.iv'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(metaitem('world_accelerator.ev')).CWUt(128).EUt(491520))
		.duration(12000).EUt(491520)
		.buildAndRegister()

// Computer Casing
if (LabsModeHelper.normal) {
	// Computer Casing * 2
	mods.gregtech.assembler.removeByInput(30720, [metaitem('frameIridium'), metaitem('plateIridium') * 6, metaitem('circuit.nano_mainframe'), metaitem('wireFineCobalt') * 32, metaitem('wireFineCopper') * 32, metaitem('wireGtSingleVanadiumGallium') * 2], null)

	mods.gregtech.assembler.recipeBuilder()
		.inputs(metaitem('frameIridium'), metaitem('plateIridium') * 6, metaitem('circuit.nano_mainframe') * 2, metaitem('wireFineCobalt') * 64, metaitem('wireFineCopper') * 64, metaitem('wireGtSingleVanadiumGallium') * 4)
		.outputs(item('gregtech:computer_casing') * 4)
		.changeRecycling()
		.duration(400).EUt(30720)
		.buildAndRegister();
} 