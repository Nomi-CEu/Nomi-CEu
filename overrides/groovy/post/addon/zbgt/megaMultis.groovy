// MODS_LOADED: zbgt
// ^, Makes the script not run as long as ZBGT isn't a mod in the player's instance.

import com.nomiceu.nomilabs.util.LabsModeHelper

import static gregtech.api.GTValues.*

/* Mega Multiblocks Recipes */

// Mega Oil Crackling Unit
mods.gregtech.assembler.recipeBuilder()
    .inputs(
        metaitem('cracker') * 64,
        metaitem('gcym:frameWatertightSteel') * 64,
        ore('circuitLuv') * 16,
        item('gcym:unique_casing', 4) * 16,
        metaitem('electric.pump.iv') * 16,
        metaitem('pipeNormalFluidPolybenzimidazole') * 16)
    .fluidInputs(fluid('soldering_alloy') * 9216)
    .outputs(metaitem('zbgt:mega_ocu'))
    .duration(1200).EUt(VA[IV])
    .replace().buildAndRegister()

// Mega Electric Blast Furnace
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_ebf')], null)

if (LabsModeHelper.normal) {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(
            metaitem('electric_blast_furnace') * 64,
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
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(
            metaitem('electric_blast_furnace') * 64,
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
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_vf')], null)

if (LabsModeHelper.normal) {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(
            metaitem('vacuum_freezer') * 64,
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
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(
            metaitem('vacuum_freezer') * 64,
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
mods.gregtech.assembler.removeByOutput([metaitem('zbgt:mega_abs')], null)

if (LabsModeHelper.normal) {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(
            metaitem('gcym:alloy_blast_smelter') * 64,
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
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(
            metaitem('gcym:alloy_blast_smelter') * 64,
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
