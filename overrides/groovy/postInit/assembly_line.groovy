import gregtech.recipes.builders.*
import io.sommers.packmode.PMConfig

def assembly_line = mods.gregtech.assembly_line

// World Accelerator HV
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('hull.luv'), metaitem('field.generator.luv') * 64, metaitem('field.generator.luv') * 16, metaitem('sensor.luv') * 20, metaitem('emitter.luv') * 20, ore('circuitLuv') * 16, metaitem('plateDoubleIridium') * 4, metaitem('plateDenseDraconium') * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
    .outputs(metaitem('world_accelerator.hv'))
    .stationResearch(b -> b.researchStack(item('minecraft:clock')).CWUt(4))
    .duration(6000).EUt(30720)
    .buildAndRegister()

// ZPM Field Generator
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('frameNaquadahAlloy'), metaitem('plateNaquadahAlloy') * 6, metaitem('quantumstar'), metaitem('emitter.zpm') * 2, ore('circuitZpm') * 2, metaitem('wireFineUraniumRhodiumDinaquadide') * 64, metaitem('wireFineUraniumRhodiumDinaquadide') * 64, metaitem('cableGtSingleVanadiumGallium') * 4)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('awakened_draconium') * 1296)
    .outputs(metaitem('field.generator.zpm'))
    .stationResearch(b -> b.researchStack(metaitem('field.generator.luv')).CWUt(4))
    .duration(600).EUt(24000)
    .buildAndRegister()

// Dark Soularium Jetplate
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(item('simplyjetpacks:itemjetpack', 8), item('simplyjetpacks:metaitemmods', 4) * 2, item('extrautils2:angelring'), item('enderio:item_material', 16) * 2, item('nomilabs:doublecompressedoctadiccapacitor'), ore('circuitLuv') * 4, item('simplyjetpacks:metaitemmods', 11) * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152)
    .outputs(item('simplyjetpacks:itemjetpack', 9))
    .stationResearch(b -> b.researchStack(item('simplyjetpacks:metaitemmods', 11)).CWUt(16))
    .duration(3000).EUt(30720)
    .buildAndRegister()

// Flux-Infused Jetplate
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(item('simplyjetpacks:itemjetpack', 17), item('redstonearsenal:armor.plate_flux'), item('simplyjetpacks:metaitemmods', 21), item('extrautils2:angelring'), item('nomilabs:compressedoctadiccapacitor') * 2, ore('circuitLuv') * 4, item('simplyjetpacks:metaitemmods', 30) * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152)
    .outputs(item('simplyjetpacks:itemjetpack', 18))
    .stationResearch(b -> b.researchStack(item('simplyjetpacks:metaitemmods', 30)).CWUt(16))
    .duration(3000).EUt(30720)
    .buildAndRegister()

// Naquadah Reactor 1
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('cover.screen'), item('appliedenergistics2:spatial_pylon') * 3, ore('circuitZpm'), item('gregtech:transparent_casing', 1) * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('omnium') * 32)
    .outputs(metaitem('nomilabs:naquadah_reactor_1'))
    .stationResearch(b -> b.researchStack(metaitem('boltNaquadah')).CWUt(16))
    .duration(1500).EUt(122880)
    .buildAndRegister()

// Rotary Hearth Furnace
if (PMConfig.getPackMode() == "normal") {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(metaitem('electric_blast_furnace'), ore('circuitUv') * 4, metaitem('field.generator.luv') * 4, metaitem('springNaquadahAlloy') * 4, metaitem('plateDenseNaquadahAlloy') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
        .fluidInputs(fluid('soldering_alloy') * 1152)
        .outputs(metaitem('gcym:mega_blast_furnace'))
        .stationResearch(b -> b.researchStack(metaitem('electric_blast_furnace')).CWUt(16))
        .duration(1200).EUt(30720)
        .buildAndRegister()
} else {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(metaitem('electric_blast_furnace'), ore('circuitUhv') * 4, metaitem('field.generator.uv') * 4, metaitem('springTritanium') * 4, metaitem('plateTritanium') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
        .fluidInputs(fluid('soldering_alloy') * 1152)
        .outputs(metaitem('gcym:mega_blast_furnace'))
        .stationResearch(b -> b.researchStack(metaitem('electric_blast_furnace')).CWUt(128).EUt(1966080))
        .duration(1200).EUt(491520)
        .buildAndRegister()
}

// Bulk Blast Chiller
if (PMConfig.getPackMode() == "normal") {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(metaitem('vacuum_freezer'), ore('circuitUv') * 4, metaitem('field.generator.luv') * 4, metaitem('pipeNormalFluidNaquadah') * 4, metaitem('plateDenseNaquadahAlloy') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
        .fluidInputs(fluid('soldering_alloy') * 1152)
        .outputs(metaitem('gcym:mega_vacuum_freezer'))
        .stationResearch(b -> b.researchStack(metaitem('vacuum_freezer')).CWUt(16))
        .duration(1200).EUt(30720)
        .buildAndRegister()
} else {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(metaitem('vacuum_freezer'), ore('circuitUhv') * 4, metaitem('field.generator.uv') * 4, metaitem('pipeNormalFluidDuranium') * 4, metaitem('plateDenseTritanium') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
        .fluidInputs(fluid('soldering_alloy') * 1152)
        .outputs(metaitem('gcym:mega_vacuum_freezer'))
        .stationResearch(b -> b.researchStack(metaitem('vacuum_freezer')).CWUt(128).EUt(1966080))
        .duration(1200).EUt(491520)
        .buildAndRegister()
}
// World Accelerator EV
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('hull.zpm'), metaitem('field.generator.zpm') * 64, metaitem('field.generator.zpm') * 16, metaitem('sensor.zpm') * 20, metaitem('emitter.zpm') * 20, ore('circuitZpm') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('plateDenseDraconium') * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152)
    .outputs(metaitem('world_accelerator.ev'))
    .stationResearch(b -> b.researchStack(metaitem('world_accelerator.hv')).CWUt(32).EUt(122880))
    .duration(12000).EUt(122880)
    .buildAndRegister()

// Naquadah Reactor 2
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('cover.screen'), item('appliedenergistics2:spatial_pylon') * 3, ore('circuitUv'), item('gregtech:transparent_casing', 1) * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('omnium') * 288)
    .outputs(metaitem('nomilabs:naquadah_reactor_2'))
    .stationResearch(b -> b.researchStack(metaitem('nomilabs:naquadah_reactor_1')).CWUt(64).EUt(122880))
    .duration(1500).EUt(122880)
    .buildAndRegister()

// Universal Navigator
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('frameMicroversium'), metaitem('plateMicroversium') * 24, metaitem('gravistar'), metaitem('sensor.uv') * 2, metaitem('robot.arm.uv') * 2, ore('circuitUhv'), metaitem('plateDenseNaquadahAlloy') * 2, metaitem('wireGtQuadrupleEnrichedNaquadahTriniumEuropiumDuranide') * 4, metaitem('wireFineTritanium') * 64)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('naquadria') * 576)
    .outputs(item('nomilabs:universalnavigator'))
    .stationResearch(b -> b.researchStack(item('nomilabs:stellarcreationdata')).CWUt(96).EUt(491520))
    .duration(6000).EUt(491520)
    .buildAndRegister()

// Ultimate Material
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(item('draconicevolution:dragon_heart'), item('armorplus:material', 1) * 4, item('armorplus:material', 2) * 8, item('armorplus:material', 3) * 12)
    .outputs(item('armorplus:material', 4))
    .stationResearch(b -> b.researchStack(item('draconicevolution:dragon_heart')).CWUt(96).EUt(491520))
    .duration(600).EUt(491520)
    .buildAndRegister()

// Reactor Stabilizer Rotor Assembly
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(ore('frameGtAwakenedDraconium'), ore('gearAwakenedDraconium'), ore('plateAwakenedDraconium') * 2, item('draconicevolution:reactor_part', 1) * 2, item('draconicevolution:reactor_part', 2) * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152)
    .outputs(item('draconicevolution:reactor_part', 3))
    .stationResearch(b -> b.researchStack(metaitem('gearAwakenedDraconium')).CWUt(96).EUt(491520))
    .duration(600).EUt(491520)
    .buildAndRegister()

// Reactor Stabilizer Focus Ring
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(ore('frameGtAwakenedDraconium'), item('draconicevolution:awakened_core'), ore('ringAwakenedDraconium') * 4, ore('plateCrystalMatrix') * 4, item('advsolars:sunnarium_plate') * 4)
    .fluidInputs(fluid('soldering_alloy') * 1152)
    .outputs(item('draconicevolution:reactor_part', 4))
    .stationResearch(b -> b.researchStack(metaitem('ringAwakenedDraconium')).CWUt(96).EUt(491520))
    .duration(600).EUt(491520)
    .buildAndRegister()

// Reactor Stabilizer Frame
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(ore('frameGtAwakenedDraconium'), ore('gearAwakenedDraconium'), item('draconicevolution:awakened_core'), metaitem('sensor.zpm') * 2, metaitem('emitter.zpm') * 2, ore('plateElite') * 6)
    .fluidInputs(fluid('soldering_alloy') * 1152)
    .outputs(item('draconicevolution:reactor_part'))
    .stationResearch(b -> b.researchStack(metaitem('frameAwakenedDraconium')).CWUt(96).EUt(491520))
    .duration(750).EUt(491520)
    .buildAndRegister()

// Simulation Supercomputer
if (PMConfig.getPackMode() == "normal") {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(item('gcym:large_multiblock_casing', 11), ore('plateTrinaquadalloy') * 6, item('deepmoblearning:simulation_chamber') * 4, item('nomilabs:heartofauniverse'), metaitem('robot.arm.uv') * 2, metaitem('field.generator.uv') * 2, ore('circuitUhv') * 4, item('draconicevolution:draconic_energy_core'))
        .fluidInputs(fluid('soldering_alloy') * 1152)
        .outputs(metaitem('nomilabs:dml_sim_chamber'))
        .stationResearch(b -> b.researchStack(item('deepmoblearning:simulation_chamber')).CWUt(128).EUt(1966080))
        .duration(1200).EUt(1966080)
        .buildAndRegister()
}

// World Accelerator IV
mods.gregtech.assembly_line.recipeBuilder()
    .inputs(metaitem('hull.uv'), metaitem('field.generator.uv') * 64, metaitem('field.generator.uv') * 16, metaitem('sensor.uv') * 20, metaitem('emitter.uv') * 20, ore('circuitUv') * 16, metaitem('plateDoubleEuropium') * 4, metaitem('plateDenseNeutronium') * 2)
    .fluidInputs(fluid('soldering_alloy') * 1152, fluid('enderium') * 1152, fluid('naquadria') * 576)
    .outputs(metaitem('world_accelerator.iv'))
    .stationResearch(b -> b.researchStack(metaitem('world_accelerator.ev')).CWUt(128).EUt(491520))
    .duration(12000).EUt(491520)
    .buildAndRegister()

// UV Field Generator (Hard mode only)
if (PMConfig.getPackMode() == "expert") {
    mods.gregtech.assembly_line.recipeBuilder()
        .inputs(ore('frameGtTritanium'), ore('plateTritanium') * 6, metaitem('gravistar'), metaitem('emitter.uv') * 2, ore('circuitUv') * 2, ore('wireFineEnrichedNaquadahTriniumEuropiumDuranide') * 64, ore('wireFineEnrichedNaquadahTriniumEuropiumDuranide') * 64, ore('cableGtSingleYttriumBariumCuprate') * 4)
        .fluidInputs(fluid('soldering_alloy') * 1728, fluid('naquadria') * 576, fluid('taranium') * 288)
        .outputs(metaitem('field.generator.uv'))
        .stationResearch(b -> b.researchStack(metaitem('field.generator.zpm')).CWUt(48).EUt(122880))
        .duration(600).EUt(100000)
        .buildAndRegister()
}