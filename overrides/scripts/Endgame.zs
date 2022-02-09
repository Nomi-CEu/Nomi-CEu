import crafttweaker.item.IIngredient;
import mods.gregtech.recipe.RecipeMap;
import scripts.common.makeShaped as makeShaped;

<deepmoblearning:glitch_fragment>.addTooltip(format.aqua(format.italic(
    "Obtained by crushing Glitch Hearts against Obsidian.")));

<appliedenergistics2:material:1>.addTooltip(format.aqua(format.italic(
    "Obtained by charging with RF power in the AE2 Charger.")));

//Gravistar
// Gravi Star * 1
<recipemap:autoclave>.findRecipe(7680, [<metaitem:quantumstar>], [<liquid:neutronium> * 288]).remove();

autoclave.recipeBuilder()
    .inputs(<minecraft:nether_star>)
    .fluidInputs(<liquid:neutronium> * 36)
    .outputs([<metaitem:gravistar>])
    .duration(480).EUt(7680).buildAndRegister();

makeShaped("of_sunnarium_plates", <advsolars:sunnarium_plate> * 4,
    ["RRR",
     "RSR",
     "RRR"],
    { S : <advsolars:sunnarium>, R : <ore:plateHastelloyC276> });

makeShaped("of_enriched_sunnarium", <advsolars:sunnarium_enriched> * 4,
    ["NAN",
     "ASA",
     "NAN"],
    { N : <contenttweaker:stabilizedneptunium>,
      A : <contenttweaker:stabilizedamericium>,
      S : <advsolars:sunnarium> });

makeShaped("of_enriched_sunnarium_plate", <advsolars:sunnarium_enriched_plate>,
    [" E ",
     "EPE",
     " E "],
    { E : <advsolars:sunnarium_enriched>, P : <advsolars:sunnarium_plate> });

//electrolyzer.recipeBuilder()
//    .inputs([<ore:dustSphalerite> * 3])
//    .outputs([<metaitem:dustZinc>,
//              <metaitem:dustSmallZinc> * 2,
//              <metaitem:dustSulfur>,
//              <metaitem:dustSmallGallium>])
//    .duration(200).EUt(30).buildAndRegister();

//Radon
electrolyzer.recipeBuilder()
    .inputs([<contenttweaker:radiumsalt>])
    .outputs([<metaitem:dustRockSalt>])
    .fluidOutputs(<liquid:radon> * 1000)
    .duration(200).EUt(2000).buildAndRegister();

electrolyzer.recipeBuilder()
    .inputs([<minecraft:glass> * 4])
    .outputs([<minecraft:quartz>])
    .duration(100).EUt(20).buildAndRegister();


//autoclave.findRecipe(40, [<metaitem:dustCarbon>], [<liquid:platinum> * 1]).remove();

//Gem Sensor
makeShaped("of_gem_sensor", <contenttweaker:gemsensor>,
    [" O ",
     "PSP",
     " P "],
    { O : <advancedrocketry:satelliteprimaryfunction>,
      S : <metaitem:sensor.iv>,
      P : <ore:plateTungstenCarbide> });

//Composition Sensor
recipes.remove(<advancedrocketry:satelliteprimaryfunction:1>);
makeShaped("of_composition_sensor", <advancedrocketry:satelliteprimaryfunction:1>,
    [" O ",
     "PSP",
     " P "],
    { O : <advancedrocketry:satelliteprimaryfunction>,
      S : <metaitem:sensor.hv>,
      P : <ore:plateStainlessSteel> });

////Wetware Boards
//assembler.findRecipe(480,
//    [<metaitem:board.multilayer.fiber_reinforced>, <ore:circuitGood>.firstItem],
//    [<liquid:polystyrene> * 144]).remove();
//
//reactor.recipeBuilder()
//    .inputs([<metaitem:board.multilayer.fiber_reinforced>, <contenttweaker:draconicstemcells> * 8])
//    .fluidInputs(<liquid:sterilized_growth_medium> * 4000)
//    .outputs([<metaitem:board.wetware>])
//    .fluidOutputs(<liquid:raw_growth_medium> * 3000)
//    .duration(6000).EUt(3000).buildAndRegister();
//
//reactor.recipeBuilder()
//    .inputs([<minecraft:dragon_egg>])
//    .fluidInputs(<liquid:sterilized_growth_medium> * 10000)
//    .outputs([<contenttweaker:draconicstemcells> * 64])
//    .duration(6000).EUt(25000).buildAndRegister();
//
////Growth Medium
//reactor.recipeBuilder()
//    .inputs([<metaitem:dustMeat>])
//    .fluidInputs(<liquid:distilled_water> * 1000)
//    .fluidOutputs([<liquid:raw_growth_medium> * 1000])
//    .duration(200).EUt(200).buildAndRegister();

//Neutronium from Piles
blast_furnace.recipeBuilder()
    .inputs([<avaritia:resource:2> * 9])
    .fluidInputs([<liquid:xenon> * 250])
    .outputs(<metaitem:nuggetNeutronium>)
    .property("temperature", 9600)
    .duration(40).EUt(500000).buildAndRegister();

recipes.addShapeless(<avaritia:resource:2> * 9, [<metaitem:nuggetNeutronium>]);

//Superconductor Wires
//assembler.findRecipe(512,
//    [<gregtech:cable:200> * 3,
//     <ore:plateTungstenSteel>.firstItem * 3,
//     <metaitem:electric.pump.lv>],
//    [<liquid:nitrogen> * 2000]).remove();
//
//assembler.findRecipe(512,
//    [<gregtech:cable:135> * 3,
//     <ore:plateTungstenSteel>.firstItem * 3,
//     <metaitem:electric.pump.lv>],
//    [<liquid:nitrogen> * 2000]).remove();
//
//assembler.findRecipe(512,
//    [<gregtech:cable:195> * 3,
//     <ore:plateTungstenSteel>.firstItem * 3,
//     <metaitem:electric.pump.lv>],
//    [<liquid:nitrogen> * 2000]).remove();
//
//freezer.recipeBuilder()
//    .inputs(<gregtech:cable:710>)
//    .fluidInputs([<liquid:moltennetherstar> * 144])
//    .outputs(<gregtech:cable:354>)
//    .duration(100).EUt(6000).buildAndRegister();

//t6 circuits
//val t6c as IIngredient[] = [
//    <metaitem:component.smd.capacitor> * 2,
//    <metaitem:component.smd.transistor> * 2,
//    <metaitem:wireFineYttriumBariumCuprate> * 2,
//    <metaitem:processor.neuro>,
//    <metaitem:crystal.central_processing_unit>,
//    <metaitem:plate.nano_central_processing_unit>];
//
//assembler.findRecipe(28000, t6c, [<liquid:tin> * 144]).remove();
//assembler.findRecipe(28000, t6c, [<liquid:soldering_alloy> * 72]).remove();

//t7 circuits
//val t7c as IIngredient[] = [
//    <metaitem:wireFineYttriumBariumCuprate> * 6,
//    <metaitem:component.small_coil> * 4,
//    <metaitem:component.smd.capacitor> * 4,
//    <metaitem:plate.random_access_memory> * 4,
//    <metaitem:circuit.wetware_processor> * 2,
//    <metaitem:board.wetware>];
//
//assembler.findRecipe(34400, t7c, [<liquid:tin> * 288]).remove();
//assembler.findRecipe(34400, t7c, [<liquid:soldering_alloy> * 144]).remove();
//
//t8 circuits
//val t8c as IIngredient[] = [
//    <metaitem:wireFineYttriumBariumCuprate> * 6,
//    <metaitem:component.smd.diode> * 4,
//    <metaitem:plate.nor_memory_chip> * 4,
//    <metaitem:plate.random_access_memory> * 4,
//    <metaitem:circuit.wetware_assembly> * 3,
//    <metaitem:board.wetware> * 2];
//
//assembler.findRecipe(34400, t8c, [<liquid:tin> * 288]).remove();
//assembler.findRecipe(34400, t8c, [<liquid:soldering_alloy> * 144]).remove();
//
//recipes.remove(<metaitem:gearEnderium>);
//recipes.remove(<metaitem:gearSignalum>);



//extractor.findRecipe(512, [<minecraft:egg>], [null]).remove();

extractor.recipeBuilder()
    .inputs(<contenttweaker:impossiblerealmdata>)
    .outputs([<contenttweaker:quantumflux>])
    .duration(100).EUt(3000).buildAndRegister();

recipes.remove(<extrautils2:rainbowgenerator>);
makeShaped("of_rainbow_generator", <extrautils2:rainbowgenerator>,
    ["OTO",
     "OHO",
     "OBO"],
    { O : <extrautils2:opinium:8>,
      H : <contenttweaker:heartofauniverse>,
      T : <extrautils2:rainbowgenerator:2>,
      B : <extrautils2:rainbowgenerator:1> });

recipes.remove(<craftelytra:elytra_wing>);
makeShaped("of_elytra_wing", <craftelytra:elytra_wing>,
    [" PP",
     "PE ",
     "PP "],
    { P : <metaitem:platePalladium>,
      E : <metaitem:gemPerfectEmerald> });

recipes.remove(<minecraft:elytra>);
makeShaped("of_elytra", <minecraft:elytra>,
    ["   ", "WGW", "   "],
    { W : <craftelytra:elytra_wing>,
      G : <enderio:item_material:7> });



//fluidextractor.recipeBuilder()
//    .inputs(<contenttweaker:sentientgear>)
//    .fluidOutputs([<liquid:tungsten_carbide> * 40320])
//    .duration(1000).EUt(3000).buildAndRegister();

// Helium Plasma * 125
//<recipemap:fusion_reactor>.findRecipe(4096, null, [<liquid:deuterium> * 125, <liquid:tritium> * 125]).remove();


fusion_reactor.recipeBuilder()
	.fluidInputs([<liquid:berkelium> * 16, <liquid:californium> * 16])
    .fluidOutputs(<liquid:einsteinium> * 16)
    .duration(100)
    .EUt(15360)
    .property("eu_to_start", 400000000)
    .buildAndRegister();

// LuV Machine Casing
recipes.remove(<gregtech:machine_casing:6>);

// LuV Machine Hull
recipes.remove(<meta_tile_entity:hull.luv>);

recipes.addShaped(<meta_tile_entity:hull.luv>, [
	[<metaitem:platePolytetrafluoroethylene>, <ore:plateLumium>, <metaitem:platePolytetrafluoroethylene>],
	[<ore:cableGtSingleVanadiumGallium>, <gregtech:machine_casing:6>, <ore:cableGtSingleVanadiumGallium>]]);

assembler.findRecipe(16,
    [<ore:plateRhodiumPlatedPalladium>.firstItem * 8,
     <metaitem:circuit.integrated>.withTag({Configuration: 8})],
    [null]).remove();

assembler.recipeBuilder()
    .inputs(<ore:plateLumium> * 8)
    .outputs([<gregtech:machine_casing:6>])
    .duration(30).EUt(16).buildAndRegister();

//Rare Earth
// Redstone * 1
<recipemap:centrifuge>.findRecipe(24, [<metaitem:dustImpureRedstone>], null).remove();

centrifuge.recipeBuilder()
    .inputs(<metaitem:dustImpureRedstone>)
    .outputs([<minecraft:redstone>, <metaitem:dustTinyRareEarth>])
    .duration(900).EUt(24).buildAndRegister();


//Bismuth
//centrifuge.findRecipe(24, [<metaitem:dustImpureLead>], [null]).remove();
//centrifuge.recipeBuilder()
//    .inputs(<metaitem:dustImpureLead>)
//    .outputs([<metaitem:dustLead>, <metaitem:dustTinyBismuth> * 3])
//    .duration(900).EUt(24).buildAndRegister();
//
//centrifuge.findRecipe(24, [<metaitem:dustImpureScheelite>], [null]).remove();
//centrifuge.recipeBuilder()
//    .inputs(<metaitem:dustImpureScheelite>)
//    .outputs([<metaitem:dustScheelite>, <metaitem:dustTinyBismuth> * 3])
//    .duration(900).EUt(24).buildAndRegister();


//Nuclear Stuff

centrifuge.findRecipe(320, [<metaitem:dustUranium>], [null]).remove();

//chemical_bath.findRecipe(384, [<minecraft:ender_eye>], [<liquid:plutonium> * 288]).remove();
//chemical_bath.recipeBuilder()
//    .inputs(<minecraft:ender_eye>)
//    .fluidInputs(<liquid:radon> * 500)
//    .outputs([<metaitem:quantumeye>])
//    .duration(480).EUt(384).buildAndRegister();

//chemical_bath.findRecipe(384, [<minecraft:nether_star>], [<liquid:plutonium> * 1152]).remove();
//chemical_bath.recipeBuilder()
//    .inputs(<minecraft:nether_star>)
//    .fluidInputs(<liquid:radon> * 2000)
//    .outputs([<metaitem:quantumstar>])
//    .duration(1920).EUt(384).buildAndRegister();

makeShaped("of_nc_cell_block", <nuclearcraft:cell_block>,
    ["TCT",
     "C C",
     "TCT"],
    { T : <ore:ingotTough>, C : <gregtech:transparent_casing> });


val trimPattern as string[] = ["N N",
                               " C ",
                               "N N"];

recipes.remove(<extendedcrafting:trimmed>);
makeShaped("of_iron_trimmed_black_steel",
    <extendedcrafting:trimmed>, trimPattern,
    { N : <ore:nuggetIron>, C : <metaitem:blockBlackSteel> }); // Black Steel Block

recipes.remove(<extendedcrafting:trimmed:1>);
makeShaped("of_gold_trimmed_black_steel",
    <extendedcrafting:trimmed:1>, trimPattern,
    { N : <ore:nuggetGold>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:2>);
makeShaped("of_diamond_trimmed_black_steel",
    <extendedcrafting:trimmed:2>, trimPattern,
    { N : <ore:nuggetDiamond>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:3>);
makeShaped("of_emerald_trimmed_black_steel",
    <extendedcrafting:trimmed:3>, trimPattern,
    { N : <ore:nuggetEmerald>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:4>);
makeShaped("of_crystaltine_trimmed_black_steel",
    <extendedcrafting:trimmed:4>, trimPattern,
    { N : <extendedcrafting:material:25>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:5>);
makeShaped("of_omnium_trimmed_black_steel",
    <extendedcrafting:trimmed:5>, trimPattern,
    { N : <extendedcrafting:material:33>, C : <metaitem:blockBlackSteel> }); //Black Steel Block


//Remove hardcoded gtce neutronium recipes and replace with oredicted versions

////Cutting Saw recipes
//saw.findRecipe(30, [<avaritia:block_resource>], [<liquid:water> * 1000]).remove();
//saw.recipeBuilder()
//    .inputs(<avaritia:block_resource:0>)
//    .fluidInputs(<liquid:water> * 1000)
//    .outputs([<moreplates:neutronium_plate> * 9])
//    .duration(80000).EUt(30).buildAndRegister();
//
//saw.findRecipe(30, [<avaritia:block_resource>], [<liquid:distilled_water> * 750]).remove();
//saw.recipeBuilder()
//    .inputs(<avaritia:block_resource:0>)
//    .fluidInputs(<liquid:distilled_water> * 750)
//    .outputs([<moreplates:neutronium_plate> * 9])
//    .duration(52000).EUt(30).buildAndRegister();
//
//saw.findRecipe(30, [<avaritia:block_resource>], [<liquid:lubricant> * 250]).remove();
//saw.recipeBuilder()
//    .inputs(<avaritia:block_resource:0>)
//    .fluidInputs(<liquid:lubricant> * 250)
//    .outputs([<moreplates:neutronium_plate> * 9])
//    .duration(20000).EUt(30).buildAndRegister();
//
////Extruder Recipes
//extruder.findRecipe(64,[<avaritia:resource:4>, <metaitem:shape.extruder.plate>], [null]).remove();
//extruder.recipeBuilder()
//    .inputs(<avaritia:resource:4>)
//    .notConsumable(<metaitem:shape.extruder.plate>)
//    .outputs(<moreplates:neutronium_plate>)
//    .duration(5000).EUt(64).buildAndRegister();
//
////Alloy Smelter recipes
//alloy.findRecipe(16, [<avaritia:resource:4> * 2, <metaitem:shape.mold.plate>], [null]).remove();
//alloy.recipeBuilder()
//    .inputs(<ore:ingotNeutronium> * 2)
//    .notConsumable(<metaitem:shape.mold.plate>)
//    .outputs(<moreplates:neutronium_plate>)
//    .duration(10000).EUt(16).buildAndRegister();
//
////Unpackager Recipes
//unpackager.findRecipe(12, [<ore:ingotNeutronium>.firstItem, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [null]).remove();
//unpackager.recipeBuilder()
//    .inputs(<ore:ingotNeutronium>.firstItem)
//    .notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 1}))
//    .outputs(<avaritia:resource:3>)
//    .duration(10).EUt(12).buildAndRegister();

//Add conversion recipe
recipes.addShapeless(<avaritia:resource:3>, [<metaitem:nuggetNeutronium>]);


////Remove Data Orbs
//assembler.findRecipe(1200,
//    [<metaitem:wireFinePlatinum>*32, <metaitem:plate.nand_memory_chip>*64,
//            <metaitem:plate.nor_memory_chip>*32, <metaitem:plate.random_access_memory>*4,
//            <metaitem:board.epoxy>, <metaitem:circuit.nano_processor>],
//    [<liquid:tin>*288]).remove();
//
//assembler.findRecipe(1200,
//    [<metaitem:wireFinePlatinum>*32, <metaitem:plate.nand_memory_chip>*64,
//            <metaitem:plate.nor_memory_chip>*32, <metaitem:plate.random_access_memory>*4,
//            <metaitem:board.epoxy>, <metaitem:circuit.nano_processor>],
//    [<liquid:soldering_alloy>*144]).remove();
//
////Remove Data Sticks
//assembler.findRecipe(90,
//    [<metaitem:plate.nand_memory_chip>*32, <metaitem:wireFineRedAlloy>*8,
//    <metaitem:plate.random_access_memory>*4, <metaitem:platePlastic>*4,
//    <metaitem:board.plastic>, <metaitem:circuit.advanced>],
//    [<liquid:tin>*288]).remove();
//
////Remove Data Sticks
//assembler.findRecipe(90,
//    [<metaitem:plate.nand_memory_chip>*32, <metaitem:wireFineRedAlloy>*8,
//    <metaitem:plate.random_access_memory>*4, <metaitem:platePlastic>*4,
//    <metaitem:board.plastic>, <metaitem:circuit.advanced>],
//    [<liquid:soldering_alloy>*144]).remove();
//
////Remove NAND Gates, only used in data items
//saw.findRecipe(48, [<metaitem:wafer.nand_memory_chip>],[<liquid:water>*90]).remove();
//saw.findRecipe(48, [<metaitem:wafer.nand_memory_chip>],[<liquid:distilled_water>*67]).remove();
//saw.findRecipe(48, [<metaitem:wafer.nand_memory_chip>],[<liquid:lubricant>*22]).remove();
//
//engraver.findRecipe(480, [<metaitem:lensEnderPearl>, <metaitem:wafer.glowstone>], [null]).remove();
//engraver.findRecipe(1920, [<metaitem:lensEnderPearl>, <metaitem:wafer.naquadah>], [null]).remove();
//
////Remove NOR Gates, only used in data items
//saw.findRecipe(48, [<metaitem:wafer.nor_memory_chip>],[<liquid:water>*90]).remove();
//saw.findRecipe(48, [<metaitem:wafer.nor_memory_chip>],[<liquid:distilled_water>*67]).remove();
//saw.findRecipe(48, [<metaitem:wafer.nor_memory_chip>],[<liquid:lubricant>*22]).remove();
//
//engraver.findRecipe(480, [<metaitem:lensEmerald>, <metaitem:wafer.glowstone>], [null]).remove();
//engraver.findRecipe(1920, [<metaitem:lensEmerald>, <metaitem:wafer.naquadah>], [null]).remove();

//fusion_reactor.findRecipe(49152,
//    [null],
//    [<liquid:chrome> * 16, <liquid:lutetium> * 16]).remove();
//
//fusion_reactor.findRecipe(8192,
//    [null],
//    [<liquid:silicon> * 16, <liquid:lanthanum> * 16]).remove();

//Processing Array
recipes.remove(<metaitem:processing_array>);
makeShaped("of_processing_array", <metaitem:processing_array>,
    ["CSC",
     "AHA",
     "CBC"],
     { A : <metaitem:robot.arm.iv>, //Robot Arm (IV)
       H : <meta_tile_entity:hull.iv>, //Machine Hull (IV)
       C : <ore:circuitMaster>, //T6 Circuit
       S : <advsolars:sunnarium>, //Sunnarium
       B : <metaitem:tool.dataorb>}); //dataorb


//Restore Radon Recipe for QBit wafer
//reactor.recipeBuilder()
//  .inputs(<metaitem:dustIndiumGalliumPhosphide>, <metaitem:wafer.nano_central_processing_unit>)
//  .fluidInputs(<liquid:radon> * 50)
//  .outputs(<metaitem:wafer.qbit_central_processing_unit>)
//  .duration(600).EUt(1920).buildAndRegister();

//reactor.findRecipe(1920, [<metaitem:wafer.nano_central_processing_unit>, <gregtech:cable:5354> * 8], [null]).remove();

// Creative Tank Data
extractor.recipeBuilder()
    .inputs(<contenttweaker:heartofauniverse>)
    .outputs(<contenttweaker:creativeportabletankmold>)
    .duration(1000)
    .EUt(180000)
    .buildAndRegister();

// UHV 16x Batbuf
recipes.addShaped(<metaitem:battery_buffer.uhv.16>, [
    [<metaitem:wireGtHexOmnium>, <metaitem:hull.uhv>, <metaitem:wireGtHexOmnium>],
    [<metaitem:wireGtHexOmnium>, <minecraft:chest>, <metaitem:wireGtHexOmnium>]
]);

// Assembly Line
// ZPM Field Generator * 1
<recipemap:assembly_line>.findRecipe(24000, [<metaitem:frameNaquadahAlloy>, <metaitem:plateNaquadahAlloy> * 6, <metaitem:quantumstar>, <metaitem:emitter.zpm> * 2, <metaitem:circuit.quantum_mainframe> * 2, <metaitem:wireFineEuropium> * 64, <metaitem:wireFineEuropium> * 64, <metaitem:cableGtSingleVanadiumGallium> * 4], [<liquid:soldering_alloy> * 1152]).remove();
assembly_line.recipeBuilder()
    .inputs([<metaitem:frameNaquadahAlloy>, <metaitem:plateNaquadahAlloy> * 6, <metaitem:quantumstar>, <metaitem:emitter.zpm> * 2, <metaitem:circuit.quantum_mainframe> * 2, <metaitem:wireFineEuropium> * 64, <metaitem:wireFineEuropium> * 64, <metaitem:cableGtSingleVanadiumGallium> * 4, <metaitem:plateDenseAwakenedDraconium>, <metaitem:plateDenseAwakenedDraconium>])
    .fluidInputs([<liquid:soldering_alloy> * 1152])
    .outputs(<metaitem:field.generator.zpm>)
    .duration(600)
    .EUt(24000)
    .buildAndRegister();