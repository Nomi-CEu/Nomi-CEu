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
for(int i = 3; i <= 9; i++) {
	mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', i))
}


/* Unwrap craft for Wraps */
def wraps = [
	(item('zbgt:zbgt_meta_item', 57)): item('zbgt:zbgt_meta_item', 26), // Wrap of Generic ULV Circuit -> Generic ULV Circuit
	(item('zbgt:zbgt_meta_item', 58)): item('zbgt:zbgt_meta_item', 27), // Wrap of Generic LV Circuit -> Generic LV Circuit
	(item('zbgt:zbgt_meta_item', 59)): item('zbgt:zbgt_meta_item', 28), // Wrap of Generic MV Circuit -> Generic MV Circuit
	(item('zbgt:zbgt_meta_item', 60)): item('zbgt:zbgt_meta_item', 29), // Wrap of Generic HV Circuit -> Generic HV Circuit
	(item('zbgt:zbgt_meta_item', 61)): item('zbgt:zbgt_meta_item', 30), // Wrap of Generic EV Circuit -> Generic EV Circuit
	(item('zbgt:zbgt_meta_item', 62)): item('zbgt:zbgt_meta_item', 31), // Wrap of Generic IV Circuit -> Generic IV Circuit
	(item('zbgt:zbgt_meta_item', 63)): item('zbgt:zbgt_meta_item', 32), // Wrap of Generic LUV Circuit -> Generic LUV Circuit
	(item('zbgt:zbgt_meta_item', 64)): item('zbgt:zbgt_meta_item', 33), // Wrap of Generic ZPM Circuit -> Generic ZPM Circuit
	(item('zbgt:zbgt_meta_item', 65)): item('zbgt:zbgt_meta_item', 34), // Wrap of Generic UV Circuit -> Generic UV Circuit
	(item('zbgt:zbgt_meta_item', 66)): item('zbgt:zbgt_meta_item', 35), // Wrap of Generic UHV Circuit -> Generic UHV Circuit
	(item('zbgt:zbgt_meta_item', 72)): metaitem('component.smd.capacitor'), // Wrap of SMD Capacitor
	(item('zbgt:zbgt_meta_item', 73)): metaitem('component.smd.diode'), // Wrap of SMD Diode
	(item('zbgt:zbgt_meta_item', 74)): metaitem('component.smd.inductor'), // Wrap of SMD Inductor
	(item('zbgt:zbgt_meta_item', 75)): metaitem('component.smd.resistor'), // Wrap of SMD Resistor
	(item('zbgt:zbgt_meta_item', 76)): metaitem('component.smd.transistor'), // Wrap of SMD Transistor
	(item('zbgt:zbgt_meta_item', 77)): metaitem('component.advanced_smd.capacitor'), // Wrap of Advanced SMD Capacitor
	(item('zbgt:zbgt_meta_item', 78)): metaitem('component.advanced_smd.diode'), // Wrap of Advanced SMD Diode
	(item('zbgt:zbgt_meta_item', 79)): metaitem('component.advanced_smd.inductor'), // Wrap of Advanced SMD Inductor
	(item('zbgt:zbgt_meta_item', 80)): metaitem('component.advanced_smd.resistor'), // Wrap of Advanced SMD Resistor
	(item('zbgt:zbgt_meta_item', 81)): metaitem('component.advanced_smd.transistor'), // Wrap of Advanced SMD Transistor
	(item('zbgt:zbgt_meta_item', 82)): metaitem('board.coated'), // Wrap of Coated Circuit Board
	(item('zbgt:zbgt_meta_item', 83)): metaitem('board.phenolic'), // Wrap of Phenolic Circuit Board
	(item('zbgt:zbgt_meta_item', 84)): metaitem('board.plastic'), // Wrap of Plastic Circuit Board
	(item('zbgt:zbgt_meta_item', 85)): metaitem('board.epoxy'), // Wrap of Epoxy Circuit Board
	(item('zbgt:zbgt_meta_item', 86)): metaitem('board.fiber_reinforced'), // Wrap of Fiber Reinforced Circuit Board
	(item('zbgt:zbgt_meta_item', 87)): metaitem('board.multilayer.fiber_reinforced'), // Wrap of Multilayer Fiber Reinforced Circuit Board
	(item('zbgt:zbgt_meta_item', 88)): metaitem('board.wetware'), // Wrap of Wetware Circuit Board
	(item('zbgt:zbgt_meta_item', 89)): metaitem('circuit_board.basic'), // Wrap of Basic Circuit Board
	(item('zbgt:zbgt_meta_item', 90)): metaitem('circuit_board.good'), // Wrap of Good Circuit Board
	(item('zbgt:zbgt_meta_item', 91)): metaitem('circuit_board.plastic'), // Wrap of Plastic Circuit Board
	(item('zbgt:zbgt_meta_item', 92)): metaitem('circuit_board.advanced'), // Wrap of Advanced Circuit Board
	(item('zbgt:zbgt_meta_item', 93)): metaitem('circuit_board.elite'), // Wrap of Elite Circuit Board
	(item('zbgt:zbgt_meta_item', 94)): metaitem('circuit_board.extreme'), // Wrap of Extreme Circuit Board
	(item('zbgt:zbgt_meta_item', 95)): metaitem('circuit_board.wetware'), // Wrap of Master Circuit Board
	(item('zbgt:zbgt_meta_item', 96)): metaitem('plate.simple_system_on_chip'), // Wrap of Simple SoC
	(item('zbgt:zbgt_meta_item', 97)): metaitem('plate.system_on_chip'), // Wrap of SoC
	(item('zbgt:zbgt_meta_item', 98)): metaitem('plate.advanced_system_on_chip'), // Wrap of Advanced SoC
	(item('zbgt:zbgt_meta_item', 99)): metaitem('plate.highly_advanced_system_on_chip'), // Wrap of Highly Advanced SoC
	(item('zbgt:zbgt_meta_item', 100)): metaitem('plate.central_processing_unit'), // Wrap of CPU
	(item('zbgt:zbgt_meta_item', 101)): metaitem('plate.nano_central_processing_unit'), // Wrap of Nano CPU
	(item('zbgt:zbgt_meta_item', 102)): metaitem('plate.qbit_central_processing_unit'), // Wrap of Qubit CPU
	(item('zbgt:zbgt_meta_item', 103)): metaitem('plate.ultra_low_power_integrated_circuit'), // Wrap of Ultra Low Power IC
	(item('zbgt:zbgt_meta_item', 104)): metaitem('plate.low_power_integrated_circuit'), // Wrap of Low Power IC
	(item('zbgt:zbgt_meta_item', 105)): metaitem('plate.power_integrated_circuit'), // Wrap of Power IC
	(item('zbgt:zbgt_meta_item', 106)): metaitem('plate.high_power_integrated_circuit'), // Wrap of High Power IC
	(item('zbgt:zbgt_meta_item', 107)): metaitem('plate.ultra_high_power_integrated_circuit'), // Wrap of Ultra High Power IC
	(item('zbgt:zbgt_meta_item', 108)): metaitem('plate.random_access_memory'), // Wrap of RAM
	(item('zbgt:zbgt_meta_item', 109)): metaitem('plate.nor_memory_chip'), // Wrap of NOR Chip
	(item('zbgt:zbgt_meta_item', 110)): metaitem('plate.nand_memory_chip'), // Wrap of NAND Chip
	(item('zbgt:zbgt_meta_item', 111)): metaitem('plate.integrated_logic_circuit'), // Wrap of Integrated Logic Circuit
	(item('zbgt:zbgt_meta_item', 112)): metaitem('processor.neuro'), // Wrap of Neuro Processsing Unit
	(item('zbgt:zbgt_meta_item', 113)): metaitem('engraved.crystal_chip'), // Wrap of Engraved Crystal Chip
	(item('zbgt:zbgt_meta_item', 114)): metaitem('crystal.central_processing_unit'), // Wrap of Chrystal CPU
	(item('zbgt:zbgt_meta_item', 115)): metaitem('crystal.system_on_chip') // Wrap of Crystal SoC
]

wraps.each { wrap, output ->
	mods.gregtech.assembler.recipeBuilder()
		.inputs(wrap)
		.circuitMeta(1)
		.outputs(output * 16)
		.duration(100).EUt(VA[LV])
		.buildAndRegister()
}


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
def dropperCoverRecipes = [
	'lv': item('zbgt:zbgt_meta_item', 117), // LV Dropper Cover
	'mv': item('zbgt:zbgt_meta_item', 118), // MV Dropper Cover
	'hv': item('zbgt:zbgt_meta_item', 119), // HV Dropper Cover
	'ev': item('zbgt:zbgt_meta_item', 120), // EV Dropper Cover
	'iv': item('zbgt:zbgt_meta_item', 121) // IV Dropper Cover
]
def eut = ['lv': VA[LV], 'mv': VA[MV], 'hv': VA[HV], 'ev': VA[EV], 'iv': VA[IV]]

dropperCoverRecipes.each { tier, output ->
	mods.gregtech.assembler.recipeBuilder()
		.inputs(
			metaitem("conveyor.module.${tier.toLowerCase()}"),
			item('minecraft:dropper'),
			ore("circuit${tier.capitalize()}"),
			metaitem("electric.piston.${tier.toLowerCase()}")
		)
		.outputs(output)
		.duration(200).EUt(eut[tier])
		.buildAndRegister()
}

// Remove higher tier blocks from JEI
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 9)) // Component Assembly Line Casing (UHV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 10)) // Component Assembly Line Casing (UEV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 11)) // Component Assembly Line Casing (UIV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 12)) // Component Assembly Line Casing (UXV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 13)) // Component Assembly Line Casing (OpV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 14)) // Component Assembly Line Casing (MAX)
