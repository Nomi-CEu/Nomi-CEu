#packmode normal
#priority -1

import mods.gregtech.recipe.helpers;

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

chemical_reactor.recipeBuilder().inputs([<nomilabs:block_dust>]).fluidInputs([<liquid:water> * 1000]).outputs(<minecraft:clay>).EUt(15).duration(20).buildAndRegister();
// Amount stays the same, as you are hydrating the dust, so fact that it is distilled doesn't improve amount of water
// Duration is improved, because its distilled, its easier to react
chemical_reactor.recipeBuilder().inputs([<nomilabs:block_dust>]).fluidInputs([<liquid:distilled_water> * 1000]).outputs(<minecraft:clay>).EUt(15).duration(10).buildAndRegister();


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



recipes.addShapeless(<metaitem:nomilabs:dustConductiveIron>, [<metaitem:dustIron>,<minecraft:redstone>]);

// steam multis (moved to groovy)

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
helpers.clear(<recipemap:primitive_blast_furnace>);

/* Start PBF Recipes */

/* Wrought Iron */
	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:gemCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:gemCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:dustCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotWroughtIron>, <ore:dustCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(400)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotWroughtIron> * 2, <ore:fuelCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(600)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotWroughtIron> * 2, <ore:dustCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(600)
		.EUt(1)
		.buildAndRegister();

/* Iron */
	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:gemCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:gemCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:dustCoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotIron>, <ore:dustCharcoal>])
		.outputs([<metaitem:ingotSteel>, <metaitem:dustTinyDarkAsh>])
		.duration(900)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotIron> * 2, <ore:fuelCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(1500)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:ingotIron> * 2, <ore:dustCoke>])
		.outputs([<metaitem:ingotSteel> * 2, <metaitem:dustTinyAsh>])
		.duration(1500)
		.EUt(1)
		.buildAndRegister();

/* Block Recipes */
	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:blockWroughtIron>, <ore:blockCoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(3600)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:blockWroughtIron>, <ore:blockCharcoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(3600)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:blockWroughtIron> * 2, <ore:blockFuelCoke>])
		.outputs([<metaitem:blockSteel> * 2, <metaitem:dustAsh>])
		.duration(5400)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:blockIron>, <ore:blockCoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(8100)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:blockIron>, <ore:blockCharcoal>])
		.outputs([<metaitem:blockSteel>, <metaitem:dustDarkAsh>])
		.duration(8100)
		.EUt(1)
		.buildAndRegister();

	<recipemap:primitive_blast_furnace>.recipeBuilder()
		.inputs([<ore:blockIron> * 2, <ore:blockFuelCoke>])
		.outputs([<metaitem:blockSteel> * 2, <metaitem:dustAsh>])
		.duration(13500)
		.EUt(1)
		.buildAndRegister();

/* End PBF Recipes */

// Creative Tank Data
extractor.recipeBuilder()
    .inputs(<nomilabs:heartofauniverse>)
    .outputs(<nomilabs:creativeportabletankmold>)
    .duration(1000)
    .EUt(180000)
    .buildAndRegister();


// Impossible Realm Data Recipes
makeShaped("of_impossiblerealmdata_x1", <nomilabs:impossiblerealmdata>,
	["OEO",
	 "EOE",
	 "OEO"],
	{ E : <actuallyadditions:item_solidified_experience>,
	  O : <deepmoblearning:living_matter_overworldian> });

makeShaped("of_impossiblerealmdata_x2", <nomilabs:impossiblerealmdata> * 2,
	["HEH",
	 "EHE",
	 "HEH"],
	{ E : <actuallyadditions:item_solidified_experience>,
	  H : <deepmoblearning:living_matter_hellish> });

makeShaped("of_impossiblerealmdata_x4", <nomilabs:impossiblerealmdata> * 4,
	["XEX",
	 "EXE",
	 "XEX"],
	{ E : <actuallyadditions:item_solidified_experience>,
	  X : <deepmoblearning:living_matter_extraterrestrial> });

extractor.recipeBuilder()
    .inputs(<nomilabs:impossiblerealmdata>)
    .outputs([<nomilabs:quantumflux>])
    .duration(100).EUt(3000)
    .buildAndRegister();

// Dragon Lair Data
makeShapeless3("of_dragonlairdata", <nomilabs:dragonlairdata>,
	["IHH",
	 "HHH",
	 "HHH"],
	{ I : <nomilabs:impossiblerealmdata>,
	  H : <deepmoblearning:living_matter_extraterrestrial> }
);

// Wither Realm Data
makeShapeless3("of_witherrealmdata", <nomilabs:witherrealmdata>,
	["IXX",
	 "XXX",
	 "XXX"],
	{ I : <nomilabs:impossiblerealmdata>,
	  X : <deepmoblearning:living_matter_hellish> }
);

// Quantum Flux Recipes
makeShaped("of_quantumflux_a", <nomilabs:quantumflux>,
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
	[<metaitem:nomilabs:wireGtSingleVibrantAlloy>,<enderio:item_liquid_conduit:1>,<metaitem:nomilabs:wireGtSingleVibrantAlloy>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);


//item conduit - assembler
assembler.recipeBuilder()
    .inputs([<ore:wireGtSinglePulsatingIron> * 3, <ore:itemConduitBinder> * 6])
    .outputs([<enderio:item_item_conduit> * 8])
    .duration(80).EUt(16).buildAndRegister();

//ender fluid conduit - assembler
assembler.recipeBuilder()
    .inputs([<metaitem:nomilabs:wireGtSingleVibrantAlloy> * 2, <enderio:item_liquid_conduit:1>, <ore:itemConduitBinder> * 6])
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
val creativecell = <thermalexpansion:cell>.withTag({Creative: 1 as byte, Level: 4 as byte}, false);
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
      D : creativecell,
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
//recipes.addShaped("creative_tank_provider", <metaitem:nomilabs:creative_tank_provider>, [
//    [<metaitem:emitter.zpm>, <metaitem:field.generator.luv>, <metaitem:emitter.zpm>],
//    [<metaitem:field.generator.zpm>, <gcym:large_multiblock_casing:11>, <metaitem:field.generator.zpm>],
//    [<ore:circuitZpm>, <metaitem:field.generator.uv>, <ore:circuitZpm>]
//]);
//
//// creative tank provider
//// creative tank
//creative_tank_provider.recipeMap
//    .recipeBuilder()
//    .notConsumable(<nomilabs:creativeportabletankmold>)
//    .inputs(<minecraft:bucket>)
//    .outputs(<metaitem:creative_tank>)
//    .duration(500)
//    .EUt(100000)
//    .buildAndRegister();

//Numismatic Dynamo
recipes.remove(<thermalexpansion:dynamo:5>);
recipes.addShaped(<thermalexpansion:dynamo:5>, [
	[null, <nomilabs:excitationcoil>, null],
	[<metaitem:nomilabs:plateVibrantAlloy>, <morefurnaces:furnaceblock:2>, <metaitem:nomilabs:plateVibrantAlloy>],
	[<enderio:item_material:13>, <thermalfoundation:material:514>, <enderio:item_material:13>]]);

// Red Alloy (Moved to Groovy)

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
<recipemap:electric_blast_furnace>.findRecipe(30720, [<metaitem:nomilabs:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:neon> * 25]).remove();
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(30720, [<metaitem:nomilabs:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:nomilabs:dustDraconium>]).fluidInputs([<liquid:nitro_fuel>*2000]).outputs(<metaitem:nomilabs:ingotHotDraconium>).property("temperature", 6800).duration(1800).EUt(30720).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:nitro_fuel>*8000]).outputs([<metaitem:nomilabs:ingotHotDraconium> * 2]).property("temperature", 6800).duration(3600).EUt(30720).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:nomilabs:dustDraconium>]).fluidInputs([<liquid:gasoline>*2000]).outputs(<metaitem:nomilabs:ingotHotDraconium>).property("temperature", 6800).duration(1800).EUt(30720).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:gasoline>*8000]).outputs([<metaitem:nomilabs:ingotHotDraconium> * 2]).property("temperature", 6800).duration(3600).EUt(30720).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:nomilabs:dustDraconium>]).fluidInputs([<liquid:gasoline_premium>*500]).outputs(<metaitem:nomilabs:ingotHotDraconium>).property("temperature", 6800).duration(1206).EUt(30720).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:gasoline_premium>*2000]).outputs([<metaitem:nomilabs:ingotHotDraconium> * 2]).property("temperature", 6800).duration(2412).EUt(30720).buildAndRegister();

//////////////////// Exotic Materials Catalyst ////////////////////////
makeExtremeRecipe7(<nomilabs:exoticmaterialscatalyst>,
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
      S : <metaitem:nomilabs:ingotManyullyn>,
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
	[<metaitem:conveyor.module.hv>, <metaitem:hull.hv>, <metaitem:nomilabs:toolHeadBuzzSawEndSteel>],
	[<ore:circuitHv>, <metaitem:cableGtSingleGold>, <metaitem:electric.motor.hv>]
]);

// Sterilizing Filter (Moved to Groovy)

// Butadiene
large_chemical_reactor.recipeBuilder()
	.fluidInputs(<liquid:ethanol> * 2000)
	.notConsumable(<ore:dustTantalum>)
	.fluidOutputs(<liquid:butadiene> * 1000)
	.circuit(25)
	.duration(300).EUt(7680).buildAndRegister();

// Nq+ and Nq*
mixer.recipeBuilder().inputs([<metaitem:dustNaquadah> * 2,<enderio:item_material:20> * 4,<nomilabs:grainsofinnocence>,<enderio:item_material:36>]).fluidInputs([<liquid:pulsating_iron> * 576, <liquid:neptunium> * 144]).outputs(<metaitem:dustNaquadahEnriched>).EUt(8000).duration(400).buildAndRegister();

mixer.recipeBuilder().inputs([<metaitem:dustNaquadah> * 2,<enderio:item_material:34>,<enderio:item_material:35>*4,<enderio:item_material:37>]).fluidInputs([<liquid:enderium> * 576, <liquid:curium> * 144]).outputs(<metaitem:dustNaquadria>).EUt(30000).duration(400).buildAndRegister();

// Recycling recipe replacements
// RHF & BBC (moved to Groovy)

// I/O Buses (Groovy)

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

// HM Material Removals (Moved to Groovy)

// Half Ships
mods.jei.JEI.removeAndHide(<nomilabs:tierfourandhalfship>);
mods.jei.JEI.removeAndHide(<nomilabs:tiereightandhalfship>);

// Stabilized Miners
mods.jei.JEI.removeAndHide(<nomilabs:tiereightship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tiereightship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tierfiveship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tierfiveship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tierfourandhalfship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tierfourandhalfship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tierfourship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tierfourship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tieroneship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tieroneship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tiersevenship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tiersevenship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tiersixship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tiersixship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tierthreeship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tierthreeship_stabilized_matter>);
mods.jei.JEI.removeAndHide(<nomilabs:tiertwoship_stabilized>);
mods.jei.JEI.removeAndHide(<nomilabs:tiertwoship_stabilized_matter>);
