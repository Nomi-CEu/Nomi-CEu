import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;

//Ender Star
recipes.remove(<actuallyadditions:item_misc:19>);	
reactor.recipeBuilder().inputs([<minecraft:nether_star>]).fluidInputs([<liquid:ender_distillation> * 8000]).outputs(<actuallyadditions:item_misc:19>).EUt(400).duration(2000).buildAndRegister();

//Distillation Tower
recipes.removeByRecipeName("gregtech:distillation_tower");
recipes.addShaped(<meta_tile_entity:distillation_tower>, [
	[<ore:pipeLargeStainlessSteel>, <metaitem:electric.pump.hv>, <ore:pipeLargeStainlessSteel>], 
	[<ore:circuitAdvanced>, <meta_tile_entity:hull.mv>, <ore:circuitAdvanced>], 
	[<ore:pipeLargeStainlessSteel>, <metaitem:electric.pump.hv>, <ore:pipeLargeStainlessSteel>]]);

//Fermenter
fermenter.recipeBuilder().fluidInputs([<liquid:canolaoil> * 100]).fluidOutputs([<liquid:refinedcanolaoil> * 100]).duration(400).EUt(2).buildAndRegister();

//Canola
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:canolaoil> * 1000,<liquid:methanol> * 6000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
//chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:canolaoil> * 1000,<liquid:bio.ethanol> * 6000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:refinedcanolaoil> * 750,<liquid:methanol> * 4500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
//chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:refinedcanolaoil> * 750,<liquid:bio.ethanol> * 4500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:crystaloil> * 500,<liquid:methanol> * 3000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();
//chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:crystaloil> * 500,<liquid:bio.ethanol> * 3000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:empoweredoil> * 250,<liquid:methanol> * 1500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();
//chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:empoweredoil> * 250,<liquid:bio.ethanol> * 1500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder().inputs(<actuallyadditions:item_misc:23>).fluidInputs([<liquid:canolaoil> * 1000]).fluidOutputs([<liquid:crystaloil> * 1000]).duration(100).EUt(120).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<actuallyadditions:item_misc:24>).fluidInputs([<liquid:canolaoil> * 1000]).fluidOutputs([<liquid:empoweredoil> * 1000]).duration(100).EUt(500).buildAndRegister();

recipes.removeByRecipeName("actuallyadditions:recipes132");
recipes.addShaped(<actuallyadditions:block_canola_press>, [
	[<metaitem:plateSteel>, <actuallyadditions:block_crystal:5>, <metaitem:plateSteel>], 
	[<metaitem:electric.piston.mv>, null, <metaitem:electric.piston.mv>], 
	[<metaitem:plateSteel>, <actuallyadditions:item_misc:8>, <metaitem:plateSteel>]]);
<actuallyadditions:block_canola_press>.addTooltip(format.green("Turns Canola into Canola Oil. Requires RF."));  

//Moon Materials
macerator.recipeBuilder().inputs([<advancedrocketry:moonturf>]).outputs([<contenttweaker:moondust>]).duration(200).EUt(400).buildAndRegister();
macerator.recipeBuilder().inputs([<advancedrocketry:moonturf_dark>]).outputs([<contenttweaker:moondust>]).duration(200).EUt(400).buildAndRegister();

macerator.recipeBuilder().inputs([<thermalfoundation:material:2048>]).outputs([<thermalfoundation:material:2049> * 4]).duration(200).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<thermalfoundation:material:2050>]).outputs([<thermalfoundation:material:2051> * 4]).duration(200).EUt(16).buildAndRegister();
macerator.recipeBuilder().inputs([<thermalfoundation:material:2052>]).outputs([<thermalfoundation:material:2053> * 4]).duration(200).EUt(16).buildAndRegister();

centrifuge.findRecipe(20, [], [<liquid:hydrogen> * 160]).remove();
centrifuge.recipeBuilder().fluidInputs(<liquid:hydrogen> * 500).fluidOutputs([<liquid:deuterium> * 10]).duration(800).EUt(30).buildAndRegister();
centrifuge.recipeBuilder().inputs(<contenttweaker:moondust>).fluidOutputs([<liquid:deuterium> * 100]).duration(200).EUt(20).buildAndRegister();
centrifuge.recipeBuilder().inputs(<metaitem:dustStone> * 3).outputs([<metaitem:dustSiliconDioxide> * 2]).duration(40).EUt(20).buildAndRegister();

//Gear Boxes Via Assembler
assembler.recipeBuilder()
	.inputs([<metaitem:gearSteel> * 2, <metaitem:plateSteel> * 4, <ore:frameGtSteel>])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8}))
	.outputs([<gregtech:turbine_casing:1> * 3])
	.duration(200).EUt(16).buildAndRegister();
assembler.recipeBuilder()
	.inputs([<metaitem:gearTitanium> * 2, <metaitem:plateTitanium> * 4, <ore:frameGtTitanium>])
	.outputs([<gregtech:turbine_casing:2> * 3])
	.duration(400).EUt(16).buildAndRegister();

//Engine Intake
assembler.recipeBuilder().inputs([<metaitem:rotorTitanium> * 4, <ore:pipeNormalFluidTitanium> * 2, <gregtech:metal_casing:6>]).outputs([<gregtech:multiblock_casing>]).duration(400).EUt(16).buildAndRegister();

//Manyullyn
mixer.recipeBuilder()
    .outputs(<metaitem:dustManyullyn> * 4)
    .inputs([<metaitem:dustArdite> * 4, <metaitem:dustCobalt> * 4, <ore:dustMana>])
    .duration(400).EUt(30).buildAndRegister();

//Ardite
mixer.recipeBuilder()
    .outputs(<metaitem:dustArdite> * 4)
    .inputs([<metaitem:dustRedSteel> * 3, <minecraft:blaze_powder>])
    .duration(200).EUt(30).buildAndRegister();

// Draconic Superconductor
vacuum_freezer.recipeBuilder()
	.inputs(<metaitem:wireGtSingleDraconium>)
	.fluidInputs(<liquid:nether_star> * 144)
	.outputs(<metaitem:wireGtSingleDraconicSuperconductor>)
	.duration(100)
	.EUt(6000)
	.buildAndRegister();

// Allow Gas Collector to work in LostCities, void dims
gas_collector.recipeBuilder()
	.fluidOutputs(<liquid:air> * 10000)
	.notConsumable(<gregtech:meta_item_1:461>.withTag({Configuration: 1}))
	.property("dimension", 111)
	.property("dimension", 119)
	.duration(200)
	.EUt(16)
	.buildAndRegister();
