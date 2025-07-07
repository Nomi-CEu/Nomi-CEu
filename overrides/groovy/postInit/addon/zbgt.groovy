// MODS_LOADED: zbgt
// ^, Makes the script not run as long as ZBGT isn't a mod in the player's instance.

package postInit.addon

import classes.postInit.Common
import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.util.LabsModeHelper
import com.zorbatron.zbgt.api.recipes.properties.CoALProperty
import gregtech.api.items.metaitem.MetaItem
import gregtech.api.recipes.Recipe
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.recipeproperties.ComputationProperty

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.toGtInput
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TooltipHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.*

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
		.inputs(metaitem('transformer.adjustable.uv') * 64, metaitem('laser_hatch.source_4096a.uv') * 4)
		.inputWildNBT(metaitem('max.battery'))
		.fluidInputs(fluid('soldering_alloy') * 9216,
			fluid('polybenzimidazole') * 18432,
			fluid('naquadria') * 2304,
			fluid('omnium') * 1440)
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
			metaitem('laser_hatch.source_4096a.uv') * 4)
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
		metaitem('pipeNormalFluidPolybenzimidazole') * 16)
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
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16)
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
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16)
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
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16)
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
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16)
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
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16)
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
			metaitem('wireGtHexUraniumRhodiumDinaquadide') * 16)
		.fluidInputs(fluid('soldering_alloy') * 9216)
		.outputs(metaitem('zbgt:mega_abs'))
		.stationResearch(b -> b.researchStack(metaitem('gcym:alloy_blast_smelter')).CWUt(128).EUt(VA[UHV]))
		.duration(1200).EUt(VA[UV])
		.buildAndRegister()
}


/* YOTTank Cells */
// Add new recipes for YOTTank Cells
crafting.shapedBuilder()
	.output(item('zbgt:yottank_cell', 0))
	.matrix('SFS',
			'SHS',
			'SCS')
	.key('S', metaitem('plateSteel'))
	.key('F', metaitem('field.generator.lv'))
	.key('H', item('gregtech:hermetic_casing', 0))
	.key('C', ore('circuitLv'))
	.register()

for (var tinLike : [fluid('tin') * (L * 2), fluid('soldering_alloy') * L]) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(
			item('gregtech:hermetic_casing', 3),
			metaitem('field.generator.hv') * 2,
			ore('circuitEv') * 4,
			metaitem('plateTitanium') * 4)
		.fluidInputs(tinLike)
		.outputs(item('zbgt:yottank_cell', 1))
		.duration(100).EUt(VA[EV])
		.buildAndRegister()
}

for (var tinLike : [fluid('tin') * (L * 4), fluid('soldering_alloy') * (L * 2)]) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(
			item('gregtech:hermetic_casing', 5),
			metaitem('field.generator.iv') * 2,
			ore('circuitLuv') * 4,
			metaitem('plateRhodiumPlatedPalladium') * 4)
		.fluidInputs(tinLike)
		.outputs(item('zbgt:yottank_cell', 2))
		.duration(100).EUt(VA[LuV])
		.buildAndRegister()
}

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(
		item('gregtech:hermetic_casing', 8),
		metaitem('field.generator.uv') * 2,
		ore('circuitUhv') * 4,
		metaitem('plateEuropium') * 8)
	.fluidInputs(fluid('soldering_alloy') * (L * 8), fluid('polybenzimidazole') * (L * 8))
	.outputs(item('zbgt:yottank_cell', 3))
	.stationResearch(b -> b.researchStack(item('zbgt:yottank_cell', 2)).CWUt(16).EUt(VA[UV]))
	.duration(100).EUt(VA[UV])
	.buildAndRegister()


// Remove other YOTTank Cells from JEI
for(int i = 4; i <= 9; i++) {
	mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', i))
}

// Add tooltips to YOTTank Cells
addTooltip(item('zbgt:yottank_cell', 0), [
	translatableEmpty(),
	translatable('nomiceu.tooltip.yottank_cell.yottank_cell.1'),
	translatable('nomiceu.tooltip.yottank_cell.yottank_cell.2')
])

for (int i = 1; i <= 3; i++) {
	addTooltip(item('zbgt:yottank_cell', i), [
		translatableEmpty(),
		translatable('nomiceu.tooltip.yottank_cell.yottank_cell.1')
	])
}

/* Unwrap Craft for Wraps (Excl. Circuits) */
for (MetaItem.MetaValueItem meta : item('zbgt:zbgt_meta_item').getItem().getAllItems()) {
	if (!meta.unlocalizedName.startsWith('wrapped.') || meta.unlocalizedName.startsWith('wrapped.circuit.')) continue

	List<Recipe> recipes = mods.gregtech.assembler.findByOutput([meta.getStackForm()], null)

	if (recipes == null)
		println "ZBGT Addon Script: Could not find recipes for wrap ${meta.unlocalizedName}!"

	for (Recipe recipe : recipes) {
		mods.gregtech.assembler.recipeBuilder()
			.inputs(meta.getStackForm())
			.circuitMeta(1)
			.outputs(recipe.getInputs().get(0).inputStacks[0]) // First input, first accepted stack
			.duration(100).EUt(VA[LV])
			.buildAndRegister()
	}
}

/* Unwrap Craft for Circuits */
for (var tier : Common.getVoltageNames(ULV, UHV)) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(metaitem("zbgt:wrapped.circuit.${tier}"))
		.circuitMeta(1)
		.outputs(metaitem("zbgt:generic_circuit.${tier}")) // Circuit Wraps contain one circuit only
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

// Remove smaller single craft cells, and complex 60K cell craft
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:coolant_cell.10k')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.10k'))
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:coolant_cell.30k')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.30k'))

mods.gregtech.assembler.removeByInput([
		metaitem('zbgt:coolant_cell.30k') * 2, // 30K Cell * 2
		metaitem('plateTin') * 8, // Tin Plates * 8
		metaitem('circuit.integrated').withNbt(['Configuration': 1])
	], null)

/* Dropper Cover Assembler recipes */
for (var tier : LV..IV) {
	var name = VN[tier].toLowerCase()
	mods.gregtech.assembler.recipeBuilder()
		.inputs(
			metaitem("conveyor.module.${name}"),
			item('minecraft:dropper'),
			ore("circuit${name.capitalize()}"),
			metaitem("electric.piston.${name}"))
		.outputs(metaitem("zbgt:cover.cover_dropper.${name}"))
		.duration(200).EUt(VA[tier])
		.buildAndRegister()
}

/* Circuit Assembly Line */

// EV: Tier 1 (Workstation)
mods.gregtech.circuit_assembly_line_recipes.changeByOutput([metaitem('circuit.workstation')], null)
	.forEach { ChangeRecipeBuilder builder ->
		builder.changeInput(-1) {
				toGtInput(ore('stickVibrantAlloy') * 64)
			}.replaceAndRegister()
	}

// IV: Tier 2 (Nano Supercomputer)
mods.gregtech.circuit_assembly_line_recipes.changeByOutput([metaitem('circuit.nano_computer')], null)
	.forEach { ChangeRecipeBuilder builder ->
		builder.removeInputs(-1, -2)
			.builder { RecipeBuilder recipe ->
				recipe.inputs(ore('wireGtHexLumium'), ore('wireGtHexTungstenSteel') * 2)
			}.replaceAndRegister()
	}

// ZPM: Tier 2 (Crystal Supercomputer)
mods.gregtech.circuit_assembly_line_recipes.changeByOutput([metaitem('circuit.crystal_computer')], null)
	.forEach { ChangeRecipeBuilder builder ->
		builder.changeInput(-1) {
				toGtInput(ore('wireGtHexEnderium') * 4)
			}.replaceAndRegister()
	}

/* CoAL */

/* Remove UHV+ CoAL blocks from JEI */
for (var tier : UHV..MAX) {
	mods.jei.ingredient.removeAndHide(item('zbgt:coal_casing', tier))
}

/* CoAL Recipe Fixes */

// ULV Covers
// ZBGT generates recipes using the 'hard' ulv cover recipes.
mods.gregtech.coal_recipes.recipeBuilder()
	.inputs(
		ore('stickLongBronze') * 24,
		ore('wireGtHexTin') * 6,
		ore('stickLongIronMagnetic') * 24)
	.circuitMeta(1)
	.outputs(metaitem('ulv_covers:electric.motor.ulv') * 64)
	.duration(600).EUt(VA[ULV])
	.replace().buildAndRegister()

mods.gregtech.coal_recipes.recipeBuilder()
	.inputs(
		ore('gearBronze') * 12,
		ore('stickLongBronze') * 24,
		metaitem('ulv_covers:electric.motor.ulv') * 48,
		ore('plateDoubleBronze') * 24)
	.circuitMeta(2)
	.outputs(metaitem('ulv_covers:electric.piston.ulv') * 64)
	.duration(600).EUt(VA[ULV])
	.replace().buildAndRegister()

var pumpBuilder = mods.gregtech.coal_recipes.recipeBuilder()
	.inputs(
		ore('rotorBronze') * 48,
		ore('pipeNormalFluidBronze') * 16,
		metaitem('ulv_covers:electric.motor.ulv') * 48)
	.circuitMeta(3)
	.outputs(metaitem('ulv_covers:electric.pump.ulv') * 64)
	.duration(600).EUt(VA[ULV])
	.replace() // Removes the original recipe, once

for (var rubber : [fluid('rubber'), fluid('silicone_rubber'), fluid('styrene_butadiene_rubber')]) {
	pumpBuilder.copy()
		.fluidInputs(rubber * (L / 4 * 48))
		.buildAndRegister()
}

mods.gregtech.coal_recipes.recipeBuilder()
	.inputs(
		ore('circuitUlv') * 48,
		ore('stickLongBronze') * 24,
		metaitem('ulv_covers:electric.piston.ulv') * 48,
		metaitem('ulv_covers:electric.motor.ulv') * 48)
	.circuitMeta(4)
	.outputs(metaitem('ulv_covers:robot.arm.ulv') * 64)
	.duration(600).EUt(VA[ULV])
	.replace().buildAndRegister()

mods.gregtech.coal_recipes.changeByOutput([metaitem('ulv_covers:conveyor.module.ulv')], null)
	// Don't copy properties; ULV components have none
	.forEach { ChangeRecipeBuilder builder ->
		// Remove Original
		builder.builder{ it.replace() }

		for (var rubber : [fluid('rubber'), fluid('silicone_rubber'), fluid('styrene_butadiene_rubber')]) {
			builder.copyOriginal()
				.changeInput(0) {
					it.copyWithAmount((int) (it.getAmount() / 2)) // Reduce motor amt to half
				}.builder { RecipeBuilder recipe ->
					recipe.clearFluidInputs()
						.fluidInputs(rubber * (L * 2 * 48))
						.circuitMeta(5)
				}.buildAndRegister()
		}
	}

// Field Generators (ZPM, UV (HM Only))
mods.gregtech.coal_recipes.changeByOutput([metaitem('field.generator.zpm')], null)
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.fluidInputs(fluid('awakened_draconium') * (L * 9 * 48)) // Original Amount x 48 (64 production, 3/4 discount)
		}.copyProperties(CoALProperty.instance, ComputationProperty.instance) // CoAL supports total computation, but never used
		.replaceAndRegister()
	}

if (LabsModeHelper.expert) {
	mods.gregtech.coal_recipes.changeByOutput([metaitem('field.generator.zpm')], null)
		.forEach { ChangeRecipeBuilder builder ->
			builder.builder { RecipeBuilder recipe ->
				recipe.fluidInputs(fluid('taranium') * (L * 2 * 48)) // Original Amount x 48 (64 production, 3/4 discount)
			}.copyProperties(CoALProperty.instance, ComputationProperty.instance) // CoAL supports total computation, but never used
			.replaceAndRegister()
		}
}
