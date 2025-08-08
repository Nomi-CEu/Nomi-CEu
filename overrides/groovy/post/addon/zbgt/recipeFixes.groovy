// MODS_LOADED: zbgt
// ^, Makes the script not run as long as ZBGT isn't a mod in the player's instance.

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.util.LabsModeHelper
import com.zorbatron.zbgt.api.recipes.properties.CoALProperty
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.recipeproperties.ComputationProperty

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.toGtInput
import static gregtech.api.GTValues.*

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

var conveyorBuilder = mods.gregtech.coal_recipes.recipeBuilder()
	.inputs(metaitem('ulv_covers:electric.motor.ulv') * 48, ore('cableGtHexLead') * 3)
	.circuitMeta(5)
	.outputs(metaitem('ulv_covers:conveyor.module.ulv') * 64)
	.duration(600).EUt(VA[ULV])
	.replace() // Removes the original recipe, once

for (var rubber : [fluid('rubber'), fluid('silicone_rubber'), fluid('styrene_butadiene_rubber')]) {
	conveyorBuilder.copy()
		.fluidInputs(rubber * (L * 2 * 48))
		.buildAndRegister()
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
	mods.gregtech.coal_recipes.changeByOutput([metaitem('field.generator.uv')], null)
		.forEach { ChangeRecipeBuilder builder ->
			builder.builder { RecipeBuilder recipe ->
				recipe.fluidInputs(fluid('taranium') * (L * 2 * 48)) // Original Amount x 48 (64 production, 3/4 discount)
			}.copyProperties(CoALProperty.instance, ComputationProperty.instance) // CoAL supports total computation, but never used
				.replaceAndRegister()
		}
}
