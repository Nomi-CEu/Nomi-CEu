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

//Wrought Iron
furnace.remove(<metaitem:nuggetWroughtIron>);
furnace.addRecipe(<metaitem:ingotWroughtIron>, <minecraft:iron_ingot>, 0.0);

recipes.remove(<storagedrawers:upgrade_template>);
recipes.addShaped(<storagedrawers:upgrade_template> * 2, [
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>],
	[<ore:stickWood>, <storagedrawers:customdrawers>, <ore:stickWood>],
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);

//Wood Pulp
recipes.addShapeless(<metaitem:dustWood> * 4,[<ore:logWood>,<ore:gtceMortars>]);

//Red Alloy Dust
recipes.addShapeless(<metaitem:dustRedAlloy>, [<metaitem:dustCopper>, <minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>]);


//Iron Shears
//recipes.remove(<minecraft:shears>);
//recipes.addShaped(<minecraft:shears>,[
//[<gregtech:meta_tool:6>,<ore:plateIron>],
//[<ore:plateIron>,<gregtech:meta_tool:9>]]);
//<minecraft:shears>.displayName = "Iron Shears";

//Wool
//recipes.remove(<minecraft:string>);
//recipes.addShapeless(<minecraft:string> * 4, [<minecraft:wool>]);


//recipes.addShaped(<gregtech:meta_tool:7>.withTag({"GT.ToolStats": {PrimaryMaterial: "rubber", MaxDurability: 256, DigSpeed: 4.0 as float, AttackDamage: 1.0 as float, HarvestLevel: 1}}), [
//[<metaitem:plateRubber>,<metaitem:plateRubber>,null],
//[<metaitem:plateRubber>,<metaitem:plateRubber>,<minecraft:stick>],
//[<metaitem:plateRubber>,<metaitem:plateRubber>,null]]);


//Dusts
//furnace.addRecipe(<metaitem:ingotTin>, <gregtech:ore_tin_0>, 0.0);
//recipes.addShapeless(<metaitem:dustCopper>, [<ore:ingotCopper>,<ore:gtceMortars>]);
//recipes.addShapeless(<metaitem:dustIron>, [<ore:ingotIron>,<ore:gtceMortars>]);
//recipes.addShapeless(<metaitem:dustLithium>, [<ore:ingotLithium>,<ore:gtceMortars>]);
//recipes.addShapeless(<metaitem:dustCoal>,[<minecraft:coal>,<ore:gtceMortars>]);
//recipes.addShapeless(<metaitem:dustCharcoal>,[<minecraft:coal:1>,<ore:gtceMortars>]);
//recipes.addShapeless(<metaitem:dustTin>, [<metaitem:ingotTin>,<ore:gtceMortars>]);
recipes.addShapeless(<minecraft:gravel>, [<minecraft:cobblestone>, <ore:gtceMortars>]);
recipes.addShapeless(<minecraft:sand>, [<minecraft:gravel>, <ore:gtceMortars>]);
recipes.addShapeless(<contenttweaker:block_dust>, [<minecraft:sand>, <ore:gtceMortars>]);
recipes.addShapeless(<minecraft:clay>, [<contenttweaker:block_dust>,<minecraft:water_bucket>]);
furnace.addRecipe(<contenttweaker:pulsatingdust>, <metaitem:dustUraninite>, 0.0);
recipes.addShapeless(<minecraft:gravel>, [<minecraft:cobblestone>, <ore:gtceMortars>]);


//Clay Electrolyzing
electrolyzer.findRecipe(60, [<metaitem:dustClay> * 13], [null]).remove();
electrolyzer.recipeBuilder().inputs([<metaitem:dustClay> * 13]).outputs([<metaitem:dustSodium> * 2, <metaitem:dustSilicon> * 2, <metaitem:dustLithium>, <metaitem:dustAluminium> * 2]).fluidOutputs([<liquid:water>*6000]).duration(364).EUt(15).buildAndRegister();

//Photovoltaic Cells
alloy_smelter.recipeBuilder().inputs([<enderio:item_material:38> * 2, <metaitem:plateElectricalSteel>]).outputs([<enderio:item_material:3>]).duration(180).EUt(16).buildAndRegister();

//Small Gears
//alloy_smelter.recipeBuilder().inputs([<metaitem:ingotAluminium>]).notConsumable(<metaitem:shape.mold.gear.small>).outputs([<metaitem:gearSmallAluminium>]).duration(80).EUt(16).buildAndRegister();
//alloy_smelter.recipeBuilder().inputs([<metaitem:ingotTitanium>]).notConsumable(<metaitem:shape.mold.gear.small>).outputs([<metaitem:gearSmallTitanium>]).duration(80).EUt(16).buildAndRegister();
//alloy_smelter.recipeBuilder().inputs([<metaitem:ingotStainlessSteel>]).notConsumable(<metaitem:shape.mold.gear.small>).outputs([<metaitem:gearSmallStainlessSteel>]).duration(80).EUt(16).buildAndRegister();
//alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>]).notConsumable(<metaitem:shape.mold.gear.small>).outputs([<metaitem:gearSmallSteel>]).duration(80).EUt(16).buildAndRegister();
//alloy_smelter.recipeBuilder().inputs([<metaitem:ingotTungstenSteel>]).notConsumable(<metaitem:shape.mold.gear.small>).outputs([<metaitem:gearSmallTungstenSteel>]).duration(80).EUt(16).buildAndRegister();

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
	[<ore:circuitBasic>, <storagedrawers:customdrawers>, <ore:circuitBasic>],
	[<ore:plateIron>, <minecraft:diamond_block>, <ore:plateIron>]]);

recipes.addShaped(<storagedrawers:controller>, [
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
	[<ore:circuitBasic>, <storagedrawers:customdrawers>, <ore:circuitBasic>],
	[<ore:plateIron>, <minecraft:emerald_block>, <ore:plateIron>]]);

recipes.addShaped(<storagedrawers:controllerslave>, [
	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
	[<ore:circuitBasic>, <storagedrawers:customdrawers>, <ore:circuitBasic>],
	[<ore:plateIron>, <minecraft:gold_block>, <ore:plateIron>]]);

//recipes.remove(<rangedpumps:pump>);
//recipes.addShaped(<rangedpumps:pump>, [
//	[<minecraft:obsidian>, <metaitem:electric.pump.lv>, <minecraft:obsidian>],
//	[<metaitem:electric.pump.lv>, <gregtech:meta_block_compressed_13:10>, <metaitem:electric.pump.lv>], //Ender Pearl Block
//	[<minecraft:obsidian>, <metaitem:electric.pump.lv>, <minecraft:obsidian>]]);
//<rangedpumps:pump>.displayName = "Ender Pump";

// Ender Tank (Ender Storage)
recipes.remove(<enderstorage:ender_storage:1>);
//recipes.addShaped(<enderstorage:ender_storage:1>, [
//	[<minecraft:blaze_rod>, <minecraft:wool>, <minecraft:blaze_rod>],
//	[<ore:obsidian>, basictank, <ore:obsidian>],
//	[<minecraft:blaze_rod>, <gregtech:meta_block_compressed_13:10>, <minecraft:blaze_rod>]]); //Ender Pearl Block
//recipes.addShapeless(<enderstorage:ender_storage:1>, [<enderstorage:ender_storage:1>]);


//Black Quartz
centrifuge.recipeBuilder().inputs([<metaitem:dustQuartzite> * 4]).outputs([<actuallyadditions:item_dust:7>]).duration(400).EUt(90).buildAndRegister();
autoclave.recipeBuilder().inputs([<actuallyadditions:item_dust:7>]).fluidInputs(<liquid:water> * 1000).outputs([<actuallyadditions:item_misc:5>]).duration(150).EUt(16).buildAndRegister();

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
	[<actuallyadditions:item_crystal>, <metaitem:gearConductiveIron>, <actuallyadditions:item_crystal>],
	[null, <actuallyadditions:item_crystal>, null]]);



//Photovoltaic Composite
recipes.remove(<enderio:item_material:38>);
recipes.addShapeless(<enderio:item_material:38> * 3, [<metaitem:dustLapis>,<metaitem:dustCoal>,<metaitem:dustSilicon>]);


recipes.remove(<simplyjetpacks:metaitem:4>);
recipes.remove(<appliedenergistics2:quartz_glass>);
recipes.addShaped(<simplyjetpacks:metaitem:4>, [[<minecraft:leather>, <ore:plateSteel>, <minecraft:leather>]]);

// Steel
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCoal>]).outputs([<metaitem:ingotSteel>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCharcoal>]).outputs([<metaitem:ingotSteel>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCarbon>]).outputs([<metaitem:ingotSteel>]).duration(150).EUt(16).buildAndRegister();
//EIO Alloys
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <minecraft:obsidian>]).outputs([<metaitem:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <actuallyadditions:item_crystal:3>]).outputs([<metaitem:ingotDarkSteel>]).duration(240).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotSteel>, <metaitem:dustSilicon>]).outputs([<metaitem:ingotElectricalSteel>]).duration(120).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<minecraft:gold_ingot>, <minecraft:soul_sand>]).outputs([<metaitem:ingotSoularium>]).duration(120).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotDarkSteel>, <ore:dustEndstone>]).outputs([<metaitem:ingotEndSteel>]).duration(300).EUt(120).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<minecraft:glass>, <ore:dustCertusQuartz>]).outputs([<appliedenergistics2:quartz_glass> * 2]).duration(100).EUt(16).buildAndRegister();

//Ender Chest
recipes.removeByRecipeName("enderstorage:ender_chest");
recipes.addShaped(<enderstorage:ender_storage>, [
	[<minecraft:blaze_rod>, <minecraft:wool>, <minecraft:blaze_rod>],
	[<ore:obsidian>, <meta_tile_entity:steel_chest>, <ore:obsidian>],
	[<minecraft:blaze_rod>, <ore:enderpearl>, <minecraft:blaze_rod>]]);

//Blaze Rod
recipes.addShapeless(<minecraft:blaze_rod>, [<minecraft:brewing_stand>]);

//LV Macerator
recipes.remove(<meta_tile_entity:macerator.lv>);
recipes.addShaped(<meta_tile_entity:macerator.lv>, [
	[<metaitem:electric.piston.lv>, <metaitem:electric.motor.lv>, <metaitem:toolHeadBuzzSawWroughtIron>],
	[<ore:cableGtSingleTin>, <ore:cableGtSingleTin>, <meta_tile_entity:hull.lv>],
	[<ore:circuitBasic>, <ore:circuitBasic>, <ore:cableGtSingleTin>]]);

//MV Macerator
recipes.remove(<meta_tile_entity:macerator.mv>);
recipes.addShaped(<meta_tile_entity:macerator.mv>, [
	[<metaitem:electric.piston.mv>, <metaitem:electric.motor.mv>, <metaitem:toolHeadBuzzSawSteel>],
	[<ore:cableGtSingleCopper>, <ore:cableGtSingleCopper>, <meta_tile_entity:hull.mv>],
	[<ore:circuitGood>, <ore:circuitGood>, <ore:cableGtSingleCopper>]]);

//LV Piston
recipes.addShaped(<metaitem:electric.piston.lv>, [
	[<metaitem:plateWroughtIron>,<metaitem:plateWroughtIron>,<metaitem:plateWroughtIron>],
	[<ore:cableGtSingleTin>, <metaitem:stickWroughtIron>,<metaitem:stickWroughtIron>],
	[<ore:cableGtSingleTin>, <metaitem:electric.motor.lv>, <metaitem:gearWroughtIron>]]);

//Fluid Conduit
mods.jei.JEI.removeAndHide(<enderio:item_liquid_conduit>);
recipes.remove(<enderio:item_liquid_conduit:1>);
recipes.addShaped(<enderio:item_liquid_conduit:1> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>],
	[<minecraft:glass>,<minecraft:glass>,<minecraft:glass>],
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
assembler.recipeBuilder().inputs([<minecraft:glass> * 3, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_liquid_conduit:1> * 8]).duration(80).EUt(16).buildAndRegister();
//macerator.recipeBuilder().inputs([<minecraft:diamond>]).outputs([<metaitem:dustDiamond>]).duration(80).EUt(8).buildAndRegister();
macerator.recipeBuilder().inputs([<appliedenergistics2:material:7>]).outputs([<appliedenergistics2:material:8>]).duration(80).EUt(8).buildAndRegister();

macerator.recipeBuilder().inputs([<enderio:item_material:16>]).outputs([<enderio:item_material:37>]).duration(500).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:19>]).outputs([<enderio:item_material:34>]).duration(400).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:15>]).outputs([<enderio:item_material:35>]).duration(300).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:14>]).outputs([<enderio:item_material:36>]).duration(200).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<enderio:item_material:17>]).outputs([<contenttweaker:grainsofinnocence>]).duration(200).EUt(16).buildAndRegister();
recipes.addShapeless(<contenttweaker:blazepowder>,[<minecraft:blaze_powder>]);
recipes.addShapeless(<minecraft:blaze_powder>,[<contenttweaker:blazepowder>]);
recipes.remove(<appliedenergistics2:part:36>);

//Yeta Wrench
recipes.remove(<enderio:item_yeta_wrench>);
recipes.addShaped(<enderio:item_yeta_wrench>, [
	[<minecraft:iron_ingot>, null, <minecraft:iron_ingot>],
	[null, <metaitem:gearIron>, null],
	[null,<minecraft:iron_ingot>,null]]);


//<meta_tile_entity:electric_blast_furnace>.displayName = "Electric Blast Furnace Controller";
//<meta_tile_entity:fluid_hatch.import.ulv>.displayName = "Fluid Input Hatch (ULV)";
//<meta_tile_entity:fluid_hatch.import.lv>.displayName = "Fluid Input Hatch (LV)";
//<meta_tile_entity:fluid_hatch.import.mv>.displayName = "Fluid Input Hatch (MV)";
//<meta_tile_entity:fluid_hatch.import.hv>.displayName = "Fluid Input Hatch (HV)";
//<meta_tile_entity:fluid_hatch.import.ev>.displayName = "Fluid Input Hatch (EV)";
//<meta_tile_entity:fluid_hatch.import.iv>.displayName = "Fluid Input Hatch (IV)";
//<meta_tile_entity:fluid_hatch.import.luv>.displayName = "Fluid Input Hatch (LuV)";
//<meta_tile_entity:fluid_hatch.import.zpm>.displayName = "Fluid Input Hatch (ZPM)";
//<meta_tile_entity:fluid_hatch.import.uv>.displayName = "Fluid Input Hatch (UV)";
//<meta_tile_entity:fluid_hatch.import.max>.displayName = "Fluid Input Hatch (MAX)";
//<meta_tile_entity:fluid_hatch.export.ulv>.displayName = "Fluid Output Hatch (ULV)";
//<meta_tile_entity:fluid_hatch.export.lv>.displayName = "Fluid Output Hatch (LV)";
//<meta_tile_entity:fluid_hatch.export.mv>.displayName = "Fluid Output Hatch (MV)";
//<meta_tile_entity:fluid_hatch.export.hv>.displayName = "Fluid Output Hatch (HV)";
//<meta_tile_entity:fluid_hatch.export.ev>.displayName = "Fluid Output Hatch (EV)";
//<meta_tile_entity:fluid_hatch.export.iv>.displayName = "Fluid Output Hatch (IV)";
//<meta_tile_entity:fluid_hatch.export.luv>.displayName = "Fluid Output Hatch (LuV)";
//<meta_tile_entity:fluid_hatch.export.zpm>.displayName = "Fluid Output Hatch (ZPM)";
//<meta_tile_entity:fluid_hatch.export.uv>.displayName = "Fluid Output Hatch (UV)";
//<meta_tile_entity:fluid_hatch.export.max>.displayName = "Fluid Output Hatch (MAX)";




//Chemistry Why the hell is all sorts of things put here half of these arent even early game in any capacity aaaaaaaa
chemical_reactor.recipeBuilder().inputs([<extendedcrafting:material:7>]).fluidInputs([<liquid:lava> * 1000]).outputs(<minecraft:end_stone>).EUt(15).duration(20).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:lava> * 1000]).outputs(<armorplus:lava_crystal:1>).EUt(15).duration(100).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:obsidian>]).fluidInputs([<liquid:lava> * 1000]).outputs(<armorplus:lava_infused_obsidian>).EUt(15).duration(200).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<contenttweaker:block_dust>]).fluidInputs([<liquid:lava> * 1000]).outputs(<minecraft:netherrack>).EUt(15).duration(20).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<contenttweaker:block_dust>]).fluidInputs([<liquid:water> * 1000]).outputs(<minecraft:clay>).EUt(15).duration(20).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:magma>]).fluidOutputs(<liquid:lava> * 1000).EUt(30).duration(120).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<thermalfoundation:fertilizer>]).fluidInputs(<liquid:ammonia> * 100).outputs(<thermalfoundation:fertilizer:1>).EUt(30).duration(120).buildAndRegister();
// recipes for Manganese Oxides - currently unused
// chemical_reactor.recipeBuilder().inputs([<metaitem:dustManganese>]).fluidInputs(<liquid:oxygen> * 250).outputs(<nuclearcraft:dust_oxide:2>).EUt(15).duration(120).buildAndRegister();
// chemical_reactor.recipeBuilder().inputs([<nuclearcraft:dust_oxide:2>]).fluidInputs(<liquid:phosphoric_acid> * 1000).outputs(<nuclearcraft:dust_oxide:2>).EUt(500).duration(120).buildAndRegister();
mixer.recipeBuilder().inputs([<metaitem:dustTricalciumPhosphate>,<metaitem:dustGold>]).outputs(<minecraft:glowstone_dust> * 2).EUt(15).duration(80).buildAndRegister();
mixer.recipeBuilder().inputs([<metaitem:dustIron>,<metaitem:dustTin>]).outputs(<metaitem:dustTinAlloy> * 2).EUt(15).duration(40).buildAndRegister();
// Nq+ and Nq*
mixer.recipeBuilder().inputs([<metaitem:dustNaquadah> * 2,<enderio:item_material:20> * 4,<contenttweaker:grainsofinnocence>,<enderio:item_material:36>]).fluidInputs([<liquid:pulsating_iron> * 576, <liquid:neptunium> * 144]).outputs(<metaitem:dustNaquadahEnriched>).EUt(8000).duration(400).buildAndRegister();
mixer.recipeBuilder().inputs([<metaitem:dustNaquadah> * 2,<enderio:item_material:34>,<enderio:item_material:35>*4,<enderio:item_material:37>]).fluidInputs([<liquid:enderium> * 576, <liquid:curium> * 144]).outputs(<metaitem:dustNaquadria>).EUt(30000).duration(400).buildAndRegister();

mixer.recipeBuilder().inputs([<ore:dustSteel> * 3,<ore:dustBlackBronze> * 2,<actuallyadditions:item_crystal:3> * 2,<extrautils2:ingredients:4> * 2]).outputs(<metaitem:dustBlackSteel>  * 9).EUt(15).duration(200).buildAndRegister();
recipes.removeShapeless(<metaitem:dustBlackSteel>, [<ore:dustNickel>, <ore:dustBlackBronze>, <ore:dustSteel>, <ore:dustSteel>, <ore:dustSteel>]);
//mixer.findRecipe(8, [<ore:dustTinySteel>.firstItem * 3, <ore:dustTinyNickel>.firstItem, <ore:dustTinyBlackBronze>.firstItem], [null]).remove();
//mixer.findRecipe(8, [<ore:dustSmallSteel>.firstItem * 3, <ore:dustSmallNickel>.firstItem, <ore:dustSmallBlackBronze>.firstItem], [null]).remove();
furnace.addRecipe(<actuallyadditions:item_misc:5>, <actuallyadditions:block_misc:3>, 0.0);

chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:glowstone> * 288]).outputs(<thermalfoundation:material:894>).EUt(100).duration(100).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:redstone> * 288]).outputs(<thermalfoundation:material:893>).EUt(100).duration(100).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:quartz>]).fluidInputs([<liquid:ender> * 250]).outputs(<thermalfoundation:material:895>).EUt(100).duration(100).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:dragon_breath>, <metaitem:dustManyullyn>]).outputs(<ore:dustDraconium>.firstItem).EUt(2000).duration(500).buildAndRegister();
chemical_reactor.recipeBuilder().inputs([<minecraft:glass_bottle> * 4]).fluidInputs([<liquid:pyrotheum> * 1000, <liquid:nitro_fuel> * 1000]).outputs(<minecraft:dragon_breath> * 4).EUt(2000).duration(1000).buildAndRegister();
//recipes.addShaped(<armorplus:lava_nether_brick>, [
//	[null, <minecraft:nether_brick>, null],
//	[<minecraft:nether_brick>, <minecraft:lava_bucket>, <minecraft:nether_brick>],
//	[null, <minecraft:nether_brick>, null]]);
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
//assembler.findRecipe(2, [<minecraft:blaze_powder>, <minecraft:ender_pearl>], [null]).remove();
//assembler.findRecipe(2, [<minecraft:ender_pearl> * 6,<minecraft:blaze_rod>], [null]).remove();
// Black Steel Dust * 5
<recipemap:mixer>.findRecipe(7, [<metaitem:dustBlackBronze>, <metaitem:dustNickel>, <metaitem:dustSteel> * 3, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();


//Ammonia Recipe: Changes the EU/t
//reactor.findRecipe(384, [<metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:nitrogen> * 1000, <liquid:hydrogen> * 3000]).remove();
//chemical_reactor.recipeBuilder()
//	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 1}))
//	.fluidInputs(<liquid:nitrogen> * 1000, <liquid:hydrogen> * 3000)
//	.fluidOutputs(<liquid:ammonia> * 1000)
//	.EUt(100).duration(320).buildAndRegister();

//Dimethylhydrazine: Changes the EU/t
chemical_reactor.findRecipe(480, [null], [<liquid:dimethylamine> * 1000, <liquid:monochloramine> * 1000]).remove();
chemical_reactor.recipeBuilder()
	.fluidInputs(<liquid:monochloramine> * 1000, <liquid:dimethylamine> * 1000)
	.fluidOutputs(<liquid:dimethylhydrazine> * 1000,<liquid:hydrochloric_acid> * 1000)
	.EUt(120).duration(960).buildAndRegister();

//Remove other recipe for Dimethylhydrazine
chemical_reactor.findRecipe(480, [null], [<liquid:methanol> * 2000, <liquid:ammonia> * 2000, <liquid:hypochlorous_acid> * 1000]).remove();

//Lava Factory
recipes.remove(<actuallyadditions:block_misc:7>);
recipes.addShaped(<actuallyadditions:block_misc:7> * 2, [[<metaitem:plateAluminium>, <metaitem:plateSteel>, <metaitem:plateAluminium>],[<metaitem:plateSteel>, null, <metaitem:plateSteel>], [<metaitem:plateAluminium>, <metaitem:plateSteel>, <metaitem:plateAluminium>]]);

recipes.remove(<actuallyadditions:block_lava_factory_controller>);
recipes.addShaped(<actuallyadditions:block_lava_factory_controller>, [
	[<actuallyadditions:item_misc:8>, <actuallyadditions:block_misc:7>, <actuallyadditions:item_misc:8>],
	[<minecraft:lava_bucket:*>, <morefurnaces:furnaceblock:3>, <minecraft:lava_bucket:*>]]);

recipes.remove(<actuallyadditions:block_fluid_collector>);
recipes.remove(<actuallyadditions:block_placer>);
recipes.remove(<actuallyadditions:block_fluid_placer>);

recipes.addShaped(<actuallyadditions:block_breaker>, [[<actuallyadditions:item_misc:7>, <metaitem:electric.piston.lv>]]);
recipes.addShaped(<actuallyadditions:block_placer>, [[<metaitem:electric.piston.lv>,<actuallyadditions:item_misc:7>]]);
recipes.addShaped(<actuallyadditions:block_fluid_placer>, [[<metaitem:electric.pump.lv>,<actuallyadditions:item_misc:7>]]);
recipes.addShaped(<actuallyadditions:block_fluid_collector>, [[<actuallyadditions:item_misc:7>,<metaitem:electric.pump.lv>]]);

//Rubber Sheet
compressor.recipeBuilder().inputs(<metaitem:rubber_drop>).outputs(<metaitem:plateRubber>).duration(20).EUt(8).buildAndRegister();
//compressor.recipeBuilder().inputs(<extrautils2:ingredients:11>).outputs(<moreplates:demon_plate>).duration(200).EUt(400).buildAndRegister();
compressor.recipeBuilder().inputs(<metaitem:dustCalcium> * 2).outputs(<minecraft:dye:15>).duration(20).EUt(4).buildAndRegister();
//compressor.recipeBuilder().inputs(<minecraft:dye:15> * 3).outputs(<minecraft:bone>).duration(20).EUt(8).buildAndRegister();
assembler.recipeBuilder().inputs(<minecraft:bone> * 4).circuit(14).outputs(<minecraft:skull>).duration(20).EUt(16).buildAndRegister();


//macerator.findRecipe(8, [<minecraft:cobblestone>], [null]).remove();
//macerator.findRecipe(8, [<minecraft:gravel>], [null]).remove();
//macerator.recipeBuilder().inputs([<minecraft:stone>]).outputs([<metaitem:dustStone>]).duration(16).EUt(10).buildAndRegister();
//macerator.recipeBuilder().inputs([<minecraft:cobblestone>]).outputs([<minecraft:gravel>]).duration(16).EUt(10).buildAndRegister();
//macerator.recipeBuilder().inputs([<minecraft:gravel>]).outputs([<minecraft:sand>]).duration(16).EUt(10).buildAndRegister();
forge_hammer.recipeBuilder().inputs([<minecraft:sand>]).outputs([<contenttweaker:block_dust>]).duration(16).EUt(10).buildAndRegister();
//macerator.recipeBuilder().inputs([<minecraft:netherrack>]).outputs([<metaitem:dustNetherrack>]).duration(16).EUt(10).buildAndRegister();

// Endstone Dust * 1
<recipemap:macerator>.findRecipe(2, [<minecraft:end_stone:0>], null).remove();

macerator.recipeBuilder().inputs([<ore:endstone>.firstItem]).outputs([<ore:dustEndstone>.firstItem]).duration(16).EUt(10).buildAndRegister();

//Copper Furnace
recipes.remove(<morefurnaces:furnaceblock:5>);
recipes.addShaped(<morefurnaces:furnaceblock:5>, [
[<ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>],
[<ore:ingotCopper>, <morefurnaces:furnaceblock>, <ore:ingotCopper>],
[<ore:ingotCopper>, <ore:ingotCopper>, <ore:ingotCopper>]]);

//Silver Furnace
recipes.remove(<morefurnaces:furnaceblock:6>);
recipes.addShaped(<morefurnaces:furnaceblock:6>, [
	[<ore:ingotSilver>, <ore:ingotSilver>, <ore:ingotSilver>],
	[<ore:ingotSilver>, <morefurnaces:furnaceblock:5>, <ore:ingotSilver>],
	[<ore:ingotSilver>, <ore:ingotSilver>, <ore:ingotSilver>]]);

//Gold Furnace
recipes.remove(<morefurnaces:furnaceblock:1>);
recipes.addShaped(<morefurnaces:furnaceblock:1>, [
	[<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>],
	[<minecraft:gold_ingot>, <morefurnaces:furnaceblock:6>, <minecraft:gold_ingot>],
	[<minecraft:gold_ingot>, <minecraft:gold_ingot>, <minecraft:gold_ingot>]]);

//Diamond Furnace
recipes.remove(<morefurnaces:furnaceblock:2>);
recipes.addShaped(<morefurnaces:furnaceblock:2>, [
	[<minecraft:diamond>, <minecraft:diamond>, <minecraft:diamond>],
	[<minecraft:diamond>, <morefurnaces:furnaceblock:1>, <minecraft:diamond>],
	[<minecraft:diamond>, <minecraft:diamond>, <minecraft:diamond>]]);

//Obsidian Furnace
recipes.remove(<morefurnaces:furnaceblock:3>);
recipes.addShaped(<morefurnaces:furnaceblock:3>, [
	[<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>],
	[<morefurnaces:furnaceblock:2>, <minecraft:obsidian>, <morefurnaces:furnaceblock:2>],
	[<minecraft:obsidian>, <minecraft:obsidian>, <minecraft:obsidian>]]);


//recipes.removeByRecipeName("gregtech:conductive_iron_cable_1");
//recipes.addShapeless(<gregtech:cable:5700>,[<gregtech:cable:700>,<metaitem:plateRubber>]);

// Battery Alloy
recipes.addShapeless(<metaitem:dustBatteryAlloy> * 4, [<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustAntimony>]);

recipes.addShapeless(<metaitem:battery.re.lv.cadmium>,[<metaitem:battery.hull.lv>,<metaitem:dustCadmium>,<metaitem:dustCadmium>]);	//Small Cadmium
recipes.addShapeless(<metaitem:battery.re.lv.sodium>,[<metaitem:battery.hull.lv>,<metaitem:dustSodium>,<metaitem:dustSodium>]);	//Small Sodium
recipes.addShapeless(<metaitem:battery.re.lv.lithium>,[<metaitem:battery.hull.lv>,<metaitem:dustLithium>,<metaitem:dustLithium>]);	//Small Lithium

// Small Battery Hull
//recipes.remove(<metaitem:battery.hull.lv>);
//recipes.addShaped(<metaitem:battery.hull.lv>, [
//	[<ore:cableGtSingleRedAlloy>], 
//	[<metaitem:plateTin>], 
//	[<metaitem:plateTin>]]);

// Add Corrected Small Battery Hull recipe to Assembler
//assembler.findRecipe(1, [<metaitem:plateBatteryAlloy>, <gregtech:cable:5071>],[<liquid:plastic>*144]).remove();
//assembler.recipeBuilder()
//	.inputs([<metaitem:plateTin>, <gregtech:cable:5237>])
//	.fluidInputs([<liquid:plastic>*144])	
//	.outputs([<metaitem:battery.hull.lv>])
//	.duration(800).EUt(1).buildAndRegister();

// Correct the Macerating recipe for Small Battery Hull
//macerator.findRecipe(8, [<metaitem:battery.hull.lv>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<metaitem:battery.hull.lv>)
//	.outputs(<metaitem:dustTin>)
//	.duration(30).EUt(8).buildAndRegister();

// Add Corrected Small Battery Hull recipe to fluid extractor
//fluid_extractor.findRecipe(32, [<metaitem:battery.hull.lv>], [null]).remove();
//fluid_extractor.recipeBuilder()
//	.inputs(<metaitem:battery.hull.lv>)
//	.fluidOutputs(<liquid:tin>*144)
//	.duration(80).EUt(32).buildAndRegister();


//recipes.removeByRecipeName("gregtech:electric_motor/electric_motor_lv_steel");

//recipes.remove(<meta_tile_entity:compressor.lv>);
//recipes.addShaped(<meta_tile_entity:compressor.lv>, [
//	[<ore:plateIron>,<ore:plateIron>,<ore:plateIron>],
//	[<metaitem:electric.piston.lv>, <meta_tile_entity:hull.lv>, <metaitem:electric.piston.lv>],
//	[<ore:cableGtSingleTin>, <ore:plateIron>, <ore:cableGtSingleTin>]]);

//furnace.addRecipe(<metaitem:dustSodium>, <metaitem:dustSalt>, 0.0);
//furnace.addRecipe(<ore:ingotCopper>.firstItem,<ore:oreCopper>);
//furnace.addRecipe(<ore:ingotCopper>.firstItem,<gregtech:ore_copper_0:0>);
//furnace.addRecipe(<ore:ingotCopper>.firstItem,<gregtech:ore_copper_0:1>);
//furnace.addRecipe(<ore:ingotCopper>.firstItem,<gregtech:ore_copper_0:2>);
//furnace.addRecipe(<ore:ingotCopper>.firstItem,<gregtech:ore_copper_0:3>);
//furnace.addRecipe(<metaitem:ingotCopper>, <metaitem:dustChalcopyrite>, 0.0);

//furnace.remove(<minecraft:iron_nugget> * 3, <metaitem:dustImpurePyrite>);
//furnace.remove(<minecraft:iron_nugget> * 3, <metaitem:dustPyrite>);
//furnace.addRecipe(<minecraft:iron_ingot>, <metaitem:dustPyrite>, 0.0);
//furnace.addRecipe(<minecraft:iron_ingot>, <metaitem:dustImpurePyrite>, 0.0);

//wiremill.recipeBuilder().inputs([<extendedcrafting:material:32>]).outputs([<gregtech:cable:709> * 2]).duration(100).EUt(50000).buildAndRegister();

centrifuge.findRecipe(30, [<metaitem:dustBlackSteel> * 5], [null]).remove();
//electrolyzer.findRecipe(90, [<metaitem:dustGalena> * 8], [null]).remove();
//electrolyzer.recipeBuilder().inputs([<metaitem:dustGalena> * 8]).outputs([<metaitem:dustLead> * 3,<metaitem:dustSilver> * 3, <metaitem:dustSulfur> * 2]).duration(500).EUt(32).buildAndRegister();
electrolyzer.recipeBuilder().inputs([<ore:dustEnderPearl>]).outputs([<contenttweaker:pulsatingdust>]).duration(200).EUt(1000).buildAndRegister();
electrolyzer.findRecipe(60, [<metaitem:dustEnderPearl> * 10], [null]).remove();


//autoclave.findRecipe(24, [<metaitem:dustLapis>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustCertusQuartz>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustNetherQuartz>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustMonazite>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustCinnabar>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustQuartzite>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustSodalite>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustLazurite>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustApatite>], [<liquid:water> * 250]).remove();
//autoclave.findRecipe(24, [<metaitem:dustLapis>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustCertusQuartz>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustNetherQuartz>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustMonazite>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustCinnabar>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustQuartzite>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustSodalite>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustLazurite>], [<liquid:distilled_water> * 50]).remove();
//autoclave.findRecipe(24, [<metaitem:dustApatite>], [<liquid:distilled_water> * 50]).remove();
//autoclave.recipeBuilder().inputs([<metaitem:dustLapis>]).fluidInputs([<liquid:water> * 100]).outputs([<minecraft:dye:4>]).duration(40).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<metaitem:dustNetherQuartz>]).fluidInputs([<liquid:water> * 100]).outputs([<minecraft:quartz>]).duration(40).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<metaitem:dustDiamond>]).fluidInputs([<liquid:water> * 100]).outputs([<minecraft:diamond>]).duration(200).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<metaitem:dustEmerald>]).fluidInputs([<liquid:water> * 100]).outputs([<minecraft:emerald>]).duration(300).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<metaitem:dustCertusQuartz>]).fluidInputs([<liquid:water> * 100]).outputs([<metaitem:gemCertusQuartz>]).duration(100).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<metaitem:dustCoal>]).fluidInputs([<liquid:water> * 100]).outputs([<minecraft:coal>]).duration(20).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<metaitem:dustApatite>]).fluidInputs([<liquid:water> * 100]).outputs([<metaitem:gemApatite>]).duration(20).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<ore:dustCinnabar>]).fluidInputs([<liquid:water> * 100]).outputs([<ore:gemCinnabar>.firstItem]).duration(200).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<ore:dustMonazite>]).fluidInputs([<liquid:water> * 100]).outputs([<ore:gemMonazite>.firstItem]).duration(200).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<ore:dustSodalite>]).fluidInputs([<liquid:water> * 100]).outputs([<ore:gemSodalite>.firstItem]).duration(80).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<ore:dustLazurite>]).fluidInputs([<liquid:water> * 100]).outputs([<ore:gemLazurite>.firstItem]).duration(80).EUt(16).buildAndRegister();
//autoclave.recipeBuilder().inputs([<ore:dustQuartzite>]).fluidInputs([<liquid:water> * 100]).outputs([<ore:gemQuartzite>.firstItem]).duration(40).EUt(16).buildAndRegister();

//	mods.jei.JEI.removeAndHide(<ore:gemFlawedAlmandine>);
//	mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedBlueTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedCertusQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedRuby>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedSodalite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedTanzanite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedNetherQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedQuartzite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedJasper>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedGlass>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedLignite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedOlivine>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedOpal>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedAmethyst>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedLapis>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedApatite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedGarnetRed>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedGarnetYellow>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedVinteum>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedMonazite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedSkystone>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedCinnabar>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedCoal>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedEmerald>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedDiamond>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedGreenSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedRutile>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawedLazurite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedAlmandine>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedBlueTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedCertusQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedRuby>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedSodalite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedTanzanite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedNetherQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedQuartzite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedJasper>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedGlass>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedLignite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedOlivine>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedOpal>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedAmethyst>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedLapis>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedApatite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedGarnetRed>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedGarnetYellow>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedVinteum>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedMonazite>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedSkystone>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedCinnabar>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedCoal>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedEmerald>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedDiamond>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedGreenSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedRutile>);mods.jei.JEI.removeAndHide(
//	<ore:gemChippedLazurite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessAlmandine>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessBlueTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessCertusQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessSodalite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessTanzanite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessNetherQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessQuartzite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessJasper>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessGlass>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessLignite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessOlivine>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessOpal>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessAmethyst>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessApatite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessGarnetRed>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessGarnetYellow>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessVinteum>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessMonazite>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessSkystone>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessCinnabar>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessCoal>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessGreenSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessRutile>);mods.jei.JEI.removeAndHide(
//	<ore:gemFlawlessLazurite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteAlmandine>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteBlueTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteCertusQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteSodalite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteTanzanite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteTopaz>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteNetherQuartz>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteQuartzite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteJasper>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteGlass>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteLignite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteOlivine>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteOpal>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteAmethyst>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteApatite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteGarnetRed>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteGarnetYellow>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteVinteum>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteMonazite>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteSkystone>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteCinnabar>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteCoal>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteGreenSapphire>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteRutile>);mods.jei.JEI.removeAndHide(
//	<ore:gemExquisiteLazurite>);

mods.jei.JEI.removeAndHide(<ore:gemFlawedCoke>);
mods.jei.JEI.removeAndHide(<ore:gemChippedCoke>);
mods.jei.JEI.removeAndHide(<ore:gemFlawlessLapis>);
mods.jei.JEI.removeAndHide(<ore:gemFlawlessCoke>);
mods.jei.JEI.removeAndHide(<ore:gemExquisiteLapis>);
mods.jei.JEI.removeAndHide(<ore:gemExquisiteCoke>);
mods.jei.JEI.removeAndHide(<metaitem:gemGlass>);

furnace.setFuel(<metaitem:dustGraphite>, 1200);

//compressor.recipeBuilder().inputs(<ore:ingotAluminium>).outputs(<ore:plateAluminium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotAmericium>).outputs(<ore:plateAmericium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotAntimony>).outputs(<ore:plateAntimony>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotBeryllium>).outputs(<ore:plateBeryllium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotChrome>).outputs(<ore:plateChrome>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotCobalt>).outputs(<ore:plateCobalt>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotCopper>).outputs(<ore:plateCopper>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotErbium>).outputs(<ore:plateErbium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotEuropium>).outputs(<ore:plateEuropium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotGallium>).outputs(<ore:plateGallium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotGold>).outputs(<metaitem:plateGold>).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotIridium>).outputs(<metaitem:plateIridium>).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotIron>).outputs(<ore:plateIron>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotLead>).outputs(<ore:plateLead>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotLithium>).outputs(<ore:plateLithium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotManganese>).outputs(<ore:plateManganese>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotNeodymium>).outputs(<ore:plateNeodymium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotNickel>).outputs(<ore:plateNickel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotNiobium>).outputs(<ore:plateNiobium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotOsmium>).outputs(<ore:plateOsmium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPalladium>).outputs(<ore:platePalladium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPlatinum>).outputs(<ore:platePlatinum>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPlutonium241>).outputs(<ore:platePlutonium241>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPotassium>).outputs(<ore:platePotassium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSilicon>).outputs(<ore:plateSilicon>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPotassium>).outputs(<ore:platePotassium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPraseodymium>).outputs(<ore:platePraseodymium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPromethium>).outputs(<ore:platePromethium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotRubidium>).outputs(<ore:plateRubidium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSamarium>).outputs(<ore:plateSamarium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSilver>).outputs(<ore:plateSilver>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSodium>).outputs(<ore:plateSodium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotStrontium>).outputs(<ore:plateStrontium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTantalum>).outputs(<ore:plateTantalum>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTellurium>).outputs(<ore:plateTellurium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTerbium>).outputs(<ore:plateTerbium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotThorium>).outputs(<ore:plateThorium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotThulium>).outputs(<ore:plateThulium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTin>).outputs(<ore:plateTin>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotThulium>).outputs(<ore:plateThulium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotVanadium>).outputs(<ore:plateVanadium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotYttrium>).outputs(<ore:plateYttrium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTitanium>).outputs(<ore:plateTitanium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotUranium>).outputs(<ore:plateUranium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotZinc>).outputs(<ore:plateZinc>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotAnnealedCopper>).outputs(<ore:plateAnnealedCopper>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotBrass>).outputs(<ore:plateBrass>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotBronze>).outputs(<ore:plateBronze>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotCupronickel>).outputs(<ore:plateCupronickel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotElectrum>).outputs(<ore:plateElectrum>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotInvar>).outputs(<ore:plateInvar>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotBatteryAlloy>).outputs(<ore:plateBatteryAlloy>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotEpoxid>).outputs(<ore:plateEpoxid>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<minecraft:diamond>).outputs(<ore:plateDiamond>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<minecraft:emerald>).outputs(<ore:plateEmerald>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:gemLapis>).outputs(<ore:plateLapis>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotMagnalium>).outputs(<ore:plateMagnalium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSolderingAlloy>).outputs(<ore:plateSolderingAlloy>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotStainlessSteel>).outputs(<ore:plateStainlessSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSteel>).outputs(<ore:plateSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotGraphite>).outputs(<ore:plateGraphite>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotOsmiridium>).outputs(<ore:plateOsmiridium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTungstenSteel>).outputs(<ore:plateTungstenSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTungsten>).outputs(<ore:plateTungsten>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTungstenCarbide>).outputs(<ore:plateTungstenCarbide>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotConductiveIron>).outputs(<ore:plateConductiveIron>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotEnergeticAlloy>).outputs(<ore:plateEnergeticAlloy>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotVibrantAlloy>).outputs(<ore:plateVibrantAlloy>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotDarkSteel>).outputs(<ore:plateDarkSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotPulsatingIron>).outputs(<ore:platePulsatingIron>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotElectricalSteel>).outputs(<ore:plateElectricalSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotLumium>).outputs(<ore:plateLumium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotSignalum>).outputs(<ore:plateSignalum>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotEnderium>).outputs(<ore:plateEnderium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotEndSteel>).outputs(<ore:plateEndSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotManyullyn>).outputs(<ore:plateManyullyn>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotArdite>).outputs(<ore:plateArdite>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotReinforcedEpoxyResin>).outputs(<ore:plateReinforcedEpoxyResin>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotBlackSteel>).outputs(<ore:plateBlackSteel>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotYttriumBariumCuprate>).outputs(<ore:plateYttriumBariumCuprate>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotWroughtIron>).outputs(<ore:plateWroughtIron>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotTinAlloy>).outputs(<ore:plateTinAlloy>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotRedAlloy>).outputs(<ore:plateRedAlloy>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotCobaltBrass>).outputs(<ore:plateCobaltBrass>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotElectrumFlux>).outputs(<ore:plateElectrumFlux>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotNeutronium>).outputs(<ore:plateNeutronium>.firstItem).duration(100).EUt(30000).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotInfinity>).outputs(<ore:plateInfinity>.firstItem).duration(100).EUt(30000).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotDraconium>).outputs(<ore:plateDraconium>.firstItem).duration(100).EUt(3000).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotDraconiumAwakened>).outputs(<ore:plateDraconiumAwakened>.firstItem).duration(100).EUt(8000).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotCrystalMatrix>).outputs(<ore:plateCrystalMatrix>.firstItem).duration(100).EUt(8000).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotScandium>).outputs(<ore:plateScandium>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:gemAlmandine>).outputs(<ore:plateAlmandine>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:gemBlueTopaz>).outputs(<ore:plateBlueTopaz>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:gemGreenSapphire>).outputs(<ore:plateGreenSapphire>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:gemRutile>).outputs(<ore:plateRutile>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotKanthal>).outputs(<ore:plateKanthal>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotNiobiumNitride>).outputs(<ore:plateNiobiumNitride>.firstItem).duration(100).EUt(10).buildAndRegister();
//compressor.recipeBuilder().inputs(<ore:ingotNichrome>).outputs(<ore:plateNichrome>.firstItem).duration(100).EUt(10).buildAndRegister();



//recipes.removeByRecipeName("gregtech:tin_cable_4");
//recipes.removeByRecipeName("gregtech:tin_cable_2");
//recipes.removeByRecipeName("gregtech:red_alloy_cable_4");
//recipes.removeByRecipeName("gregtech:red_alloy_cable_2");
//recipes.removeByRecipeName("gregtech:conductive_iron_cable_2");
//recipes.removeByRecipeName("gregtech:conductive_iron_cable_4");
recipes.removeByRecipeName("gregtech:block_decompress_clay");
//recipes.removeByRecipeName("gregtech:gravel_to_flint");



//recipes.remove(<metaitem:gearAluminium>);
//recipes.remove(<metaitem:gearCopper>);
//recipes.remove(<metaitem:gearGold>);
//recipes.remove(<metaitem:gearIridium>);
//recipes.remove(<metaitem:gearIron>);
//recipes.remove(<metaitem:gearLead>);
//recipes.remove(<metaitem:gearOsmium>);
//recipes.remove(<metaitem:gearPlatinum>);
//recipes.remove(<metaitem:gearSilver>);
//recipes.remove(<metaitem:gearTin>);
//recipes.remove(<metaitem:gearTitanium>);
//recipes.remove(<metaitem:gearBrass>);
//recipes.remove(<metaitem:gearBronze>);
//recipes.remove(<metaitem:gearInvar>);
//recipes.remove(<metaitem:gearElectrum>);
//recipes.remove(<metaitem:gearSteel>);

recipes.remove(<thermalfoundation:fertilizer>);
recipes.remove(<thermalfoundation:fertilizer:1>);
recipes.addShapeless(<thermalfoundation:fertilizer> * 16, [<ore:dustWood>, <ore:dustWood>, <ore:dustCharcoal>, <ore:dustSaltpeter>,<metaitem:gemApatite>,<metaitem:gemApatite>]);
recipes.addShapeless(<thermalfoundation:fertilizer> * 16, [<ore:dustWood>, <ore:dustWood>, <ore:dustCoal>, <ore:dustSaltpeter>,<metaitem:gemApatite>,<metaitem:gemApatite>]);

recipes.remove(<meta_tile_entity:extruder.mv>);
recipes.remove(<meta_tile_entity:extruder.hv>);
recipes.remove(<meta_tile_entity:extruder.ev>);


recipes.addShaped(<meta_tile_entity:extruder.mv>, [[<ore:wireGtQuadrupleCupronickel>, <ore:wireGtQuadrupleCupronickel>, <ore:circuitGood>],
	[<metaitem:electric.piston.mv>, <meta_tile_entity:hull.mv>, <ore:pipeNormalFluidSteel>],
	[<ore:wireGtQuadrupleCupronickel>, <ore:wireGtQuadrupleCupronickel>, <ore:circuitGood>]]);

recipes.addShaped(<meta_tile_entity:extruder.hv>, [
	[<ore:wireGtQuadrupleKanthal>, <ore:wireGtQuadrupleKanthal>, <ore:circuitAdvanced>],
	[<metaitem:electric.piston.hv>, <meta_tile_entity:hull.hv>, <ore:pipeNormalFluidStainlessSteel>],
	[<ore:wireGtQuadrupleKanthal>, <ore:wireGtQuadrupleKanthal>, <ore:circuitAdvanced>]]);

recipes.addShaped(<meta_tile_entity:extruder.ev>, [
	[<ore:wireGtQuadrupleNichrome>, <ore:wireGtQuadrupleNichrome>, <ore:circuitExtreme>],
	[<metaitem:electric.piston.ev>, <meta_tile_entity:hull.ev>, <ore:pipeNormalFluidTitanium>],
	[<ore:wireGtQuadrupleNichrome>, <ore:wireGtQuadrupleNichrome>, <ore:circuitExtreme>]]);



recipes.addShapeless(<metaitem:dustConductiveIron>, [<metaitem:dustIron>,<minecraft:redstone>]);
//recipes.addShapeless(<minecraft:flint>, [<ore:gtceMortars>, <minecraft:gravel:*>, <minecraft:gravel:*>]);

furnace.addRecipe(<minecraft:iron_nugget> * 3, <metaitem:dustVanadiumMagnetite>, 0.0);
furnace.addRecipe(<minecraft:iron_nugget> * 2, <metaitem:dustImpureVanadiumMagnetite>, 0.0);

//furnace.remove(<metaitem:ingotConductiveIron>);
//furnace.addRecipe(<enderio:item_alloy_ingot:4>, <metaitem:dustConductiveIron>, 0.0);

//recipes.addShaped(<metaitem:gearIron>, [[<metaitem:stickIron>, <ore:plateIron>, <metaitem:stickIron>],[<ore:plateIron>, <gregtech:meta_tool:11>, <ore:plateIron>], [<metaitem:stickIron>, <ore:plateIron>, <metaitem:stickIron>]]);


//makeShaped("of_sponge", <minecraft:sponge>,
//	["PPP",
//	 "PMP",
//	 "PPP"],
//	{ P : <metaitem:plant_ball>,  // Plant Ball
//	  M : <inspirations:mulch>});

//// Bronze Casing Assembler recipe
//assembler.recipeBuilder()
//	.inputs(<metaitem:plateBronze>*6, <minecraft:brick_block>)
//	.outputs(<gregtech:metal_casing>*3)
//	.duration(50).EUt(16).buildAndRegister();

//Fix unintended Concrete powerder skips

//macerator.findRecipe(8, [<gregtech:concrete>], [null]).remove();
//fluid_extractor.findRecipe(32, [<gregtech:concrete>], [null]).remove();
//
//
//recipes.removeByRecipeName("gregtech:block_decompress_concrete");
//
//macerator.recipeBuilder()
//	.inputs(<gregtech:concrete>)
//	.outputs(<metaitem:dustConcrete> *9)
//	.duration(270).EUt(8).buildAndRegister();
//
//fluid_extractor.recipeBuilder()
//	.inputs(<gregtech:concrete>)
//	.fluidOutputs(<liquid:concrete>*1296)
//	.duration(720).EUt(32).buildAndRegister();
//
//recipes.addShapeless(<metaitem:dustConcrete>*9, [<gregtech:concrete>]);

//Fix Wool macerator recipes
//acerator.findRecipe(2, [<minecraft:wool>], [null]).remove();
//acerator.recipeBuilder()
//	.inputs(<ore:blockWool>)
//	.outputs(<minecraft:string> *4)
//	.duration(400).EUt(2).buildAndRegister();
//
//Remove Unobtainable Clay recipe
//recipes.removeByRecipeName("thermalfoundation:clay_ball");

//Add recipe for Iron Trapdoor
assembler.recipeBuilder()
	.inputs(<ore:plateIron> * 4)
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 6}))
	.outputs(<minecraft:iron_trapdoor>)
	.duration(200).EUt(16).buildAndRegister();


//Restore Pump Recipes

//val material as string[] = [
//
//	"Chrome",
//	"Iridium",
//	"Darmstadtium",
//	"Osmium",
//	"Tin",
//	"Titanium",
//	"Bronze",
//	"StainlessSteel",
//	"Steel",
//	"TungstenSteel",
//	"SteelMagnetic",
//	"Hssg",
//	"Hsse",
//	"Neutronium"
//
//] as string[];
//
//for mat in material {
//	var allPlate = oreDict.get("plate" ~ mat);
//	var plate = allPlate.firstItem;
//	var allScrew = oreDict.get("screw" ~ mat);
//	var screw = allScrew.firstItem;
//	var allRing = oreDict.get("ring" ~ mat);
//	var ring = allRing.firstItem;
//	var allRotor = oreDict.get("rotor" ~ mat);
//	var rotor = allRotor.firstItem;
//
//	//Assembler Recipe
//	assembler.recipeBuilder()
//		.inputs(plate*4, ring)
//		.fluidInputs(<liquid:soldering_alloy> * 32)
//		.outputs(rotor)
//		.EUt(24).duration(240).buildAndRegister();
//
//	//By Hand Recipe
//	recipes.remove(rotor);
//
//	recipes.addShaped("of_rotor_" ~ mat, rotor,
//		["PHP",
//	 	 "SRF",
//	 	 "PDP"],
//		{ P : plate,  
//	  	  H : <ore:gtceHardHammers>,
//	  	  S : screw,
//	  	  R : ring,
//	  	  F : <ore:gtceFiles>,
//	  	  D : <ore:gtceScrewdrivers>});
//}

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


//Implosion Compressor Recipes (Adding back the dynamite)

//val implosioninputs = [
//	[<metaitem:dustGarnetYellow>, <metaitem:gemGarnetYellow>],
//	[<metaitem:dustEnderEye>, <minecraft:ender_eye>],
//	[<metaitem:dustAlmandine>, <metaitem:gemAlmandine>],
//	[<metaitem:dustEnderPearl>, <minecraft:ender_pearl>],
//	[<metaitem:dustVinteum>, <metaitem:gemVinteum>],
//	[<metaitem:dustOlivine>, <metaitem:gemOlivine>],
//	[<metaitem:dustGlass>, <metaitem:gemGlass>],
//	[<metaitem:dustTanzanite>, <metaitem:gemTanzanite>],
//	[<metaitem:dustJasper>, <metaitem:gemJasper>],
//	[<metaitem:dustOpal>, <metaitem:gemOpal>],
//	[<metaitem:dustBlueTopaz>, <metaitem:gemBlueTopaz>],
//	[<metaitem:dustTopaz>, <metaitem:gemTopaz>],
//	[<metaitem:dustSapphire>, <metaitem:gemSapphire>],
//	[<metaitem:dustGarnetRed>, <metaitem:gemGarnetRed>],
//	[<metaitem:dustRuby>, <metaitem:gemRuby>],
//	[<metaitem:dustNetherStar>, <minecraft:nether_star>],
//	[<metaitem:dustEmerald>, <minecraft:emerald>],
//	[<metaitem:dustGreenSapphire>, <metaitem:gemGreenSapphire>],
//	[<metaitem:dustRutile>, <metaitem:gemRutile>],
//	[<metaitem:dustAmethyst>, <metaitem:gemAmethyst>]
//
//] as IItemStack[][];
//
//for input in implosioninputs {
//
//implosion_compressor.recipeBuilder()
//	.inputs([input[0] * 4])
//	.outputs([input[1] * 3, <metaitem:dustTinyDarkAsh> * 2])
//	.property("explosives", <metaitem:dynamite> * 32)
//	.duration(20).EUt(30).buildAndRegister();
//
//}

//Reinforced Iridium
//implosion_compressor.recipeBuilder()
//	.inputs(<metaitem:ingot.iridium_alloy>)
//	.property("explosives", <metaitem:dynamite> * 64)
//	.outputs(<metaitem:plate.iridium_alloy>)
//	.duration(20).EUt(30).buildAndRegister();

//Omnium
implosion_compressor.recipeBuilder()
	.inputs([<extendedcrafting:singularity_ultimate>])
	.outputs(<extendedcrafting:material:33>)
	.property("explosives", <metaitem:dynamite> * 8)
	.duration(20).EUt(30).buildAndRegister();

//Custom Byproduct chances: Revert macerator chances to old behavior

//RecipeMap.chanceFunction = function(chance as int,
//									boostPerTier as int,
//									tier as int) as int {
//	if boostPerTier == 0 {
//	    // Simulation Chamber recipes, for example, which should not scale
//	    return chance;
//	}
//	return chance * pow(2, tier);
//};

////Slight nerf to Bone Meal Recipe
//macerator.findRecipe(2, [<minecraft:bone>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<minecraft:bone>)
//	.outputs(<minecraft:dye:15> * 4)
//	.duration(60).EUt(8).buildAndRegister();
//
////Adjust the Bone Meal by hand recipe
//recipes.removeByRecipeName("gregtech:bone_to_bone_meal");
//recipes.addShapeless(<minecraft:dye:15> * 3,
//	[<minecraft:bone>, <ore:gtceMortars>]);
//
////Adjust Bone Meal Compressor recipe to prevent dupe
////compressor.findRecipe(8, [<minecraft:dye:15> * 3], [null]).remove();
//compressor.recipeBuilder()
//	.inputs(<minecraft:dye:15> * 4)
//	.outputs(<minecraft:bone>)
//	.duration(20).EUt(8).buildAndRegister();

//Add Decomposition Recipe for Polyphenylene Sulfide
electrolyzer.recipeBuilder()
	.fluidInputs(<liquid:polyphenylene_sulfide> * 11000)
	.outputs(<metaitem:dustCarbon> * 6, <metaitem:dustSulfur>)
	.fluidOutputs(<liquid:hydrogen> * 4000)
	.duration(288).EUt(128).buildAndRegister();

//Fix glowstone block recipe conflict in cutting saw
//saw.findRecipe(30, [<minecraft:glowstone>], [<liquid:water> * 73]).remove();
//saw.findRecipe(30, [<minecraft:glowstone>], [<liquid:distilled_water> * 55]).remove();
//saw.findRecipe(30, [<minecraft:glowstone>], [<liquid:lubricant> * 18]).remove();
//
//saw.findRecipe(30, [<minecraft:glowstone>], [<liquid:water> * 73]).remove();
//saw.findRecipe(30, [<minecraft:glowstone>], [<liquid:distilled_water> * 55]).remove();
//saw.findRecipe(30, [<minecraft:glowstone>], [<liquid:lubricant> * 18]).remove();

	
//saw.recipeBuilder()
//	.inputs(<minecraft:glowstone>)
//	.fluidInputs(<liquid:water> * 5)
//	.outputs(<metaitem:plateGlowstone> * 4)
//	.duration(200).EUt(16).buildAndRegister();
//
//saw.recipeBuilder()
//	.inputs(<minecraft:glowstone>)
//	.fluidInputs(<liquid:distilled_water> * 3)
//	.outputs(<metaitem:plateGlowstone> * 4)
//	.duration(130).EUt(16).buildAndRegister();
//
//saw.recipeBuilder()
//	.inputs(<minecraft:glowstone>)
//	.fluidInputs(<liquid:lubricant> * 1)
//	.outputs(<metaitem:plateGlowstone> * 4)
//	.duration(50).EUt(16).buildAndRegister();

//Re-adding the old GTCE granite recipe, as it is being relied on.
//Due to GTCE's weird recipe removal for items that share an oredict, only one of the items need to be removed
//// Granite Dust * 1
//<recipemap:macerator>.findRecipe(2, [<minecraft:stone:1>], null).remove();
//
//
//macerator.recipeBuilder()
//	.inputs(<ore:stoneGranite>)
//	.outputs(<metaitem:dustGraniteBlack>)
//	.chancedOutput(<metaitem:dustThorium>, 100, 100)
//	.duration(150).EUt(8).buildAndRegister();

//Adjust the recipe of the Rotor mold
//recipes.removeByRecipeName("gregtech:shape/mold/shape_mold_rotor");
//recipes.addShaped("gtce_rotor_mold", <metaitem:shape.mold.rotor>, [
//	[<ore:gtceHardHammers>, null, null],
//	[null, null, null],
//	[null, null, <metaitem:shape.empty>]
//]);

//recipes.removeByRecipeName("gregtech:scanner_battery.re.lv.lithium");
//recipes.removeByRecipeName("gregtech:scanner_battery.re.lv.cadmium");
//recipes.removeByRecipeName("gregtech:scanner_battery.re.lv.sodium");

//Temporary removal of a duplicate recipe
//reactor.findRecipe(30, [<metaitem:dustSodiumBisulfate> * 7], [<liquid:water> * 1000]).remove();

//Tetranitromethane recipe as a holdover
//chemical_reactor.recipeBuilder()
//	.fluidInputs(<liquid:ethenone> * 2000, <liquid:nitric_acid> * 4000)
//	.fluidOutputs(<liquid:tetranitromethane> * 1000, <liquid:water> * 4000)
//	.outputs(<metaitem:dustCarbon> * 3)
//	.duration(480).EUt(120).buildAndRegister();

//electrolyzer.findRecipe(60, [null], [<liquid:glycerol> * 1000]).remove();

// remove xu2 shortcut hopper
recipes.removeByRecipeName("extrautils2:shortcut_hopper");

// steam multis
recipes.removeByRecipeName("gregtech:steam_oven");
recipes.addShaped(<metaitem:steam_oven>, [
	[<gregtech:metal_casing>, <metaitem:gearInvar>, <gregtech:metal_casing>],
	[<gregtech:boiler_firebox_casing>, <morefurnaces:furnaceblock:5>, <gregtech:boiler_firebox_casing>],
	[<gregtech:metal_casing>, <metaitem:gearInvar>, <gregtech:metal_casing>]
]);

recipes.removeByRecipeName("gregtech:steam_grinder");
recipes.addShaped(<metaitem:steam_grinder>, [
	[<gregtech:metal_casing>, <metaitem:gearPotin>, <gregtech:metal_casing>],
	[<gregtech:metal_casing>, <minecraft:diamond>, <gregtech:metal_casing>],
	[<gregtech:metal_casing>, <metaitem:gearPotin>, <gregtech:metal_casing>]
]);

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
electrolyzer.recipeBuilder()
	.inputs(<metaitem:dustDiamond>)
	.outputs(<metaitem:dustCarbon> * 16)
	.duration(768)
	.EUt(30)
	.buildAndRegister();

// PBF nomified
furnace.remove(<metaitem:brick.fireclay>);
furnace.addRecipe(<metaitem:brick.fireclay>, <metaitem:dustFireclay>, 0.5);
recipes.removeByRecipeName("gregtech:fireclay_dust");
recipes.addShapeless("fireclay_dust", <metaitem:dustFireclay> * 16, [<metaitem:dustClay>, <metaitem:dustBrick>]);
// Compressed Fireclay * 1
<recipemap:compressor>.findRecipe(4, [<metaitem:dustFireclay>], null).remove();
// Clay Dust * 1
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustFireclay> * 2], null).remove();


// PBF recipe removals
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:ingotWroughtIron>, <metaitem:dustCoke>], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:ingotWroughtIron>, <metaitem:gemCoke>], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:ingotWroughtIron>, <minecraft:coal:1> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:ingotWroughtIron>, <metaitem:dustCoal> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:ingotWroughtIron>, <minecraft:coal:0> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:ingotWroughtIron>, <metaitem:dustCharcoal> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_ingot:0>, <metaitem:dustCoke>], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_ingot:0>, <metaitem:gemCoke>], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_ingot:0>, <minecraft:coal:1> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_ingot:0>, <metaitem:dustCoal> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_ingot:0>, <minecraft:coal:0> * 2], null).remove();
// Steel Ingot * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_ingot:0>, <metaitem:dustCharcoal> * 2], null).remove();
// Block of Steel * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:blockWroughtIron>, <metaitem:blockCoke>], null).remove();
// Block of Steel * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:blockWroughtIron>, <metaitem:blockCharcoal> * 2], null).remove();
// Block of Steel * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<metaitem:blockWroughtIron>, <minecraft:coal_block:0> * 2], null).remove();
// Block of Steel * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_block:0>, <metaitem:blockCoke>], null).remove();
// Block of Steel * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_block:0>, <minecraft:coal_block:0> * 2], null).remove();
// Block of Steel * 1
<recipemap:primitive_blast_furnace>.findRecipe(1, [<minecraft:iron_block:0>, <metaitem:blockCharcoal> * 2], null).remove();

// PBF recipes

primitive_blast_furnace.recipeBuilder()
	.inputs([<metaitem:ingotWroughtIron>, <minecraft:coal>])
	.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh> * 2])
	.duration(400)
	.EUt(1)
	.buildAndRegister();
primitive_blast_furnace.recipeBuilder()
	.inputs([<metaitem:ingotWroughtIron>, <minecraft:coal:1>])
	.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh> * 2])
	.duration(400)
	.EUt(1)
	.buildAndRegister();
primitive_blast_furnace.recipeBuilder()
	.inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCoal>])
	.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh> * 2])
	.duration(400)
	.EUt(1)
	.buildAndRegister();
primitive_blast_furnace.recipeBuilder()
	.inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCharcoal>])
	.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh> * 2])
	.duration(400)
	.EUt(1)
	.buildAndRegister();


// Kill Glowstone Decomp
// Small Pile of Redstone Dust * 2
<recipemap:centrifuge>.findRecipe(80, [<minecraft:glowstone_dust:0>], null).remove();

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