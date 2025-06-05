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
	(metaitem('zbgt:wrapped.circuit.ulv')): metaitem('zbgt:generic_circuit.ulv'),
	(metaitem('zbgt:wrapped.circuit.lv')): metaitem('zbgt:generic_circuit.lv'),
	(metaitem('zbgt:wrapped.circuit.mv')): metaitem('zbgt:generic_circuit.mv'),
	(metaitem('zbgt:wrapped.circuit.hv')): metaitem('zbgt:generic_circuit.hv'),
	(metaitem('zbgt:wrapped.circuit.ev')): metaitem('zbgt:generic_circuit.ev'),
	(metaitem('zbgt:wrapped.circuit.iv')): metaitem('zbgt:generic_circuit.iv'),
	(metaitem('zbgt:wrapped.circuit.luv')): metaitem('zbgt:generic_circuit.luv'),
	(metaitem('zbgt:wrapped.circuit.zpm')): metaitem('zbgt:generic_circuit.zpm'),
	(metaitem('zbgt:wrapped.circuit.uv')): metaitem('zbgt:generic_circuit.uv'),
	(metaitem('zbgt:wrapped.circuit.uhv')): metaitem('zbgt:generic_circuit.uhv'),
	(metaitem('zbgt:wrapped.smd.capacitor')): metaitem('component.smd.capacitor'),
	(metaitem('zbgt:wrapped.smd.diode')): metaitem('component.smd.diode'),
	(metaitem('zbgt:wrapped.smd.inductor')): metaitem('component.smd.inductor'),
	(metaitem('zbgt:wrapped.smd.resistor')): metaitem('component.smd.resistor'),
	(metaitem('zbgt:wrapped.smd.transistor')): metaitem('component.smd.transistor'),
	(metaitem('zbgt:wrapped.smd.advanced_capacitor')): metaitem('component.advanced_smd.capacitor'),
	(metaitem('zbgt:wrapped.smd.advanced_diode')): metaitem('component.advanced_smd.diode'),
	(metaitem('zbgt:wrapped.smd.advanced_inductor')): metaitem('component.advanced_smd.inductor'),
	(metaitem('zbgt:wrapped.smd.advanced_resistor')): metaitem('component.advanced_smd.resistor'),
	(metaitem('zbgt:wrapped.smd.advanced_transistor')): metaitem('component.advanced_smd.transistor'),
	(metaitem('zbgt:wrapped.board.coated')): metaitem('board.coated'),
	(metaitem('zbgt:wrapped.board.phenolic')): metaitem('board.phenolic'),
	(metaitem('zbgt:wrapped.board.plastic')): metaitem('board.plastic'),
	(metaitem('zbgt:wrapped.board.epoxy')): metaitem('board.epoxy'),
	(metaitem('zbgt:wrapped.board.fiber_reinforced')): metaitem('board.fiber_reinforced'),
	(metaitem('zbgt:wrapped.board.multilayer_fiber_reinforced')): metaitem('board.multilayer.fiber_reinforced'),
	(metaitem('zbgt:wrapped.board.wetware')): metaitem('board.wetware'),
	(metaitem('zbgt:wrapped.circuit_board.basic')): metaitem('circuit_board.basic'),
	(metaitem('zbgt:wrapped.circuit_board.good')): metaitem('circuit_board.good'),
	(metaitem('zbgt:wrapped.circuit_board.plastic')): metaitem('circuit_board.plastic'),
	(metaitem('zbgt:wrapped.circuit_board.advanced')): metaitem('circuit_board.advanced'),
	(metaitem('zbgt:wrapped.circuit_board.elite')): metaitem('circuit_board.elite'),
	(metaitem('zbgt:wrapped.circuit_board.extreme')): metaitem('circuit_board.extreme'),
	(metaitem('zbgt:wrapped.circuit_board.wetware')): metaitem('circuit_board.wetware'),
	(metaitem('zbgt:wrapped.chip.soc_simple')): metaitem('plate.simple_system_on_chip'),
	(metaitem('zbgt:wrapped.chip.soc')): metaitem('plate.system_on_chip'),
	(metaitem('zbgt:wrapped.chip.soc_advanced')): metaitem('plate.advanced_system_on_chip'),
	(metaitem('zbgt:wrapped.chip.soc_highly_advanced')): metaitem('plate.highly_advanced_system_on_chip'),
	(metaitem('zbgt:wrapped.chip.cpu')): metaitem('plate.central_processing_unit'),
	(metaitem('zbgt:wrapped.chip.cpu_nano')): metaitem('plate.nano_central_processing_unit'),
	(metaitem('zbgt:wrapped.chip.cpu_qubit')): metaitem('plate.qbit_central_processing_unit'),
	(metaitem('zbgt:wrapped.chip.pic_ultra_low')): metaitem('plate.ultra_low_power_integrated_circuit'),
	(metaitem('zbgt:wrapped.chip.pic_low')): metaitem('plate.low_power_integrated_circuit'),
	(metaitem('zbgt:wrapped.chip.pic')): metaitem('plate.power_integrated_circuit'),
	(metaitem('zbgt:wrapped.chip.pic_high')): metaitem('plate.high_power_integrated_circuit'),
	(metaitem('zbgt:wrapped.chip.pic_ultra_high')): metaitem('plate.ultra_high_power_integrated_circuit'),
	(metaitem('zbgt:wrapped.chip.ram')): metaitem('plate.random_access_memory'),
	(metaitem('zbgt:wrapped.chip.nor')): metaitem('plate.nor_memory_chip'),
	(metaitem('zbgt:wrapped.chip.nand')): metaitem('plate.nand_memory_chip'),
	(metaitem('zbgt:wrapped.chip.integrated_logic')): metaitem('plate.integrated_logic_circuit'),
	(metaitem('zbgt:wrapped.misc.neuro_processor')): metaitem('processor.neuro'),
	(metaitem('zbgt:wrapped.misc.engraved_crystal_chip')): metaitem('engraved.crystal_chip'),
	(metaitem('zbgt:wrapped.misc.crystal_cpu')): metaitem('crystal.central_processing_unit'),
	(metaitem('zbgt:wrapped.misc.crystal_soc')): metaitem('crystal.system_on_chip')
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
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.180k'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.360k'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.540k'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.1080k'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.180k_sp'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.360k_sp'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.540k_sp'))
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.1080k_sp'))

// Remove unused filled cell recipes and from JEI
mods.gregtech.canner.removeByOutput([metaitem('zbgt:coolant_cell.60k.he')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.60k.he'))
mods.gregtech.canner.removeByOutput([metaitem('zbgt:coolant_cell.180k.he')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.180k.he'))
mods.gregtech.canner.removeByOutput([metaitem('zbgt:coolant_cell.60k.nak')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.60k.nak'))
mods.gregtech.canner.removeByOutput([metaitem('zbgt:coolant_cell.180k.nak')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.180k.nak'))

// Remove smaller single craft cells, and compley 60K cell craft
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:coolant_cell.10k')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.10k'))
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:coolant_cell.30k')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.30k'))

mods.gregtech.assembler.removeByInput(120, [
		metaitem('zbgt:coolant_cell.30k') * 2, // 30K Cell * 2
		metaitem('plateTin') * 8, // Tin Plates * 8
		metaitem('circuit.integrated').withNbt(['Configuration': 1])
	], null)


/* Dropper Cover Assembler recipes */
def dropperCoverTiers = ['lv': VA[LV], 'mv': VA[MV], 'hv': VA[HV], 'ev': VA[EV], 'iv': VA[IV]]

dropperCoverTiers.each { tier, eut ->
	mods.gregtech.assembler.recipeBuilder()
		.inputs(
			metaitem("conveyor.module.${tier}"),
			item('minecraft:dropper'),
			ore("circuit${tier.capitalize()}"),
			metaitem("electric.piston.${tier}")
		)
		.outputs(metaitem("zbgt:cover.cover_dropper.${tier}"))
		.duration(200).EUt(eut)
		.buildAndRegister()
}

// Remove higher tier blocks from JEI
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 9)) // Component Assembly Line Casing (UHV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 10)) // Component Assembly Line Casing (UEV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 11)) // Component Assembly Line Casing (UIV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 12)) // Component Assembly Line Casing (UXV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 13)) // Component Assembly Line Casing (OpV)
mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', 14)) // Component Assembly Line Casing (MAX)
