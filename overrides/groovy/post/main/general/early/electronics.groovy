package post.main.general.early

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static gregtech.api.GTValues.*

import gregtech.api.recipes.RecipeMaps

// Pyrolyse Oven
replaceRecipeInput(metaitem('pyrolyse_oven'), [
    [metaitem('electric.piston.lv'), ore('circuitLv'), ore('wireGtQuadrupleCupronickel')],
    [ore('circuitLv'), metaitem('hull.ulv'), ore('circuitLv')],
    [metaitem('electric.piston.lv'), metaitem('electric.pump.lv'), ore('wireGtQuadrupleCupronickel')]])

// HV Coil
mods.gregtech.assembler.recipeBuilder()
    .inputs(metaitem('stickSteelMagnetic'), metaitem('wireFineSilver') * 16)
    .circuitMeta(1)
    .outputs(metaitem('voltage_coil.hv'))
    .changeRecycling()
    .duration(200).EUt(VA[HV])
    .replace().buildAndRegister()

// EV Coil
mods.gregtech.assembler.recipeBuilder()
    .inputs(metaitem('stickNeodymiumMagnetic'), metaitem('wireFinePlatinum') * 16)
    .circuitMeta(1)
    .outputs(metaitem('voltage_coil.ev'))
    .changeRecycling()
    .duration(200).EUt(VA[EV])
    .replace().buildAndRegister()

// Refresh HV and EV Energy and Dynamo Recipes, and EV High-Amp and Adjustable Transformers
// Note: EV 4A Energy Input and Output Hatches are added after this script is loaded, in recyclingAdditions (misc)
// Since stacks are not stored, they cannot simply be reloaded, we must recall.
// TODO Remove once we get Recursive Recycling Removal
changeStackRecycling(metaitem('energy_hatch.input.hv'), [
    metaitem('hull.hv'),
    metaitem('springGold') * 2,
    metaitem('plate.low_power_integrated_circuit') * 2,
    metaitem('voltage_coil.hv')])
changeStackRecycling(metaitem('energy_hatch.output.hv'), [
    metaitem('hull.hv'),
    metaitem('cableGtSingleGold') * 2,
    metaitem('plate.low_power_integrated_circuit') * 2,
    metaitem('voltage_coil.hv')])

changeStackRecycling(metaitem('energy_hatch.input.ev'), [
    metaitem('hull.ev'),
    metaitem('springAluminium') * 2,
    metaitem('plate.power_integrated_circuit') * 2,
    metaitem('voltage_coil.ev')])
changeStackRecycling(metaitem('energy_hatch.output.ev'), [
    metaitem('hull.ev'),
    metaitem('cableGtSingleAluminium') * 2,
    metaitem('plate.power_integrated_circuit') * 2,
    metaitem('voltage_coil.ev')])

changeStackRecycling(metaitem('transformer.hi_amp.ev'), [
    metaitem('transformer.ev'),
    metaitem('cableGtQuadrupleAluminium') * 4,
    metaitem('voltage_coil.ev') * 2,
    metaitem('cableGtQuadruplePlatinum')])
changeStackRecycling(metaitem('transformer.adjustable.ev'), RecipeMaps.ASSEMBLER_RECIPES)
