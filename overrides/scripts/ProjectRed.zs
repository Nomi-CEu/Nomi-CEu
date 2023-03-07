import crafttweaker.item.IItemStack;

val toRemove = [
	<projectred-core:resource_item:104>,		//Electrotine Alloy Ingot
	<projectred-core:resource_item:105>,		//Electrotine
	<projectred-core:resource_item:202>,		//Peridot
	<projectred-core:resource_item:251>,		//Red Iron Compound
	<projectred-core:resource_item:252>,		//Electrotine Iron Compound
	<projectred-core:resource_item:312>,		//Electrotine Silicon Compound
	<projectred-core:resource_item:342>,		//Electro Silicon
	<projectred-core:resource_item:400>,		//Copper Coil
	<projectred-core:resource_item:401>,		//Iron Coil
	<projectred-core:resource_item:402>,		//Gold Coil
	<projectred-core:resource_item:410>,		//Motor
	<projectred-core:resource_item:420>,		//Woven Cloth
	<projectred-core:resource_item:421>,		//Sail
	<projectred-core:resource_item:600>,		//Null-Logic Routing Chip
	<projectred-core:drawplate>,				//Draw Plate
	<projectred-core:multimeter>,				//Multimeter
	<projectred-integration:gate:34>,			//IC Gate
	<projectred-transmission:wire:34>,			//Low Load Power Line
	<projectred-transmission:framed_wire:34>,	//Framed Low Load Power Line
	<projectred-core:resource_item:250>,		//Sandy Coal Compound
	<projectred-core:resource_item:300>,		//Silicon
	<projectred-core:resource_item:310>,		//Red Silicon Compound
	<projectred-core:resource_item:311>		    //Glowing Silicon Compound
] as IItemStack[];

//Removing the preceding items and their recipes
for item in toRemove {
	mods.jei.JEI.removeAndHide(item);
}

// Recipes
<projectred-transmission:wire>.addTooltip(format.yellow("For use with ProjectRed"));
recipes.removeByRecipeName("projectred-transmission:red_alloy_wire");
recipes.addShapeless(<projectred-transmission:wire>, [<ore:wireGtSingleRedAlloy>]);

furnace.remove(<projectred-core:resource_item>);
recipes.addShaped(<projectred-core:resource_item> * 4, [
	[null, <ore:wireFineRedAlloy>],
	[null, <metaitem:board.coated>]
]);
recipes.addShaped(<projectred-core:resource_item> * 8, [
	[null, <ore:wireFineRedAlloy>],
	[null, <metaitem:board.plastic>]
]);
recipes.addShaped(<projectred-core:resource_item> * 16, [
	[null, <ore:wireFineRedAlloy>],
	[null, <metaitem:board.epoxy>]
]);
recipes.addShaped(<projectred-core:resource_item> * 32, [
	[null, <ore:wireFineRedAlloy>],
	[null, <metaitem:board.fiber_reinforced>]
]);

recipes.removeByRecipeName("projectred-core:parts/conductive_plate");
recipes.removeByRecipeName("projectred-core:parts/platformed_plate");
recipes.removeByRecipeName("projectred-core:parts/anode");
recipes.removeByRecipeName("projectred-core:parts/pointer");
recipes.removeByRecipeName("projectred-core:parts/cathode");
recipes.removeByRecipeName("projectred-transmission:wired_plate");
recipes.removeByRecipeName("projectred-transmission:bundled_plate");
recipes.removeByRecipeName("projectred-integration:bus_input_panel");
recipes.remove(<projectred-core:resource_item:310>);
recipes.remove(<projectred-core:resource_item:311>);
furnace.remove(<projectred-core:resource_item:341>);
furnace.remove(<projectred-core:resource_item:320>);

var screwdriver = <ore:toolScrewdriver>;

recipes.addShaped(<projectred-core:resource_item:1>, [
	[null, <ore:plateRedAlloy>, null],
	[null, <projectred-core:resource_item>, null],
	[null, screwdriver, null]
]);
recipes.addShaped(<projectred-core:resource_item:4>, [
	[null, <projectred-core:resource_item>, null],
	[<projectred-core:resource_item:2>, <metaitem:frameWood>, <projectred-core:resource_item:2>],
	[<projectred-core:resource_item>, screwdriver, <projectred-core:resource_item>]
]);
recipes.addShaped(<projectred-core:resource_item:10>, [
	[null, <ore:plateRedstone>, null],
	[null, <projectred-core:resource_item>, null],
	[null, screwdriver, null]
]);
recipes.addShaped(<projectred-core:resource_item:12>, [
	[null, <ore:circuitUlv>, null],
	[null, <projectred-core:resource_item:11>, null],
	[null, screwdriver, null]
]);
recipes.addShaped(<projectred-core:resource_item:11>, [
	[null, <ore:boltRedAlloy>, null],
	[null, <projectred-core:resource_item>, null],
	[null, screwdriver, null]
]);
recipes.addShaped(<projectred-core:resource_item:2>, [
	[null, <ore:wireGtSingleRedAlloy>, null],
	[null, <projectred-core:resource_item>, null],
	[null, screwdriver, null]
]);
recipes.addShaped(<projectred-core:resource_item:3>, [
	[null, <ore:projredBundledCable>, null],
	[null, <projectred-core:resource_item>, null],
	[null, screwdriver, null]
]);
recipes.addShaped(<projectred-integration:gate:30>, [
	[<projectred-core:resource_item:3>, screwdriver, <projectred-core:resource_item:3>],
	[<projectred-core:resource_item:3>, <metaitem:cover.screen>, <projectred-core:resource_item:3>],
	[<projectred-core:resource_item:3>, <ore:circuitLv>, <projectred-core:resource_item:3>],
]);

chemical_bath.recipeBuilder()
	.inputs(<metaitem:plate.integrated_logic_circuit>)
	.fluidInputs(<liquid:redstone> * 1152)
	.outputs(<projectred-core:resource_item:320>)
	.duration(400).EUt(6).buildAndRegister();
chemical_bath.recipeBuilder()
	.inputs(<metaitem:plate.integrated_logic_circuit>)
	.fluidInputs(<liquid:glowstone> * 1152)
	.outputs(<projectred-core:resource_item:341>)
	.duration(400).EUt(6).buildAndRegister();

recipes.addShapeless(<projectred-transmission:wire:16>, [<ore:cableGtSingleRedAlloy>]);

recipes.removeByRecipeName("projectred-transmission:insulated/green_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/cyan_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/yellow_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/blue_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/light_gray_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/orange_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/gray_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/pink_insulated_wire");

recipes.removeByRecipeName("projectred-transmission:insulated/magenta_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/brown_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/light_blue_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/white_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/red_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/black_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/lime_insulated_wire");
recipes.removeByRecipeName("projectred-transmission:insulated/purple_insulated_wire");

