#packmode normal
#priority -1

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;
import mods.gregtech.recipe.helpers;

import scripts.common.makeShaped as makeShaped;
import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeExtremeRecipe7 as makeExtremeRecipe7;
import scripts.common.makeExtremeRecipe9 as makeExtremeRecipe9;
import scripts.common.makeShapeless3 as makeShapeless3;
import scripts.common.removeMaterial as removeMaterial;
import scripts.common.removeMaterialSolid as removeMaterialSolid;
import scripts.common.removeMaterialFluid as removeMaterialFluid;

//Nether Cake
recipes.addShaped(<dimensionaledibles:nether_cake>, [[<metaitem:dustNetherrack>,<metaitem:dustNetherrack>,<metaitem:dustNetherrack>], [<minecraft:obsidian>, <enderio:item_material:70>, <minecraft:obsidian>],[<minecraft:soul_sand>,<minecraft:soul_sand>,<minecraft:soul_sand>]]);

//Steel [tier 0]

// Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:ingotWroughtIron>], [<liquid:oxygen> * 1000]).remove();
// Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<minecraft:iron_ingot:0>], [<liquid:oxygen> * 200]).remove();

// Steel
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCoal>]).outputs([<metaitem:ingotSteel>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCharcoal>]).outputs([<metaitem:ingotSteel>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<metaitem:ingotWroughtIron>, <metaitem:dustCarbon>]).outputs([<metaitem:ingotSteel>]).duration(150).EUt(16).buildAndRegister();

//Wrought Iron
furnace.remove(<metaitem:nuggetWroughtIron>);
furnace.addRecipe(<metaitem:ingotWroughtIron>, <minecraft:iron_ingot>, 0.0);

//Red Alloy Dust
recipes.addShapeless(<metaitem:dustRedAlloy>, [<metaitem:dustCopper>, <minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>]);

recipes.addShapeless(<minecraft:clay>, [<contenttweaker:block_dust>,<minecraft:water_bucket>]);

//Clay Electrolyzing
electrolyzer.findRecipe(60, [<metaitem:dustClay> * 13], [null]).remove();
electrolyzer.recipeBuilder().inputs([<metaitem:dustClay> * 13]).outputs([<metaitem:dustSodium> * 2, <metaitem:dustSilicon> * 2, <metaitem:dustLithium>, <metaitem:dustAluminium> * 2]).fluidOutputs([<liquid:water>*6000]).duration(364).EUt(15).buildAndRegister();

// Ender Tank (Ender Storage)
recipes.remove(<enderstorage:ender_storage:1>);
recipes.addShaped(<enderstorage:ender_storage:1>, [
	[<minecraft:blaze_rod>, <minecraft:wool>, <minecraft:blaze_rod>],
	[<ore:obsidian>, basictank, <ore:obsidian>],
	[<minecraft:blaze_rod>, <ore:blockEnderPearl>, <minecraft:blaze_rod>]]); //Ender Pearl Block
recipes.addShapeless(<enderstorage:ender_storage:1>, [<enderstorage:ender_storage:1>]);


//LV Macerator
recipes.remove(<meta_tile_entity:macerator.lv>);
recipes.addShaped(<meta_tile_entity:macerator.lv>, [
	[<metaitem:electric.piston.lv>, <metaitem:electric.motor.lv>, <metaitem:toolHeadBuzzSawWroughtIron>],
	[<ore:cableGtSingleTin>, <ore:cableGtSingleTin>, <meta_tile_entity:hull.lv>],
	[<ore:circuitLv>, <ore:circuitLv>, <ore:cableGtSingleTin>]]);

//MV Macerator
recipes.remove(<meta_tile_entity:macerator.mv>);
recipes.addShaped(<meta_tile_entity:macerator.mv>, [
	[<metaitem:electric.piston.mv>, <metaitem:electric.motor.mv>, <metaitem:toolHeadBuzzSawSteel>],
	[<ore:cableGtSingleCopper>, <ore:cableGtSingleCopper>, <meta_tile_entity:hull.mv>],
	[<ore:circuitMv>, <ore:circuitMv>, <ore:cableGtSingleCopper>]]);

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

chemical_reactor.recipeBuilder().inputs([<contenttweaker:block_dust>]).fluidInputs([<liquid:water> * 1000]).outputs(<minecraft:clay>).EUt(15).duration(20).buildAndRegister();


recipes.remove(<meta_tile_entity:extruder.mv>);
recipes.remove(<meta_tile_entity:extruder.hv>);
recipes.remove(<meta_tile_entity:extruder.ev>);


recipes.addShaped(<meta_tile_entity:extruder.mv>, [[<ore:wireGtQuadrupleCupronickel>, <ore:wireGtQuadrupleCupronickel>, <ore:circuitMv>],
	[<metaitem:electric.piston.mv>, <meta_tile_entity:hull.mv>, <ore:pipeNormalFluidSteel>],
	[<ore:wireGtQuadrupleCupronickel>, <ore:wireGtQuadrupleCupronickel>, <ore:circuitMv>]]);

recipes.addShaped(<meta_tile_entity:extruder.hv>, [
	[<ore:wireGtQuadrupleKanthal>, <ore:wireGtQuadrupleKanthal>, <ore:circuitHv>],
	[<metaitem:electric.piston.hv>, <meta_tile_entity:hull.hv>, <ore:pipeNormalFluidStainlessSteel>],
	[<ore:wireGtQuadrupleKanthal>, <ore:wireGtQuadrupleKanthal>, <ore:circuitHv>]]);

recipes.addShaped(<meta_tile_entity:extruder.ev>, [
	[<ore:wireGtQuadrupleNichrome>, <ore:wireGtQuadrupleNichrome>, <ore:circuitEv>],
	[<metaitem:electric.piston.ev>, <meta_tile_entity:hull.ev>, <ore:pipeNormalFluidTitanium>],
	[<ore:wireGtQuadrupleNichrome>, <ore:wireGtQuadrupleNichrome>, <ore:circuitEv>]]);



recipes.addShapeless(<metaitem:dustConductiveIron>, [<metaitem:dustIron>,<minecraft:redstone>]);

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
helpers.clear(primitive_blast_furnace);

/* Start PBF Recipes */

/* Wrought Iron */
	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:gemCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:gemCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:dustCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:dustCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotWroughtIron> * 2, <ore:fuelCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(600)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotWroughtIron> * 2, <ore:dustCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(600)
		.EUt(1)
		.buildAndRegister();

/* Iron */
	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:gemCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:gemCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:dustCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:dustCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotIron> * 2, <ore:fuelCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(1500)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:ingotIron> * 2, <ore:dustCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(1500)
		.EUt(1)
		.buildAndRegister();

/* Block Recipes */
	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:blockWroughtIron>, <ore:blockCoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(3600)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:blockWroughtIron>, <ore:blockCharcoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(3600)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:blockWroughtIron> * 2, <ore:blockFuelCoke>])
		.outputs([<metaitem:blockSteel> * 2, <metaitem:dustAsh>])
		.duration(5400)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:blockIron>, <ore:blockCoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(8100)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:blockIron>, <ore:blockCharcoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(8100)
		.EUt(1)
		.buildAndRegister();

	primitive_blast_furnace.recipeBuilder()
		.inputs([<ore:blockIron> * 2, <ore:blockFuelCoke>])
		.outputs([<metaitem:blockSteel> * 2, <metaitem:dustAsh>])
		.duration(13500)
		.EUt(1)
		.buildAndRegister();

/* End PBF Recipes */

// Creative Tank Data
extractor.recipeBuilder()
    .inputs(<contenttweaker:heartofauniverse>)
    .outputs(<contenttweaker:creativeportabletankmold>)
    .duration(1000)
    .EUt(180000)
    .buildAndRegister();


// Impossible Realm Data Recipes
makeShaped("of_impossiblerealmdata_x1", <contenttweaker:impossiblerealmdata>,
	["OEO",
	 "EOE",
	 "OEO"],
	{ E : <actuallyadditions:item_solidified_experience>,
	  O : <deepmoblearning:living_matter_overworldian> });

makeShaped("of_impossiblerealmdata_x2", <contenttweaker:impossiblerealmdata> * 2,
	["HEH",
	 "EHE",
	 "HEH"],
	{ E : <actuallyadditions:item_solidified_experience>,
	  H : <deepmoblearning:living_matter_hellish> });

makeShaped("of_impossiblerealmdata_x4", <contenttweaker:impossiblerealmdata> * 4,
	["XEX",
	 "EXE",
	 "XEX"],
	{ E : <actuallyadditions:item_solidified_experience>,
	  X : <deepmoblearning:living_matter_extraterrestrial> });

// Dragon Lair Data
makeShapeless3("of_dragonlairdata", <contenttweaker:dragonlairdata>,
	["IHH",
	 "HHH",
	 "HHH"],
	{ I : <contenttweaker:impossiblerealmdata>,
	  H : <deepmoblearning:living_matter_extraterrestrial> }
);

// Wither Realm Data
makeShapeless3("of_witherrealmdata", <contenttweaker:witherrealmdata>,
	["IXX",
	 "XXX",
	 "XXX"],
	{ I : <contenttweaker:impossiblerealmdata>,
	  X : <deepmoblearning:living_matter_hellish> }
);

// Quantum Flux Recipes
makeShaped("of_quantumflux_a", <contenttweaker:quantumflux>,
	[" X ",
	 "XMX",
	 " X "],
	{ M : <enderio:item_material:14>,
	  X : <deepmoblearning:living_matter_extraterrestrial> }
);

// Extraterrestrial Matter
recipes.remove(<deepmoblearning:living_matter_extraterrestrial>);
makeShaped("of_dml_living_matter_extraterrestrial",
	<deepmoblearning:living_matter_extraterrestrial>,
	[" H ",
	 "HEH",
	 " H "],
	{ H : <deepmoblearning:living_matter_hellish>,
	  E : <minecraft:ender_pearl> }
);

recipes.remove(<nuclearcraft:water_source>);
makeShaped("of_nc_water_source", <nuclearcraft:water_source>,
    ["AAA",
     "B B",
     "AAA"],
    { A : <ore:plateWroughtIron>,
      B : <minecraft:water_bucket:*> });


//Rubber by hand
recipes.addShaped(<metaitem:plateRubber>,[[<ore:toolHammer>],[<metaitem:rubber_drop>],[<metaitem:rubber_drop>]]);	

//Rubber Sheet
compressor.recipeBuilder().inputs(<metaitem:rubber_drop>).outputs(<metaitem:plateRubber>).duration(20).EUt(8).buildAndRegister();

//Item conduit - by hand
recipes.addShaped(<enderio:item_item_conduit> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<ore:wireGtSinglePulsatingIron>,<ore:wireGtSinglePulsatingIron>,<ore:wireGtSinglePulsatingIron>],
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);


//ender fluid conduit - by hand
recipes.addShaped(<enderio:item_liquid_conduit:2> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<metaitem:wireGtSingleVibrantAlloy>,<enderio:item_liquid_conduit:1>,<metaitem:wireGtSingleVibrantAlloy>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);


//item conduit - assembler
assembler.recipeBuilder()
    .inputs([<ore:wireGtSinglePulsatingIron> * 3, <ore:itemConduitBinder> * 6])
    .outputs([<enderio:item_item_conduit> * 8])
    .duration(80).EUt(16).buildAndRegister();

//ender fluid conduit - assembler
assembler.recipeBuilder()
    .inputs([<metaitem:wireGtSingleVibrantAlloy> * 2, <enderio:item_liquid_conduit:1>, <ore:itemConduitBinder> * 6])
    .outputs([<enderio:item_liquid_conduit:2> * 8])
    .duration(80).EUt(16).buildAndRegister();

// remove LV Motor recipes
recipes.removeByRecipeName("gregtech:electric_motor_lv_steel");
recipes.removeByRecipeName("gregtech:electric_motor_lv_iron");
assembler.findRecipe(30, [<metaitem:cableGtSingleTin> * 2, <metaitem:stickSteel> * 2, <metaitem:stickSteelMagnetic>, <metaitem:wireGtSingleCopper> * 4], [null]).remove();
<recipemap:assembler>.findRecipe(30, [<metaitem:cableGtSingleTin> * 2, <metaitem:stickIron> * 2, <metaitem:stickIronMagnetic>, <metaitem:wireGtSingleCopper> * 4], null).remove();


//LV Motor - with Fine Copper Wires
recipes.addShaped(<metaitem:electric.motor.lv>, [
	[<ore:cableGtSingleTin>, <metaitem:wireFineCopper>, <ore:stickIron>], 
	[<metaitem:wireFineCopper>, <ore:stickIronMagnetic>, <metaitem:wireFineCopper>],
	[<ore:stickIron>, <metaitem:wireFineCopper>, <ore:cableGtSingleTin>]]);
assembler.recipeBuilder()
	.inputs([<metaitem:cableGtSingleTin> * 2, <metaitem:stickIron> * 2, <metaitem:stickIronMagnetic>, <metaitem:wireFineCopper> * 4])
	.outputs(<metaitem:electric.motor.lv>)
	.duration(100)
	.EUt(30)
	.buildAndRegister();
// Glass Tube

recipes.addShaped(<metaitem:component.glass.tube>, [
	[null, null, null],
	[<ore:paneGlass>, <ore:paneGlass>, <ore:paneGlass>],
	[<ore:paneGlass>, <ore:paneGlass>, <ore:paneGlass>]
]);

// t1 board easier
recipes.removeByRecipeName("gregtech:basic_circuit_board");
recipes.addShaped("basic_circuit_board", <metaitem:circuit_board.basic>, [[<ore:wireFineCopper>, <ore:wireFineCopper>, <ore:wireFineCopper>], [<ore:wireFineCopper>, <gregtech:meta_item_1:381>, <ore:wireFineCopper>], [<ore:wireFineCopper>, <ore:wireFineCopper>, <ore:wireFineCopper>]]);


////////////////////////// Creative Chest ///////////////////////
val creativecell = <thermalexpansion:cell>.withTag({Recv: 250000, RSControl: 0 as byte, Facing: 3 as byte, Energy: 500000000, Creative: 1 as byte, SideCache: [2, 2, 2, 2, 2, 2] as byte[] as byte[], Level: 4 as byte, Send: 250000}, false);
val creativetank = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 1 as byte, Level: 4 as byte}, false);
val creativejetpack = <simplyjetpacks:itemjetpack>.withTag({JetpackParticleType: 3}, false);

makeExtremeRecipe9(<metaitem:creative_chest> * 2,
    ["ABBBBBBBA",
     "BCTEDETCB",
     "BFSGHGSFB",
     "BUJXIXJUB",
     "BNSWKWSNB",
     "BUJXLXJUB",
     "BFSGMGSFB",
     "BCTEDETCB",
     "ABBBBBBBA"],
    { A : <storagedrawers:upgrade_creative>,
      B : <ore:ingotInfinity>,
      C : <draconicevolution:creative_rf_source>,
      D : creativecell.only(isCreative),
      E : <extrautils2:creativeenergy>,
      F : <extrautils2:drum:4>,
      G : <extrautils2:passivegenerator:6>,
      H : <avaritia:infinity_helmet>,
      I : <avaritia:infinity_chestplate>,
      J : creativejetpack,
      K : <avaritia:infinity_sword>,
      L : <avaritia:infinity_pants>,
      M : <avaritia:infinity_boots>,
      N : <metaitem:infinite_energy>,
      S : <solarflux:solar_panel_infinity>,
      T : <metaitem:creative_tank>,
      U : <appliedenergistics2:creative_energy_cell>,
      W : <thermalcultivation:watering_can:32000>.withTag({Water: 0, Mode: 4}, false),
      X : <thermalexpansion:capacitor:32000>.withTag({Energy: 250000000}, false)
    });

// Creative Drum
makeExtremeRecipe9(<extrautils2:drum:4>,
    ["BBBCDCBBB",
     "BBCDEDCBB",
     "BCDEFEDCB",
     "CDEFFFEDC",
     "DEFFAFFED",
     "CDEFFFEDC",
     "BCDEFEDCB",
     "BBCDEDCBB",
     "BBBCDCBBB"],
    { A : <avaritia:resource:5>,
      B : <metaitem:large_fluid_cell.steel>,
      C : <metaitem:large_fluid_cell.aluminium>,
      D : <metaitem:large_fluid_cell.stainless_steel>,
      E : <metaitem:large_fluid_cell.titanium>,
      F : <metaitem:large_fluid_cell.tungstensteel> });

// Liquid XP

fluid_extractor.recipeBuilder()
    .inputs([<deepmoblearning:living_matter_overworldian>])
    .fluidOutputs([<liquid:xpjuice> * 200])
    .duration(40).EUt(32).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<deepmoblearning:living_matter_hellish>])
    .fluidOutputs([<liquid:xpjuice> * 400])
    .duration(80).EUt(32).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<deepmoblearning:living_matter_extraterrestrial>])
    .fluidOutputs([<liquid:xpjuice> * 500])
    .duration(100).EUt(32).buildAndRegister();


//// Creative Tank Provider
//val creative_tank_provider = Builder.start("mbt:creative_tank_provider")
//    .withPattern(function(controller as IControllerTile) as IBlockPattern {
//        return FactoryBlockPattern.start()
//            .aisle("CCC", "CCC", "CCC")
//            .aisle("CCC", "CFC", "CCC")
//            .aisle("CCC", "CSC", "CCC")
//            .where('S', controller.self())
//            .where('F', <metastate:gregtech:meta_block_frame_24:12>) // Tungstencarbide Frame Box
//            .where("C", CTPredicate.states(<metastate:gcym:large_multiblock_casing:11>) | controller.autoAbilities(true, false, true, true, false, false, false))
//            .build();
//    } as IPatternBuilderFunction)
//    .withRecipeMap(
//        FactoryRecipeMap.start("creative_tank_provider")
//            .minInputs(2)
//            .maxInputs(2)
//            .minOutputs(1)
//            .maxOutputs(1)
//            .build())
//    .withBaseTexture(<metastate:gcym:large_multiblock_casing:11>)
//    .buildAndRegister();
//
//creative_tank_provider.hasMufflerMechanics = false;
//creative_tank_provider.hasMaintenanceMechanics = false;
//
//recipes.addShaped("creative_tank_provider", <metaitem:mbt:creative_tank_provider>, [
//    [<metaitem:emitter.zpm>, <metaitem:field.generator.luv>, <metaitem:emitter.zpm>],
//    [<metaitem:field.generator.zpm>, <gcym:large_multiblock_casing:11>, <metaitem:field.generator.zpm>],
//    [<ore:circuitZpm>, <metaitem:field.generator.uv>, <ore:circuitZpm>]
//]);
//
//// creative tank provider
//// creative tank
//creative_tank_provider.recipeMap
//    .recipeBuilder()
//    .notConsumable(<contenttweaker:creativeportabletankmold>)
//    .inputs(<minecraft:bucket>)
//    .outputs(<metaitem:creative_tank>)
//    .duration(500)
//    .EUt(100000)
//    .buildAndRegister();

//Numismatic Dynamo
recipes.remove(<thermalexpansion:dynamo:5>);
recipes.addShaped(<thermalexpansion:dynamo:5>, [
	[null, <contenttweaker:excitationcoil>, null],
	[<metaitem:plateVibrantAlloy>, <morefurnaces:furnaceblock:2>, <metaitem:plateVibrantAlloy>],
	[<enderio:item_material:13>, <thermalfoundation:material:514>, <enderio:item_material:13>]]);

// Red Alloy
<recipemap:alloy_blast_smelter>.findRecipe(16, [<metaitem:dustCopper>, <minecraft:redstone> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 5})], null).remove();
alloy_blast_smelter.recipeBuilder()
	.inputs(<ore:dustCopper> * 2, <minecraft:redstone> * 3)
	.circuit(2)
	.property("temperature", 1000)
	.fluidOutputs(<liquid:red_alloy> * 288)
	.duration(75).EUt(16).buildAndRegister();
	
// Redstone * 4
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustRedAlloy>], null).remove();

// zpm crystal
// crystal growing w Enderium
autoclave.recipeBuilder()
	.inputs(<ore:gemExquisiteOlivine>)
	.fluidInputs(<liquid:enderium> * 144)
	.chancedOutput(<metaitem:crystal.raw>, 900, 1800)
	.duration(12000)
	.EUt(320)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

autoclave.recipeBuilder()
	.inputs(<ore:gemExquisiteEmerald>)
	.fluidInputs(<liquid:enderium> * 144)
	.chancedOutput(<metaitem:crystal.raw>, 900, 1800)
	.duration(12000)
	.EUt(320)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

autoclave.recipeBuilder()
	.inputs(<metaitem:crystal.raw_chip>)
	.fluidInputs(<liquid:enderium> * 144)
	.chancedOutput(<metaitem:crystal.raw>, 8000, 250)
	.duration(12000)
	.EUt(320)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

// Upgrade Template
recipes.remove(<storagedrawers:upgrade_template>);
recipes.addShaped(<storagedrawers:upgrade_template> * 2, [
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>],
	[<ore:stickWood>, <storagedrawers:customdrawers>, <ore:stickWood>],
	[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);

// NC Cobble gen
recipes.remove(<nuclearcraft:cobblestone_generator>);
makeShaped("of_nc_cobblestone_generator",
    <nuclearcraft:cobblestone_generator>,
    ["AAA",
     "B C",
     "AAA"],
    { A : <ore:plateSteel>,
      B : <minecraft:water_bucket:*>,
      C : <minecraft:lava_bucket:*> });

makeShaped("of_nc_cobblestone_generator_mirrored",
    <nuclearcraft:cobblestone_generator>,
    ["AAA",
     "C B",
     "AAA"],
    { A : <ore:plateSteel>,
      B : <minecraft:water_bucket:*>,
      C : <minecraft:lava_bucket:*> });

//Crystal Growth Chamber
recipes.addShaped(<ae2stuff:grower>, [
	[<ore:frameGtDarkSteel>, <appliedenergistics2:material:1>, <ore:frameGtDarkSteel>], 
	[<appliedenergistics2:material:1>, <meta_tile_entity:hull.lv>, <appliedenergistics2:material:1>], 
	[<ore:frameGtDarkSteel>, <appliedenergistics2:material:1>, <ore:frameGtDarkSteel>]]);	

//Distillation Tower
recipes.removeByRecipeName("gregtech:distillation_tower");
recipes.addShaped(<meta_tile_entity:distillation_tower>, [
	[<ore:pipeLargeFluidStainlessSteel>, <metaitem:electric.pump.hv>, <ore:pipeLargeFluidStainlessSteel>], 
	[<ore:circuitHv>, <meta_tile_entity:hull.mv>, <ore:circuitHv>], 
	[<ore:pipeLargeFluidStainlessSteel>, <metaitem:electric.pump.hv>, <ore:pipeLargeFluidStainlessSteel>]]);

//Draconium [tier 14]
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:neon> * 25]).remove();
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:dustDraconium>]).fluidInputs([<liquid:nitro_fuel>*2000]).outputs(<metaitem:ingotHotDraconium>).property("temperature", 6800).duration(10000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:nitro_fuel>*8000]).outputs([<metaitem:ingotHotDraconium> * 2]).property("temperature", 6800).duration(20000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:dustDraconium>]).fluidInputs([<liquid:gasoline>*2000]).outputs(<metaitem:ingotHotDraconium>).property("temperature", 6800).duration(10000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:gasoline>*8000]).outputs([<metaitem:ingotHotDraconium> * 2]).property("temperature", 6800).duration(20000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:dustDraconium>]).fluidInputs([<liquid:gasoline_premium>*500]).outputs(<metaitem:ingotHotDraconium>).property("temperature", 6800).duration(10000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:gasoline_premium>*2000]).outputs([<metaitem:ingotHotDraconium> * 2]).property("temperature", 6800).duration(20000).EUt(120).buildAndRegister();

//////////////////// Exotic Materials Catalyst ////////////////////////
makeExtremeRecipe7(<contenttweaker:exoticmaterialscatalyst>,
    ["L  M  J",
     " K W S ",
     "  YNT  ",
     "OFUVAIC",
     "  XEH  ",
     " Q G P ",
     "B  R  D"],
    { A : <ore:ingotCrystalMatrix>,
      B : <ore:ingotRuridit>,
      C : <ore:ingotElectricalSteel>,
      D : <ore:ingotEnergeticAlloy>,
      E : <ore:ingotVibrantAlloy>,
      F : <ore:ingotRhodiumPlatedPalladium>,
      G : <ore:ingotDarkSteel>,
      H : <ore:ingotSoularium>,
      I : <ore:ingotEndSteel>,
      J : <metaitem:ingotKanthal>,
      K : <metaitem:ingotMagnalium>,
      L : <metaitem:ingotNichrome>,
      M : <metaitem:ingotRedSteel>,
      N : <metaitem:ingotBlueSteel>,
      O : <metaitem:ingotVanadiumSteel>,
      P : <metaitem:ingotHssg>,
      Q : <metaitem:ingotHsse>,
      R : <metaitem:ingotHsss>,
      S : <metaitem:ingotManyullyn>,
      T : <ore:ingotMicroversium>,
      U : <ore:ingotElectrumFlux>,
      V : <simplyjetpacks:metaitemmods:3>,
      W : <thermalfoundation:material:136>,
      X : <ore:ingotSignalum>,
      Y : <ore:ingotEnderium> });

// Diamond decomp
electrolyzer.recipeBuilder()
	.inputs(<metaitem:dustDiamond>)
	.outputs(<metaitem:dustCarbon> * 16)
	.duration(768)
	.EUt(30)
	.buildAndRegister();

// HV Cutting Saw alternate
recipes.addShaped(<metaitem:cutter.hv>, [
	[<metaitem:cableGtSingleGold>, <ore:circuitHv>, <gregtech:transparent_casing>],
	[<metaitem:conveyor.module.hv>, <metaitem:hull.hv>, <metaitem:toolHeadBuzzSawEndSteel>],
	[<ore:circuitHv>, <metaitem:cableGtSingleGold>, <metaitem:electric.motor.hv>]
]);

// Sterilizing Filter
recipes.removeByRecipeName("gregtech:blacklight");
recipes.addShaped(<metaitem:blacklight>, [
	[<metaitem:screwTungstenCarbide>, <metaitem:plateTungstenCarbide>, <metaitem:screwTungstenCarbide>],
	[null, <metaitem:springHssg>, null],
	[<ore:circuitIv>, <metaitem:plateTungstenCarbide>, <metaitem:cableGtSinglePlatinum>]
]);
recipes.removeByRecipeName("gregtech:filter_casing_sterile");
recipes.addShaped(<gregtech:cleanroom_casing:2>, [
	[<metaitem:pipeLargeFluidPolybenzimidazole>, <metaitem:emitter.luv>, <metaitem:pipeLargeFluidPolybenzimidazole>],
	[<metaitem:item_filter>, <metaitem:blacklight>, <metaitem:item_filter>],
	[<metaitem:electric.motor.luv>, <ore:frameGtBlackSteel>, <metaitem:rotorIridium>]
]);

// Replace recycling recipes
<recipemap:arc_furnace>.findRecipe(30, [<gregtech:cleanroom_casing:2>], [<liquid:oxygen> * 1265]).remove();
<recipemap:macerator>.findRecipe(32, [<gregtech:cleanroom_casing:2>], null).remove();

arc_furnace.recipeBuilder()
	.inputs([<gregtech:cleanroom_casing:2>])
	.fluidInputs([<liquid:oxygen> * 1265])
	.outputs([<metaitem:ingotIridium> * 4, <metaitem:ingotBlackSteel> * 2, <metaitem:dustSmallAsh> * 6])
	.duration(691)
	.EUt(30)
	.buildAndRegister();
	
macerator.recipeBuilder()
	.inputs([<gregtech:cleanroom_casing:2>])
	.outputs([<metaitem:dustPolybenzimidazole> * 12, <metaitem:dustIridium> * 4, <metaitem:dustBlackSteel> * 2])
	.duration(696)
	.EUt(32)
	.buildAndRegister();

// Butadiene
large_chemical_reactor.recipeBuilder()
	.fluidInputs(<liquid:ethanol> * 2000)
	.notConsumable(<ore:dustTantalum>)
	.fluidOutputs(<liquid:butadiene> * 1000)
	.circuit(25)
	.duration(300).EUt(7680).buildAndRegister();

// Nq+ and Nq*
mixer.recipeBuilder().inputs([<metaitem:dustNaquadah> * 2,<enderio:item_material:20> * 4,<contenttweaker:grainsofinnocence>,<enderio:item_material:36>]).fluidInputs([<liquid:pulsating_iron> * 576, <liquid:neptunium> * 144]).outputs(<metaitem:dustNaquadahEnriched>).EUt(8000).duration(400).buildAndRegister();

mixer.recipeBuilder().inputs([<metaitem:dustNaquadah> * 2,<enderio:item_material:34>,<enderio:item_material:35>*4,<enderio:item_material:37>]).fluidInputs([<liquid:enderium> * 576, <liquid:curium> * 144]).outputs(<metaitem:dustNaquadria>).EUt(30000).duration(400).buildAndRegister();

/* UHV Multis, move to zpm (used to be UHV) */
// Rotary Hearth Furnace
recipes.remove(<metaitem:gcym:mega_blast_furnace>);
recipes.addShaped(<metaitem:gcym:mega_blast_furnace>,
	[[<ore:springNaquadahAlloy>, <ore:circuitUv>, <ore:springNaquadahAlloy>],
	[<metaitem:field.generator.luv>, <metaitem:electric_blast_furnace>, <metaitem:field.generator.luv>],
	[<ore:plateDenseNaquadahAlloy>, <ore:wireGtQuadrupleUraniumRhodiumDinaquadide>, <ore:plateDenseNaquadahAlloy>]]);

// Bulk Blast Chiller
recipes.remove(<metaitem:gcym:mega_vacuum_freezer>);
recipes.addShaped(<metaitem:gcym:mega_vacuum_freezer>,
	[[<ore:pipeNormalFluidNaquadah>, <ore:circuitUv>, <ore:pipeNormalFluidNaquadah>],
	[<metaitem:field.generator.luv>, <metaitem:vacuum_freezer>, <metaitem:field.generator.luv>],
	[<ore:plateDenseNaquadahAlloy>, <ore:wireGtQuadrupleUraniumRhodiumDinaquadide>, <ore:plateDenseNaquadahAlloy>]]);

// Recycling recipe replacements
// RHF
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:gcym:mega_blast_furnace>], [<liquid:oxygen> * 20786]).remove();
<recipemap:macerator>.findRecipe(32, [<metaitem:gcym:mega_blast_furnace>], null).remove();
arc_furnace.recipeBuilder()
	.inputs(<metaitem:gcym:mega_blast_furnace>)
	.fluidInputs(<liquid:oxygen> * 20786)
	.outputs(<metaitem:ingotNaquadahAlloy> * 20, <metaitem:ingotInvar> * 4, <metaitem:ingotUraniumRhodiumDinaquadide> * 2, <metaitem:ingotTin>)
	.duration(20786)
	.EUt(30)
	.buildAndRegister();

macerator.recipeBuilder()
	.inputs(<metaitem:gcym:mega_blast_furnace>)
	.outputs(<metaitem:dustStone> * 24, <metaitem:dustNaquadahAlloy> * 20, <metaitem:dustInvar> * 4, <metaitem:dustRubber> * 2)
	.duration(20786)
	.EUt(30)
	.buildAndRegister();

// BBC
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:gcym:mega_vacuum_freezer>], [<liquid:oxygen> * 26976]).remove();
<recipemap:macerator>.findRecipe(32, [<metaitem:gcym:mega_vacuum_freezer>], null).remove();
arc_furnace.recipeBuilder()
	.inputs(<metaitem:gcym:mega_vacuum_freezer>)
	.fluidInputs(<liquid:oxygen> * 26976)
	.outputs(<metaitem:ingotNaquadahAlloy> * 18, <metaitem:ingotStainlessSteel> * 12, <metaitem:ingotElectrum> * 12, <metaitem:blockSteel>)
	.duration(26976)
	.EUt(30)
	.buildAndRegister();

macerator.recipeBuilder()
	.inputs(<metaitem:gcym:mega_vacuum_freezer>)
	.outputs(<metaitem:dustNaquadahAlloy> * 18, <metaitem:dustSmallRubber> * 50, <metaitem:dustSmallSteel> * 49, <metaitem:dustStainlessSteel> * 12)
	.duration(25408)
	.EUt(32)
	.buildAndRegister();
	
// AA Drill Core Coin Tooltip
<actuallyadditions:item_misc:16>.addTooltip(format.red("Also can be purchased for Nomicoins."));

// Removals
// GT
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_extractor_bronze>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_extractor_steel>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_macerator_bronze>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_macerator_steel>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_compressor_bronze>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_compressor_steel>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_hammer_bronze>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_hammer_steel>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_furnace_bronze>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_furnace_steel>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_alloy_smelter_bronze>);
mods.jei.JEI.removeAndHide(<meta_tile_entity:steam_alloy_smelter_steel>);

// Materials
removeMaterialSolid(32032);
removeMaterialSolid(32033);
removeMaterialSolid(32034);
removeMaterialSolid(32035);
//removeMaterialSolid(32036);
removeMaterialSolid(32037);
removeMaterialSolid(32038);
removeMaterialSolid(32039);
removeMaterialSolid(32040);
removeMaterialSolid(32041);
removeMaterialSolid(32042);
removeMaterialSolid(32043);
removeMaterialSolid(32044);
removeMaterialSolid(32045);
removeMaterialSolid(32049);
removeMaterialSolid(32051);
removeMaterialSolid(32052);
removeMaterialSolid(32055);
removeMaterialSolid(32057);
removeMaterialSolid(32058);
removeMaterialSolid(32059);
removeMaterialSolid(32060);
removeMaterialSolid(32061);
removeMaterialSolid(32066);
removeMaterialSolid(32067);
removeMaterialSolid(32068);
removeMaterialSolid(32069);
removeMaterialSolid(32071);
removeMaterialSolid(32072);
removeMaterialSolid(32073);
removeMaterialSolid(32074);
removeMaterialSolid(32075);
removeMaterialSolid(32076);
removeMaterialSolid(32077);
removeMaterialSolid(32078);
removeMaterialSolid(32079);
removeMaterialSolid(32080);
removeMaterialSolid(32081);
removeMaterialSolid(32083);
removeMaterialSolid(32084);
removeMaterialSolid(32085);
removeMaterialSolid(32087);
removeMaterialSolid(32088);
removeMaterialSolid(32093);
removeMaterialSolid(32096);
removeMaterialSolid(32097);
removeMaterialSolid(32098);
removeMaterialSolid(32099);
removeMaterialSolid(32100);
removeMaterialSolid(32109);

removeMaterialFluid(32046, [<liquid:hydrogen_peroxide>]);
removeMaterialFluid(32047, [<liquid:hydrazine>]);
removeMaterialFluid(32048, [<liquid:acetone_azine>]);
removeMaterialFluid(32050, [<liquid:kapton_k>]);
removeMaterialFluid(32053, [<liquid:dimethylformamide>]);
removeMaterialFluid(32054, [<liquid:aminophenol>]);
removeMaterialFluid(32056, [<liquid:antimony_pentafluoride>]);
removeMaterialFluid(32062, [<liquid:neocryolite>]);
removeMaterialFluid(32063, [<liquid:naquadah_oxide_petro_solution>]);
removeMaterialFluid(32064, [<liquid:naquadah_oxide_aero_solution>]);
removeMaterialFluid(32065, [<liquid:hot_naquadah_oxide_neocryolite_solution>]);

// Half Ships
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourandhalfship>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiereightandhalfship>);

// Stabilized Miners
mods.jei.JEI.removeAndHide(<contenttweaker:tiereightship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiereightship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfiveship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfiveship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourandhalfship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourandhalfship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tieroneship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tieroneship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersevenship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersevenship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersixship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersixship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierthreeship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierthreeship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiertwoship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiertwoship_stabilized_matter>);
