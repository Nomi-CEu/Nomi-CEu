#packmode normal

import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IItemStack;
  

recipes.addShaped(<actuallyadditions:item_misc:16>, [
	[<contenttweaker:omnicoin100>, null, <contenttweaker:omnicoin100>],
	[null, <contenttweaker:omnicoin100>, null],
	[<contenttweaker:omnicoin100>, null, <contenttweaker:omnicoin100>]]);
recipes.addShapeless(<morefurnaces:furnaceblock:2> * 2, [<morefurnaces:furnaceblock:3>]); 
  
//Stone Widget
recipes.addShaped(<contenttweaker:stonewidget>, [
	[null, <contenttweaker:stonewidgetup>, null],
	[null, <enderio:item_material:10>, null], 
	[null, <contenttweaker:stonewidgetdown>, null]]);
recipes.addShaped(<contenttweaker:stonewidgetup>, [
	[<minecraft:stone_slab>, <ore:toolHammer>, <minecraft:stone_slab>],
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>], 
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>]]);
recipes.addShaped(<contenttweaker:stonewidgetdown>, [
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>], 
	[<minecraft:stone>,<minecraft:stone>,<minecraft:stone>],
	[<minecraft:stone_slab>, <ore:toolHammer>, <minecraft:stone_slab>]]);
recipes.remove(<enderio:item_material:10>);
recipes.addShaped(<enderio:item_material:10>,[
	[null, <minecraft:stone>, null],
	[<minecraft:stone>, <enderio:item_material:9>, <minecraft:stone>],
	[null, <minecraft:stone>, null]]);

	
	
//Wooden Widget
recipes.addShaped(<contenttweaker:woodenwidget>, [
	[null, null, null],
	[<contenttweaker:woodwidgetleft>, <enderio:item_material:9>, <contenttweaker:woodwidgetright>],
	[null,null,null]]);
recipes.addShaped(<contenttweaker:woodwidgetleft>, [
	[<ore:slabWood>,<ore:plankWood>,<ore:plankWood>], 
	[<ore:toolSaw>,<ore:plankWood>,<ore:plankWood>],
	[<ore:slabWood>, <ore:plankWood>, <ore:plankWood>]]);
recipes.addShaped(<contenttweaker:woodwidgetright>, [
	[<ore:plankWood>,<ore:plankWood>,<ore:slabWood>], 
	[<ore:plankWood>,<ore:plankWood>,<ore:toolSaw>],
	[<ore:plankWood>,<ore:plankWood>,<ore:slabWood>]]);
recipes.remove(<enderio:item_material:9>);

	
//Alloy Widget
recipes.addShaped(<contenttweaker:alloywidget>, [
	[<ore:cableGtSingleCopper>, <metaitem:plateCupronickel>, <ore:cableGtSingleCopper>],
	[<metaitem:plateCupronickel>, <metaitem:gearInvar>, <metaitem:plateCupronickel>], 
	[<ore:cableGtSingleCopper>, <metaitem:plateCupronickel>, <ore:cableGtSingleCopper>]]);


//Ender Widget
recipes.addShaped(<contenttweaker:enderwidget>, [
	[<enderio:item_item_conduit>, <metaitem:platePulsatingIron>, <enderio:item_redstone_conduit>],
	[<metaitem:platePulsatingIron>, <metaitem:gearElectricalSteel>, <metaitem:platePulsatingIron>], 
	[<enderio:item_power_conduit>, <metaitem:platePulsatingIron>, <enderio:item_liquid_conduit:1>]]);


recipes.addShaped(<gregtech:rubber_sapling> * 64, [[<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:sapling:5> * 64, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, null, null], [<contenttweaker:omnicoin>, null, null]]);
recipes.addShaped(<minecraft:sapling:4> * 64, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, null, <contenttweaker:omnicoin>], [null, null, null]]);
recipes.addShaped(<minecraft:sapling:1> * 64, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, null, null], [null, <contenttweaker:omnicoin>, null]]);
recipes.addShaped(<minecraft:sapling:2> * 64, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[<contenttweaker:omnicoin>, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:clay_ball> * 64, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[null, null, <contenttweaker:omnicoin>], [null, null, null]]);
recipes.addShaped(<actuallyadditions:item_canola_seed> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, <contenttweaker:omnicoin>, null], [null, null, null]]);
recipes.addShaped(<minecraft:sapling> * 64, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[null, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:reeds> * 32, [[<contenttweaker:omnicoin>, null, <contenttweaker:omnicoin>],[null, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:cactus> * 32, [[<contenttweaker:omnicoin>, null, null],[<contenttweaker:omnicoin>, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:potato> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_green_sapphire_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_sapphire_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_cobaltite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_neodymium_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_realgar_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_electrotine_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_tantalite_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_pitchblende_0> * 32, [[<contenttweaker:omnicoin>, null, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, null, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_saltpeter_0> * 32, [[null, <contenttweaker:omnicoin>, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, null, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_graphite_0> * 32, [[null, null, <contenttweaker:omnicoin>],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, null, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_powellite_0> * 32, [[null, <contenttweaker:omnicoin>, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_oilsands_0> * 32, [[<contenttweaker:omnicoin>, null, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, <contenttweaker:omnicoin>, null]]);
recipes.addShaped(<gregtech:ore_gold_0> * 32, [[<contenttweaker:omnicoin25>, null, <contenttweaker:omnicoin25>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_emerald_0> * 32, [[<contenttweaker:omnicoin25>, null, null],[null, null, null], [<contenttweaker:omnicoin25>, null, null]]);
recipes.addShaped(<gregtech:ore_palladium_0> * 32, [[<contenttweaker:omnicoin25>, null, null],[null, null, null], [null, <contenttweaker:omnicoin25>, null]]);
recipes.addShaped(<gregtech:ore_molybdenum_0> * 32, [[null, null, <contenttweaker:omnicoin25>],[null, null, null], [null, null, null]]);
//recipes.addShaped(<gregtech:ore_uranium_0> * 32, [[<contenttweaker:omnicoin25>, null, null],[null, null, null], [null, null, <contenttweaker:omnicoin25>]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:chicken"}}) * 2, [[null, <contenttweaker:omnicoin25>, null],[null, null, null], [null, null, <contenttweaker:omnicoin25>]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}) * 2, [[<contenttweaker:omnicoin25>, <contenttweaker:omnicoin25>, null],[null, null, <contenttweaker:omnicoin25>], [null, null, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:pig"}}) * 2, [[<contenttweaker:omnicoin25>, null, null],[null, null, <contenttweaker:omnicoin25>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_ilmenite_0> * 32, [[<contenttweaker:omnicoin25>, null, null],[null, <contenttweaker:omnicoin25>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_platinum_0> * 32, [[<contenttweaker:omnicoin25>, null, null],[<contenttweaker:omnicoin25>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_cooperite_0> * 32, [[<contenttweaker:omnicoin25>, null, null],[<contenttweaker:omnicoin25>, <contenttweaker:omnicoin25>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_diamond_0> * 32, [[<contenttweaker:omnicoin25>, <contenttweaker:omnicoin25>, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:sheep"}}) * 2, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, null, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_tricalcium_phosphate_0> * 32, [[null, null, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_apatite_0> * 32, [[<contenttweaker:omnicoin>, null, null],[null, null, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_sphalerite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[null, null, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_uraninite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[null, null, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_spessartine_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[null, null, null], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_silver_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[null, null, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_lead_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[null, <contenttweaker:omnicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_molybdenite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, null, null], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_bastnasite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_monazite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_tetrahedrite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[null, null, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_topaz_0> * 32, [[null, null, null], [<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_ruby_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[null, <contenttweaker:omnicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_stibnite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_thorium_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[<contenttweaker:omnicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_malachite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_pyrite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_beryllium_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, null, null], [<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_salt_0> * 32, [[null, <contenttweaker:omnicoin>, null],[null, null, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_rock_salt_0> * 32, [[null, null, null],[null, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_lazurite_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, null, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null]]);
recipes.addShaped(<gregtech:ore_vanadium_magnetite_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[null, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_calcite_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_sodalite_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[null, null, null], [null, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_lapis_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[null, null, null], [<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null]]);
//recipes.addShaped(<gregtech:ore_lignite_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[null, null, <contenttweaker:omnicoin>], [<contenttweaker:omnicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_coal_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[null, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_cinnabar_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[<contenttweaker:omnicoin>, null, null], [null, null, <contenttweaker:omnicoin>]]);
recipes.addShaped(<gregtech:ore_redstone_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[<contenttweaker:omnicoin>, null, null], [null, <contenttweaker:omnicoin>, null]]);
recipes.addShaped(<gregtech:ore_talc_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[<contenttweaker:omnicoin>, null, null], [<contenttweaker:omnicoin>, null, null]]);
recipes.addShaped(<gregtech:ore_pyrope_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[<contenttweaker:omnicoin>, null, <contenttweaker:omnicoin>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_soapstone_0> * 32, [[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_banded_iron_0> * 32, [[null, null, null],[null, null, null], [null, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_galena_0> * 32, [[null, null, null],[null, null, null], [<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_almandine_0> * 32, [[null, null, null],[null, null, null], [<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_garnierite_0> * 32, [[null, null, null],[null, null, <contenttweaker:omnicoin5>], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_nickel_0> * 32, [[null, null, null],[null, null, <contenttweaker:omnicoin5>], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_barite_0> * 32, [[null, null, null],[null, null, <contenttweaker:omnicoin5>], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_lepidolite_0> * 32, [[null, null, null],[null, <contenttweaker:omnicoin5>, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_bentonite_0> * 32, [[null, null, null],[null, <contenttweaker:omnicoin5>, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShapeless(<contenttweaker:omnicoin> * 5, [<contenttweaker:omnicoin5>]);
recipes.addShapeless(<contenttweaker:omnicoin5> * 5, [<contenttweaker:omnicoin25>]);
recipes.addShapeless(<contenttweaker:omnicoin25> * 4, [<contenttweaker:omnicoin100>]);
recipes.addShaped(<gregtech:ore_aluminium_0> * 32, [[null, null, null],[null, <contenttweaker:omnicoin5>, null], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_bauxite_0> * 32, [[null, null, null],[null, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_grossular_0> * 32, [[null, null, null],[<contenttweaker:omnicoin5>, null, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_pyrolusite_0> * 32, [[null, null, null],[<contenttweaker:omnicoin5>, null, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_magnesite_0> * 32, [[null, null, null],[<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_olivine_0> * 32, [[null, null, null],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_tin_0> * 32, [[null, null, <contenttweaker:omnicoin5>],[null, null, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_cassiterite_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[null, null, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_lithium_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[null, null, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_spodumene_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[null, null, null], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_chalcopyrite_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[null, null, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_copper_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[null, <contenttweaker:omnicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_sulfur_0> * 32, [[null, <contenttweaker:omnicoin5>, null],[<contenttweaker:omnicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_quartzite_0> * 32, [[null, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_nether_quartz_0> * 32, [[<contenttweaker:omnicoin5>, null, null],[null, null, null], [null, null, <contenttweaker:omnicoin5>]]);
recipes.addShaped(<gregtech:ore_certus_quartz_0> * 32, [[<contenttweaker:omnicoin5>, null, null],[null, null, null], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<gregtech:ore_pentlandite_0> * 32, [[<contenttweaker:omnicoin5>, null, null],[null, null, null], [<contenttweaker:omnicoin5>, null, null]]);
recipes.addShaped(<gregtech:ore_glauconite_sand_0> * 32, [[<contenttweaker:omnicoin5>, null, null],[null, null, <contenttweaker:omnicoin5>], [null, null, null]]);
recipes.addShaped(<gregtech:ore_brown_limonite_0> * 32, [[<contenttweaker:omnicoin5>, null, null],[null, <contenttweaker:omnicoin5>, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_yellow_limonite_0> * 32, [[<contenttweaker:omnicoin5>, null, null],[<contenttweaker:omnicoin5>, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_iron_0> * 32, [[<contenttweaker:omnicoin5>, null, <contenttweaker:omnicoin5>],[null, null, null], [null, null, null]]);
recipes.addShaped(<gregtech:ore_magnetite_0> * 32, [[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, null],[null, null, null], [null, null, null]]);
recipes.addShaped(<contenttweaker:omnicoin100>, [[<contenttweaker:omnicoin25>, null, <contenttweaker:omnicoin25>],[null,null,null], [<contenttweaker:omnicoin25>, null, <contenttweaker:omnicoin25>]]);
recipes.addShaped(<contenttweaker:omnicoin25>, [[null, <contenttweaker:omnicoin5>, null],[<contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>, <contenttweaker:omnicoin5>], [null, <contenttweaker:omnicoin5>, null]]);
recipes.addShaped(<contenttweaker:omnicoin5>, [[null, <contenttweaker:omnicoin>, null],[<contenttweaker:omnicoin>, <contenttweaker:omnicoin>, <contenttweaker:omnicoin>], [null, <contenttweaker:omnicoin>, null]]);

/*
    Airtight Seal books for the low price of 900 Nomicoins!
 */
recipes.addShaped("of_craft_airtight_seal",
    <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 12 as short}]}),
    [[<contenttweaker:omnicoin100>, <contenttweaker:omnicoin100>, <contenttweaker:omnicoin100>],
     [<contenttweaker:omnicoin100>, <contenttweaker:omnicoin100>, <contenttweaker:omnicoin100>],
     [<contenttweaker:omnicoin100>, <contenttweaker:omnicoin100>, <contenttweaker:omnicoin100>]]);
