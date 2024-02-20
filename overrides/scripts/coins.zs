#packmode normal

import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IItemStack;
  

recipes.addShaped(<actuallyadditions:item_misc:16>, [
	[<nomilabs:nomicoin100>, null, <nomilabs:nomicoin100>],
	[null, <nomilabs:nomicoin100>, null],
	[<nomilabs:nomicoin100>, null, <nomilabs:nomicoin100>]]);
recipes.addShapeless(<morefurnaces:furnaceblock:2> * 2, [<morefurnaces:furnaceblock:3>]); 
  
//Stone Widget
recipes.addShaped(<nomilabs:stonewidget>, [
	[null, <nomilabs:stonewidgetup>, null],
	[null, <enderio:item_material:10>, null], 
	[null, <nomilabs:stonewidgetdown>, null]]);
recipes.addShaped(<nomilabs:stonewidgetup>, [
	[<minecraft:stone_slab>, <ore:toolHammer>, <minecraft:stone_slab>],
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>], 
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>]]);
recipes.addShaped(<nomilabs:stonewidgetdown>, [
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>], 
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>],
	[<minecraft:stone_slab>, <ore:toolHammer>, <minecraft:stone_slab>]]);
recipes.remove(<enderio:item_material:10>);
recipes.addShaped(<enderio:item_material:10>,[
	[null, <minecraft:stone>, null],
	[<minecraft:stone>, <enderio:item_material:9>, <minecraft:stone>],
	[null, <minecraft:stone>, null]]);

	
	
//Wooden Widget
recipes.addShaped(<nomilabs:woodenwidget>, [
	[null, null, null],
	[<nomilabs:woodwidgetleft>, <enderio:item_material:9>, <nomilabs:woodwidgetright>],
	[null,null,null]]);
recipes.addShaped(<nomilabs:woodwidgetleft>, [
	[<ore:slabWood>,<ore:plankWood>,<ore:plankWood>], 
	[<ore:toolSaw>,<ore:plankWood>,<ore:plankWood>],
	[<ore:slabWood>, <ore:plankWood>, <ore:plankWood>]]);
recipes.addShaped(<nomilabs:woodwidgetright>, [
	[<ore:plankWood>,<ore:plankWood>,<ore:slabWood>], 
	[<ore:plankWood>,<ore:plankWood>,<ore:toolSaw>],
	[<ore:plankWood>,<ore:plankWood>,<ore:slabWood>]]);
recipes.remove(<enderio:item_material:9>);

	
//Alloy Widget
recipes.addShaped(<nomilabs:alloywidget>, [
	[<ore:cableGtSingleCopper>, <metaitem:plateCupronickel>, <ore:cableGtSingleCopper>],
	[<metaitem:plateCupronickel>, <metaitem:gearInvar>, <metaitem:plateCupronickel>], 
	[<ore:cableGtSingleCopper>, <metaitem:plateCupronickel>, <ore:cableGtSingleCopper>]]);


//Ender Widget
recipes.addShaped(<nomilabs:enderwidget>, [
	[<enderio:item_item_conduit>, <metaitem:nomilabs:platePulsatingIron>, <enderio:item_redstone_conduit>],
	[<metaitem:nomilabs:platePulsatingIron>, <metaitem:nomilabs:gearElectricalSteel>, <metaitem:nomilabs:platePulsatingIron>], 
	[<enderio:item_power_conduit>, <metaitem:nomilabs:platePulsatingIron>, <enderio:item_liquid_conduit:1>]]);


recipes.addShaped(<gregtech:rubber_sapling> * 64, [[<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:sapling:5> * 64, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, null, null], [<nomilabs:nomicoin>, null, null]]);
recipes.addShaped(<minecraft:sapling:4> * 64, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, null, <nomilabs:nomicoin>], [null, null, null]]);
recipes.addShaped(<minecraft:sapling:1> * 64, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, null, null], [null, <nomilabs:nomicoin>, null]]);
recipes.addShaped(<minecraft:sapling:2> * 64, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[<nomilabs:nomicoin>, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:clay_ball> * 64, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[null, null, <nomilabs:nomicoin>], [null, null, null]]);
recipes.addShaped(<actuallyadditions:item_canola_seed> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, <nomilabs:nomicoin>, null], [null, null, null]]);
recipes.addShaped(<minecraft:sapling> * 64, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[null, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:reeds> * 32, [[<nomilabs:nomicoin>, null, <nomilabs:nomicoin>],[null, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:cactus> * 32, [[<nomilabs:nomicoin>, null, null],[<nomilabs:nomicoin>, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:potato> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_green_sapphire_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_sapphire_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_cobaltite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_neodymium_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_realgar_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_electrotine_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_tantalite_0> * 32, [[null, <nomilabs:nomicoin5>, null],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_pitchblende_0> * 32, [[<nomilabs:nomicoin>, null, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, null, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_saltpeter_0> * 32, [[null, <nomilabs:nomicoin>, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, null, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_graphite_0> * 32, [[null, null, <nomilabs:nomicoin>],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, null, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_powellite_0> * 32, [[null, <nomilabs:nomicoin>, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_oilsands_0> * 32, [[<nomilabs:nomicoin>, null, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, <nomilabs:nomicoin>, null]]);
recipes.addShaped(<gregtech:ore_gold_0> * 32, [[<nomilabs:nomicoin25>, null, <nomilabs:nomicoin25>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_emerald_0> * 32, [[<nomilabs:nomicoin25>, null, null],[null, null, null], [<nomilabs:nomicoin25>, null, null]]);
recipes.addShaped(<gregtech:ore_palladium_0> * 32, [[<nomilabs:nomicoin25>, null, null],[null, null, null], [null, <nomilabs:nomicoin25>, null]]);
recipes.addShaped(<gregtech:ore_molybdenum_0> * 32, [[null, null, <nomilabs:nomicoin25>],[null, null, null], [null, null, null]]);
//recipes.addShaped(<gregtech:ore_uranium_0> * 32, [[<nomilabs:nomicoin25>, null, null],[null, null, null], [null, null, <nomilabs:nomicoin25>]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}) * 2, [[null, <nomilabs:nomicoin25>, null],[null, null, null], [null, null, <nomilabs:nomicoin25>]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}) * 2, [[<nomilabs:nomicoin25>, <nomilabs:nomicoin25>, null],[null, null, <nomilabs:nomicoin25>], [null, null, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}) * 2, [[<nomilabs:nomicoin25>, null, null],[null, null, <nomilabs:nomicoin25>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_ilmenite_0> * 32, [[<nomilabs:nomicoin25>, null, null],[null, <nomilabs:nomicoin25>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_platinum_0> * 32, [[<nomilabs:nomicoin25>, null, null],[<nomilabs:nomicoin25>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_cooperite_0> * 32, [[<nomilabs:nomicoin25>, null, null],[<nomilabs:nomicoin25>, <nomilabs:nomicoin25>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_diamond_0> * 32, [[<nomilabs:nomicoin25>, <nomilabs:nomicoin25>, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}) * 2, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, null, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_tricalcium_phosphate_0> * 32, [[null, null, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, <nomilabs:nomicoin>, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_apatite_0> * 32, [[<nomilabs:nomicoin>, null, null],[null, null, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_sphalerite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[null, null, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_uraninite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[null, null, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_spessartine_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[null, null, null], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_silver_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[null, null, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_lead_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[null, <nomilabs:nomicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_molybdenite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, null, null], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_bastnasite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_monazite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_tetrahedrite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[null, null, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_topaz_0> * 32, [[null, null, null], [<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_ruby_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[null, <nomilabs:nomicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_stibnite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_thorium_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[<nomilabs:nomicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_malachite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_pyrite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_beryllium_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, null, null], [<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_salt_0> * 32, [[null, <nomilabs:nomicoin>, null],[null, null, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_rock_salt_0> * 32, [[null, null, null],[null, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_lazurite_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, null, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, <nomilabs:nomicoin>, null]]);
recipes.addShaped(<gregtech:ore_vanadium_magnetite_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[null, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_calcite_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_sodalite_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[null, null, null], [null, <nomilabs:nomicoin>, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_lapis_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[null, null, null], [<nomilabs:nomicoin>, <nomilabs:nomicoin>, null]]);
//recipes.addShaped(<gregtech:ore_lignite_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[null, null, <nomilabs:nomicoin>], [<nomilabs:nomicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_coal_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[null, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_cinnabar_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[<nomilabs:nomicoin>, null, null], [null, null, <nomilabs:nomicoin>]]);
recipes.addShaped(<gregtech:ore_redstone_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[<nomilabs:nomicoin>, null, null], [null, <nomilabs:nomicoin>, null]]);
recipes.addShaped(<gregtech:ore_talc_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[<nomilabs:nomicoin>, null, null], [<nomilabs:nomicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_pyrope_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[<nomilabs:nomicoin>, null, <nomilabs:nomicoin>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_soapstone_0> * 32, [[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_banded_iron_0> * 32, [[null, null, null],[null, null, null], [null, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_galena_0> * 32, [[null, null, null],[null, null, null], [<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_almandine_0> * 32, [[null, null, null],[null, null, null], [<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_garnierite_0> * 32, [[null, null, null],[null, null, <nomilabs:nomicoin5>], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_nickel_0> * 32, [[null, null, null],[null, null, <nomilabs:nomicoin5>], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_barite_0> * 32, [[null, null, null],[null, null, <nomilabs:nomicoin5>], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_lepidolite_0> * 32, [[null, null, null],[null, <nomilabs:nomicoin5>, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_bentonite_0> * 32, [[null, null, null],[null, <nomilabs:nomicoin5>, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShapeless(<nomilabs:nomicoin> * 5, [<nomilabs:nomicoin5>]);
recipes.addShapeless(<nomilabs:nomicoin5> * 5, [<nomilabs:nomicoin25>]);
recipes.addShapeless(<nomilabs:nomicoin25> * 4, [<nomilabs:nomicoin100>]);
recipes.addShaped(<gregtech:ore_aluminium_0> * 32, [[null, null, null],[null, <nomilabs:nomicoin5>, null], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_bauxite_0> * 32, [[null, null, null],[null, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_grossular_0> * 32, [[null, null, null],[<nomilabs:nomicoin5>, null, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_pyrolusite_0> * 32, [[null, null, null],[<nomilabs:nomicoin5>, null, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_magnesite_0> * 32, [[null, null, null],[<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_olivine_0> * 32, [[null, null, null],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_tin_0> * 32, [[null, null, <nomilabs:nomicoin5>],[null, null, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_cassiterite_0> * 32, [[null, <nomilabs:nomicoin5>, null],[null, null, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_lithium_0> * 32, [[null, <nomilabs:nomicoin5>, null],[null, null, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_spodumene_0> * 32, [[null, <nomilabs:nomicoin5>, null],[null, null, null], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_chalcopyrite_0> * 32, [[null, <nomilabs:nomicoin5>, null],[null, null, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_copper_0> * 32, [[null, <nomilabs:nomicoin5>, null],[null, <nomilabs:nomicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_sulfur_0> * 32, [[null, <nomilabs:nomicoin5>, null],[<nomilabs:nomicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_quartzite_0> * 32, [[null, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_nether_quartz_0> * 32, [[<nomilabs:nomicoin5>, null, null],[null, null, null], [null, null, <nomilabs:nomicoin5>]]);
recipes.addShaped(<gregtech:ore_certus_quartz_0> * 32, [[<nomilabs:nomicoin5>, null, null],[null, null, null], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<gregtech:ore_pentlandite_0> * 32, [[<nomilabs:nomicoin5>, null, null],[null, null, null], [<nomilabs:nomicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_glauconite_sand_0> * 32, [[<nomilabs:nomicoin5>, null, null],[null, null, <nomilabs:nomicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_brown_limonite_0> * 32, [[<nomilabs:nomicoin5>, null, null],[null, <nomilabs:nomicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_yellow_limonite_0> * 32, [[<nomilabs:nomicoin5>, null, null],[<nomilabs:nomicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_iron_0> * 32, [[<nomilabs:nomicoin5>, null, <nomilabs:nomicoin5>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_magnetite_0> * 32, [[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<nomilabs:nomicoin100>, [[<nomilabs:nomicoin25>, null, <nomilabs:nomicoin25>],[null,null,null], [<nomilabs:nomicoin25>, null, <nomilabs:nomicoin25>]]);
recipes.addShaped(<nomilabs:nomicoin25>, [[null, <nomilabs:nomicoin5>, null],[<nomilabs:nomicoin5>, <nomilabs:nomicoin5>, <nomilabs:nomicoin5>], [null, <nomilabs:nomicoin5>, null]]);
recipes.addShaped(<nomilabs:nomicoin5>, [[null, <nomilabs:nomicoin>, null],[<nomilabs:nomicoin>, <nomilabs:nomicoin>, <nomilabs:nomicoin>], [null, <nomilabs:nomicoin>, null]]);

/*
    Airtight Seal books for the low price of 900 Nomicoins!
 */
recipes.addShaped("of_craft_airtight_seal",
    <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}),
    [[<nomilabs:nomicoin100>, <nomilabs:nomicoin100>, <nomilabs:nomicoin100>],
     [<nomilabs:nomicoin100>, <nomilabs:nomicoin100>, <nomilabs:nomicoin100>],
     [<nomilabs:nomicoin100>, <nomilabs:nomicoin100>, <nomilabs:nomicoin100>]]);
