#loader gregtech
#priority 10000

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;

var element_omnium = Elements.add(130, 234, -1, null, "Omnium", "Nm", false);
var element_draconium = Elements.add(149, 264, -1, null, "Draconium", "Dc", false);
var element_draconium_awakened = Elements.add(149, 267, -1, null, "AwakenedDraconium", "Dc*", false);

var fluix = MaterialBuilder(32000, "fluix")
    .gem()
    .color(0x674FAF).iconSet("QUARTZ")
    .flags(["generate_plate", "disable_decomposition", "no_smelting", "crystallizable"])
    .components([<material:certus_quartz> * 1, <material:nether_quartz> * 1, <material:redstone> * 1])
    .build();

var draconium = MaterialBuilder(32001, "draconium")
    .element("Draconium")
    .ingot().fluid()
    .color(0xbe49ed).iconSet("METALLIC")
    .blastTemp(6800, "HIGHER")
    .cableProperties(524288, 1, 0, true)
    .flags(["generate_plate", "generate_rod", "generate_gear", "generate_dense", "generate_lens"])
    .build();

var awakened_draconium = MaterialBuilder(32002, "awakened_draconium")
    .element("AwakenedDraconium")
    .ingot().fluid()
    .color(0xf58742).iconSet("METALLIC")
    .flags(["no_smelting", "generate_plate", "generate_rod", "generate_gear", "generate_dense"])
    .build();

var dark_steel = MaterialBuilder(32003, "dark_steel")
    .ingot().fluid()
    .color(0x414751).iconSet("DULL")
    .flags(["generate_plate", "generate_rod", "generate_frame", "disable_decomposition"])
    .components([<material:iron> * 1])
    .build();

var omnium = MaterialBuilder(32004, "omnium")
    .ingot().fluid()
    .element("Omnium")
    .color(0x84053e).iconSet("SHINY")
    .cableProperties(2147483647, 1, 0, true)
    .build();

//var black_quartz = MaterialBuilder(32005, "black_quartz")
//    .gem()
//    .color(0x17151a).iconSet("QUARTZ")
//    .build();

var ardite = MaterialBuilder(32006, "ardite")
    .ingot().fluid()
    .color(0xad2f05).iconSet("DULL")
    .components([<material:red_steel> * 3, <material:blaze> * 1])
    .flags(["generate_plate"])
    .build();

var mana = MaterialBuilder(32007, "mana")
    .flags(["disable_decomposition"])
    .build();

var manyullyn = MaterialBuilder(32008, "manyullyn")
    .ingot().fluid()
    .color(0x9949cc).iconSet("DULL")
    .flags(["generate_plate"])
    .components([<material:ardite> * 4, <material:cobalt> * 4, <material:mana> * 1])
    .build();


var signalum = MaterialBuilder(32010, "signalum")
    .ingot().fluid()
    .color(0xff7f0f).iconSet("SHINY")
    .blastTemp(4000)
    .flags(["generate_plate", "generate_dense", "generate_rod", "generate_gear"])
    .components([<material:annealed_copper> * 4, <material:ardite> * 2, <material:red_alloy> * 2])
    .cableProperties(32768, 1, 0, true)
    .build();

var conductive_iron = MaterialBuilder(32011, "conductive_iron")
    .ingot().fluid()
    .color(0xf7b29b).iconSet("DULL")
    .flags("generate_plate", "generate_gear")
    .components([<material:iron> * 1, <material:redstone> * 1])
    .cableProperties(32, 1, 0, true)
    .build();

var energetic_alloy = MaterialBuilder(32012, "energetic_alloy")
    .ingot().fluid()
    .color(0xffb545).iconSet("SHINY")
    .flags("generate_plate", "generate_gear")
    .blastTemp(1250)
    .components([<material:gold> * 1, <material:redstone> * 1, <material:glowstone> * 1])
    .cableProperties(128, 1, 0, true)
    .build();

var vibrant_alloy = MaterialBuilder(32013, "vibrant_alloy")
    .ingot().fluid()
    .color(0xa4ff70).iconSet("SHINY")
    .flags("generate_plate", "generate_gear")
    .blastTemp(1250)
    .components([<material:energetic_alloy> * 1, <material:ender_pearl> * 1])
    .cableProperties(512, 1, 0, true)
    .build();

var pulsating_iron = MaterialBuilder(32014, "pulsating_iron")
    .ingot().fluid()
    .color(0x6ae26e).iconSet("SHINY")
    .flags("generate_plate", "generate_gear")
    .components([<material:iron> * 1])
    .cableProperties(8, 1, 0, true)
    .build();

var electrical_steel = MaterialBuilder(32015, "electrical_steel")
    .ingot().fluid()
    .color(0xb2c0c1).iconSet("SHINY")
    .flags("generate_plate", "generate_gear")
    .components([<material:steel> * 1, <material:silicon> * 1])
    .build();
    
var lumium = MaterialBuilder(32017, "lumium")
    .ingot().fluid()
    .color(0xf6ff99).iconSet("SHINY")
    .flags("generate_plate", "generate_gear")
    .blastTemp(4500)
    .components([<material:tin_alloy> * 4, <material:sterling_silver> * 2])
    .cableProperties(8192, 1, 0, true)
    .build();

var enderium = MaterialBuilder(32018, "enderium")
    .ingot().fluid()
    .color(0x1f6b62).iconSet("SHINY")
    .flags("generate_plate", "generate_gear")
    .blastTemp(6400)
    .components([<material:lead> * 4, <material:platinum> * 2, <material:blue_steel> * 1, <material:osmium> * 1])
    .cableProperties(131072, 1, 0, true)
    .build();

var electrum_flux = MaterialBuilder(32019, "electrum_flux")
    .ingot().fluid()
    .color(0xf7be20).iconSet("METALLIC")
    .flags("generate_plate")
    .components([<material:electrum> * 6, <material:lumium> * 1, <material:signalum> * 1, <material:mana> * 1]) 
    .build();

var mithril = MaterialBuilder(32021, "mithril")
    .ingot()
    .color(0x428fdb).iconSet("DULL")
    .flags("generate_plate", "generate_gear")
    .components([<material:titanium> * 1, <material:mana> * 1])
    .build();

var knightslime = MaterialBuilder(32022, "knightslime")
    .ingot()
    .color(0xff70e2).iconSet("SHINY")
    .flags("generate_plate")
    .components([<material:titanium> * 1])
    .build();

var crystal_matrix = MaterialBuilder(32023, "crystal_matrix")
    .ingot().fluid()
    .color(0x70ecff).iconSet("SHINY")
    .flags("generate_plate")
    .build();

var soularium = MaterialBuilder(32024, "soularium")
    .ingot().fluid()
    .color(0x3b0d0d).iconSet("DULL")
    .components([<material:gold> * 1])
    .build();

var end_steel = MaterialBuilder(32025, "end_steel")
    .ingot().fluid()
    .color(0xd6d980).iconSet("DULL")
    .flags("generate_plate")
    .cableProperties(2048,1,0,true)
    .build();

var infinity = MaterialBuilder(32026, "infinity")
    .ingot()
    .color(0xedfeff).iconSet("SHINY")
    .flags("generate_plate")
    .build();

var microversium = MaterialBuilder(32027, "microversium")
    .ingot()
    .color(0x9b61b8).iconSet("DULL")
    .flags("generate_plate", "generate_frame")
    .build();

var draconic_superconductor = MaterialBuilder(32028, "draconic_superconductor")
    .ingot()
    .color(0xf5f0f4).iconSet("SHINY")
    .cableProperties(2147483647, 4, 0, true)
    .build();

MaterialRegistry.get("niobium").addOre();
MaterialRegistry.get("osmium").addOre();
MaterialRegistry.get("iridium").addOre();
MaterialRegistry.get("uranium").addOre();
MaterialRegistry.get("rutile").addOre();

//MaterialRegistry.get("niobium").setOreByProducts([<material:tantalum>]);
//MaterialRegistry.get("osmium").setOreByProducts([<material:iridium>, <material:nickel>]);
//MaterialRegistry.get("iridium").setOreByProducts([<material:osmium>, <material:nickel>]);
//MaterialRegistry.get("uranium").setOreByProducts([<material:thorium>, <material:lead>, <material:uranium_235>]);

MaterialRegistry.get("neptunium").addIngot();
MaterialRegistry.get("curium").addIngot();
MaterialRegistry.get("berkelium").addIngot();
MaterialRegistry.get("californium").addIngot();
MaterialRegistry.get("einsteinium").addIngot();
//MaterialRegistry.get("graphite").addIngot();

MaterialRegistry.get("uranium_235").addFluid();
MaterialRegistry.get("neptunium").addFluid();
MaterialRegistry.get("plutonium_241").addFluid();
MaterialRegistry.get("curium").addFluid();
MaterialRegistry.get("berkelium").addFluid();
MaterialRegistry.get("californium").addFluid();
MaterialRegistry.get("einsteinium").addFluid();

MaterialRegistry.get("neutronium").addFlags(["generate_round"]);
MaterialRegistry.get("titanium").addFlags(["generate_foil", "generate_fine_wire"]);
MaterialRegistry.get("stainless_steel").addFlags(["generate_foil", "generate_fine_wire"]);
MaterialRegistry.get("naquadah_enriched").addFlags(["generate_bolt_screw"]);
MaterialRegistry.get("naquadria").addFlags(["generate_bolt_screw"]);

MaterialRegistry.get("glowstone").setFormula("Au(Ca3(PO4)2)", true);