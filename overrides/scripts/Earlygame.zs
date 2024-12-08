import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IItemStack;
//import scripts.CommonVars.makeShaped as makeShaped;

//Plantball
recipes.addShaped(<metaitem:plant_ball>, [
	[<ore:treeLeaves>,<ore:treeLeaves>,<ore:treeLeaves>],
	[<ore:treeLeaves>,null,<ore:treeLeaves>],
	[<ore:treeLeaves>,<ore:treeLeaves>,<ore:treeLeaves>]]);
recipes.addShaped(<metaitem:plant_ball>, [
	[<minecraft:vine>,<minecraft:vine>,<minecraft:vine>],
	[<minecraft:vine>,null,<minecraft:vine>],
	[<minecraft:vine>,<minecraft:vine>,<minecraft:vine>]]);
recipes.addShaped(<metaitem:plant_ball>, [
	[<ore:treeSapling>,<ore:treeSapling>,<ore:treeSapling>],
	[<ore:treeSapling>,null,<ore:treeSapling>],
	[<ore:treeSapling>,<ore:treeSapling>,<ore:treeSapling>]]);
furnace.addRecipe(<minecraft:slime_ball> * 2, <metaitem:plant_ball>, 0.0);

//Ender Pearls
alloy.recipeBuilder().inputs([<minecraft:diamond>,<ore:dustPulsating>]).outputs([<minecraft:ender_pearl>]).duration(300).EUt(16).buildAndRegister();

// Firework Rocket JEI fix
recipes.addShapeless(<minecraft:fireworks>.withTag({Fireworks: {Flight: 1 as byte}}), [<minecraft:paper>, <minecraft:gunpowder>]);
recipes.addShapeless(<minecraft:fireworks>.withTag({Fireworks: {Flight: 2 as byte}}), [<minecraft:paper>, <minecraft:gunpowder>, <minecraft:gunpowder>]);
recipes.addShapeless(<minecraft:fireworks>.withTag({Fireworks: {Flight: 3 as byte}}), [<minecraft:paper>, <minecraft:gunpowder>, <minecraft:gunpowder>, <minecraft:gunpowder>]);

/* Tool Belt */
recipes.remove(<toolbelt:pouch>);
recipes.addShaped(<toolbelt:pouch>, [
	[null, <minecraft:gold_ingot>, null],
	[<minecraft:leather>, <simplyjetpacks:metaitem:4>, <minecraft:leather>],
	[null, <minecraft:leather>, null]]);

//Dusts
recipes.addShapeless(<minecraft:gravel>, [<minecraft:cobblestone>, <ore:toolMortar>]);
recipes.addShapeless(<minecraft:sand>, [<minecraft:gravel>, <ore:toolHammer>]);
recipes.addShapeless(<nomilabs:block_dust>, [<minecraft:sand>, <ore:toolHammer>]);
furnace.addRecipe(<nomilabs:pulsatingdust>, <metaitem:dustUraninite>, 0.0);

//Snad	
recipes.remove(<snad:snad>);
recipes.remove(<snad:snad:1>);
recipes.addShaped(<snad:snad>, [[<extrautils2:compressedsand:1>], [<enderio:item_material:14>], [<extrautils2:compressedsand:1>]]);

//Photovoltaic Cells
alloy_smelter.recipeBuilder().inputs([<enderio:item_material:38> * 2, <metaitem:nomilabs:plateElectricalSteel>]).outputs([<enderio:item_material:3>]).duration(180).EUt(16).buildAndRegister();


//Drawers
recipes.remove(<storagedrawers:upgrade_storage>);
recipes.remove(<storagedrawers:compdrawers>);
recipes.remove(<storagedrawers:controller>);
recipes.remove(<storagedrawers:controllerslave>);
recipes.addShaped(<storagedrawers:upgrade_storage>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [<minecraft:coal>, <storagedrawers:upgrade_template>, <minecraft:coal>], [<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);

recipes.addShaped(<storagedrawers:compdrawers>, [
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
	[<metaitem:electric.piston.lv>, <storagedrawers:customdrawers>, <metaitem:electric.piston.lv>],
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>]]);

recipes.addShaped(<storagedrawers:controller>, [
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
	[<ore:circuitLv>, <storagedrawers:customdrawers>, <ore:circuitLv>],
	[<ore:plateIron>, <minecraft:diamond_block>, <ore:plateIron>]]);

recipes.addShaped(<storagedrawers:controller>, [
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
	[<ore:circuitLv>, <storagedrawers:customdrawers>, <ore:circuitLv>],
	[<ore:plateIron>, <minecraft:emerald_block>, <ore:plateIron>]]);

recipes.addShaped(<storagedrawers:controllerslave>, [
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
	[<ore:circuitLv>, <storagedrawers:customdrawers>, <ore:circuitLv>],
	[<ore:plateIron>, <minecraft:gold_block>, <ore:plateIron>]]);

//Mechanical Crafter
recipes.remove(<extrautils2:crafter>);
recipes.addShaped(<extrautils2:crafter>, [[<extrautils2:ingredients>, <metaitem:gearSmallSteel>, <extrautils2:ingredients>],[<metaitem:gearSmallSteel>, <metaitem:workbench>, <metaitem:gearSmallSteel>], [<extrautils2:ingredients>, <metaitem:gearSmallSteel>, <extrautils2:ingredients>]]);


//resonating redstone crystal
recipes.remove(<extrautils2:ingredients>);
recipes.remove(<extrautils2:ingredients:2>);
recipes.remove(<extrautils2:ingredients:6>);
recipes.remove(<extrautils2:ingredients:7>);
recipes.remove(<extrautils2:ingredients:8>);
alloy_smelter.recipeBuilder().inputs([<extrautils2:endershard>, <actuallyadditions:item_crystal>]).outputs([<extrautils2:ingredients>]).duration(180).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<extrautils2:endershard>, <minecraft:redstone_block>]).outputs([<extrautils2:ingredients>]).duration(180).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<ore:blockEnderEye>, <actuallyadditions:block_crystal> * 4]).outputs([<extrautils2:ingredients:2>]).duration(800).EUt(16).buildAndRegister(); // Ender Eye Block
alloy_smelter.recipeBuilder().inputs([<extrautils2:ingredients:9>, <minecraft:diamond> * 4]).outputs([<extrautils2:ingredients:7>]).duration(800).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<extrautils2:ingredients:9>, <ore:ingotEnergeticAlloy> * 4]).outputs([<extrautils2:ingredients:6>]).duration(400).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<extrautils2:ingredients:9>, <ore:ingotElectricalSteel> * 4]).outputs([<extrautils2:ingredients:8>]).duration(400).EUt(16).buildAndRegister();

//Redstone Gear
recipes.remove(<extrautils2:ingredients:1>);
recipes.addShaped(<extrautils2:ingredients:1>, [
	[null, <actuallyadditions:item_crystal>, null],
	[<actuallyadditions:item_crystal>, <metaitem:nomilabs:gearConductiveIron>, <actuallyadditions:item_crystal>],
	[null, <actuallyadditions:item_crystal>, null]]);



//Photovoltaic Composite
recipes.remove(<enderio:item_material:38>);
recipes.addShapeless(<enderio:item_material:38> * 3, [<metaitem:dustLapis>,<metaitem:dustCoal>,<metaitem:dustSilicon>]);


recipes.remove(<simplyjetpacks:metaitem:4>);
recipes.remove(<appliedenergistics2:quartz_glass>);
recipes.addShaped(<simplyjetpacks:metaitem:4>, [[<minecraft:leather>, <ore:plateSteel>, <minecraft:leather>]]);

//EIO Alloys
// Dark steel
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <minecraft:obsidian>]).outputs([<metaitem:nomilabs:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustSteel>, <minecraft:obsidian>]).outputs([<metaitem:nomilabs:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <metaitem:dustObsidian>]).outputs([<metaitem:nomilabs:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustSteel>, <metaitem:dustObsidian>]).outputs([<metaitem:nomilabs:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <actuallyadditions:item_crystal:3>]).outputs([<metaitem:nomilabs:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustSteel>, <actuallyadditions:item_crystal:3>]).outputs([<metaitem:nomilabs:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();

// Electrical Steel
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <metaitem:dustSilicon>]).outputs([<metaitem:nomilabs:ingotElectricalSteel>]).duration(120).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustSteel>, <metaitem:dustSilicon>]).outputs([<metaitem:nomilabs:ingotElectricalSteel>]).duration(120).EUt(16).buildAndRegister();

// End Steel
alloy_smelter.recipeBuilder().inputs([<metaitem:nomilabs:ingotDarkSteel>, <ore:dustEndstone>]).outputs([<metaitem:nomilabs:ingotEndSteel>]).duration(300).EUt(120).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:nomilabs:dustDarkSteel>, <ore:dustEndstone>]).outputs([<metaitem:nomilabs:ingotEndSteel>]).duration(300).EUt(120).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:nomilabs:ingotDarkSteel>, <minecraft:end_stone>]).outputs([<metaitem:nomilabs:ingotEndSteel>]).duration(300).EUt(120).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:nomilabs:dustDarkSteel>, <minecraft:end_stone>]).outputs([<metaitem:nomilabs:ingotEndSteel>]).duration(300).EUt(120).buildAndRegister();

// Soularium
alloy_smelter.recipeBuilder().inputs([<minecraft:gold_ingot>, <minecraft:soul_sand>]).outputs([<metaitem:nomilabs:ingotSoularium>]).duration(120).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustGold>, <minecraft:soul_sand>]).outputs([<metaitem:nomilabs:ingotSoularium>]).duration(120).EUt(16).buildAndRegister();

// Conductive Iron
alloy_smelter.recipeBuilder().inputs([<minecraft:iron_ingot>, <minecraft:redstone>]).outputs([<metaitem:nomilabs:ingotConductiveIron>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustIron>, <minecraft:redstone>]).outputs([<metaitem:nomilabs:ingotConductiveIron>]).duration(150).EUt(16).buildAndRegister();

// Pulsating Iron
alloy_smelter.recipeBuilder().inputs([<minecraft:iron_ingot>, <ore:dustPulsating>]).outputs([<metaitem:nomilabs:ingotPulsatingIron>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:dustIron>, <ore:dustPulsating>]).outputs([<metaitem:nomilabs:ingotPulsatingIron>]).duration(150).EUt(16).buildAndRegister();

// Ae2 glass
alloy_smelter.recipeBuilder().inputs([<minecraft:glass>, <ore:dustCertusQuartz>]).outputs([<appliedenergistics2:quartz_glass> * 2]).duration(100).EUt(16).buildAndRegister();

//Ender Chest
recipes.removeByRecipeName("enderstorage:ender_chest");
recipes.addShaped(<enderstorage:ender_storage>, [
	[<minecraft:blaze_rod>, <minecraft:wool>, <minecraft:blaze_rod>],
	[<ore:obsidian>, <meta_tile_entity:crate.steel>, <ore:obsidian>],
	[<minecraft:blaze_rod>, <ore:enderpearl>, <minecraft:blaze_rod>]]);

//Blaze Rod
recipes.addShapeless(<minecraft:blaze_rod>, [<minecraft:brewing_stand>]);

//macerator.recipeBuilder().inputs([<minecraft:diamond>]).outputs([<metaitem:dustDiamond>]).duration(80).EUt(8).buildAndRegister();
macerator.recipeBuilder().inputs([<appliedenergistics2:material:7>]).outputs([<appliedenergistics2:material:8>]).duration(80).EUt(8).buildAndRegister();

macerator.recipeBuilder().inputs([<enderio:item_material:16>]).outputs([<enderio:item_material:37>]).duration(500).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:19>]).outputs([<enderio:item_material:34>]).duration(400).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:15>]).outputs([<enderio:item_material:35>]).duration(300).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:14>]).outputs([<enderio:item_material:36>]).duration(200).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:17>]).outputs([<nomilabs:grainsofinnocence>]).duration(200).EUt(16).buildAndRegister();

//Yeta Wrench
recipes.remove(<enderio:item_yeta_wrench>);
recipes.addShaped(<enderio:item_yeta_wrench>, [
	[<minecraft:iron_ingot>, null, <minecraft:iron_ingot>],
	[null, <metaitem:gearIron>, null],
	[null,<minecraft:iron_ingot>,null]]);




//Chemistry Why the hell is all sorts of things put here half of these arent even early game in any capacity aaaaaaaa
chemical_reactor.recipeBuilder().inputs([<extendedcrafting:material:7>]).fluidInputs([<liquid:lava> * 1000]).outputs(<minecraft:end_stone>).EUt(15).duration(20).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:lava> * 1000]).outputs(<armorplus:lava_crystal:1>).EUt(15).duration(100).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:obsidian>]).fluidInputs([<liquid:lava> * 1000]).outputs(<armorplus:lava_infused_obsidian>).EUt(15).duration(200).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<nomilabs:block_dust>]).fluidInputs([<liquid:lava> * 1000]).outputs(<minecraft:netherrack>).EUt(15).duration(20).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:magma>]).fluidOutputs(<liquid:lava> * 1000).EUt(30).duration(120).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<thermalfoundation:fertilizer>]).fluidInputs(<liquid:ammonia> * 100).outputs(<thermalfoundation:fertilizer:1>).EUt(30).duration(120).buildAndRegister();

mixer.recipeBuilder().inputs([<metaitem:dustTricalciumPhosphate>,<metaitem:dustGold>]).outputs(<minecraft:glowstone_dust> * 2).EUt(15).duration(80).buildAndRegister();

// Black Steel (Moved to Groovy)

// Black Quartz Ore -> Black Quartz
furnace.addRecipe(<actuallyadditions:item_misc:5>, <actuallyadditions:block_misc:3>, 0.0);

// Clathrates
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:glowstone> * 288]).outputs(<thermalfoundation:material:894>).EUt(75).duration(120).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:redstone> * 288]).outputs(<thermalfoundation:material:893>).EUt(75).duration(120).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:ender> * 250]).outputs(<thermalfoundation:material:895>).EUt(75).duration(120).buildAndRegister();

// Draconium
chemical_reactor.recipeBuilder().inputs([<minecraft:dragon_breath>, <metaitem:nomilabs:dustManyullyn>]).outputs(<ore:dustDraconium>.firstItem).EUt(2000).duration(500).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:glass_bottle> * 4]).fluidInputs([<liquid:pyrotheum> * 1000, <liquid:nitro_fuel> * 1000]).outputs(<minecraft:dragon_breath> * 4).EUt(2000).duration(1000).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:glass_bottle> * 16]).fluidInputs([<liquid:pyrotheum> * 1000, <liquid:gasoline_premium> * 1000]).outputs(<minecraft:dragon_breath> * 16).EUt(2000).duration(1000).buildAndRegister();

recipes.addShaped(<extendedcrafting:material:40>, [
	[null, <minecraft:ender_eye>, null],
	[<minecraft:ender_eye>, <minecraft:nether_star>, <minecraft:ender_eye>],
	[null, <minecraft:ender_eye>, null]]);

recipes.remove(<minecraft:ender_eye>);
// Eye of Ender * 1
<recipemap:chemical_bath>.findRecipe(480, [<minecraft:ender_pearl:0>], [<liquid:blaze> * 144]).remove();
chemical_reactor.recipeBuilder().inputs([<minecraft:ender_pearl>,<minecraft:blaze_powder>]).outputs(<minecraft:ender_eye>).EUt(16).duration(100).buildAndRegister();

recipes.remove(<extrautils2:endershard>);
recipes.addShapeless(<extrautils2:endershard> * 8, [<minecraft:ender_pearl>]);

//Dimethylhydrazine: Changes the EU/t
chemical_reactor.findRecipe(480, [null], [<liquid:dimethylamine> * 1000, <liquid:monochloramine> * 1000]).remove();
// 1,1-Dimethylhydrazine * 1000
<recipemap:large_chemical_reactor>.findRecipe(480, null, [<liquid:dimethylamine> * 1000, <liquid:monochloramine> * 1000]).remove();
chemical_reactor.recipeBuilder()
	.fluidInputs(<liquid:monochloramine> * 1000, <liquid:dimethylamine> * 1000)
	.fluidOutputs(<liquid:dimethylhydrazine> * 1000,<liquid:hydrochloric_acid> * 1000)
	.EUt(120).duration(960).buildAndRegister();

//Remove other recipe for Dimethylhydrazine
chemical_reactor.findRecipe(480, [null], [<liquid:methanol> * 2000, <liquid:ammonia> * 2000, <liquid:hypochlorous_acid> * 1000]).remove();

//Lava Factory Casing
recipes.remove(<actuallyadditions:block_misc:7>);
recipes.addShaped(<actuallyadditions:block_misc:7> * 2, [[<metaitem:plateAluminium>, <metaitem:plateSteel>, <metaitem:plateAluminium>],[<metaitem:plateSteel>, null, <metaitem:plateSteel>], [<metaitem:plateAluminium>, <metaitem:plateSteel>, <metaitem:plateAluminium>]]);

recipes.remove(<actuallyadditions:block_fluid_collector>);
recipes.remove(<actuallyadditions:block_placer>);
recipes.remove(<actuallyadditions:block_fluid_placer>);

recipes.addShaped(<actuallyadditions:block_breaker>, [[<actuallyadditions:item_misc:7>, <metaitem:electric.piston.lv>]]);
recipes.addShaped(<actuallyadditions:block_placer>, [[<metaitem:electric.piston.lv>,<actuallyadditions:item_misc:7>]]);
recipes.addShaped(<actuallyadditions:block_fluid_placer>, [[<metaitem:electric.pump.lv>,<actuallyadditions:item_misc:7>]]);
recipes.addShaped(<actuallyadditions:block_fluid_collector>, [[<actuallyadditions:item_misc:7>,<metaitem:electric.pump.lv>]]);

compressor.recipeBuilder().inputs(<metaitem:dustCalcium> * 2).outputs(<minecraft:dye:15>).duration(20).EUt(4).buildAndRegister();

assembler.recipeBuilder().inputs(<minecraft:bone> * 4).circuit(14).outputs(<minecraft:skull>).duration(20).EUt(16).buildAndRegister();


forge_hammer.recipeBuilder().inputs([<minecraft:sand>]).outputs([<nomilabs:block_dust>]).duration(16).EUt(10).buildAndRegister();

// Endstone Dust * 1
<recipemap:macerator>.findRecipe(2, [<minecraft:end_stone:0>], null).remove();

macerator.recipeBuilder().inputs([<ore:endstone>.firstItem]).outputs([<ore:dustEndstone>.firstItem]).duration(16).EUt(10).buildAndRegister();

// Battery Alloy
recipes.addShapeless(<metaitem:dustBatteryAlloy> * 4, [<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustAntimony>]);

recipes.addShapeless(<metaitem:battery.re.lv.cadmium>,[<metaitem:battery.hull.lv>,<metaitem:dustCadmium>,<metaitem:dustCadmium>]);	//Small Cadmium
recipes.addShapeless(<metaitem:battery.re.lv.sodium>,[<metaitem:battery.hull.lv>,<metaitem:dustSodium>,<metaitem:dustSodium>]);	//Small Sodium
recipes.addShapeless(<metaitem:battery.re.lv.lithium>,[<metaitem:battery.hull.lv>,<metaitem:dustLithium>,<metaitem:dustLithium>]);	//Small Lithium

furnace.setFuel(<metaitem:dustGraphite>, 1200);

// recipes.removeByRecipeName("gregtech:block_decompress_clay");
// Clay Block into Clay Ball by hand
recipes.addShapeless(<minecraft:clay_ball> * 4, [<minecraft:clay>]);


recipes.remove(<thermalfoundation:fertilizer>);
recipes.remove(<thermalfoundation:fertilizer:1>);
recipes.addShapeless(<thermalfoundation:fertilizer> * 16, [<ore:dustWood>, <ore:dustWood>, <ore:dustCharcoal>, <ore:dustSaltpeter>,<metaitem:gemApatite>,<metaitem:gemApatite>]);
recipes.addShapeless(<thermalfoundation:fertilizer> * 16, [<ore:dustWood>, <ore:dustWood>, <ore:dustCoal>, <ore:dustSaltpeter>,<metaitem:gemApatite>,<metaitem:gemApatite>]);

//furnace.addRecipe(<minecraft:iron_nugget> * 3, <metaitem:dustVanadiumMagnetite>, 0.0);
//furnace.addRecipe(<minecraft:iron_nugget> * 2, <metaitem:dustImpureVanadiumMagnetite>, 0.0);


/* Old Recipe for Iron Trapdoor
assembler.recipeBuilder()
	.inputs(<ore:plateIron> * 4)
	.circuit(6)
	.outputs(<minecraft:iron_trapdoor>)
	.duration(200).EUt(16).buildAndRegister();
*/

//Vinyl Acetate
electrolyzer.recipeBuilder()
	.fluidInputs(<liquid:vinyl_acetate> * 12000)
	.outputs(<ore:dustCarbon>.firstItem * 4)
	.fluidOutputs(<liquid:oxygen> * 2000, <liquid:hydrogen> * 6000)
	.duration(288).EUt(60).buildAndRegister();

//Polyvinyl Acetate
electrolyzer.recipeBuilder()
	.fluidInputs(<liquid:polyvinyl_acetate> * 12000)
	.outputs(<ore:dustCarbon>.firstItem * 4)
	.fluidOutputs(<liquid:oxygen> * 2000, <liquid:hydrogen> * 6000)
	.duration(288).EUt(60).buildAndRegister();

//Dichlorobenzene
electrolyzer.recipeBuilder()
	.fluidInputs(<liquid:dichlorobenzene> * 12000)
	.outputs(<ore:dustCarbon>.firstItem * 6)
	.fluidOutputs(<liquid:chlorine> * 2000, <liquid:hydrogen> * 4000)
	.duration(576).EUt(60).buildAndRegister();

//Add Decomposition Recipe for Polyphenylene Sulfide
electrolyzer.recipeBuilder()
	.fluidInputs(<liquid:polyphenylene_sulfide> * 11000)
	.outputs(<metaitem:dustCarbon> * 6, <metaitem:dustSulfur>)
	.fluidOutputs(<liquid:hydrogen> * 4000)
	.duration(288).EUt(128).buildAndRegister();

// Crafting Station
assembler.recipeBuilder()
	.inputs([<minecraft:chest> * 2, <ore:plankWood> * 4, <minecraft:crafting_table>])
	.outputs([<metaitem:workbench>])
	.duration(100)
	.EUt(7)
	.buildAndRegister();

// Diamond Electrolysis
// Carbon Dust * 64
<recipemap:electrolyzer>.findRecipe(30, [<metaitem:dustDiamond>], null).remove();

// Kill Glowstone Decomp
// Small Pile of Redstone Dust * 2
//<recipemap:centrifuge>.findRecipe(80, [<minecraft:glowstone_dust:0>], null).remove();

cutter.recipeBuilder()
	.inputs(<appliedenergistics2:fluix_block>)
	.fluidInputs(<liquid:water> * 73)
	.outputs(<moreplates:fluix_plate> * 8)
	.duration(1568)
	.EUt(30)
	.buildAndRegister();

cutter.recipeBuilder()
	.inputs(<appliedenergistics2:fluix_block>)
	.fluidInputs(<liquid:distilled_water> * 55)
	.outputs(<moreplates:fluix_plate> * 8)
	.duration(1176)
	.EUt(30)
	.buildAndRegister();

cutter.recipeBuilder()
	.inputs(<appliedenergistics2:fluix_block>)
	.fluidInputs(<liquid:lubricant> * 18)
	.outputs(<moreplates:fluix_plate> * 8)
	.duration(784)
	.EUt(30)
	.buildAndRegister();

// Nature's Compass
recipes.remove(<naturescompass:naturescompass>);
recipes.addShaped(<naturescompass:naturescompass>, 
	[[<ore:treeSapling>, <minecraft:compass>, <ore:treeSapling>],
	[<ore:logWood>, <metaitem:prospector.lv>, <ore:logWood>],
	[<ore:treeSapling>, <ore:logWood>, <ore:treeSapling>]]);
	
// Charcoal maceration
macerator.recipeBuilder()
	.inputs(<thermalfoundation:storage_resource>)
	.outputs(<metaitem:dustCharcoal> * 9)
	.duration(108).EUt(2).buildAndRegister();

macerator.recipeBuilder()
	.inputs(<chisel:block_charcoal:*>)
	.outputs(<metaitem:dustCharcoal> * 9)
	.duration(108).EUt(2).buildAndRegister();

/*arc_furnace.recipeBuilder()
    .inputs(<minecraft:iron_door>)
    .fluidInputs(<liquid:oxygen> * 236)
    .outputs(<metaitem:ingotWroughtIron> * 2)
    .duration(236)
    .EUt(32)
    .buildAndRegister();

macerator.recipeBuilder()
    .inputs(<minecraft:iron_door>)
    .outputs(<metaitem:dustIron> * 2)
    .duration(236)
    .EUt(8)
    .buildAndRegister();*/
