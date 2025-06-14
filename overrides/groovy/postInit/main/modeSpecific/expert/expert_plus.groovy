import static gregtech.api.GTValues.*
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.builders.AssemblyLineRecipeBuilder
import gregtech.api.recipes.recipeproperties.ResearchProperty
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.createRecipe

if (!LabsModeHelper.expert) return
// Coils rework
//Recipe removal: Coils

mods.gregtech.assembler.removeByOutput([item('gregtech:wire_coil', 5)], null) //Naq Coil
mods.gregtech.assembler.removeByOutput([item('gregtech:wire_coil', 6)], null) //Trinium Coil
mods.gregtech.assembler.removeByOutput([item('gregtech:wire_coil', 7)], null) //Tritanium Coil

//Recipe addition: Coils
//Naq Coil
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(ore('frameGtRhodiumPlatedPalladium') * 1,
                metaitem('voltage_coil.luv') * 1,
                ore('wireGtDoubleNaquadah') * 16,
                ore('foilOsmium') * 16,
                ore('plateDoubleLumium') * 2,
                ore('wireGtDoubleSamariumIronArsenicOxide') * 8,
                ore('screwYttriumBariumCuprate') * 32,
                ore('boltRuridit') * 32,
                ore('circuitLuv') * 1,
        )
        .fluidInputs(fluid('tungsten_steel') * 576,
                    fluid('soldering_alloy') * 288,
        )
        .outputs(item('gregtech:wire_coil', 5))
        .duration(1200).EUt(VA[LuV]) //60s
        .buildAndRegister()
//Trinium Coil
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(ore('frameGtNaquadahAlloy') * 1,
                metaitem('voltage_coil.zpm') * 1,
                ore('wireGtDoubleTrinium') * 16,
                ore('foilNaquadahEnriched') * 16,
                ore('plateDoubleEuropium') * 2,
                ore('wireGtDoubleIndiumTinBariumTitaniumCuprate') * 8,
                ore('screwHsse') * 32,
                ore('boltOsmiridium') * 32,
                ore('circuitZpm') * 1,
        )
        .fluidInputs(fluid('draconium') * 576,
                fluid('soldering_alloy') * 288,
        )
        .outputs(item('gregtech:wire_coil', 6))
        .stationResearch(b -> b.researchStack(item('gregtech:wire_coil', 5)).CWUt(4).EUt(VA[ZPM]))
        .duration(1800).EUt(VA[ZPM]) //90s
        .buildAndRegister()
//Tritanium Coil
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(ore('frameGtDarmstadtium') * 1,
                metaitem('voltage_coil.uv') * 1,
                ore('wireGtDoubleTritanium') * 16,
                ore('foilNaquadria') * 16,
                ore('plateDoubleAmericium') * 2,
                ore('wireGtDoubleUraniumRhodiumDinaquadide') * 8,
                ore('screwHsss') * 32,
                ore('boltNaquadahAlloy') * 32,
                ore('circuitUv') * 1,
        )
        .fluidInputs(fluid('awakened_draconium') * 576,
                fluid('soldering_alloy') * 288,
        )
        .outputs(item('gregtech:wire_coil', 7))
        .stationResearch(b -> b.researchStack(item('gregtech:wire_coil', 6)).CWUt(48).EUt(VA[UV]))
        .duration(2400).EUt(VA[UV]) //120s
        .buildAndRegister()
//Late game circuit nerfs

//Recipe removal
// Crystal Supercomputer
mods.gregtech.circuit_assembler.removeByOutput([item('gregtech:meta_item_1', 642)], null)
mods.gregtech.circuit_assembly_line_recipes.removeByOutput([item('gregtech:meta_item_1', 642)], null)
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(ore('frameGtHsse') * 2,
                metaitem('circuit.crystal_assembly') * 2,
                metaitem('plate.random_access_memory') * 32,
                metaitem('plate.high_power_integrated_circuit') * 2,
                ore('wireGtSingleNiobiumTitanium') * 8,
                metaitem('component.advanced_smd.inductor') * 8,
                metaitem('component.advanced_smd.capacitor') * 16,
                metaitem('component.advanced_smd.diode') * 8,
        )
        .fluidInputs(fluid('soldering_alloy') * 288,
        )
        .outputs(metaitem('circuit.crystal_computer'))
        .stationResearch(b -> b.researchStack(metaitem('circuit.crystal_assembly')).CWUt(2).EUt(VA[LuV]))
        .duration(800).EUt(VA[LuV]) //40s
        .buildAndRegister()
// Crystal Mainframe
mods.gregtech.assembly_line.removeByOutput([metaitem('circuit.crystal_mainframe')], null)
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(ore('frameGtHsss') * 4,
                metaitem('circuit_board.elite') * 1,
                metaitem('circuit.crystal_computer') * 2,
                metaitem('component.advanced_smd.inductor') * 32,
                metaitem('component.advanced_smd.capacitor') * 32,
                metaitem('component.advanced_smd.diode') * 32,
                metaitem('component.advanced_smd.resistor') * 32,
                metaitem('component.advanced_smd.transistor') * 32,
                ore('foilPolybenzimidazole') * 48,
                metaitem('plate.random_access_memory') * 32,
                ore('wireFineNiobiumTitanium') * 64,
                ore('wireFineNiobiumTitanium') * 16,
        )
        .fluidInputs(fluid('soldering_alloy') * 1440,
        )
        .outputs(metaitem('circuit.crystal_mainframe'))
        .stationResearch(b -> b.researchStack(metaitem('circuit.crystal_computer')).CWUt(16).EUt(VA[LuV]))
        .duration(1500).EUt(VA[LuV]) //75s
        .buildAndRegister()
// Wetware Supercomputer
mods.gregtech.assembly_line.removeByOutput([metaitem('circuit.wetware_computer')], null)
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(metaitem('frameDuranium') * 1,
                metaitem('stem_cells') * 8,
                ore('dragonEgg') * 2,
                metaitem('circuit.wetware_assembly') * 2,
                metaitem('component.advanced_smd.diode') * 8,
                metaitem('plate.nor_memory_chip') * 12,
                metaitem('plate.random_access_memory') * 32,
                ore('wireFineYttriumBariumCuprate') * 24,
        )
        .fluidInputs(fluid('soldering_alloy') * 288,
        )
        .outputs(metaitem('circuit.wetware_computer'))
        .stationResearch(b -> b.researchStack(metaitem('circuit.wetware_assembly')).CWUt(16).EUt(VA[LuV]))
        .duration(600).EUt(VA[ZPM]) //30s
        .buildAndRegister()
//Wetware Mainframe
mods.gregtech.assembly_line.removeByOutput([metaitem('circuit.wetware_mainframe')], null)
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(metaitem('frameTritanium') * 8,
                item('nomilabs:quantumfluxedeterniumplating') * 1,
                metaitem('circuit.wetware_computer') * 2,
                metaitem('component.advanced_smd.inductor') * 64,
                metaitem('component.advanced_smd.capacitor') * 64,
                metaitem('component.advanced_smd.diode') * 64,
                metaitem('component.advanced_smd.resistor') * 64,
                metaitem('component.advanced_smd.transistor') * 64,
                metaitem('robot.arm.zpm') * 1,
                metaitem('sensor.zpm') * 2,
                metaitem('field.generator.zpm') * 2,
                metaitem('platePolybenzimidazole') * 16,
                metaitem('wafer.ultra_high_power_integrated_circuit') * 2,
                metaitem('plate.random_access_memory') * 64,
                ore('wireGtDoubleEnrichedNaquadahTriniumEuropiumDuranide') *24,
                ore('wireFineNaquadah') * 64,
        )
        .fluidInputs(fluid('darmstadtium') * 1440,
                     fluid('polybenzimidazole') * 1152,
                     fluid('naquadria') * 864,
                     fluid('einsteinium') * 288,
        )
        .outputs(metaitem('circuit.wetware_mainframe'))
        .stationResearch(b -> b.researchStack(metaitem('circuit.wetware_computer')).CWUt(96).EUt(VA[UV]))
        .duration(4000).EUt(VA[UV])
        .buildAndRegister()

