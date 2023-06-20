#loader gregtech

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.IMaterialPredicate;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.gregtech.ore.OrePrefix;

//val gemPerfect as OrePrefix = OrePrefix.registerOrePrefix("gemPerfect", 8, "gemPerfect", 1);
//gemPerfect.setGenerationPredicate(IMaterialPredicate.hasGem);
//gemPerfect.createMaterialItem();

var element_omnium = Elements.add(130, 234, -1, null, "Omnium", "Nm", false);
var element_draconium = Elements.add(149, 264, -1, null, "Draconium", "Dc", false);
var element_draconium_awakened = Elements.add(149, 267, -1, null, "AwakenedDraconium", "Dc*", false);

var draconium = MaterialBuilder(32001, "draconium")
    .element("Draconium")
    .ingot().fluid().ore()
    .color(0xbe49ed).iconSet("metallic")
    .blastTemp(6800, "HIGHER")
    .cableProperties(524288, 1, 0, true)
    .flags(["generate_plate", "generate_rod", "generate_gear", "generate_dense"])
    .build();

var awakened_draconium = MaterialBuilder(32002, "awakened_draconium")
    .element("AwakenedDraconium")
    .ingot().fluid()
    .color(0xf58742).iconSet("metallic")
    .flags(["no_smelting", "generate_plate", "generate_rod", "generate_gear"])
    .build();

var dark_steel = MaterialBuilder(32003, "dark_steel")
    .ingot().fluid()
    .color(0x414751).iconSet("dull")
    .flags(["generate_plate", "generate_rod", "generate_frame", "disable_decomposition"])
    .components([<material:iron> * 1])
    .build();

var omnium = MaterialBuilder(32004, "omnium")
    .ingot().fluid()
    .element("Omnium")
    .color(0x84053e).iconSet("shiny")
    .cableProperties(2147483647, 64, 0, true)
    .build();

var ardite = MaterialBuilder(32006, "ardite")
    .ingot().fluid()
    .color(0xad2f05).iconSet("dull")
    .components([<material:red_steel> * 3, <material:blaze> * 1])
    .flags(["generate_plate"])
    .build();

var mana = MaterialBuilder(32007, "mana")
    .flags(["disable_decomposition"])
    .build();

var manyullyn = MaterialBuilder(32008, "manyullyn")
    .ingot().fluid()
    .color(0x9949cc).iconSet("metallic")
    .flags(["generate_plate"])
    .components([<material:ardite> * 4, <material:cobalt> * 4, <material:mana> * 1])
    .build();


var signalum = MaterialBuilder(32010, "signalum")
    .ingot().fluid()
    .color(0xff7f0f).iconSet("shiny")
    .blastTemp(4000, "MID", 120, 12800)
    .flags(["generate_plate", "generate_dense", "generate_rod", "generate_gear"])
    .components([<material:annealed_copper> * 4, <material:ardite> * 2, <material:red_alloy> * 2])
    .cableProperties(32768, 1, 0, true)
    .build();

var conductive_iron = MaterialBuilder(32011, "conductive_iron")
    .ingot().fluid()
    .color(0xf7b29b).iconSet("metallic")
    .flags("generate_plate", "generate_gear")
    .components([<material:iron> * 1, <material:redstone> * 1])
    .cableProperties(32, 1, 0, true)
    .build();

var energetic_alloy = MaterialBuilder(32012, "energetic_alloy")
    .ingot().fluid()
    .color(0xffb545).iconSet("shiny")
    .flags("generate_plate", "generate_gear")
    .blastTemp(1250, "LOW", 120, 400)
    .components([<material:gold> * 2, <material:redstone> * 1, <material:glowstone> * 1])
    .cableProperties(128, 1, 0, true)
    .build();

var vibrant_alloy = MaterialBuilder(32013, "vibrant_alloy")
    .ingot().fluid()
    .color(0xa4ff70).iconSet("shiny")
    .flags("generate_plate", "generate_gear", "generate_rod", "generate_bolt_screw")
    .blastTemp(1350, "LOW", 120, 600)
    .components([<material:energetic_alloy> * 1, <material:ender_pearl> * 1])
    .cableProperties(512, 1, 0, true)
    .build();

var pulsating_iron = MaterialBuilder(32014, "pulsating_iron")
    .ingot().fluid()
    .color(0x6ae26e).iconSet("shiny")
    .flags("generate_plate", "generate_gear")
    .components([<material:iron> * 1])
    .cableProperties(8, 1, 0, true)
    .build();

var electrical_steel = MaterialBuilder(32015, "electrical_steel")
    .ingot().fluid()
    .color(0xb2c0c1).iconSet("metallic")
    .flags("generate_plate", "generate_gear")
    .components([<material:steel> * 1, <material:silicon> * 1])
    .build();
    
var lumium = MaterialBuilder(32017, "lumium")
    .ingot().fluid()
    .color(0xf6ff99).iconSet("bright")
    .flags("generate_plate", "generate_gear", "generate_fine_wire")
    .blastTemp(4500, "MID", 120, 14400)
    .components([<material:tin_alloy> * 4, <material:sterling_silver> * 2])
    .cableProperties(8192, 1, 0, true)
    .build();

var enderium = MaterialBuilder(32018, "enderium")
    .ingot().fluid()
    .color(0x1f6b62).iconSet("shiny")
    .flags("generate_plate", "generate_gear", "generate_fine_wire")
    .blastTemp(6400, "HIGHEST", 120, 20800)
    .components([<material:lead> * 4, <material:platinum> * 2, <material:blue_steel> * 1, <material:osmium> * 1])
    .cableProperties(131072, 1, 0, true)
    .build();

var electrum_flux = MaterialBuilder(32019, "electrum_flux")
    .ingot().fluid()
    .color(0xf7be20).iconSet("bright")
    .flags("generate_plate", "generate_gear")
    .blastTemp(1100)
    .components([<material:electrum> * 6, <material:lumium> * 1, <material:signalum> * 1]) 
    .build();

var mithril = MaterialBuilder(32021, "mithril")
    .ingot()
    .color(0x428fdb).iconSet("dull")
    .flags("generate_plate", "generate_gear", "no_unification")
    .components([<material:titanium> * 1, <material:mana> * 1])
    .build();

var crystal_matrix = MaterialBuilder(32023, "crystal_matrix")
    .ingot().fluid()
    .color(0x70ecff).iconSet("shiny")
    .flags("generate_plate")
    .build();

var soularium = MaterialBuilder(32024, "soularium")
    .ingot().fluid()
    .color(0x7c674d).iconSet("metallic")
    .flags("generate_plate")
    .components([<material:gold> * 1])
    .build();

var end_steel = MaterialBuilder(32025, "end_steel")
    .ingot().fluid()
    .color(0xd6d980).iconSet("metallic")
    .flags("generate_plate", "generate_gear")
    .toolStats(4.0, 3.5, 1024, 3)
    .cableProperties(2048,1,0,true)
    .build();

var infinity = MaterialBuilder(32026, "infinity")
    .ingot()
    .color(0x000000).iconSet("shiny")
    .flags("generate_plate")
    .components([<material:neutronium> * 5])
    .build();
<material:infinity>.setFormula("∞");

var microversium = MaterialBuilder(32027, "microversium")
    .ingot()
    .color(0x9b61b8).iconSet("dull")
    .flags("generate_plate", "generate_frame")
    .build();

var draconic_superconductor = MaterialBuilder(32028, "draconic_superconductor")
    .ingot()
    .color(0xf5f0f4).iconSet("shiny")
    .cableProperties(2147483647, 4, 0, true)
    .build();

var osmiridium_8020 = MaterialBuilder(32029, "osmiridium_8020")
    .dust()
    .components([<material:osmium> * 4, <material:iridium> * 1])
    .colorAverage()
    .ore()
    .addOreByproducts(<material:osmium>, <material:iridium>, <material:ruthenium>)
    .build();

var iridosmine_8020 = MaterialBuilder(32030, "iridosmine_8020")
    .dust()
    .components([<material:iridium> * 4, <material:osmium> * 1])
    .colorAverage()
    .ore()
    .addOreByproducts(<material:iridium>, <material:osmium>, <material:rhodium>)
    .build();

var kaemanite = MaterialBuilder(32031, "kaemanite")
    .dust()
    .components([<material:trinium> * 1, <material:tantalum> * 1, <material:oxygen> * 4])
    .color(0xe7413c).iconSet("bright")
    .ore()
    .addOreByproducts(<material:niobium>, <material:trinium_sulfide>, <material:trinium>)
    .build();

var tungsten_trioxide = MaterialBuilder(32032, "tungsten_trioxide")
    .dust()
    .color(0xC7D300).iconSet("dull")
    .flags("disable_decomposition")
    .components([<material:tungsten> * 1, <material:oxygen> * 3])
    .build();

var beryllium_oxide = MaterialBuilder(32033, "beryllium_oxide")
    .ingot()
    .color(0x54C757).iconSet("dull")
    .flags("generate_rod", "generate_ring")
    .components([<material:beryllium> * 1, <material:oxygen> * 1])
    .build();

var niobium_pentoxide = MaterialBuilder(32034, "niobium_pentoxide")
    .dust()
    .color(0xBAB0C3).iconSet("rough")
    .components([<material:niobium> * 2, <material:oxygen> * 5])
    .build();

var tantalum_pentoxide = MaterialBuilder(32035, "tantalum_pentoxide")
    .dust()
    .color(0x72728A).iconSet("rough")
    .components([<material:tantalum> * 2, <material:oxygen> * 5])
    .build();

var fluorite = MaterialBuilder(32036, "fluorite")
    .dust().ore()
    .color(0xFFFC9E).iconSet("rough")
    .components([<material:calcium> * 1, <material:fluorine> * 2])
    .addOreByproducts(<material:sphalerite>, <material:bastnasite>, <material:topaz>)
    .build();

var manganese_difluoride = MaterialBuilder(32037, "manganese_difluoride")
    .dust()
    .color(0xEF4B3D).iconSet("rough")
    .components([<material:manganese> * 1, <material:fluorine> * 2])
    .build();

var molybdenum_trioxide = MaterialBuilder(32038, "molybdenum_trioxide")
    .dust()
    .color(0xCBCFDA).iconSet("rough")
    .flags("disable_decomposition")
    .components([<material:molybdenum> * 1, <material:oxygen> * 3])
    .build();

var lead_chloride = MaterialBuilder(32039, "lead_chloride")
    .dust()
    .color(0xF3F3F3).iconSet("rough")
    .components([<material:lead> * 1, <material:chlorine> * 2])
    .build();

var wollastonite = MaterialBuilder(32040, "wollastonite")
    .dust()
    .color(0xF7F7E7).iconSet("bright")
    .components([<material:calcium> * 1, <material:silicon> * 1, <material:oxygen> * 3])
    .build();

var sodium_metavanadate = MaterialBuilder(32041, "sodium_metavanadate")
    .dust()
    .flags("disable_decomposition")
    .color(0xe6bb22).iconSet("dull")
    .components([<material:sodium> * 1, <material:vanadium> * 1, <material:oxygen> * 3])
    .build();

var vanadium_pentoxide = MaterialBuilder(32042, "vanadium_pentoxide")
    .dust()
    .color(0xffcf33).iconSet("rough")
    .components([<material:vanadium> * 2, <material:oxygen> * 5])
    .build();

var ammonium_metavanadate = MaterialBuilder(32043, "ammonium_metavanadate")
    .dust()
    .flags("disable_decomposition")
    .color(0xf7e37e).iconSet("dull")
    .components([<material:nitrogen> * 1, <material:hydrogen> * 4, <material:vanadium> * 1, <material:oxygen> * 3])
    .build();

var phthalic_anhydride = MaterialBuilder(32044, "phthalic_anhydride")
    .dust()
    .flags("disable_decomposition")
    .color(0xeeaaee).iconSet("dull")
    .components([<material:carbon> * 8, <material:hydrogen> * 4, <material:oxygen> * 3])
    .build();
<material:phthalic_anhydride>.setFormula("C6H4(CO)2O", true);

var ethylanthraquinone = MaterialBuilder(32045, "ethylanthraquinone")
    .dust()
    .color(0xf1e181)
    .flags("disable_decomposition")
    .components([<material:carbon> * 16, <material:hydrogen> * 12, <material:oxygen> * 2])
    .build();
<material:ethylanthraquinone>.setFormula("C6H4(CO)2C6H3(CH2CH3)", true);

var hydrogen_peroxide = MaterialBuilder(32046, "hydrogen_peroxide")
    .fluid()
    .color(0xd2ffff)
    .components([<material:hydrogen> * 2, <material:oxygen> * 2])
    .build();

var hydrazine = MaterialBuilder(32047, "hydrazine")
    .fluid()
    .color(0xb50707)
    .components([<material:nitrogen> * 2, <material:hydrogen> * 4])
    .build();

var acetone_azine = MaterialBuilder(32048, "acetone_azine")
    .fluid()
    .color(0xa1e1e1)
    .components([<material:carbon> * 6, <material:hydrogen> * 12, <material:nitrogen> * 2])
    .build();
<material:acetone_azine>.setFormula("((CH3)2(CN))2", true);

var graphene_oxide = MaterialBuilder(32049, "graphene_oxide")
    .dust()
    .flags("disable_decomposition")
    .color(0x777777).iconSet("rough")
    .components([<material:graphene> * 1, <material:oxygen> * 1])
    .build();

var kapton_k = MaterialBuilder(32050, "kapton_k")
    .ingot().fluid()
    .color(0xffce52).iconSet("dull")
    .flags("generate_plate", "disable_decomposition")
    .components([<material:carbon> * 22, <material:hydrogen> * 10, <material:nitrogen> * 2, <material:oxygen> * 5])
    .build();
<material:kapton_k>.setFormula("C6H2((CO)2N)2C6H4OC6H4", true);

var durene = MaterialBuilder(32051, "durene")
    .dust()
    .flags("disable_decomposition")
    .color(0x336040).iconSet("fine")
    .components([<material:carbon> * 10, <material:hydrogen> * 14])
    .build();
<material:durene>.setFormula("C6H2(CH3)4", true);

var pyromellitic_dianhydride = MaterialBuilder(32052, "pyromellitic_dianhydride")
    .dust()
    .flags("disable_decomposition")
    .color(0xf0ead6).iconSet("rough")
    .components([<material:carbon> * 10, <material:hydrogen> * 2, <material:oxygen> * 6])
    .build();
<material:pyromellitic_dianhydride>.setFormula("C6H2(C2O3)2", true);

var dimethylformamide = MaterialBuilder(32053, "dimethylformamide")
    .fluid()
    .color(0x42bdff)
    .components([<material:carbon> * 3, <material:hydrogen> * 7, <material:nitrogen> * 1, <material:oxygen> * 1])
    .build();

var aminophenol = MaterialBuilder(32054, "aminophenol")
    .fluid()
    .flags("disable_decomposition")
    .color(0xff7f50)
    .components([<material:carbon> * 6, <material:hydrogen> * 7, <material:nitrogen> * 1, <material:oxygen> * 1])
    .build();

var oxydianiline = MaterialBuilder(32055, "oxydianiline")
    .dust()
    .flags("disable_decomposition")
    .color(0xf0e130).iconSet("dull")
    .components([<material:carbon> * 12, <material:hydrogen> * 12, <material:nitrogen> * 2, <material:oxygen> * 1])
    .build();
<material:oxydianiline>.setFormula("O(C6H4NH2)2", true);

var antimony_pentafluoride = MaterialBuilder(32056, "antimony_pentafluoride")
    .fluid()
    .flags("disable_decomposition")
    .color(0xe3f1f1)
    .components([<material:antimony> * 1, <material:fluorine> * 5])
    .build();

var naquadah_oxide = MaterialBuilder(32057, "naquadah_oxide")
    .dust()
    .flags("disable_decomposition")
    .color(0x17ddd3).iconSet("rough")
    .components([<material:naquadah> * 2, <material:oxygen> * 3])
    .build();

var pyromorphite = MaterialBuilder(32058, "pyromorphite")
    .dust()
    .flags("disable_decomposition")
    .color(0xd3ed28).iconSet("rough")
    .components([<material:lead> * 5, <material:phosphate> * 3, <material:chlorine> * 1])
    .build();

var naquadah_hydroxide = MaterialBuilder(32059, "naquadah_hydroxide")
    .dust()
    .color(0x1941a6).iconSet("dull")
    .components([<material:naquadah> * 1, <material:hydrogen> * 3, <material:oxygen> * 3])
    .build();
<material:naquadah_hydroxide>.setFormula("Nq(OH)3", true);

var snowchestite = MaterialBuilder(32060, "snowchestite")
    .dust().ore()
    .flags("disable_decomposition")
    .color(0x274c9f).iconSet("shiny")
    .components([<material:naquadah_oxide> * 3, <material:pyromorphite> * 1])
    .addOreByproducts(<material:caesium>, <material:vanadium_magnetite>, <material:naquadah_hydroxide>)
    .build();

var caesium_hydroxide = MaterialBuilder(32061, "caesium_hydroxide")
    .dust()
    .flags("disable_decomposition")
    .color(0xbd8340).iconSet("dull")
    .components([<material:caesium> * 1, <material:oxygen> * 1, <material:hydrogen> * 1])
    .build();

var neocryolite = MaterialBuilder(32062, "neocryolite")
    .fluid()
    .flags("disable_decomposition")
    .color(0x3fd1aa)
    .components([<material:caesium> * 3, <material:naquadah> * 1, <material:fluorine> * 6])
    .build();

var naquadah_oxide_petro_solution = MaterialBuilder(32063, "naquadah_oxide_petro_solution")
    .fluid()
    .flags("disable_decomposition")
    .color(0x595c70)
    .build();

var naquadah_oxide_aero_solution = MaterialBuilder(32064, "naquadah_oxide_aero_solution")
    .fluid()
    .flags("disable_decomposition")
    .color(0x6f7059)
    .build();

var hot_naquadah_oxide_neocryolite_solution = MaterialBuilder(32065, "hot_naquadah_oxide_neocryolite_solution")
    .fluid()
    .flags("disable_decomposition")
    .color(0x658280)
    .build();
<material:hot_naquadah_oxide_neocryolite_solution>.setFluidTemperature(4700);

var lead_metasilicate = MaterialBuilder(32066, "lead_metasilicate")
    .dust()
    .color(0xF7F7E7).iconSet("dull")
    .components([<material:lead> * 1, <material:silicon> * 1, <material:oxygen> * 3])
    .build();

var platinum_metallic = MaterialBuilder(32067, "platinum_metallic")
    .dust()
    .color(0xfffbc5).iconSet("metallic")
    .flags("disable_decomposition")
    .components([<material:platinum> * 1, <material:rare_earth> * 1])
    .build();

var palladium_metallic = MaterialBuilder(32068, "palladium_metallic")
    .dust()
    .color(0x808080).iconSet("metallic")
    .flags("disable_decomposition")
    .components([<material:palladium> * 1, <material:rare_earth> * 1])
    .build();

var ammonium_hexachloroplatinate = MaterialBuilder(32069, "ammonium_hexachloroplatinate")
    .dust()
    .color(0xfef0c2).iconSet("metallic")
    .flags("disable_decomposition")
    .components([<material:nitrogen> * 2, <material:hydrogen> * 8, <material:platinum> * 1, <material:chlorine> * 6])
    .build();
<material:ammonium_hexachloroplatinate>.setFormula("(NH4)2PtCl6", true);

var chloroplatinic_acid = MaterialBuilder(32070, "chloroplatinic_acid")
    .fluid()
    .color(0xfef0c2)
    .flags("disable_decomposition")
    .components([<material:hydrogen> * 2, <material:platinum> * 1, <material:chlorine> * 6])
    .build();

var potassium_bisulfate = MaterialBuilder(32071, "potassium_bisulfate")
    .dust()
    .color(0xfdbd68)
    .components([<material:potassium> * 1, <material:hydrogen> * 1, <material:sulfur> * 1, <material:oxygen> * 4])
    .build();

var potassium_pyrosulfate = MaterialBuilder(32072, "potassium_pyrosulfate")
    .dust()
    .color(0xfbbb66)
    .components([<material:potassium> * 2, <material:sulfur> * 2, <material:oxygen> * 7])
    .build();

var potassium_sulfate = MaterialBuilder(32073, "potassium_sulfate")
    .dust()
    .color(0xf0b064).iconSet("metallic")
    .components([<material:potassium> * 2, <material:sulfur> * 1, <material:oxygen> * 4])
    .build();

var zinc_sulfate = MaterialBuilder(32074, "zinc_sulfate")
    .dust()
    .color(0x846649).iconSet("fine")
    .components([<material:zinc> * 1, <material:sulfur> * 1, <material:oxygen> * 4])
    .build();

var sodium_nitrate = MaterialBuilder(32075, "sodium_nitrate")
    .dust()
    .color(0x846684).iconSet("rough")
    .components([<material:sodium> * 1, <material:nitrogen> * 1, <material:oxygen> * 3])
    .build();

var rhodium_nitrate = MaterialBuilder(32076, "rhodium_nitrate")
    .dust()
    .color(0x776649).iconSet("fine")
    .flags("disable_decomposition")
    .components([<material:rhodium> * 1, <material:nitrogen> * 3, <material:oxygen> * 9])
    .build();
<material:rhodium_nitrate>.setFormula("Rh(NO3)3", true);

var sodium_ruthenate = MaterialBuilder(32077, "sodium_ruthenate")
    .dust()
    .color(0x3a40cb).iconSet("shiny")
    .flags("disable_decomposition")
    .components([<material:sodium> * 2, <material:ruthenium> * 1, <material:oxygen> * 4])
    .build();

var sodium_peroxide = MaterialBuilder(32078, "sodium_peroxide")
    .dust()
    .color(0xecff80).iconSet("rough")
    .components([<material:sodium> * 2, <material:oxygen> * 2])
    .build();

var iridium_dioxide_residue = MaterialBuilder(32079, "iridium_dioxide_residue")
    .dust()
    .color(0x17182e).iconSet("rough")
    .flags("disable_decomposition")
    .components([<material:iridium> * 1, <material:oxygen> * 2, <material:rare_earth> * 1])
    .build();

var ammonium_hexachloroiridiate = MaterialBuilder(32080, "ammonium_hexachloroiridiate")
    .dust()
    .color(0x644629).iconSet("rough")
    .flags("disable_decomposition")
    .components([<material:nitrogen> * 2, <material:hydrogen> * 8, <material:iridium> * 1, <material:chlorine> * 6])
    .build();
<material:ammonium_hexachloroiridiate>.setFormula("(NH4)2IrCl6", true);
    
var platinum_group_residue = MaterialBuilder(32081, "platinum_group_residue")
    .dust()
    .color(0x64632e).iconSet("rough")
    .flags("disable_decomposition")
    .components([<material:iridium> * 1, <material:osmium> * 1, <material:rhodium> * 1, <material:ruthenium> * 1, <material:rare_earth> * 1])
    .build();

var palladium_rich_ammonia = MaterialBuilder(32082, "palladium_rich_ammonia")
    .fluid()
    .color(0x808080)
    .flags("disable_decomposition")
    .components([<material:ammonia> * 2, <material:palladium> * 1, <material:chlorine> * 1])
    .build();

var crude_platinum_residue = MaterialBuilder(32083, "crude_platinum_residue")
    .dust()
    .color(0xfffbc5).iconSet("dull")
    .flags("disable_decomposition")
    .components([<material:platinum_raw> * 1])
    .build();

var crude_palladium_residue = MaterialBuilder(32084, "crude_palladium_residue")
    .dust()
    .color(0x909090).iconSet("dull")
    .flags("disable_decomposition")
    .components([<material:palladium_raw> * 1])
    .build();

var iridium_group_sludge = MaterialBuilder(32085, "iridium_group_sludge")
    .dust()
    .color(0x644629).iconSet("dull")
    .flags("disable_decomposition")
    .components([<material:iridium> * 1, <material:osmium> * 1, <material:ruthenium> * 1, <material:rare_earth> * 1])
    .build();

var rhodium_sulfate_solution = MaterialBuilder(32086, "rhodium_sulfate_solution")
    .fluid()
    .color(0xffbb66)
    .flags("disable_decomposition")
    .components([<material:rhodium_sulfate> * 1, <material:water> * 1])
    .build();

var crude_rhodium_residue = MaterialBuilder(32087, "crude_rhodium_residue")
    .dust()
    .color(0x666666).iconSet("dull")
    .flags("disable_decomposition")
    .components([<material:rhodium> * 2, <material:water> * 1])
    .build();

var rhodium_salt = MaterialBuilder(32088, "rhodium_salt")
    .dust()
    .color(0x848484).iconSet("shiny")
    .flags("disable_decomposition")
    .components([<material:salt> * 2, <material:rhodium> * 2, <material:chlorine> * 6])
    .build();
<material:rhodium_salt>.setFormula("(NaCl)2(RhCl3)2", true);

var acidic_iridium_dioxide_solution = MaterialBuilder(32089, "acidic_iridium_dioxide_solution")
    .fluid()
    .color(0x27284e)
    .flags("disable_decomposition")
    .components([<material:iridium_dioxide_residue> * 1, <material:hydrochloric_acid> * 4])
    .build();

var platinum_palladium_leachate = MaterialBuilder(32090, "platinum_palladium_leachate")
    .fluid()
    .color(0xffffc5)
    .flags("disable_decomposition")
    .components([<material:platinum> * 1, <material:palladium> * 1, <material:aqua_regia> * 1])
    .build();

var methyl_formate = MaterialBuilder(32091, "methyl_formate")
    .fluid()
    .color(0xffaaaa)
    .flags("disable_decomposition")
    .components([<material:carbon> * 2, <material:hydrogen> * 4, <material:oxygen> * 2])
    .build();
<material:methyl_formate>.setFormula("HCOOCH3", true);

var formic_acid = MaterialBuilder(32092, "formic_acid")
    .fluid()
    .color(0xffffc5)
    .flags("disable_decomposition")
    .components([<material:carbon> * 1, <material:hydrogen> * 2, <material:oxygen> * 2])
    .build();
<material:formic_acid>.setFormula("HCOOH", true);

var sodium_methoxide = MaterialBuilder(32093, "sodium_methoxide")
    .dust()
    .color(0xd0d0f0).iconSet("dull")
    .flags("disable_decomposition")
    .components([<material:carbon> * 1, <material:hydrogen> * 3, <material:oxygen> * 1, <material:sodium> * 1])
    .build();

var hexafluorosilicic_acid = MaterialBuilder(32094, "hexafluorosilicic_acid")
    .fluid()
    .color(0xd00010)
    .components([<material:hydrogen> * 2, <material:silicon> * 1, <material:fluorine> * 6])
    .build();

var dirty_hexafluorosilicic_acid = MaterialBuilder(32095, "dirty_hexafluorosilicic_acid")
    .fluid()
    .color(0xe00030)
    .flags("disable_decomposition")
    .components([<material:hydrogen> * 2, <material:silicon> * 1, <material:fluorine> * 6, <material:rare_earth> * 1])
    .build();

var stone_residue = MaterialBuilder(32096, "stone_residue")
    .dust()
    .color(0x4d4d4d).iconSet("rough")
    .flags("disable_decomposition")
    .build();

var uncommon_residue = MaterialBuilder(32097, "uncommon_residue")
    .dust()
    .color(0x4d4ded).iconSet("fine")
    .flags("disable_decomposition")
    .build();

var oxidised_residue = MaterialBuilder(32098, "oxidised_residue")
    .dust()
    .color(0xad4d4d).iconSet("fine")
    .flags("disable_decomposition")
    .build();

var refined_residue = MaterialBuilder(32099, "refined_residue")
    .dust()
    .color(0x2a8a21).iconSet("shiny")
    .flags("disable_decomposition")
    .build();

var clean_inert_residue = MaterialBuilder(32100, "clean_inert_residue")
    .dust()
    .color(0x3bbd2f).iconSet("shiny")
    .flags("disable_decomposition")
    .build();

var ultraacidic_residue = MaterialBuilder(32101, "ultraacidic_residue")
    .fluid()
    .color(0xb0babf)
    .flags("disable_decomposition")
    .build();

var xenic_acid = MaterialBuilder(32102, "xenic_acid")
    .fluid()
    .color(0xa567db)
    .components([<material:xenon> * 1, <material:water> * 1, <material:oxygen> * 5, <material:hydrogen_peroxide> * 1])
    .build();
<material:xenic_acid>.setFormula("H2XeO4", true);

var dusty_helium = MaterialBuilder(32103, "dusty_helium")
    .fluid("gas")
    .color(0xa040af)
    .flags("disable_decomposition")
    .components([<material:helium_3> * 1, <material:rare_earth> * 1])
    .build();

var taranium_enriched_helium = MaterialBuilder(32104, "taranium_enriched_helium")
    .fluid("gas").plasma()
    .color(0x10c050)
    .flags("disable_decomposition")
    .build();

var taranium_depleted_helium = MaterialBuilder(32105, "taranium_depleted_helium")
    .fluid("gas")
    .color(0x006010)
    .flags("disable_decomposition")
    .build();

var tritium_hydride = MaterialBuilder(32106, "tritium_hydride")
    .fluid("gas")
    .color(0xd01010)
    .flags("disable_decomposition")
    .components([<material:tritium> * 1, <material:hydrogen> * 1])
    .build();

var helium_hydride = MaterialBuilder(32107, "helium_hydride")
    .fluid("gas")
    .color(0xe6d62e)
    .flags("disable_decomposition")
    .components([<material:helium_3> * 1, <material:hydrogen> * 1])
    .build();

var dioxygen_difluoride = MaterialBuilder(32108, "dioxygen_difluoride")
    .fluid()
    .colorAverage()
    .components([<material:oxygen> * 2, <material:fluorine> * 2])
    .build();
<material:dioxygen_difluoride>.setFluidTemperature(80);

var taranium = MaterialBuilder(32109, "taranium")
    .element("Taranium")
    .ingot().fluid()
    .color(0xff00ff).iconSet("bright")
    .flags("generate_plate", "generate_dense")
    .blastTemp(10800)
    .build();
<material:taranium>.setFormula("Tn");

var darmstadtite = MaterialBuilder(32110, "darmstadtite")
    .dust().ore(2)
    .colorAverage().iconSet("dull")
    .components([<material:darmstadtium> * 2, <material:sulfur> * 3])
    .addOreByproducts([<material:rare_earth>, <material:rhodium_sulfate>, <material:darmstadtium>])
    .build();

var dulysite = MaterialBuilder(32111, "dulysite")
    .gem().ore(2)
    .colorAverage().iconSet("ruby")
    .components([<material:duranium> * 1, <material:chlorine> * 3])
    .addOreByproducts([<material:sphalerite>, <material:duranium>, <material:europium>])
    .build();

var butanol = MaterialBuilder(32112, "butanol")
    .fluid()
    .color(0xc7af2e)
    .components([<material:carbon> * 4, <material:hydrogen> * 10, <material:oxygen> * 1])
    .build();
<material:butanol>.setFormula("C4H9OH", true);

var phosphorus_trichloride = MaterialBuilder(32113, "phosphorus_trichloride")
    .fluid()
    .color(0xe8c474)
    .components([<material:phosphorus> * 1, <material:chlorine> * 3])
    .build();

var phosphoryl_chloride = MaterialBuilder(32114, "phosphoryl_chloride")
    .fluid()
    .color(0xe8bb5b)
    .components([<material:phosphorus> * 1, <material:oxygen> * 1, <material:chlorine> * 3])
    .build();

var tributyl_phosphate = MaterialBuilder(32115, "tributyl_phosphate")
    .fluid()
    .color(0xe8c4a0)
    .components([<material:carbon> * 12, <material:hydrogen> * 27, <material:oxygen> * 4, <material:phosphorus> * 1])
    .build();
<material:tributyl_phosphate>.setFormula("(C4H9O)3PO", true);

<material:rhodium_sulfate>.addDust();

<material:lutetium>.addIngot();
<material:neptunium>.addIngot();
<material:curium>.addIngot();
<material:berkelium>.addIngot();
<material:californium>.addIngot();
<material:einsteinium>.addIngot();
<material:graphite>.addIngot();

<material:neptunium>.addFluid();
<material:curium>.addFluid();
<material:berkelium>.addFluid();
<material:californium>.addFluid();
<material:einsteinium>.addFluid();
<material:nether_star>.addFluid();

<material:topaz>.addFlags(["generate_lens"]);
<material:blue_topaz>.addFlags(["generate_lens"]);
<material:ender_pearl>.addFlags(["generate_lens"]);
<material:electrum>.addFlags(["generate_gear"]);
<material:neutronium>.addFlags(["generate_round"]);
<material:titanium>.addFlags(["generate_foil", "generate_fine_wire"]);
<material:stainless_steel>.addFlags(["generate_foil", "generate_fine_wire"]);
<material:naquadah_enriched>.addFlags(["generate_bolt_screw"]);
<material:naquadria>.addFlags(["generate_bolt_screw"]);
<material:redstone>.addFlags(["generate_dense"]);
<material:trinium>.addFlags(["generate_dense"]);
<material:iridium>.addFlags(["generate_dense"]);
<material:lapis>.addFlags(["generate_dense"]);
<material:graphene>.addFlags(["generate_foil"]);
<material:berkelium>.addFlags(["generate_frame"]);
<material:blue_steel>.addFlags(["generate_frame"]);
<material:ultimet>.addFlags(["generate_frame"]);
// Prevent TE Gears from showing up
<material:tin>.addFlags(["generate_gear"]);
<material:copper>.addFlags(["generate_gear"]);
<material:gold>.addFlags(["generate_gear"]);
<material:lead>.addFlags(["generate_gear"]);
<material:nickel>.addFlags(["generate_gear"]);
<material:platinum>.addFlags(["generate_gear"]);
<material:silver>.addFlags(["generate_gear"]);
<material:emerald>.addFlags(["generate_gear"]);

<material:rhodium_sulfate>.setIconSet("rough");

<material:black_steel>.setFormula("(AuAgCu3)2Fe3?4", true);
<material:rhodium_plated_palladium>.setFormula("((SnFe)4(CuAg4)2)2Pd3Rh", true);
