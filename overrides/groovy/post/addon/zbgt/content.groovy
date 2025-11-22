// MODS_LOADED: zbgt
// ^, Only runs when a player adds ZBGT themselves

package post.addon.zbgt

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TooltipHelpers.addTooltip
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.*
import static gregtech.api.GTValues.*

import static post.classes.Common.*

import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.items.metaitem.MetaItem
import gregtech.api.recipes.Recipe

/* Creative Item Recipes */

// TODO: Implement the Creative computing hatch and Creative data hatch

crafting.with {
    // Energy Source Hatch
    remove('zbgt:creative_energy_sink_to_energy_source')
    remove('zbgt:creative_emitter_to_energy_hatch')
    remove('zbgt:creative_energy_hatch_to_emitter')

    // Creative Item Bus (Useless since you already have chest)
    remove('zbgt:creative_item_bus_to_chest')
    remove('zbgt:creative_chest_to_item_bus')

    // Creative Tank
    remove('zbgt:creative_fluid_hatch_to_tank')
    remove('zbgt:creative_tank_to_fluid_hatch')
}

if (LabsModeHelper.normal) {
    // NM Specific

    // Creative Fluid Source Hatch
    mods.gregtech.creative_tank_provider.recipeBuilder()
        .notConsumable(item('nomilabs:creativeportabletankmold'))
        .inputs(metaitem('reservoir_hatch'))
        .outputs(metaitem('zbgt:creative_reservoir_hatch'))
        .duration(500).EUt(1_000_000) // Value to stay consistent with regular tank recipe
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

// Add tooltips to YOTTank Cells
addTooltip(item('zbgt:yottank_cell', 0), [
    translatableEmpty(),
    translatable('nomiceu.tooltip.yottank_cell.yottank_cell.1'),
    translatable('nomiceu.tooltip.yottank_cell.yottank_cell.2'),
])

for (int i = 1; i <= 3; i++) {
    addTooltip(item('zbgt:yottank_cell', i), [
        translatableEmpty(),
        translatable('nomiceu.tooltip.yottank_cell.yottank_cell.1'),
    ])
}

// Remove high tier YOTTank Cells from JEI
for (int i = 4; i <= 9; i++) {
    mods.jei.ingredient.removeAndHide(item('zbgt:yottank_cell', i))
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

// Remove small single craft cells, and complex 60K cell craft
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:coolant_cell.10k')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.10k'))
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:coolant_cell.30k')], null)
mods.jei.ingredient.removeAndHide(metaitem('zbgt:coolant_cell.30k'))

mods.gregtech.assembler.removeByInput([
    metaitem('zbgt:coolant_cell.30k') * 2, // 30K Cell * 2
    metaitem('plateTin') * 8, // Tin Plates * 8
    metaitem('circuit.integrated').withNbt(['Configuration' : 1]),
], null)

/* Unwrap Craft for Wraps (Excl. Circuits) */
for (MetaItem.MetaValueItem meta : item('zbgt:zbgt_meta_item').item.allItems) {
    if (!meta.unlocalizedName.startsWith('wrapped.') || meta.unlocalizedName.startsWith('wrapped.circuit.')) continue

    List<Recipe> recipes = mods.gregtech.assembler.findByOutput([meta.stackForm], null)

    if (recipes == null) {
        logger.error "ZBGT Addon Script: Could not find recipes for wrap ${meta.unlocalizedName}!"
        continue
    }

    for (Recipe recipe : recipes) {
        mods.gregtech.assembler.recipeBuilder()
            .inputs(meta.stackForm)
            .circuitMeta(1)
            .outputs(recipe.inputs.get(0).inputStacks[0]) // First input, e.g. first accepted stack
            .duration(100).EUt(VA[LV])
            .buildAndRegister()
    }
}

/* Unwrap Craft for Circuits */
for (var tier : getVoltageNames(ULV, UHV)) {
    mods.gregtech.assembler.recipeBuilder()
        .inputs(metaitem("zbgt:wrapped.circuit.${tier.value}"))
        .circuitMeta(1)
        .outputs(metaitem("zbgt:generic_circuit.${tier.value}")) // Circuit Wraps contain one circuit only
        .duration(100).EUt(VA[LV])
        .buildAndRegister()
}

/* Dropper Cover Assembler Recipes (LuV-UV Already Exist) */
for (var tier : getVoltageNames(LV, IV)) {
    mods.gregtech.assembler.recipeBuilder()
        .inputs(
            metaitem("conveyor.module.${tier.value}"),
            item('minecraft:dropper'),
            ore("circuit${tier.value.capitalize()}"),
            metaitem("electric.piston.${tier.value}"))
        .outputs(metaitem("zbgt:cover.cover_dropper.${tier.value}"))
        .duration(200).EUt(VA[tier.key])
        .buildAndRegister()
}
