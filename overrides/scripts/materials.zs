#loader gregtech
#packmode normal

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.IMaterialPredicate;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.gregtech.ore.OrePrefix;

val gemPerfect as OrePrefix = OrePrefix.registerOrePrefix("gemPerfect", 8, "gemPerfect", 1);
gemPerfect.setGenerationPredicate(IMaterialPredicate.hasGem);
gemPerfect.createMaterialItem();

var element_omnium = Elements.add(130, 234, -1, null, "Omnium", "Nm", false);
var element_draconium = Elements.add(149, 264, -1, null, "Draconium", "Dc", false);
var element_draconium_awakened = Elements.add(149, 267, -1, null, "AwakenedDraconium", "Dc*", false);

var draconium = MaterialBuilder(32001, "draconium")
    .element("Draconium")
    .ingot().fluid().ore()
    .color(0xbe49ed).iconSet("metallic")
    .blastTemp(6800, "HIGHER")
    .cableProperties(524288, 1, 0, true)
    .flags(["generate_plate", "generate_rod", "generate_gear"])
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
    .flags("generate_plate", "generate_gear")
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
    .flags("generate_plate", "generate_gear")
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
    .cableProperties(2048,1,0,true)
    .build();

var infinity = MaterialBuilder(32026, "infinity")
    .ingot()
    .color(0x000000).iconSet("shiny")
    .flags("generate_plate")
    .build();

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
    .dust()
    .color(0xFFFC9E).iconSet("rough")
    .components([<material:calcium> * 1, <material:fluorine> * 2])
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

<material:lutetium>.addIngot();
<material:neptunium>.addIngot();
<material:curium>.addIngot();
<material:berkelium>.addIngot();
<material:californium>.addIngot();
<material:einsteinium>.addIngot();
<material:graphite>.addIngot();

<material:uranium_235>.addFluid();
<material:neptunium>.addFluid();
<material:plutonium_241>.addFluid();
<material:curium>.addFluid();
<material:berkelium>.addFluid();
<material:californium>.addFluid();
<material:einsteinium>.addFluid();
<material:nether_star>.addFluid();

<material:topaz>.addFlags(["generate_lens"]);
<material:electrum>.addFlags(["generate_gear"]);
<material:neutronium>.addFlags(["generate_round"]);
<material:titanium>.addFlags(["generate_foil", "generate_fine_wire"]);
<material:stainless_steel>.addFlags(["generate_foil", "generate_fine_wire"]);
<material:naquadah_enriched>.addFlags(["generate_bolt_screw"]);
<material:naquadria>.addFlags(["generate_bolt_screw"]);
<material:redstone>.addFlags(["generate_dense"]);
<material:lapis>.addFlags(["generate_dense"]);
<material:graphene>.addFlags(["generate_foil"]);
<material:berkelium>.addFlags(["generate_frame"]);
// Prevent TE Gears from showing up
<material:tin>.addFlags(["generate_gear"]);
<material:copper>.addFlags(["generate_gear"]);
<material:gold>.addFlags(["generate_gear"]);
<material:lead>.addFlags(["generate_gear"]);
<material:nickel>.addFlags(["generate_gear"]);
<material:platinum>.addFlags(["generate_gear", ]);
<material:silver>.addFlags(["generate_gear"]);
<material:emerald>.addFlags(["generate_gear"]);

<material:black_steel>.setFormula("(AuAgCu3)2Fe3?4", true);
<material:rhodium_plated_palladium>.setFormula("((SnFe)4(CuAg4)2)2Pd3Rh", true);
