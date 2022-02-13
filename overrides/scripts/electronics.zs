import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Color;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.Material;
import scripts.common.makeShaped as makeShaped;

<enderio:item_basic_capacitor>.displayName = "Basic RF Capacitor";
<enderio:item_basic_capacitor:1>.displayName = "Double-Layer RF Capacitor";
<enderio:item_basic_capacitor:2>.displayName = "Octadic RF Capacitor";

//Rubber by hand
recipes.addShaped(<metaitem:plateRubber>,[[<ore:gtceHardHammers>],[<metaitem:rubber_drop>],[<metaitem:rubber_drop>]]);	

//Resonant Clathrate
furnace.remove(<minecraft:ender_pearl>);
furnace.addRecipe(<contenttweaker:pulsatingdust>, <thermalfoundation:material:895>, 0.0);

//EnderIO Conduits
recipes.remove(<enderio:item_power_conduit>);
recipes.remove(<enderio:item_power_conduit:1>);
recipes.remove(<enderio:item_power_conduit:2>);
recipes.remove(<enderio:item_item_conduit>);
recipes.remove(<enderio:item_endergy_conduit:2>);
recipes.remove(<enderio:item_endergy_conduit:5>);
recipes.remove(<enderio:item_redstone_conduit>);
recipes.remove(<enderio:item_liquid_conduit:2>);
recipes.remove(<enderio:item_liquid_conduit:2>);
recipes.remove(<enderio:item_endergy_conduit:8>);
recipes.remove(<enderio:item_endergy_conduit:9>);
recipes.remove(<enderio:item_endergy_conduit:10>);
recipes.remove(<enderio:item_endergy_conduit:11>);
recipes.remove(<enderio:item_endergy_conduit:1>);
recipes.remove(<enderio:item_endergy_conduit:6>);
recipes.remove(<enderio:item_endergy_conduit>);
recipes.remove(<enderio:item_endergy_conduit:4>);

recipes.addShaped(<enderio:item_power_conduit> * 3, [									//Conductive Iron Conduit
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<metaitem:wireGtSingleConductiveIron>,<metaitem:wireGtSingleConductiveIron>,<metaitem:wireGtSingleConductiveIron>],
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_power_conduit>.displayName = "Conductive Iron Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleConductiveIron> * 3, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_power_conduit> * 4]).duration(80).EUt(16).buildAndRegister();

recipes.addShaped(<enderio:item_power_conduit:1> * 3, [									//Energetic Alloy Conduit
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<metaitem:wireGtSingleEnergeticAlloy>,<enderio:item_power_conduit>,<metaitem:wireGtSingleEnergeticAlloy>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_power_conduit:1>.displayName = "Energetic Alloy Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleEnergeticAlloy> * 2, <enderio:item_power_conduit>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_power_conduit:1> * 4]).duration(80).EUt(16).buildAndRegister();

recipes.addShaped(<enderio:item_power_conduit:2> * 3, [									//vibrant alloy conduit
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<metaitem:wireGtSingleVibrantAlloy>,<enderio:item_power_conduit:1>,<metaitem:wireGtSingleVibrantAlloy>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_power_conduit:2>.displayName = "Vibrant Alloy Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleVibrantAlloy> * 2, <enderio:item_power_conduit:1>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_power_conduit:2> * 4]).duration(80).EUt(16).buildAndRegister();	

//recipes.addShaped(<enderio:item_endergy_conduit:1> * 3, [									//End Steel Conduit
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
//	[<metaitem:wireGtSingleEndSteel>,<enderio:item_power_conduit:2>,<metaitem:wireGtSingleEndSteel>], 
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_endergy_conduit:1>.displayName = "End Steel Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleEndSteel> * 2, <enderio:item_power_conduit:2>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_endergy_conduit:1> * 4]).duration(80).EUt(16).buildAndRegister();	

//recipes.addShaped(<enderio:item_endergy_conduit:6> * 3, [
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
//	[<metaitem:wireGtSingleLumium>,<enderio:item_endergy_conduit:1> ,<metaitem:wireGtSingleLumium>], 
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_endergy_conduit:6>.displayName = "Lumium Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleLumium> * 2, <enderio:item_endergy_conduit:1> , <ore:itemConduitBinder> * 6]).outputs([<enderio:item_endergy_conduit:6> * 4]).duration(80).EUt(16).buildAndRegister();

//recipes.addShaped(<enderio:item_endergy_conduit:4> * 3, [
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
//	[<metaitem:wireGtSingleSignalum>,<enderio:item_endergy_conduit:6>,<metaitem:wireGtSingleSignalum>], 
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_endergy_conduit:4>.displayName = "Signalum Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleSignalum> * 2, <enderio:item_endergy_conduit:6>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_endergy_conduit:4> * 4]).duration(80).EUt(16).buildAndRegister();

//recipes.addShaped(<enderio:item_endergy_conduit> * 3, [
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
//	[<metaitem:wireGtSingleEnderium>,<enderio:item_endergy_conduit:4>,<metaitem:wireGtSingleEnderium>], 
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_endergy_conduit>.displayName = "Enderium Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleEnderium>* 2, <enderio:item_endergy_conduit:4>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_endergy_conduit> * 4]).duration(80).EUt(16).buildAndRegister();

//recipes.addShaped(<enderio:item_endergy_conduit:10> * 3, [
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
//	[<metaitem:wireGtSingleDraconium>,<enderio:item_endergy_conduit>,<metaitem:wireGtSingleDraconium>], 
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_endergy_conduit:10>.displayName = "Draconium Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleDraconium>* 2, <enderio:item_endergy_conduit>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_endergy_conduit:10> * 4]).duration(80).EUt(16).buildAndRegister();

//MAX Tier - Superconductor
//recipes.addShaped(<enderio:item_endergy_conduit:11> * 3, [
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
//	[<metaitem:wireGtSingleDraconicSuperconductor>,<enderio:item_endergy_conduit:10>,<metaitem:wireGtSingleDraconicSuperconductor>], 
//	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);
<enderio:item_endergy_conduit:11>.displayName = "Draconic Superconductor Energy Conduit";
assembler.recipeBuilder().inputs([<metaitem:wireGtSingleDraconicSuperconductor>* 2, <enderio:item_endergy_conduit:10>, <ore:itemConduitBinder> * 6]).outputs([<enderio:item_endergy_conduit:11> * 4]).duration(80).EUt(16).buildAndRegister();

//Item conduit - by hand
recipes.addShaped(<enderio:item_item_conduit> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<ore:wireGtSinglePulsatingIron>,<ore:wireGtSinglePulsatingIron>,<ore:wireGtSinglePulsatingIron>],
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);

//redstone conduit - by hand
recipes.addShaped(<enderio:item_redstone_conduit> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<metaitem:wireGtSingleRedAlloy>,<metaitem:wireGtSingleRedAlloy>,<metaitem:wireGtSingleRedAlloy>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);

//me conduit - by hand
recipes.addShaped(<enderio:item_me_conduit> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<appliedenergistics2:part:36>,<appliedenergistics2:part:36>,<appliedenergistics2:part:36>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);

//ender fluid conduit - by hand
recipes.addShaped(<enderio:item_liquid_conduit:2> * 4, [
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>], 
	[<metaitem:wireGtSingleVibrantAlloy>,<enderio:item_liquid_conduit:1>,<metaitem:wireGtSingleVibrantAlloy>], 
	[<ore:itemConduitBinder>, <ore:itemConduitBinder>, <ore:itemConduitBinder>]]);

//redstone conduit - assembler
assembler.recipeBuilder()
    .inputs([<metaitem:wireGtSingleRedAlloy> * 3, <ore:itemConduitBinder> * 6])
    .outputs([<enderio:item_redstone_conduit> * 8])
    .duration(80).EUt(16).buildAndRegister();

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

mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:2>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:3>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:5>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:7>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:8>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:9>);


val wrench = <ore:gtceWrenches>;

// Microversium Machine Casing
makeShaped("of_microverse_casing", <contenttweaker:microverse_casing> * 2,
	["PPP",
	 "PWP",
	 "PPP"],
	{ P : <ore:ingotMicroversium>,  //Microversium Ingot
	  W : wrench});

//// LuV Machine Casing
//makeShaped("of_luv_casing", <gregtech:machine_casing:6>,
//	["PPP",
//	 "PWP",
//	 "PPP"],
//	{ P : <ore:plateLumium>,  //Lumium Plate
//	  W : wrench});

////LV Hull
//recipes.remove(<meta_tile_entity:hull.lv>);	
//recipes.addShaped(<meta_tile_entity:hull.lv>, [
//	[<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>], 
//	[<ore:cableGtSingleTin>, <gregtech:machine_casing:1>, <ore:cableGtSingleTin>]]);	

// remove steel LV Motor recipes
recipes.removeByRecipeName("gregtech:electric_motor_lv_steel");
assembler.findRecipe(30, [<metaitem:cableGtSingleTin> * 2, <metaitem:stickSteel> * 2, <metaitem:stickSteelMagnetic>, <metaitem:wireGtSingleCopper> * 4], [null]).remove();

//LV Motor - with Fine Copper Wires
recipes.addShaped(<metaitem:electric.motor.lv>, [
	[<ore:cableGtSingleTin>, <metaitem:wireFineCopper>, <ore:stickIron>], 
	[<metaitem:wireFineCopper>, <ore:stickIronMagnetic>, <metaitem:wireFineCopper>],
	[<ore:stickIron>, <metaitem:wireFineCopper>, <ore:cableGtSingleTin>]]);

//Wood Pulp
recipes.addShapeless(<metaitem:dustWood> * 4,[<ore:logWood>,<gregtech:meta_tool:12>]);	

//Pyrolyse Oven
recipes.removeByRecipeName("gregtech:pyrolyse_oven");	
recipes.addShaped(<meta_tile_entity:pyrolyse_oven>, [
	[<metaitem:electric.piston.lv>, <ore:circuitBasic>, <ore:wireGtQuadrupleCupronickel>], 
	[<ore:circuitBasic>, <meta_tile_entity:hull.ulv>, <ore:circuitBasic>], 
	[<metaitem:electric.piston.lv>, <metaitem:electric.pump.lv>, <ore:wireGtQuadrupleCupronickel>]]);

//// LV Casing
//recipes.removeByRecipeName("gregtech:casing.lv");
//recipes.addShaped(<gregtech:machine_casing:1>, [
//    [<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>],
//    [<ore:plateWroughtIron>, <ore:gtceWrenches>, <ore:plateWroughtIron>],
//    [<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>]
//]);
//// LV Machine Casing * 1
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateSteel> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 8})], null).remove();
//assembler.recipeBuilder().inputs(<ore:plateWroughtIron> * 8).notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8})).outputs([<gregtech:machine_casing:1>]).duration(30).EUt(16).buildAndRegister();
//
//// ULV Casing
//recipes.removeByRecipeName("gregtech:casing_ulv");
//
//recipes.addShaped(<gregtech:machine_casing>, [
//    [<metaitem:plateIron>, <metaitem:plateIron>, <metaitem:plateIron>],
//    [<metaitem:plateIron>, <ore:gtceWrenches>, <metaitem:plateIron>],
//    [<metaitem:plateIron>, <metaitem:plateIron>, <metaitem:plateIron>]
//]);
//// ULV Machine Casing * 1
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateWroughtIron> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 8})], null).remove();
//
//assembler.recipeBuilder().inputs(<ore:plateIron> * 8).notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8})).outputs([<gregtech:machine_casing>]).duration(30).EUt(16).buildAndRegister();


// pyro

////Wood Vinegar and Charcoal
//pyrolyse_oven.recipeBuilder()
//	.inputs([<ore:logWood> * 16])
//	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 11}))
//	.fluidInputs([<liquid:steam> * 4000])
//	.outputs([<minecraft:coal:1> * 20])
//	.fluidOutputs([<liquid:wood_vinegar> * 3000])
//	.duration(600).EUt(30).buildAndRegister();
//
////Wood Gas and Charcoal
//pyrolyse_oven.recipeBuilder()
//	.inputs([<ore:logWood> * 16])
//	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 12}))
//	.fluidInputs([<liquid:steam> * 4000])
//	.outputs([<minecraft:coal:1> * 20])
//	.fluidOutputs([<liquid:wood_gas> * 1500])
//	.duration(600).EUt(30).buildAndRegister();
//
////Wood Tar and Charcoal
//pyrolyse_oven.recipeBuilder()
//	.inputs([<ore:logWood> * 16])
//	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 13}))
//	.fluidInputs([<liquid:steam> * 4000])
//	.outputs([<minecraft:coal:1> * 20])
//	.fluidOutputs([<liquid:wood_tar> * 1500])
//	.duration(600).EUt(30).buildAndRegister();
//
////Charcoal Byproducts and Charcoal
//pyrolyse_oven.recipeBuilder()
//	.inputs([<ore:logWood> * 16])
//	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 14}))
//	.fluidInputs([<liquid:steam> * 4000])
//	.outputs([<minecraft:coal:1> * 20])
//	.fluidOutputs([<liquid:charcoal_byproducts> * 4000])
//	.duration(600).EUt(30).buildAndRegister();

//Phenol and Coke
pyrolyse_oven.recipeBuilder()
	.inputs([<minecraft:coal> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 14}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<metaitem:gemCoke> * 20])
	.fluidOutputs([<liquid:phenol> * 1000])
	.duration(600).EUt(30).buildAndRegister();

//Phenol and Coke dust
pyrolyse_oven.recipeBuilder()
	.inputs([<metaitem:dustCoal> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 11}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<metaitem:dustCoke> * 20])
	.fluidOutputs([<liquid:phenol> * 1000])
	.duration(600).EUt(30).buildAndRegister();

// force phenol for phenolic circuit board
chemical_reactor.recipeBuilder().inputs(<metaitem:board.coated>).fluidInputs([<liquid:phenol> * 100]).outputs([<metaitem:board.phenolic>]).duration(100).EUt(8).buildAndRegister();
// remove Phenolic Circuit Board * 1
<recipemap:assembler>.findRecipe(7, [<metaitem:dustWood>, <metaitem:shape.mold.plate>], [<liquid:glue> * 50]).remove();

// make t1 circuits craftable w/o steam
//recipes.removeByRecipeName("gregtech:electronic_circuit_lv");
//recipes.addShaped(<metaitem:circuit.electronic>, [
//	[<metaitem:component.resistor>, <ore:plateWroughtIron>, <metaitem:component.resistor>],
//	[<metaitem:circuit.vacuum_tube>, <metaitem:circuit_board.basic>, <metaitem:circuit.vacuum_tube>],
//	[<metaitem:cableGtSingleRedAlloy>, <metaitem:cableGtSingleRedAlloy>, <metaitem:cableGtSingleRedAlloy>]
//]);
//
//recipes.removeByRecipeName("gregtech:vacuum_tube");
//recipes.addShaped(<metaitem:circuit.vacuum_tube>, [
//	[null, null, null],
//	[<ore:stickWroughtIron>, <metaitem:component.glass.tube>, <ore:stickWroughtIron>],
//	[<metaitem:wireGtSingleCopper>, <metaitem:wireGtSingleCopper>, <metaitem:wireGtSingleCopper>]
//]);

recipes.addShaped(<metaitem:component.glass.tube>, [
	[null, null, null],
	[<ore:paneGlass>, <ore:paneGlass>, <ore:paneGlass>],
	[<ore:paneGlass>, <ore:paneGlass>, <ore:paneGlass>]
]);

recipes.removeByRecipeName("gregtech:coated_board");
recipes.removeByRecipeName("gregtech:coated_board_1x");
recipes.addShaped(<metaitem:board.coated> * 3, [
	[<metaitem:rubber_drop>, <metaitem:rubber_drop>, <metaitem:rubber_drop>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
	[<metaitem:rubber_drop>, <metaitem:rubber_drop>, <metaitem:rubber_drop>]
]);

// t1 board easier
recipes.removeByRecipeName("gregtech:basic_circuit_board");
recipes.addShaped("basic_circuit_board", <metaitem:circuit_board.basic>, [[<ore:wireFineCopper>, <ore:wireFineCopper>, <ore:wireFineCopper>], [<ore:wireFineCopper>, <gregtech:meta_item_1:381>, <ore:wireFineCopper>], [<ore:wireFineCopper>, <ore:wireFineCopper>, <ore:wireFineCopper>]]);

// workstation use vibrant
// Workstation * 1
<recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <metaitem:component.diode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltBlueAlloy> * 16], [<liquid:soldering_alloy> * 144]).remove();
// Workstation * 1
<recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <metaitem:component.diode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltBlueAlloy> * 16], [<liquid:tin> * 288]).remove();
circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <metaitem:component.diode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltVibrantAlloy> * 16])
	.fluidInputs([<liquid:tin> * 288])
	.outputs(<metaitem:circuit.workstation>)
	.duration(400)
	.EUt(120)
	.buildAndRegister();
circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <metaitem:component.diode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltVibrantAlloy> * 16])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<metaitem:circuit.workstation>)
	.duration(400)
	.EUt(120)
	.buildAndRegister();

// topaz lens oredict
<ore:craftingLensOrange>.add(<metaitem:lensTopaz>);

// HV coil
// High Voltage Coil * 1
<recipemap:assembler>.findRecipe(480, [<metaitem:stickSteelMagnetic>, <metaitem:wireFineBlackSteel> * 16, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
assembler.recipeBuilder()
	.inputs(<metaitem:stickSteelMagnetic>, <metaitem:wireFineSilver> * 16)
	.circuit(1)
	.outputs(<metaitem:voltage_coil.hv>)
	.duration(200)
	.EUt(480)
	.buildAndRegister();

// high tier circuit progression changes
// nano iv
// Nano Supercomputer * 1
<recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:soldering_alloy> * 144]).remove();
// Nano Supercomputer * 1
<recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:tin> * 288]).remove();
// Nano Supercomputer * 1
<recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:tin> * 288]).remove();
// Nano Supercomputer * 1
<recipemap:circuit_assembler>.findRecipe(600, [<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:plate.random_access_memory> * 16, <metaitem:wireFineElectrum> * 16], [<liquid:soldering_alloy> * 144]).remove();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireGtSingleLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:tin> * 288)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireGtSingleLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:soldering_alloy> * 144)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireGtSingleLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:tin> * 288)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireGtSingleLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:soldering_alloy> * 144)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.buildAndRegister();

// zpm crystal
// crystal growing w Enderium
autoclave.recipeBuilder()
	.inputs(<ore:gemExquisiteOlivine>)
	.fluidInputs(<liquid:enderium> * 144)
	.chancedOutput(<metaitem:crystal.raw>, 900, 1800)
	.duration(12000)
	.EUt(320)
	.buildAndRegister();

autoclave.recipeBuilder()
	.inputs(<ore:gemExquisiteEmerald>)
	.fluidInputs(<liquid:enderium> * 144)
	.chancedOutput(<metaitem:crystal.raw>, 900, 1800)
	.duration(12000)
	.EUt(320)
	.buildAndRegister();

autoclave.recipeBuilder()
	.inputs(<metaitem:crystal.raw_chip>)
	.fluidInputs(<liquid:enderium> * 144)
	.chancedOutput(<metaitem:crystal.raw>, 8000, 250)
	.duration(12000)
	.EUt(320)
	.buildAndRegister();

// Crystal Supercomputer * 1
<recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineNiobiumTitanium> * 32], [<liquid:soldering_alloy> * 144]).remove();
// Crystal Supercomputer * 1
<recipemap:circuit_assembler>.findRecipe(9600, [<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineNiobiumTitanium> * 32], [<liquid:tin> * 288]).remove();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineEnderium> * 32])
	.fluidInputs(<liquid:tin> * 288)
	.outputs(<metaitem:circuit.crystal_computer>)
	.duration(400)
	.EUt(9600)
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineEnderium> * 32])
	.fluidInputs(<liquid:soldering_alloy> * 144)
	.outputs(<metaitem:circuit.crystal_computer>)
	.duration(400)
	.EUt(9600)
	.buildAndRegister();

// wetware
// Stem Cells * 32
<recipemap:chemical_reactor>.findRecipe(30720, [<metaitem:dustOsmiridium>], [<liquid:bacteria> * 500, <liquid:sterilized_growth_medium> * 500]).remove();
// Stem Cells * 32
<recipemap:large_chemical_reactor>.findRecipe(30720, [<metaitem:dustOsmiridium>], [<liquid:bacteria> * 500, <liquid:sterilized_growth_medium> * 500]).remove();

chemical_reactor.recipeBuilder()
	.inputs(<minecraft:dragon_egg>)
	.fluidInputs(<liquid:bacteria> * 500, <liquid:sterilized_growth_medium> * 500)
	.outputs([<metaitem:stem_cells> * 64, <metaitem:stem_cells> * 64])
	.fluidOutputs(<liquid:bacterial_sludge> * 500)
	.duration(6000)
	.EUt(30720)
	.buildAndRegister();

//large_chemical_reactor.recipeBuilder()
//	.inputs(<minecraft:dragon_egg>)
//	.fluidInputs(<liquid:bacteria> * 500, <liquid:sterilized_growth_medium> * 500)
//	.outputs([<metaitem:stem_cells> * 64, <metaitem:stem_cells> * 64])
//	.fluidOutputs(<liquid:bacterial_sludge> * 500)
//	.duration(6000)
//	.EUt(30720)
//	.buildAndRegister();