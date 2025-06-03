// MODS_LOADED: zbgt
// ^, Makes the script not run as long as ZBGT isn't a mod in the player's instance.

package postInit.addon

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
mods.jei.ingredient.removeAndHide(item('gregtech:machine', 18008)) // Creative Item Bus

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
			metaitem('plateNaquadahAlloy') * 16,
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
			metaitem('plateNaquadahAlloy') * 16,
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
			metaitem('plateTritanium') * 16,
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

/* YOTTank Cells */
// Add new recipes for YOTTank Cells
mods.gregtech.assembler.recipeBuilder()
	.inputs(
		item('gregtech:hermetic_casing', 0),
		metaitem('field.generator.lv'),
		ore('circuitLv') * 4,
		metaitem('plateSteel') * 4
	)
	.outputs(item('zbgt:yottank_cell', 0))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(
		item('gregtech:hermetic_casing', 4),
		metaitem('field.generator.hv') * 2,
		ore('circuitIv') * 4,
		metaitem('plateTungstenSteel') * 4
	)
	.outputs(item('zbgt:yottank_cell', 1))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(
		item('gregtech:hermetic_casing', 8),
		metaitem('field.generator.uv') * 2,
		ore('circuitUv') * 4,
		metaitem('plateNeutronium') * 4
	)
	.outputs(item('zbgt:yottank_cell', 2))
	.duration(100).EUt(VA[UV])
	.buildAndRegister()

// Remove other YOTTank Cells from JEI
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 3))
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 4))
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 5))
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 6))
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 7))
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 8))
mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', 9))


/* Wraps */
// Remove unused wrap crafts and from JEI
// Wrap of Circuite board and SoC not removed, since other tiers have uses
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 57)], null) // Wrap of ULV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 57))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 58)], null) // Wrap of LV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 58))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 59)], null) // Wrap of MV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 59))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 60)], null) // Wrap of HV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 60))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 61)], null) // Wrap of EV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 61))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 62)], null) // Wrap of IV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 62))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 63)], null) // Wrap of LUV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 63))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 64)], null) // Wrap of ZPM Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 64))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 65)], null) // Wrap of UV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 65))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 66)], null) // Wrap of UHV Circuit
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 66))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 103)], null) // Wrap of PIC Ultra Low Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 103))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 104)], null) // Wrap of PIC Low Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 104))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 105)], null) // Wrap of PIC Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 105))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 106)], null) // Wrap of PIC High Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 106))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 107)], null) // Wrap of PIC Ultra High Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 107))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 111)], null) // Wrap of Integrated Logic Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 111))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 113)], null) // Wrap of Engraved Crystal Chip
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 113))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 82)], null) // Wrap of Coated Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 82))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 83)], null) // Wrap of Phenolic Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 83))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 84)], null) // Wrap of Plastic Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 84))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 85)], null) // Wrap of Epoxy Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 85))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 86)], null) // Wrap of Fiber Reinforced Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 86))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 87)], null) // Wrap of Multilayer Fiber Reinforced Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 87))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 88)], null) // Wrap of Wetware Board
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 88))

// Add unwrap Crafts
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 72)) // Wrap of SMD Capacitor
	.circuitMeta(1)
	.outputs(metaitem('component.smd.capacitor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 73)) // Wrap of SMD Diode
	.circuitMeta(1)
	.outputs(metaitem('component.smd.diode') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 74)) // Wrap of SMD Inductor
	.circuitMeta(1)
	.outputs(metaitem('component.smd.inductor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 75)) // Wrap of SMD Resistor
	.circuitMeta(1)
	.outputs(metaitem('component.smd.resistor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 76)) // Wrap of SMD Transistor
	.circuitMeta(1)
	.outputs(metaitem('component.smd.transistor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 77)) // Wrap of Advanced SMD Capacitor
	.circuitMeta(1)
	.outputs(metaitem('component.advanced_smd.capacitor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 78)) // Wrap of Advanced SMD Diode
	.circuitMeta(1)
	.outputs(metaitem('component.advanced_smd.diode') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 79)) // Wrap of Advanced SMD Inductor
	.circuitMeta(1)
	.outputs(metaitem('component.advanced_smd.inductor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 80)) // Wrap of Advanced SMD Resistor
	.circuitMeta(1)
	.outputs(metaitem('component.advanced_smd.resistor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 81)) // Wrap of Advanced SMD Transistor
	.circuitMeta(1)
	.outputs(metaitem('component.advanced_smd.transistor') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 89)) // Wrap of Basic Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.basic') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 90)) // Wrap of Good Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.good') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 91)) // Wrap of Plastic Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.plastic') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 92)) // Wrap of Advanced Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.advanced') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 93)) // Wrap of Elite Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.elite') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 94)) // Wrap of Extreme Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.extreme') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 95)) // Wrap of Master Circuit Board
	.circuitMeta(1)
	.outputs(metaitem('circuit_board.wetware') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 96)) // Wrap of Simple SoC
	.circuitMeta(1)
	.outputs(metaitem('plate.simple_system_on_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 97)) // Wrap of SoC
	.circuitMeta(1)
	.outputs(metaitem('plate.system_on_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 98)) // Wrap of Advanced SoC
	.circuitMeta(1)
	.outputs(metaitem('plate.advanced_system_on_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 99)) // Wrap of Highly Advanced SoC
	.circuitMeta(1)
	.outputs(metaitem('plate.highly_advanced_system_on_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 100)) // Wrap of CPU
	.circuitMeta(1)
	.outputs(metaitem('plate.central_processing_unit') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 101)) // Wrap of Nano CPU
	.circuitMeta(1)
	.outputs(metaitem('plate.nano_central_processing_unit') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 102)) // Wrap of Qubit CPU
	.circuitMeta(1)
	.outputs(metaitem('plate.qbit_central_processing_unit') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 108)) // Wrap of RAM
	.circuitMeta(1)
	.outputs(metaitem('plate.random_access_memory') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 109)) // Wrap of NOR Chip
	.circuitMeta(1)
	.outputs(metaitem('plate.nor_memory_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 110)) // Wrap of NAND Chip
	.circuitMeta(1)
	.outputs(metaitem('plate.nand_memory_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 112)) // Wrap of Neuro Processsing Unit
	.circuitMeta(1)
	.outputs(metaitem('processor.neuro') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 114)) // Wrap of Chrystal CPU
	.circuitMeta(1)
	.outputs(metaitem('crystal.central_processing_unit') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('zbgt:zbgt_meta_item', 115)) // Wrap of Crystal SoC
	.circuitMeta(1)
	.outputs(metaitem('crystal.system_on_chip') * 16)
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

/* Cells */
// Remove unused cells from JEI
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 133)) // 180K Space Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 134)) // 360K Space Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 135)) // 540K Space Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 136)) // 1080K Space Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 143)) // 180K SP Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 144)) // 360K SP Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 145)) // 540K SP Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 146)) // 1080K SP Coolant Cell

// Remove unused filled cell recipes and from JEI
mods.gregtech.canner.removeByOutput([item('zbgt:zbgt_meta_item', 137)], null) // 60K HE Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 137))
mods.gregtech.canner.removeByOutput([item('zbgt:zbgt_meta_item', 138)], null) // 180K HE Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 138))
mods.gregtech.canner.removeByOutput([item('zbgt:zbgt_meta_item', 140)], null) // 60K NaK Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 140))
mods.gregtech.canner.removeByOutput([item('zbgt:zbgt_meta_item', 141)], null) // 180K NaK Coolant Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 141))

// Remove smaller single craft cells, and compley 60K cell craft
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 130)], null) // 10K Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 130))
mods.gregtech.assembler.removeByOutput([item('zbgt:zbgt_meta_item', 131)], null) // 30K Cell
mods.jei.ingredient.removeAndHide(item('zbgt:zbgt_meta_item', 131))

mods.gregtech.assembler.removeByInput(120, [
		item('zbgt:zbgt_meta_item', 131) * 2, // 30K Cell * 2
		item('gregtech:meta_plate', 112) * 8, // Tin Plates * 8
		metaitem('circuit.integrated').withNbt(['Configuration': 1])
	], null)

/* Dropper Cover Assembler recipes */
mods.gregtech.assembler.recipeBuilder()
	.inputs(
		metaitem('conveyor.module.lv'),
		item('minecraft:dropper'),
		ore('circuitLv'),
		metaitem('electric.piston.lv')
	)
	.outputs(item('zbgt:zbgt_meta_item', 117)) // LV Dropper Cover
	.duration(200).EUt(VA[LV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(
		metaitem('conveyor.module.mv'),
		item('minecraft:dropper'),
		ore('circuitMv'),
		metaitem('electric.piston.mv')
	)
	.outputs(item('zbgt:zbgt_meta_item', 118)) // MV Dropper Cover
	.duration(200).EUt(VA[MV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(
		metaitem('conveyor.module.hv'),
		item('minecraft:dropper'),
		ore('circuitHv'),
		metaitem('electric.piston.hv')
	)
	.outputs(item('zbgt:zbgt_meta_item', 119)) // HV Dropper Cover
	.duration(200).EUt(VA[HV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(
		metaitem('conveyor.module.ev'),
		item('minecraft:dropper'),
		ore('circuitEv'),
		metaitem('electric.piston.ev')
	)
	.outputs(item('zbgt:zbgt_meta_item', 120)) // EV Dropper Cover
	.duration(200).EUt(VA[EV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(
		metaitem('conveyor.module.iv'),
		item('minecraft:dropper'),
		ore('circuitIv'),
		metaitem('electric.piston.iv')
	)
	.outputs(item('zbgt:zbgt_meta_item', 121)) // IV Dropper Cover
	.duration(200).EUt(VA[IV])
	.buildAndRegister()

// Remove other unused blocks from JEI
mods.jei.ingredient.removeAndHide(item('zbgt:misc_casing', 4)) // Compact Fusion Coil MK-II Prototype
mods.jei.ingredient.removeAndHide(item('zbgt:misc_casing', 5)) // Compact Fusion Coil MK-II Finaltype
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 9)) // Component Assembly Line Casing (UHV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 10)) // Component Assembly Line Casing (UEV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 11)) // Component Assembly Line Casing (UIV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 12)) // Component Assembly Line Casing (UXV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 13)) // Component Assembly Line Casing (OpV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 14)) // Component Assembly Line Casing (MAX)
