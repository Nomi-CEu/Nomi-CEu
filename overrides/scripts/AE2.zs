import mods.gregtech.recipe.RecipeMap;
import mods.appliedenergistics2.Inscriber;

// standardise fluix dust
<ore:dustFluix>.add(<appliedenergistics2:material:8>);
// Fluix Dust * 1
//<recipemap:macerator>.findRecipe(8, [<appliedenergistics2:material:7>], null).remove();

//macerator.recipeBuilder()
//	.inputs(<appliedenergistics2:material:7>)
//	.outputs(<metaitem:dustFluix>)
//	.duration(80)
//	.EUt(8)
//	.buildAndRegister();

//Silicon
Inscriber.removeRecipe(<appliedenergistics2:material:20>); 
Inscriber.addRecipe(<appliedenergistics2:material:20>, <metaitem:plateSilicon>, true, <appliedenergistics2:material:19>);	
	
//Engineering Processor	
Inscriber.removeRecipe(<appliedenergistics2:material:24>); 	
Inscriber.addRecipe(<appliedenergistics2:material:24>, <ore:circuitLv>, false, <appliedenergistics2:material:17>,<appliedenergistics2:material:20>);	
//Inscriber.addRecipe(<appliedenergistics2:material:24>, <metaitem:circuit.basic_electronic>, false, <appliedenergistics2:material:17>,<appliedenergistics2:material:20>);	
//Inscriber.addRecipe(<appliedenergistics2:material:24>, <contenttweaker:refinedcircuit>, false, <appliedenergistics2:material:17>,<appliedenergistics2:material:20>);	
Inscriber.removeRecipe(<appliedenergistics2:material:17>); 		
Inscriber.addRecipe(<appliedenergistics2:material:17>, <metaitem:plateDiamond>, true, <appliedenergistics2:material:14>);		
	
//Calculation Processor
Inscriber.removeRecipe(<appliedenergistics2:material:23>); 	
Inscriber.addRecipe(<appliedenergistics2:material:23>, <ore:circuitLv>, false, <appliedenergistics2:material:16>,<appliedenergistics2:material:20>);	
//Inscriber.addRecipe(<appliedenergistics2:material:23>, <metaitem:circuit.basic_electronic>, false, <appliedenergistics2:material:16>,<appliedenergistics2:material:20>);	
//Inscriber.addRecipe(<appliedenergistics2:material:23>, <contenttweaker:refinedcircuit>, false, <appliedenergistics2:material:16>,<appliedenergistics2:material:20>);	
Inscriber.removeRecipe(<appliedenergistics2:material:16>); 		
Inscriber.addRecipe(<appliedenergistics2:material:16>, <metaitem:plateCertusQuartz>, true, <appliedenergistics2:material:13>);	
	
//Logic Processor
Inscriber.removeRecipe(<appliedenergistics2:material:22>); 	
Inscriber.addRecipe(<appliedenergistics2:material:22>, <ore:circuitLv>, false, <appliedenergistics2:material:18>,<appliedenergistics2:material:20>);	
//Inscriber.addRecipe(<appliedenergistics2:material:22>, <metaitem:circuit.basic_electronic>, false, <appliedenergistics2:material:18>,<appliedenergistics2:material:20>);	
//Inscriber.addRecipe(<appliedenergistics2:material:22>, <contenttweaker:refinedcircuit>, false, <appliedenergistics2:material:18>,<appliedenergistics2:material:20>);	
Inscriber.removeRecipe(<appliedenergistics2:material:18>); 		
Inscriber.addRecipe(<appliedenergistics2:material:18>, <metaitem:plateGold>, true, <appliedenergistics2:material:15>);		
	
//ME Drive
recipes.remove(<appliedenergistics2:drive>);
recipes.addShaped(<appliedenergistics2:drive>, [
	[<metaitem:plateAluminium>,<metaitem:emitter.mv>,<metaitem:plateAluminium>],
	[<ore:circuitLv>,<appliedenergistics2:chest>,<ore:circuitLv>],
	[<metaitem:plateAluminium>,<metaitem:sensor.mv>,<metaitem:plateAluminium>]]);	
	
//ME Inscriber
recipes.remove(<appliedenergistics2:inscriber>);
recipes.addShaped(<appliedenergistics2:inscriber>, [
	[<metaitem:plateDarkSteel>,<metaitem:electric.piston.mv>,<metaitem:plateDarkSteel>],
	[<appliedenergistics2:material:7>,<meta_tile_entity:hull.mv>,<metaitem:plateDarkSteel>],
	[<metaitem:plateDarkSteel>,<metaitem:electric.piston.mv>,<metaitem:plateDarkSteel>]]);		
	
//Pattern
recipes.remove(<appliedenergistics2:material:52>);
recipes.addShaped(<appliedenergistics2:material:52> * 8, [
	[<metaitem:wireFineSilver>,<metaitem:wireFineSilver>,<metaitem:wireFineSilver>], 
	[<metaitem:platePlastic>,<ore:circuitHv>,<metaitem:platePlastic>],
	[<metaitem:platePlastic>, <metaitem:platePlastic>, <metaitem:platePlastic>]]);	

//Crafting CPU
recipes.remove(<appliedenergistics2:crafting_unit>);
recipes.addShaped(<appliedenergistics2:crafting_unit>, [
	[<metaitem:plateAluminium>, <appliedenergistics2:material:23>, <metaitem:plateAluminium>],
	[<appliedenergistics2:part:16>, <appliedenergistics2:material:22>, <appliedenergistics2:part:16>],
	[<metaitem:plateAluminium>, <appliedenergistics2:material:23>, <metaitem:plateAluminium>]]);
	
//Molecular Assembler
recipes.remove(<appliedenergistics2:molecular_assembler>);
recipes.addShaped(<appliedenergistics2:molecular_assembler>, [
	[<metaitem:plateAluminium>, <appliedenergistics2:quartz_glass>, <metaitem:plateAluminium>], 
	[<appliedenergistics2:material:44>, <metaitem:workbench>, <appliedenergistics2:material:43>], 
	[<metaitem:plateAluminium>, <appliedenergistics2:quartz_glass>, <metaitem:plateAluminium>]]);
	
//Quartz Fiber
recipes.remove(<appliedenergistics2:part:140>);
wiremill.recipeBuilder().inputs([<appliedenergistics2:material:11>]).outputs(<appliedenergistics2:part:140> * 2).duration(100).EUt(16).buildAndRegister();	
	
//Glass Cable
recipes.remove(<appliedenergistics2:part:16>);	
alloy_smelter.recipeBuilder().inputs([<ore:dustFluix>, <appliedenergistics2:part:140>]).outputs(<appliedenergistics2:part:16> * 2).duration(50).EUt(16).buildAndRegister();	

//Covered Cable
assembler.recipeBuilder()
	.inputs([<appliedenergistics2:part:16>])
	.fluidInputs(<liquid:rubber> * 144)
	.outputs(<appliedenergistics2:part:36>)
	.duration(100).EUt(7).buildAndRegister();

assembler.recipeBuilder()
	.inputs([<appliedenergistics2:part:16>])
	.fluidInputs(<liquid:styrene_butadiene_rubber> * 36)
	.outputs(<appliedenergistics2:part:36>)
	.duration(100).EUt(7).buildAndRegister();

assembler.recipeBuilder()
	.inputs([<appliedenergistics2:part:16>])
	.fluidInputs(<liquid:silicone_rubber> * 72)
	.outputs(<appliedenergistics2:part:36>)
	.duration(100).EUt(7).buildAndRegister();
	
//ME Conduit
recipes.remove(<enderio:item_me_conduit>);	
assembler.recipeBuilder().inputs([<appliedenergistics2:part:36> * 3, <enderio:item_material:4> * 6]).outputs(<enderio:item_me_conduit> * 8).duration(100).EUt(16).buildAndRegister();	

// Vibrant Quartz Glass
recipes.remove(<appliedenergistics2:quartz_vibrant_glass>);

alloy.recipeBuilder()
    .inputs([<appliedenergistics2:quartz_glass>,<ore:ingotVibrantAlloy>])
    .outputs([<appliedenergistics2:quartz_vibrant_glass>])
    .duration(80).EUt(16).buildAndRegister();

// Meteorite Compass
recipes.remove(<appliedenergistics2:sky_compass>);
recipes.addShaped(<appliedenergistics2:sky_compass>,[
	[<actuallyadditions:item_crystal:3>,<metaitem:plateDarkSteel>,<actuallyadditions:item_crystal:3>],
	[<metaitem:plateDarkSteel>,<appliedenergistics2:material:1>,<metaitem:plateDarkSteel>],
	[<actuallyadditions:item_crystal:3>,<metaitem:plateDarkSteel>,<actuallyadditions:item_crystal:3>]]);

compressor.recipeBuilder().inputs(<appliedenergistics2:material:7>).outputs(<ore:plateFluix>.firstItem).EUt(12).duration(20).buildAndRegister();	
compressor.recipeBuilder().inputs([<appliedenergistics2:material:12>]).outputs(<ore:plateFluix>.firstItem).EUt(12).duration(20).buildAndRegister();	
	
//Formation Plane	
recipes.remove(<appliedenergistics2:part:320>);	
recipes.addShaped(<appliedenergistics2:part:320>, [[<ore:plateFluix>, <ore:plateFluix>, <ore:plateFluix>], [<metaitem:plateAluminium>, <appliedenergistics2:material:43>, <metaitem:plateAluminium>]]);

//Fluid Formation Plane	
recipes.remove(<appliedenergistics2:part:321>);	
recipes.addShaped(<appliedenergistics2:part:321>, [[<ore:plateFluix>, <ore:plateFluix>, <ore:plateFluix>], [<metaitem:plateLapis>, <appliedenergistics2:material:43>, <metaitem:plateLapis>]]);

//Annialation Plane	
recipes.remove(<appliedenergistics2:part:300>);	
recipes.addShaped(<appliedenergistics2:part:300>, [[<ore:plateFluix>, <ore:plateFluix>, <ore:plateFluix>], [<metaitem:plateAluminium>, <appliedenergistics2:material:44>, <metaitem:plateAluminium>]]);

//Fluid Annialation Plane	
recipes.remove(<appliedenergistics2:part:302>);	
recipes.addShaped(<appliedenergistics2:part:302>, [[<ore:plateFluix>, <ore:plateFluix>, <ore:plateFluix>], [<metaitem:plateLapis>, <appliedenergistics2:material:44>, <metaitem:plateLapis>]]);

//Fluid Terminal
recipes.remove(<appliedenergistics2:part:520>);	
recipes.addShapeless(<appliedenergistics2:part:520>, [<appliedenergistics2:part:380>, <metaitem:plateLapis>, <appliedenergistics2:material:22>]);

//Export Bus
recipes.remove(<appliedenergistics2:part:260>);	
recipes.addShaped(<appliedenergistics2:part:260>, [
	[<metaitem:plateAluminium>, <appliedenergistics2:material:43>, <metaitem:plateAluminium>], 
	[null, <metaitem:electric.piston.mv>, null]]);

//Fluid Export Bus
recipes.remove(<appliedenergistics2:part:261>);	
recipes.addShaped(<appliedenergistics2:part:261>, [
	[<metaitem:plateLapis>, <appliedenergistics2:material:43>, <metaitem:plateLapis>], 
	[null, <metaitem:electric.piston.mv>, null]]);

//Import Bus
recipes.remove(<appliedenergistics2:part:240>);	
recipes.addShaped(<appliedenergistics2:part:240>, [
	[null, <appliedenergistics2:material:44>, null], 
	[<metaitem:plateAluminium>, <metaitem:electric.piston.mv>, <metaitem:plateAluminium>]]);

//Fluid Import Bus
recipes.remove(<appliedenergistics2:part:241>);	
recipes.addShaped(<appliedenergistics2:part:241>, [
	[null, <appliedenergistics2:material:44>, null], 
	[<metaitem:plateLapis>, <metaitem:electric.piston.mv>, <metaitem:plateLapis>]]);

//Storage Bus
recipes.remove(<appliedenergistics2:part:220>);	
recipes.addShapeless(<appliedenergistics2:part:220>, [<metaitem:electric.piston.mv>, <appliedenergistics2:interface>]);
	
//Fluid Storage Bus
recipes.remove(<appliedenergistics2:part:221>);	
recipes.addShapeless(<appliedenergistics2:part:221>, [<metaitem:electric.pump.mv>, <appliedenergistics2:fluid_interface>]);	
	
//P2P Tunnel
recipes.remove(<appliedenergistics2:part:460>);	
recipes.addShaped(<appliedenergistics2:part:460>, [
	[null, <metaitem:plateStainlessSteel>, null], 
	[<metaitem:plateStainlessSteel>, <appliedenergistics2:material:24>, <metaitem:plateStainlessSteel>], 
	[<ore:plateFluix>, <ore:plateFluix>, <ore:plateFluix>]]);

//Card bio	
recipes.remove(<appliedenergistics2:biometric_card>);	
recipes.addShapeless(<appliedenergistics2:biometric_card>, [<appliedenergistics2:material:25>, <metaitem:sensor.hv>]);		

//Memory Card	
recipes.remove(<appliedenergistics2:memory_card>);	
recipes.addShapeless(<appliedenergistics2:memory_card>, [<appliedenergistics2:material:25>, <ore:circuitHv>]);
	
//Basic Card
recipes.remove(<appliedenergistics2:material:25>);	
recipes.addShaped(<appliedenergistics2:material:25>, [
[<metaitem:wireFineCopper>,<metaitem:plateIron>,null],
[<metaitem:wireFineCopper>,<appliedenergistics2:material:23>,<metaitem:plateIron>],
[<metaitem:wireFineCopper>,<metaitem:plateIron>,null]]);

//Advanced Card
recipes.remove(<appliedenergistics2:material:28>);	
recipes.addShaped(<appliedenergistics2:material:28>, [
[<metaitem:wireFineAluminium>,<metaitem:plateElectricalSteel>,null],
[<metaitem:wireFineAluminium>,<appliedenergistics2:material:23>,<metaitem:plateElectricalSteel>],
[<metaitem:wireFineAluminium>,<metaitem:plateElectricalSteel>,null]]);
	
//Matter Condensor
recipes.remove(<appliedenergistics2:condenser>);	
recipes.addShaped(<appliedenergistics2:condenser>, [
	[<metaitem:plateTitanium>,<metaitem:plateTitanium>,<metaitem:plateTitanium>], 
	[<metaitem:plateTitanium>, <metaitem:quantumstar>, <metaitem:plateTitanium>], 
	[<metaitem:plateTitanium>,<metaitem:plateTitanium>,<metaitem:plateTitanium>]]);

//Wireless Part	
recipes.remove(<appliedenergistics2:material:41>);	
recipes.addShaped(<appliedenergistics2:material:41>, [
	[null, <metaitem:emitter.ev>, null], 
	[<metaitem:plateTitanium>, <appliedenergistics2:material:9>, <metaitem:plateTitanium>], 
	[null, <metaitem:plateTitanium>, null]]);

//Level Emitters	
recipes.remove(<appliedenergistics2:part:280>);		
recipes.remove(<appliedenergistics2:part:281>);		
recipes.addShaped(<appliedenergistics2:part:280>, [[<minecraft:redstone_torch>, <metaitem:plateAluminium>], [<appliedenergistics2:material:23>,<metaitem:stickStainlessSteel>]]);
recipes.addShaped(<appliedenergistics2:part:281>, [[<minecraft:redstone_torch>, <metaitem:plateLapis>], [<appliedenergistics2:material:23>,<metaitem:stickStainlessSteel>]]);	
	
Inscriber.removeRecipe(<appliedenergistics2:material:14>); 	
Inscriber.removeRecipe(<appliedenergistics2:material:13>); 	
Inscriber.removeRecipe(<appliedenergistics2:material:19>); 	
Inscriber.removeRecipe(<appliedenergistics2:material:15>); 	

// Presses
laser_engraver.recipeBuilder().inputs([<metaitem:blockVanadiumSteel>]).notConsumable(<ore:craftingLensRed>).outputs([<appliedenergistics2:material:14>]).EUt(120).duration(1600).buildAndRegister();
laser_engraver.recipeBuilder().inputs([<metaitem:blockVanadiumSteel>]).notConsumable(<ore:craftingLensBlue>).outputs([<appliedenergistics2:material:13>]).EUt(120).duration(1600).buildAndRegister();
laser_engraver.recipeBuilder().inputs([<metaitem:blockVanadiumSteel>]).notConsumable(<metaitem:lensDiamond>).outputs([<appliedenergistics2:material:19>]).EUt(120).duration(1600).buildAndRegister();
laser_engraver.recipeBuilder().inputs([<metaitem:blockVanadiumSteel>]).notConsumable(<ore:craftingLensGreen>).outputs([<appliedenergistics2:material:15>]).EUt(120).duration(1600).buildAndRegister();
laser_engraver.recipeBuilder().inputs([<metaitem:blockVanadiumSteel>]).notConsumable(<ore:craftingLensWhite>).outputs([<appliedenergistics2:material:21>]).EUt(120).duration(1600).buildAndRegister();
recipes.addShapeless(<appliedenergistics2:part:120>, [<metaitem:boltSteel>]); 
 
//Interface
recipes.removeByRecipeName("appliedenergistics2:network/blocks/interfaces_interface");
recipes.addShaped(<appliedenergistics2:interface>, [
	[<metaitem:plateAluminium>, <metaitem:robot.arm.mv>, <metaitem:plateAluminium>], 
	[<appliedenergistics2:material:44>, <meta_tile_entity:hull.mv>, <appliedenergistics2:material:43>], 
	[<metaitem:plateAluminium>, <metaitem:plateAluminium>, <metaitem:plateAluminium>]]);
	
//Fluid Interface
recipes.removeByRecipeName("appliedenergistics2:network/blocks/fluid_interfaces_interface");
recipes.addShaped(<appliedenergistics2:fluid_interface>, [
	[<metaitem:plateLapis>, <metaitem:electric.pump.mv>, <metaitem:plateLapis>], 
	[<appliedenergistics2:material:44>, <meta_tile_entity:hull.mv>, <appliedenergistics2:material:43>], 
	[<metaitem:plateLapis>, <metaitem:plateLapis>, <metaitem:plateLapis>]]);
	
//Energy Acceptor
recipes.remove(<appliedenergistics2:energy_acceptor>);
recipes.addShaped(<appliedenergistics2:energy_acceptor>, [
	[<metaitem:plateElectricalSteel>, <ore:plateFluix>, <metaitem:plateElectricalSteel>], 
	[<ore:plateFluix>, <meta_tile_entity:hull.lv>, <ore:plateFluix>], 
	[<metaitem:plateElectricalSteel>, <ore:plateFluix>, <metaitem:plateElectricalSteel>]]);

//Fluix Plate
recipes.remove(<ore:plateFluix>);
//recipes.addShaped(<ore:plateFluix>, [
//	[<ore:toolHammer>], 
//	[<appliedenergistics2:material:7>], 
//	[<appliedenergistics2:material:7>]]);	
//recipes.addShaped(<ore:plateFluix>, [
//	[<ore:toolHammer>], 
//	[<appliedenergistics2:material:12>], 
//	[<appliedenergistics2:material:12>]]);	
	
	
//Storage Housing
recipes.remove(<appliedenergistics2:material:39>);
recipes.addShaped(<appliedenergistics2:material:39>, [
	[<metaitem:wireFineRedAlloy>, <metaitem:plateElectricalSteel>, <metaitem:wireFineRedAlloy>], 
	[<metaitem:plateElectricalSteel>, null, <metaitem:plateElectricalSteel>], 
	[<metaitem:wireFineRedAlloy>, <metaitem:plateElectricalSteel>, <metaitem:wireFineRedAlloy>]]);	
	
	
//Illuminated Panel
recipes.removeByRecipeName("appliedenergistics2:network/parts/panels_semi_dark_monitor");
recipes.addShaped(<appliedenergistics2:part:180>, [
	[<appliedenergistics2:quartz_glass>, <appliedenergistics2:quartz_glass>, <appliedenergistics2:quartz_glass>], 
	[<ore:plateFluix>, <ore:plateFluix>, <ore:plateFluix>]]);

//Charger
recipes.remove(<appliedenergistics2:charger>);
recipes.addShaped(<appliedenergistics2:charger>, [
	[<metaitem:plateDarkSteel>, <metaitem:plateCertusQuartz>, <metaitem:plateDarkSteel>], 
	[<metaitem:plateDarkSteel>, null, null], 
	[<metaitem:plateDarkSteel>, <metaitem:plateCertusQuartz>, <metaitem:plateDarkSteel>]]);

//ME Chest
recipes.remove(<appliedenergistics2:chest>);
recipes.addShaped(<appliedenergistics2:chest>, [
	[<appliedenergistics2:quartz_glass>,<appliedenergistics2:part:180>, <appliedenergistics2:quartz_glass>], 
	[<appliedenergistics2:material:10>, <actuallyadditions:block_giant_chest>, <appliedenergistics2:material:12>], 
	[<ore:blockDarkSteel>, <appliedenergistics2:material:11>, <ore:blockDarkSteel>]]);

//Pattern Terminal
recipes.remove(<appliedenergistics2:part:340>);
recipes.addShapeless(<appliedenergistics2:part:340>, [<appliedenergistics2:material:24>, <appliedenergistics2:part:380>, <appliedenergistics2:material:52>]);
	
//ME Terminal
recipes.remove(<appliedenergistics2:part:380>);
recipes.addShapeless(<appliedenergistics2:part:380>, [<ore:itemIlluminatedPanel>, <ore:circuitLv>]);


//Quantum Ring
recipes.remove(<appliedenergistics2:quantum_ring>);
recipes.addShaped(<appliedenergistics2:quantum_ring>, [
[<metaitem:plateStainlessSteel>, <appliedenergistics2:material:23>, <metaitem:plateStainlessSteel>], 
[<appliedenergistics2:material:24>, <metaitem:quantumstar>, <appliedenergistics2:material:24>], 
[<metaitem:plateStainlessSteel>, <appliedenergistics2:material:23>,<metaitem:plateStainlessSteel>]]);

// Network Tool
recipes.addShapeless(<appliedenergistics2:network_tool>, [<ore:itemIlluminatedPanel>, <actuallyadditions:item_laser_wrench>]);

	
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_1k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_4k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_16k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/storage_cell_64k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_1k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_4k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_16k");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_cell_64k");
	
// 1k Storage
recipes.remove(<appliedenergistics2:material:35>);	
recipes.addShaped(<appliedenergistics2:material:35>, [
	[<minecraft:glass>, <metaitem:plateRedAlloy>, <minecraft:glass>], 
	[<metaitem:plateRedAlloy>, <ore:circuitLv>, <metaitem:plateRedAlloy>], 
	[<minecraft:glass>, <metaitem:plateRedAlloy>, <minecraft:glass>]]);
	
// 4k Storage
recipes.remove(<appliedenergistics2:material:36>);	
recipes.addShaped(<appliedenergistics2:material:36>, [
	[<minecraft:glass>, <appliedenergistics2:material:22>, <minecraft:glass>],
	[<appliedenergistics2:material:35>, <ore:circuitMv>, <appliedenergistics2:material:35>],
	[<minecraft:glass>, <appliedenergistics2:material:35>, <minecraft:glass>]]);
	
// 16k Storage
recipes.remove(<appliedenergistics2:material:37>);
recipes.addShaped(<appliedenergistics2:material:37>, [
	[<minecraft:glass>, <appliedenergistics2:material:24>, <minecraft:glass>],
	[<appliedenergistics2:material:36>, <ore:circuitHv>, <appliedenergistics2:material:36>],
	[<minecraft:glass>, <appliedenergistics2:material:36>, <minecraft:glass>]]);
	
// 64k Storage
recipes.remove(<appliedenergistics2:material:38>);
recipes.addShaped(<appliedenergistics2:material:38>, [
	[<appliedenergistics2:material:22>, <appliedenergistics2:material:24>, <appliedenergistics2:material:22>],
	[<appliedenergistics2:material:37>, <ore:circuitEv>, <appliedenergistics2:material:37>],
	[<appliedenergistics2:material:22>, <appliedenergistics2:material:37>, <appliedenergistics2:material:22>]]);
	
// Remove Wireless Terminal Recipes
recipes.remove(<ae2wtlib:infinity_booster_card>); // Infinity Booster Card
recipes.remove(<wct:wct>); // Crafting Terminal
recipes.remove(<wct:magnet_card>); // Magnet Card

// Add Tooltips
<ae2wtlib:infinity_booster_card>.addTooltip(format.red("This is being removed. A temperary conversion recipe has been added. Check JEI for more details."));
<wct:wct>.addTooltip(format.red("This is being removed. A temperary conversion recipe has been added. Check JEI for more details."));
<wct:magnet_card>.addTooltip(format.red("This is being removed. A temperary conversion recipe has been added. Check JEI for more details."));

// Add Conversion Recipes
recipes.addShapeless(<appliedenergistics2:material:59>, [<ae2wtlib:infinity_booster_card>]);
recipes.addShapeless(<appliedenergistics2:wireless_crafting_terminal>, [<wct:wct>]);
recipes.addShapeless(<appliedenergistics2:material:60>, [<wct:magnet_card>]);

//skystone and skystone dust
alloy_smelter.recipeBuilder()
	.outputs(<appliedenergistics2:sky_stone_block>)
	.inputs(<minecraft:stone>, <minecraft:end_stone>)
	.duration(200).EUt(16).buildAndRegister();

macerator.recipeBuilder()
	.outputs(<appliedenergistics2:material:45>)
	.inputs(<appliedenergistics2:sky_stone_block>)
	.duration(45).EUt(8).buildAndRegister();

// certus block
recipes.removeByRecipeName("appliedenergistics2:decorative/certus_quartz_block");
recipes.addShaped(<appliedenergistics2:quartz_block>, [
	[<metaitem:gemCertusQuartz>, <metaitem:gemCertusQuartz>],
	[<metaitem:gemCertusQuartz>, <metaitem:gemCertusQuartz>]
]);

// Oredict Storage Bus
recipes.removeByRecipeName("appliedenergistics2:network/parts/oredict_storage_bus");
recipes.removeByRecipeName("appliedenergistics2:network/parts/oredict_storage_bus_alt");
recipes.addShapeless("nf_oredict_storage_bus",
	<appliedenergistics2:part:222>,
	[<appliedenergistics2:part:220>, <metaitem:ore_dictionary_filter>]);

// Extended Processing Pattern Terminal
recipes.removeByRecipeName("appliedenergistics2:network/parts/terminal_expanded_processing");
recipes.addShaped("nf_terminal_expanded_processing", <appliedenergistics2:part:341>, [
    [null, <appliedenergistics2:part:340>, null],
    [null, <ore:circuitEv>, null],
    [null, <packagedauto:encoder>, null]
]);

// Configuration Fluid Interface Terminal (From dev)
recipes.removeByRecipeName("appliedenergistics2:network/parts/terminals_fluid_interface_configuration");
recipes.addShapeless("nf_configuration_fluid_interface_terminal", <appliedenergistics2:part:522>, [
    <appliedenergistics2:part:520>,
    <appliedenergistics2:material:24>,
    <appliedenergistics2:fluid_interface>.or(<appliedenergistics2:part:441>)
]);

// GT certus quartz
recipes.removeByRecipeName("appliedenergistics2:misc/deconstruction_certus_quartz_pillar");
recipes.removeByRecipeName("appliedenergistics2:misc/deconstruction_certus_quartz_block");
recipes.removeByRecipeName("appliedenergistics2:misc/deconstruction_certus_chiseled_quartz");

recipes.addShapeless(<metaitem:gemCertusQuartz> * 4, [<appliedenergistics2:quartz_block>]);
recipes.addShapeless(<metaitem:gemCertusQuartz> * 4, [<appliedenergistics2:quartz_pillar>]);
recipes.addShapeless(<metaitem:gemCertusQuartz> * 4, [<appliedenergistics2:chiseled_quartz_block>]);

// Temporary Conversion Recipe
recipes.addShapeless(<metaitem:dustCertusQuartz>, [<appliedenergistics2:material:2>]);

mods.jei.JEI.removeAndHide(<appliedenergistics2:material:0>);

// Tooltips
<appliedenergistics2:material:59>.addTooltip(format.yellow("Used with the Quantum Ring multiblock. Allows wireless access from anywhere. Check the Quest Book for more information."));

<appliedenergistics2:material:10>.addTooltip(format.red("Made in a Crystal Growth Chamber from a Certus Quartz Seed."));
<appliedenergistics2:material:11>.addTooltip(format.red("Made in a Crystal Growth Chamber from a Nether Quartz Seed."));
<appliedenergistics2:material:12>.addTooltip(format.red("Made in a Crystal Growth Chamber from a Fluix Seed."));
<appliedenergistics2:material:1>.addTooltip(format.aqua(format.italic("Obtained by charging with RF power in the AE2 Charger, or the Energetic Infuser.")));

<appliedenergistics2:part:470>.addTooltip(format.green(format.italic("Made by right-clicking ME P2P Tunnel with any GregTech wire or cable.")));
<appliedenergistics2:part:460>.addTooltip(format.green(format.italic("The basis for all other P2P Tunnels.")));