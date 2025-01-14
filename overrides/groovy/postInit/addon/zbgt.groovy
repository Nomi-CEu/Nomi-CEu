// MODS_LOADED: zbgt
// ^, Makes the script not run as long as ZBGT isn't a mod in the player's instance.

package postInit.addon

import gregtech.api.recipes.builders.AssemblyLineRecipeBuilder
import gregtech.api.recipes.recipeproperties.ResearchProperty
import com.nomiceu.nomilabs.util.LabsModeHelper

import static gregtech.api.GTValues.*

// TODO: Implement the Creative computing hatch and Creative data hatch

/* Creative item Recipes */

// Remove default recipes

// Energy Source Hatch
crafting.remove('zbgt:creative_energy_sink_to_energy_source')
crafting.remove('zbgt:creative_emitter_to_energy_hatch')
crafting.remove('zbgt:creative_energy_hatch_to_emitter')

// Creative Item Bus (Useless since you already have chest)
crafting.remove('zbgt:creative_item_bus_to_chest')
crafting.remove('zbgt:creative_chest_to_item_bus')

// Creative Tank
crafting.remove('zbgt:creative_fluid_hatch_to_tank')
crafting.remove('zbgt:creative_tank_to_fluid_hatch')

// Add new recipes

if (LabsModeHelper.normal) {
	// NM Specific

	// Creative Fluid Source Hatch
	mods.gregtech.creative_tank_provider.recipeBuilder()
		.notConsumable(item('nomilabs:creativeportabletankmold'))
		.inputs(metaitem('reservoir_hatch'))
		.outputs(metaitem('zbgt:creative_reservoir_hatch'))
		.duration(500).EUt(1000000) // Value to stay consistent with regular tank recipe
		.buildAndRegister()

	// Energy Source Hatch
	mods.gregtech.precise_assembler_recipes.recipeBuilder()
		.notConsumable(metaitem('infinite_energy'))
		.inputs(metaitem('transformer.adjustable.uv') * 64,
			metaitem('laser_hatch.source_4096a.uv') * 4
		)
		.inputWildNBT(metaitem('max.battery'))
		.fluidInputs(fluid('soldering_alloy') * 9216,
			fluid('polybenzimidazole') * 18432,
			fluid('naquadria') * 2304,
			fluid('omnium') * 1440
		)
		.outputs(metaitem('zbgt:creative_energy_source'))
		.casingTier(4)
		.duration(200).EUt(VA[UHV])
		.buildAndRegister()
} else {
	// HM Specific

	// Energy Source Hatch
	mods.gregtech.universal_crystallizer.recipeBuilder()
		.notConsumable(metaitem('infinite_energy'))
		.inputs(metaitem('transformer.adjustable.uv') * 64,
			metaitem('nomilabs:wireGtHexOmnium') * 64,
			ore('circuitUhv') * 16,
			metaitem('field.generator.uv') * 16,
			metaitem('sensor.uv') * 16,
			metaitem('laser_hatch.source_4096a.uv') * 4
		)
		.inputWildNBT(metaitem('max.battery'))
		.fluidInputs(fluid('naquadria') * 82944) // 64 Blocks
		.outputs(metaitem('zbgt:creative_energy_source'))
		.duration(200).EUt(VA[UHV])
		.buildAndRegister()
}

// Creative Coils
mods.gregtech.precise_assembler_recipes.recipeBuilder()
	.inputs(item('avaritia:resource', 5), item('gregtech:wire_coil', 7) * 512)
	.fluidInputs(fluid('neutronium') * 512000, fluid('pyrotheum') * 20000000)
	.outputs(item('zbgt:creative_heating_coil'))
	.casingTier(4)
	.duration(200).EUt(VA[MAX])
	.buildAndRegister()


/* Mega Multiblocks Recipes */

// Cracker
// Remove default recipes
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_ocu')], null)

// New Recipe
mods.gregtech.assembler.recipeBuilder()
	.inputs(metaitem('cracker') * 64,
		metaitem('gcym:frameWatertightSteel') * 64,
		ore('circuitLuv') * 16,
		item('gcym:unique_casing', 4) * 16,
		metaitem('electric.pump.iv') * 16,
		metaitem('pipeNormalFluidPolybenzimidazole') * 16
	)
	.fluidInputs(fluid('soldering_alloy') * 9216)
	.outputs(metaitem('zbgt:mega_ocu'))
	.duration(1200).EUt(VA[IV])
	.buildAndRegister()

// Mega Electric Blast Furnace
// Remove default recipes
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_ebf')], null)

// New Recipes
if (LabsModeHelper.normal) {
	// New NM Recipe
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('electric_blast_furnace') * 64,
			metaitem('frameNaquadahAlloy') * 64,
			ore('circuitUv') * 16,
			metaitem('field.generator.luv') * 16,
			metaitem('springNaquadahAlloy') * 16,
			metaitem('plateDenseNaquadahAlloy') * 16,
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16
		)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_ebf'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:mega_blast_furnace')).CWUt(16))
		.duration(1200).EUt(VA[LuV])
		.buildAndRegister()
} else {
	// New HM Recipe
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('electric_blast_furnace') * 64,
			metaitem('frameTritanium') * 64,
			ore('circuitUhv') * 16,
			metaitem('field.generator.uv') * 16,
			metaitem('springTritanium') * 16,
			metaitem('plateTritanium') * 16,
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16
		)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_ebf'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:mega_blast_furnace')).CWUt(128).EUt(VA[UHV]))
		.duration(1200).EUt(VA[UV])
		.buildAndRegister()
}

// Mega Vacuum Freezer
// Remove default recipes
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_vf')], null)

// New Recipes
if (LabsModeHelper.normal) {
	// New NM Recipe
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('vacuum_freezer') * 64,
			metaitem('frameNaquadahAlloy') * 64,
			ore('circuitUv') * 16,
			metaitem('field.generator.luv') * 16,
			metaitem('pipeNormalFluidNaquadah') * 16,
			metaitem('plateDenseNaquadahAlloy') * 16,
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16
		)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_vf'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:mega_vacuum_freezer')).CWUt(16))
		.duration(1200).EUt(VA[LuV])
		.buildAndRegister()
} else {
	// New HM Recipe
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('vacuum_freezer') * 64,
			metaitem('frameDuranium') * 64,
			ore('circuitUhv') * 16,
			metaitem('field.generator.uv') * 16,
			metaitem('pipeNormalFluidDuranium') * 16,
			metaitem('plateDenseTritanium') * 16,
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16
		)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_vf'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:mega_vacuum_freezer')).CWUt(128).EUt(VA[UHV]))
		.duration(1200).EUt(VA[UV])
		.buildAndRegister()
}

// Mega Alloy Blast Smelter
// Remove default recipes
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_abs')], null)

// New Recipes
if (LabsModeHelper.normal) {
	// New NM Recipe
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('gcym:alloy_blast_smelter') * 64,
			metaitem('nomilabs:frameAwakenedDraconium') * 64,
			ore('circuitUv') * 16,
			metaitem('field.generator.luv') * 16,
			metaitem('nomilabs:ringAwakenedDraconium') * 16,
			metaitem('nomilabs:plateAwakenedDraconium') * 16,
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16
		)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_abs'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:alloy_blast_smelter')).CWUt(16))
		.duration(1200).EUt(VA[LuV])
		.buildAndRegister()
} else {
	// New HM Recipe
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('gcym:alloy_blast_smelter') * 64,
			metaitem('frameTritanium') * 64,
			ore('circuitUhv') * 16,
			metaitem('field.generator.uv') * 16,
			metaitem('ringTritanium') * 16,
			metaitem('nomilabs:plateTaranium') * 16,
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16
		)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_abs'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:alloy_blast_smelter')).CWUt(128).EUt(VA[UHV]))
		.duration(1200).EUt(VA[UV])
		.buildAndRegister()
}
