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

import scripts.common.makeShaped as makeShaped;
import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeExtremeRecipe7 as makeExtremeRecipe7;
import scripts.common.makeExtremeRecipe9 as makeExtremeRecipe9;
import scripts.common.makeShapeless3 as makeShapeless3;

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

chemical_reactor.recipeBuilder().inputs([<contenttweaker:block_dust>]).fluidInputs([<liquid:water> * 1000]).outputs(<minecraft:clay>).EUt(15).duration(20).buildAndRegister();


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

// Deep Learner

recipes.removeByRecipeName("deepmoblearning:recipe1_deep_learner");
recipes.addShaped(<deepmoblearning:deep_learner>, [[null,null,null],[<metaitem:sensor.lv>,<metaitem:tricorder_scanner>,<metaitem:sensor.lv>],[null,null,null]]);

recipes.remove(<nuclearcraft:water_source>);
makeShaped("of_nc_water_source", <nuclearcraft:water_source>,
    ["AAA",
     "B B",
     "AAA"],
    { A : <ore:plateWroughtIron>,
      B : <minecraft:water_bucket:*> });


//Rubber by hand
recipes.addShaped(<metaitem:plateRubber>,[[<ore:gtceHardHammers>],[<metaitem:rubber_drop>],[<metaitem:rubber_drop>]]);	


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


////////////////////////// Creative Vending Upgrade ///////////////////////
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


// Creative Tank Provider
val creative_tank_provider = Builder.start("mbt:creative_tank_provider")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC", "CCC", "CCC")
            .aisle("CCC", "CFC", "CCC")
            .aisle("CCC", "CSC", "CCC")
            .where('S', controller.self())
            .where('F', <metastate:gregtech:meta_block_frame_24:12>) // Tungstencarbide Frame Box
            .where("C", CTPredicate.states(<metastate:gcym:large_multiblock_casing:11>) | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("creative_tank_provider")
            .minInputs(2)
            .maxInputs(2)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:11>)
    .buildAndRegister();

creative_tank_provider.hasMufflerMechanics = false;
creative_tank_provider.hasMaintenanceMechanics = false;

recipes.addShaped("creative_tank_provider", <metaitem:mbt:creative_tank_provider>, [
    [<metaitem:emitter.zpm>, <metaitem:field.generator.luv>, <metaitem:emitter.zpm>],
    [<metaitem:field.generator.zpm>, <gcym:large_multiblock_casing:11>, <metaitem:field.generator.zpm>],
    [<ore:circuitUltimate>, <metaitem:field.generator.uv>, <ore:circuitUltimate>]
]);

// creative tank provider
// creative tank
creative_tank_provider.recipeMap
    .recipeBuilder()
    .notConsumable(<contenttweaker:creativeportabletankmold>)
    .inputs(<minecraft:bucket>)
    .outputs(<metaitem:creative_tank>)
    .duration(500)
    .EUt(100000)
    .buildAndRegister();

//Numismatic Dynamo
recipes.remove(<thermalexpansion:dynamo:5>);
recipes.addShaped(<thermalexpansion:dynamo:5>, [
	[null, <contenttweaker:excitationcoil>, null],
	[<metaitem:plateVibrantAlloy>, <morefurnaces:furnaceblock:2>, <metaitem:plateVibrantAlloy>],
	[<enderio:item_material:13>, <thermalfoundation:material:514>, <enderio:item_material:13>]]);

// Red Alloy
alloy_blast_smelter.recipeBuilder()
	.inputs(<ore:dustCopper> * 2, <minecraft:redstone> * 3)
	.circuit(2)
	.property("temperature", 1000)
	.fluidOutputs(<liquid:red_alloy> * 288)
	.duration(25).EUt(120).buildAndRegister();


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

// Stabilized Miners

mods.jei.JEI.removeAndHide(<contenttweaker:tiereightship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiereightship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfiveship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfiveship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourandhalfship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourandhalfship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierfourship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiernineship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiernineship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tieroneship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tieroneship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersevenship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersevenship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersixship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiersixship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiertenship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiertenship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierthreeship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tierthreeship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiertwoship_stabilized>);
mods.jei.JEI.removeAndHide(<contenttweaker:tiertwoship_stabilized_matter>);
