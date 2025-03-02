package postInit.main.general.misc

import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.ingredients.nbtmatch.NBTCondition
import gregtech.api.recipes.ingredients.nbtmatch.NBTMatcher
import gregtech.api.recipes.ingredients.nbtmatch.NBTTagType

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static gregtech.api.recipes.RecipeMaps.*

/* Adds Recycling Recipes to some GT Items */

// 4x and 9x Fluid Hatches
// Only add these in Hard Mode, in Normal Mode, these are added in Mode-Specific/Normal-Mode/buses.groovy
if (LabsModeHelper.expert) {
	changeStackRecycling(metaitem('fluid_hatch.import_4x'), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem('fluid_hatch.import_4x.iv'), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem('fluid_hatch.import_9x'), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem('fluid_hatch.import_9x.iv'), ASSEMBLER_RECIPES)

	changeStackRecycling(metaitem('fluid_hatch.export_4x'), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem('fluid_hatch.export_4x.iv'), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem('fluid_hatch.export_9x'), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem('fluid_hatch.export_9x.iv'), ASSEMBLER_RECIPES)
}

// LuV, ZPM and UV Parts
var addRecyclingToParts = { String tier ->
	changeStackRecycling(metaitem("electric.motor.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("electric.pump.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("conveyor.module.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("electric.piston.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("robot.arm.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("field.generator.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("emitter.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("sensor.${tier}"), ASSEMBLY_LINE_RECIPES)
	changeStackRecycling(metaitem("fluid.regulator.${tier}"), ASSEMBLER_RECIPES)
}

addRecyclingToParts('luv')
addRecyclingToParts('zpm')
addRecyclingToParts('uv')

// EV, IV, LuV, ZPM, UV and UHV Misc Energy Hatches

var addRecyclingToHatches = { String tier ->
	changeStackRecycling(metaitem("energy_hatch.input_4a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("energy_hatch.output_4a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("energy_hatch.input_16a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("energy_hatch.output_16a.${tier}"), ASSEMBLER_RECIPES)

	changeStackRecycling(metaitem("transformer.adjustable.${tier}"), ASSEMBLER_RECIPES)

	changeStackRecycling(metaitem("substation_hatch.input_64a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("substation_hatch.output_64a.${tier}"), ASSEMBLER_RECIPES)

	changeStackRecycling(metaitem("laser_hatch.target_256a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("laser_hatch.source_256a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("laser_hatch.target_1024a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("laser_hatch.source_1024a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("laser_hatch.target_4096a.${tier}"), ASSEMBLER_RECIPES)
	changeStackRecycling(metaitem("laser_hatch.source_4096a.${tier}"), ASSEMBLER_RECIPES)
}

// EV Hatches (Just 4A Hatches + Adjustable Transformer)
changeStackRecycling(metaitem('energy_hatch.input_4a.ev'), ASSEMBLER_RECIPES)
changeStackRecycling(metaitem('energy_hatch.output_4a.ev'), ASSEMBLER_RECIPES)
changeStackRecycling(metaitem('transformer.adjustable.ev'), ASSEMBLER_RECIPES)

addRecyclingToHatches('iv')

// LuV+: Energy Hatch (2a) Needs Recycling Added
changeStackRecycling(metaitem('energy_hatch.input.luv'), ASSEMBLY_LINE_RECIPES)
changeStackRecycling(metaitem('energy_hatch.output.luv'), ASSEMBLY_LINE_RECIPES)
addRecyclingToHatches('luv')

changeStackRecycling(metaitem('energy_hatch.input.zpm'), ASSEMBLY_LINE_RECIPES)
changeStackRecycling(metaitem('energy_hatch.output.zpm'), ASSEMBLY_LINE_RECIPES)
addRecyclingToHatches('zpm')

changeStackRecycling(metaitem('energy_hatch.input.uv'), ASSEMBLY_LINE_RECIPES)
changeStackRecycling(metaitem('energy_hatch.output.uv'), ASSEMBLY_LINE_RECIPES)
addRecyclingToHatches('uv')

// UHV: Just Energy Input & Output (2a, 4a, 16a), Substation Hatch
changeStackRecycling(metaitem('energy_hatch.input.uhv'), ASSEMBLY_LINE_RECIPES)
changeStackRecycling(metaitem('energy_hatch.output.uhv'), ASSEMBLY_LINE_RECIPES)

changeStackRecycling(metaitem("energy_hatch.input_4a.uhv"), ASSEMBLER_RECIPES)
changeStackRecycling(metaitem("energy_hatch.output_4a.uhv"), ASSEMBLER_RECIPES)
changeStackRecycling(metaitem("energy_hatch.input_16a.uhv"), ASSEMBLER_RECIPES)
changeStackRecycling(metaitem("energy_hatch.output_16a.uhv"), ASSEMBLER_RECIPES)

changeStackRecycling(metaitem("substation_hatch.input_64a.uhv"), ASSEMBLER_RECIPES)
changeStackRecycling(metaitem("substation_hatch.output_64a.uhv"), ASSEMBLER_RECIPES)

// Batteries
NBTCondition charge = NBTCondition.create(NBTTagType.LONG, 'Charge', 0L)

changeStackRecyclingNBT(metaitem('battery.re.ulv.tantalum'), ASSEMBLER_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)

changeStackRecyclingNBT(metaitem('energy_crystal'), AUTOCLAVE_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)
changeStackRecyclingNBT(metaitem('lapotron_crystal'), ASSEMBLER_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)

changeStackRecyclingNBT(metaitem('energy.lapotronic_orb'), CIRCUIT_ASSEMBLER_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)
changeStackRecyclingNBT(metaitem('energy.lapotronic_orb_cluster'), ASSEMBLY_LINE_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)
changeStackRecyclingNBT(metaitem('energy.module'), ASSEMBLY_LINE_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)
changeStackRecyclingNBT(metaitem('energy.cluster'), ASSEMBLY_LINE_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)
changeStackRecyclingNBT(metaitem('max.battery'), ASSEMBLY_LINE_RECIPES, NBTMatcher.NOT_PRESENT_OR_HAS_KEY, charge)
