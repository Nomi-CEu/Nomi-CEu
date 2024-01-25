import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*
import static gregtech.api.recipes.RecipeMaps.*

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
ASSEMBLY_LINE_RECIPES.recipeBuilder()
		.inputs(metaitem('hull.luv'), metaitem('field.generator.luv') * 64, metaitem('field.generator.luv') * 16, metaitem('sensor.luv') * 20, metaitem('emitter.luv') * 20, ore('circuitLuv') * 16, metaitem('plateDoubleIridium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2)
		.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
		.outputs(metaitem('world_accelerator.hv'))
		.stationResearch(b -> b.researchStack(item('minecraft:clock')).CWUt(4))
		.duration(6000).EUt(30720)
		.buildAndRegister()
changeStackRecycling(metaitem('world_accelerator.hv'), [metaitem('hull.luv'), metaitem('field.generator.luv') * 64, metaitem('field.generator.luv') * 16, metaitem('sensor.luv') * 20, metaitem('emitter.luv') * 20, ore('circuitLuv') * 16, metaitem('plateDoubleIridium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2])

// World Accelerator EV
ASSEMBLY_LINE_RECIPES.recipeBuilder()
		.inputs(metaitem('hull.zpm'), metaitem('field.generator.zpm') * 64, metaitem('field.generator.zpm') * 16, metaitem('sensor.zpm') * 20, metaitem('emitter.zpm') * 20, ore('circuitZpm') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2)
		.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
		.outputs(metaitem('world_accelerator.ev'))
		.stationResearch(b -> b.researchStack(metaitem('world_accelerator.hv')).CWUt(32).EUt(122880))
		.duration(12000).EUt(122880)
		.buildAndRegister()
changeStackRecycling(metaitem('world_accelerator.ev'), [metaitem('hull.zpm'), metaitem('field.generator.zpm') * 64, metaitem('field.generator.zpm') * 16, metaitem('sensor.zpm') * 20, metaitem('emitter.zpm') * 20, ore('circuitZpm') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('nomilabs:plateDenseDraconium') * 2])

// World Accelerator IV
ASSEMBLY_LINE_RECIPES.recipeBuilder()
		.inputs(metaitem('hull.uv'), metaitem('field.generator.uv') * 64, metaitem('field.generator.uv') * 16, metaitem('sensor.uv') * 20, metaitem('emitter.uv') * 20, ore('circuitUv') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('plateDenseNeutronium') * 2)
		.fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152, fluid('naquadria') * 576)
		.outputs(metaitem('world_accelerator.iv'))
		.stationResearch(b -> b.researchStack(metaitem('world_accelerator.ev')).CWUt(128).EUt(491520))
		.duration(12000).EUt(491520)
		.buildAndRegister()
changeStackRecycling(metaitem('world_accelerator.iv'), [metaitem('hull.uv'), metaitem('field.generator.uv') * 64, metaitem('field.generator.uv') * 16, metaitem('sensor.uv') * 20, metaitem('emitter.uv') * 20, ore('circuitUv') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('plateDenseNeutronium') * 2])