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

//redstone conduit - assembler
assembler.recipeBuilder()
    .inputs([<metaitem:wireGtSingleRedAlloy> * 3, <ore:itemConduitBinder> * 6])
    .outputs([<enderio:item_redstone_conduit> * 8])
    .duration(80).EUt(16).buildAndRegister();

mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:2>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:3>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:5>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:7>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:8>);
mods.jei.JEI.removeAndHide(<enderio:item_endergy_conduit:9>);


val wrench = <ore:toolWrench>;

// Microversium Machine Casing
makeShaped("of_microverse_casing", <contenttweaker:microverse_casing> * 2,
	["PPP",
	 "PWP",
	 "PPP"],
	{ P : <ore:ingotMicroversium>,  //Microversium Ingot
	  W : wrench});

assembler.recipeBuilder()
	.inputs(<ore:ingotMicroversium> * 4)
	.circuit(6)
	.outputs(<contenttweaker:microverse_casing>)
	.duration(50).EUt(16).buildAndRegister();

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

//Wood Pulp
recipes.addShapeless(<metaitem:dustWood> * 4,[<ore:logWood>,<ore:toolMortar>]);	

//Pyrolyse Oven
recipes.removeByRecipeName("gregtech:pyrolyse_oven");	
// Aluminium Ingot * 21
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:pyrolyse_oven>], [<liquid:oxygen> * 2160]).remove();
// Aluminium Dust * 21
<recipemap:macerator>.findRecipe(8, [<metaitem:pyrolyse_oven>], null).remove();

recipes.addShaped(<meta_tile_entity:pyrolyse_oven>, [
	[<metaitem:electric.piston.lv>, <ore:circuitLv>, <ore:wireGtQuadrupleCupronickel>], 
	[<ore:circuitLv>, <meta_tile_entity:hull.ulv>, <ore:circuitLv>], 
	[<metaitem:electric.piston.lv>, <metaitem:electric.pump.lv>, <ore:wireGtQuadrupleCupronickel>]]);

//// LV Casing
//recipes.removeByRecipeName("gregtech:casing.lv");
//recipes.addShaped(<gregtech:machine_casing:1>, [
//    [<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>],
//    [<ore:plateWroughtIron>, <ore:toolWrench>, <ore:plateWroughtIron>],
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
//    [<metaitem:plateIron>, <ore:toolWrench>, <metaitem:plateIron>],
//    [<metaitem:plateIron>, <metaitem:plateIron>, <metaitem:plateIron>]
//]);
//// ULV Machine Casing * 1
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateWroughtIron> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 8})], null).remove();
//
//assembler.recipeBuilder().inputs(<ore:plateIron> * 8).notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8})).outputs([<gregtech:machine_casing>]).duration(30).EUt(16).buildAndRegister();
/*
//ULV Hull
recipes.remove(<meta_tile_entity:hull.ulv>);	
recipes.addShaped(<meta_tile_entity:hull.ulv>, [
	[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], 
	[<ore:cableGtSingleLead>, <gregtech:machine_casing>, <ore:cableGtSingleLead>]]);	
*/

// pyro

//Phenol and Coke
pyrolyse_oven.recipeBuilder()
	.inputs([<minecraft:coal> * 16])
	.circuit(14)
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<metaitem:gemCoke> * 20])
	.fluidOutputs([<liquid:phenol> * 1000])
	.duration(600).EUt(30).buildAndRegister();

//Phenol and Coke dust
pyrolyse_oven.recipeBuilder()
	.inputs([<metaitem:dustCoal> * 16])
	.circuit(11)
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


recipes.removeByRecipeName("gregtech:coated_board");
recipes.removeByRecipeName("gregtech:coated_board_1x");
recipes.addShaped(<metaitem:board.coated> * 3, [
	[<metaitem:rubber_drop>, <metaitem:rubber_drop>, <metaitem:rubber_drop>],
	[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
	[<metaitem:rubber_drop>, <metaitem:rubber_drop>, <metaitem:rubber_drop>]
]);

// workstation use vibrant
// Workstation * 1
<recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <metaitem:component.diode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltBlueAlloy> * 16], [<liquid:soldering_alloy> * 144]).remove();
// Workstation * 1
<recipemap:circuit_assembler>.findRecipe(120, [<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <metaitem:component.diode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltBlueAlloy> * 16], [<liquid:tin> * 288]).remove();
circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <ore:componentDiode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltVibrantAlloy> * 16])
	.fluidInputs([<liquid:tin> * 288])
	.outputs(<metaitem:circuit.workstation>)
	.duration(400)
	.EUt(120)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();
circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.plastic>, <metaitem:circuit.assembly> * 2, <ore:componentDiode> * 4, <metaitem:plate.random_access_memory> * 4, <metaitem:wireFineElectrum> * 16, <metaitem:boltVibrantAlloy> * 16])
	.fluidInputs([<liquid:soldering_alloy> * 144])
	.outputs(<metaitem:circuit.workstation>)
	.duration(400)
	.EUt(120)
	.property("cleanroom", "cleanroom")
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

// Replace Recycling Recipes
// Coil
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:voltage_coil.hv>], [<liquid:oxygen> * 152]).remove();
<recipemap:macerator>.findRecipe(8, [<metaitem:voltage_coil.hv>], null).remove();
arc_furnace.recipeBuilder()
	.inputs(<metaitem:voltage_coil.hv>)
	.fluidInputs(<liquid:oxygen> * 152)
	.outputs(<metaitem:ingotSilver> * 2, <metaitem:nuggetSteel> * 4)
	.duration(152)
	.EUt(30)
	.buildAndRegister();

macerator.recipeBuilder()
	.inputs(<metaitem:voltage_coil.hv>)
	.outputs(<metaitem:dustSilver> * 2, <metaitem:dustSmallSteelMagnetic> * 2)
	.duration(156)
	.EUt(8)
	.buildAndRegister();

// Energy Hatch
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:energy_hatch.input.hv>], [<liquid:oxygen> * 984]).remove();
<recipemap:macerator>.findRecipe(8, [<metaitem:energy_hatch.input.hv>], null).remove();
arc_furnace.recipeBuilder()
	.inputs(<metaitem:energy_hatch.input.hv>)
	.fluidInputs(<liquid:oxygen> * 984)
	.outputs(<metaitem:ingotStainlessSteel> * 8, <metaitem:ingotSilver> * 2, <minecraft:gold_ingot> * 2, <metaitem:nuggetSteel> * 4)
	.duration(984)
	.EUt(30)
	.buildAndRegister();

macerator.recipeBuilder()
	.inputs(<metaitem:energy_hatch.input.hv>)
	.outputs(<metaitem:dustStainlessSteel> * 8, <metaitem:dustRubber> * 4, <metaitem:dustSilver> * 2, <metaitem:dustGold> * 2)
	.duration(980)
	.EUt(8)
	.buildAndRegister();

// Dynamo Hatch
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:energy_hatch.output.hv>], [<liquid:oxygen> * 1180]).remove();
<recipemap:macerator>.findRecipe(8, [<metaitem:energy_hatch.output.hv>], null).remove();
arc_furnace.recipeBuilder()
	.inputs(<metaitem:energy_hatch.output.hv>)
	.fluidInputs(<liquid:oxygen> * 1180)
	.outputs(<metaitem:ingotStainlessSteel> * 8, <minecraft:gold_ingot> * 3, <metaitem:ingotSilver> * 2, <metaitem:nuggetSteel> * 4)
	.duration(1180)
	.EUt(30)
	.buildAndRegister();

macerator.recipeBuilder()
	.inputs(<metaitem:energy_hatch.output.hv>)
	.outputs(<metaitem:dustStainlessSteel> * 8, <metaitem:dustGold> * 3, <metaitem:dustSilver> * 2, <metaitem:dustRubber> * 2)
	.duration(1166)
	.EUt(8)
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
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireFineLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:tin> * 288)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.smd.diode> * 8, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireFineLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:soldering_alloy> * 144)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireFineLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:tin> * 288)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.advanced>, <metaitem:circuit.nano_assembly> * 2, <metaitem:component.advanced_smd.diode> * 2, <metaitem:plate.nor_memory_chip> * 4, <metaitem:wireFineLumium> * 8, <metaitem:wireFineTungstenSteel> * 16])
	.fluidInputs(<liquid:soldering_alloy> * 144)
	.outputs(<metaitem:circuit.nano_computer>)
	.duration(200)
	.EUt(600)
	.property("cleanroom", "cleanroom")
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
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

circuit_assembler.recipeBuilder()
	.inputs([<metaitem:circuit_board.elite>, <metaitem:circuit.crystal_assembly> * 2, <metaitem:plate.random_access_memory> * 4, <metaitem:plate.nor_memory_chip> * 32, <metaitem:plate.nand_memory_chip> * 64, <metaitem:wireFineEnderium> * 32])
	.fluidInputs(<liquid:soldering_alloy> * 144)
	.outputs(<metaitem:circuit.crystal_computer>)
	.duration(400)
	.EUt(9600)
	.property("cleanroom", "cleanroom")
	.buildAndRegister();

// Voltage Control Unit recipes
recipes.remove(<metaitem:gcym:tiered_hatch.ulv>);
recipes.remove(<metaitem:gcym:tiered_hatch.lv>);
recipes.remove(<metaitem:gcym:tiered_hatch.mv>);
recipes.remove(<metaitem:gcym:tiered_hatch.hv>);
recipes.remove(<metaitem:gcym:tiered_hatch.ev>);
recipes.remove(<metaitem:gcym:tiered_hatch.iv>);
recipes.remove(<metaitem:gcym:tiered_hatch.luv>);
recipes.remove(<metaitem:gcym:tiered_hatch.zpm>);
recipes.remove(<metaitem:gcym:tiered_hatch.uv>);
recipes.remove(<metaitem:gcym:tiered_hatch.uhv>);

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
	.property("cleanroom", "sterile_cleanroom")
	.duration(6000)
	.EUt(30720)
	.buildAndRegister();

