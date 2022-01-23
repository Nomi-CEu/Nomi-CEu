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

//LV Hull
recipes.remove(<meta_tile_entity:hull.lv>);	
recipes.addShaped(<meta_tile_entity:hull.lv>, [
	[<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>], 
	[<ore:cableGtSingleTin>, <gregtech:machine_casing:1>, <ore:cableGtSingleTin>]]);	
// LV Machine Hull * 1
<recipemap:assembler>.findRecipe(16, [<gregtech:machine_casing:1>, <metaitem:cableGtSingleTin> * 2], [<liquid:plastic> * 288]).remove();

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
	[<metaitem:electric.piston.lv>, <ore:circuitGood>, <ore:wireGtQuadrupleCupronickel>], 
	[<ore:circuitGood>, <meta_tile_entity:hull.ulv>, <ore:circuitGood>], 
	[<metaitem:electric.piston.lv>, <metaitem:electric.pump.lv>, <ore:wireGtQuadrupleCupronickel>]]);

// LV Casing
recipes.removeByRecipeName("gregtech:casing.lv");
recipes.addShaped(<gregtech:machine_casing:1>, [
    [<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>],
    [<ore:plateWroughtIron>, <ore:gtceWrenches>, <ore:plateWroughtIron>],
    [<ore:plateWroughtIron>, <ore:plateWroughtIron>, <ore:plateWroughtIron>]
]);
// LV Machine Casing * 1
<recipemap:assembler>.findRecipe(16, [<metaitem:plateSteel> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 8})], null).remove();
assembler.recipeBuilder().inputs(<ore:plateWroughtIron> * 8).notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8})).outputs([<gregtech:machine_casing>]).duration(30).EUt(16).buildAndRegister();

// ULV Casing
recipes.removeByRecipeName("gregtech:casing_ulv");

recipes.addShaped(<gregtech:machine_casing>, [
    [<metaitem:plateIron>, <metaitem:plateIron>, <metaitem:plateIron>],
    [<metaitem:plateIron>, <ore:gtceWrenches>, <metaitem:plateIron>],
    [<metaitem:plateIron>, <metaitem:plateIron>, <metaitem:plateIron>]
]);
// ULV Machine Casing * 1
<recipemap:assembler>.findRecipe(16, [<metaitem:plateWroughtIron> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 8})], null).remove();

assembler.recipeBuilder().inputs(<ore:plateIron> * 8).notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 8})).outputs([<gregtech:machine_casing>]).duration(30).EUt(16).buildAndRegister();

// pyro
pyrolyse_oven.recipeBuilder()
	.inputs([<ore:logWood> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 10}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<minecraft:coal:1> * 20])
	.fluidOutputs([<liquid:creosote> * 4000])
	.duration(600).EUt(30).buildAndRegister();

//Wood Vinegar and Charcoal
pyrolyse_oven.recipeBuilder()
	.inputs([<ore:logWood> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 11}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<minecraft:coal:1> * 20])
	.fluidOutputs([<liquid:wood_vinegar> * 3000])
	.duration(600).EUt(30).buildAndRegister();

//Wood Gas and Charcoal
pyrolyse_oven.recipeBuilder()
	.inputs([<ore:logWood> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 12}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<minecraft:coal:1> * 20])
	.fluidOutputs([<liquid:wood_gas> * 1500])
	.duration(600).EUt(30).buildAndRegister();

//Wood Tar and Charcoal
pyrolyse_oven.recipeBuilder()
	.inputs([<ore:logWood> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 13}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<minecraft:coal:1> * 20])
	.fluidOutputs([<liquid:wood_tar> * 1500])
	.duration(600).EUt(30).buildAndRegister();

//Charcoal Byproducts and Charcoal
pyrolyse_oven.recipeBuilder()
	.inputs([<ore:logWood> * 16])
	.notConsumable(<metaitem:circuit.integrated>.withTag({Configuration: 14}))
	.fluidInputs([<liquid:steam> * 4000])
	.outputs([<minecraft:coal:1> * 20])
	.fluidOutputs([<liquid:charcoal_byproducts> * 4000])
	.duration(600).EUt(30).buildAndRegister();

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



