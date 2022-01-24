import mods.gregtech.recipe.RecipeMap;

recipes.remove(<draconicevolution:draconic_core>);
recipes.addShaped(<draconicevolution:draconic_core>, [
	[<draconicevolution:draconium_ingot>, <ore:ingotTungstenCarbide>, <draconicevolution:draconium_ingot>],
	[<ore:ingotTungstenCarbide>, <actuallyadditions:block_crystal_empowered:1>, <ore:ingotTungstenCarbide>], 
	[<draconicevolution:draconium_ingot>, <ore:ingotTungstenCarbide>, <draconicevolution:draconium_ingot>]]);

var star = <minecraft:nether_star>;
var dblock = <draconicevolution:draconium_block>;
var dragcore = <draconicevolution:draconic_core>;
var wyvcore = <draconicevolution:wyvern_core>;

//Wyvern Energy Core
recipes.remove(<draconicevolution:wyvern_energy_core>);		
recipes.addShaped(<draconicevolution:wyvern_energy_core>, [
	[dragcore, <actuallyadditions:block_crystal_empowered>, dragcore], 
	[<actuallyadditions:block_crystal_empowered>, <actuallyadditions:item_battery_quintuple>, <actuallyadditions:block_crystal_empowered>], 
	[dragcore, <actuallyadditions:block_crystal_empowered>, dragcore]]);	

//Wyvern Bow	
recipes.remove(<draconicevolution:wyvern_bow>);	
recipes.addShaped(<draconicevolution:wyvern_bow>, [
	[star, wyvcore, star],
	[dragcore, <armorplus:ender_dragon_bow>, dragcore], 
	[star, <draconicevolution:wyvern_energy_core>, star]]);	
	
//Wyvern Axe	
recipes.remove(<draconicevolution:wyvern_axe>);	
recipes.addShaped(<draconicevolution:wyvern_axe>, [
	[star, wyvcore, star],
	[dragcore, <armorplus:ender_dragon_battle_axe>, dragcore], 
	[star, <draconicevolution:wyvern_energy_core>, star]]);	

//Wyvern Pickaxe
recipes.remove(<draconicevolution:wyvern_pick>);	
recipes.addShaped(<draconicevolution:wyvern_pick>, [
	[star, wyvcore, star],
	[dragcore, <redstonearsenal:tool.pickaxe_flux>, dragcore], 
	[star, <draconicevolution:wyvern_energy_core>, star]]);		
	
//Wyvern Shovel	
recipes.remove(<draconicevolution:wyvern_shovel>);	
recipes.addShaped(<draconicevolution:wyvern_shovel>, [
	[star, wyvcore, star],
	[dragcore, <redstonearsenal:tool.shovel_flux>, dragcore], 
	[star, <draconicevolution:wyvern_energy_core>, star]]);		
	
//Wyvern Sword	
recipes.remove(<draconicevolution:wyvern_sword>);	
recipes.addShaped(<draconicevolution:wyvern_sword>, [
	[star, wyvcore, star],
	[dragcore, <armorplus:ender_dragon_sword>, dragcore], 
	[star, <draconicevolution:wyvern_energy_core>, star]]);		

//Fusion Injector
recipes.remove(<draconicevolution:crafting_injector>);	
recipes.addShaped(<draconicevolution:crafting_injector>, [
	[<enderio:item_material:16>, <metaitem:plateEuropium>, <enderio:item_material:16>], 
	[dragcore, <actuallyadditions:block_crystal_empowered:5>, dragcore], 
	[<enderio:item_material:16>, <gregtech:multiblock_casing:3>, <enderio:item_material:16>]]);
	
//Reactor Stabalizer Frame
recipes.remove(<draconicevolution:reactor_part>);	
recipes.addShaped(<draconicevolution:reactor_part>, [
	[<nuclearcraft:part:3>,<nuclearcraft:part:3>,<nuclearcraft:part:3>], 
	[<draconicevolution:awakened_core:*>, <ore:gearAwakenedDraconium>, null], 
	[<nuclearcraft:part:3>,<nuclearcraft:part:3>,<nuclearcraft:part:3>]]);
	

recipes.remove(<draconicevolution:reactor_part:1>);
recipes.addShaped(<draconicevolution:reactor_part:1>, [
	[null, null, null], 
	[<ore:plateAwakenedDraconium>,<ore:plateAwakenedDraconium>,<ore:plateAwakenedDraconium>],
	[<ore:gearDraconium>, <ore:plateDraconium>,<ore:plateDraconium>]]);

recipes.remove(<draconicevolution:reactor_part:2>);
recipes.addShaped(<draconicevolution:reactor_part:2>, [
	[null, null, null], 
	[<ore:plateCrystalMatrix>,<ore:plateCrystalMatrix>,<ore:plateCrystalMatrix>], 
	[<ore:gearDraconium>, <ore:plateDraconium>,<ore:plateDraconium>]]);

recipes.remove(<draconicevolution:reactor_part:3>);
recipes.addShaped(<draconicevolution:reactor_part:3>, [
	[null, <draconicevolution:reactor_part:1>, <draconicevolution:reactor_part:2>], 
	[<ore:gearAwakenedDraconium>, <ore:plateAwakenedDraconium>,<ore:plateAwakenedDraconium>], 
	[null, <draconicevolution:reactor_part:1>, <draconicevolution:reactor_part:2>]]);
	
recipes.remove(<draconicevolution:reactor_part:4>);
recipes.addShaped(<draconicevolution:reactor_part:4>, [
	[<advsolars:sunnarium_plate>, <ore:plateCrystalMatrix>, <advsolars:sunnarium_plate>], 
	[<ore:plateCrystalMatrix>, <draconicevolution:awakened_core:*>, <ore:plateCrystalMatrix>], 
	[<advsolars:sunnarium_plate>, <ore:plateCrystalMatrix>, <advsolars:sunnarium_plate>]]);
	
recipes.remove(<draconicevolution:particle_generator>);
recipes.addShaped(<draconicevolution:particle_generator>, [
	[<actuallyadditions:block_crystal_empowered>, <minecraft:blaze_rod>, <actuallyadditions:block_crystal_empowered>], 
	[<minecraft:blaze_rod>, <draconicevolution:draconic_core:*>, <minecraft:blaze_rod>], 
	[<actuallyadditions:block_crystal_empowered>, <minecraft:blaze_rod>, <actuallyadditions:block_crystal_empowered>]]);

//	//Draconium
//mods.jei.JEI.removeAndHide(<metaitem:blockDraconium>);
//mods.jei.JEI.removeAndHide(<metaitem:ingotDraconium>);
//mods.jei.JEI.removeAndHide(<metaitem:nuggetDraconium>);
//mods.jei.JEI.removeAndHide(<metaitem:dustDraconium>);
////GTCE Nugget Recipe
//solidifier.findRecipe(7, [<metaitem:shape.mold.nugget>], [<liquid:draconium> * 144]).remove();
////GTCE ingot recipe
//solidifier.findRecipe(7, [<metaitem:shape.mold.ingot>], [<liquid:draconium> * 144]).remove();
////GTCE Block recipe
//solidifier.findRecipe(7, [<metaitem:shape.mold.block>], [<liquid:draconium> * 1296]).remove();
//
////Nugget Recipe
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:draconium> * 144)
//	.notConsumable(<metaitem:shape.mold.nugget>)
//	.outputs([<draconicevolution:nugget> * 9])
//	.duration(200).EUt(30).buildAndRegister();
//
////Ingot Recipe
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:draconium> * 144)
//	.notConsumable(<metaitem:shape.mold.ingot>)
//	.outputs([<draconicevolution:draconium_ingot>])
//	.duration(200).EUt(30).buildAndRegister();
//
////Block Recipe
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:draconium> * 1296)
//	.notConsumable(<metaitem:shape.mold.block>)
//	.outputs([<draconicevolution:draconium_block>])
//	.duration(200).EUt(30).buildAndRegister();
//
//recipes.addShapeless(<draconicevolution:draconium_dust>, [<metaitem:dustSmallDraconium>,<metaitem:dustSmallDraconium>,<metaitem:dustSmallDraconium>,<metaitem:dustSmallDraconium>]);
//
//recipes.addShapeless(<draconicevolution:draconium_dust>, [<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>,<metaitem:dustTinyDraconium>]);
//furnace.remove(<metaitem:nuggetDraconium>);
////GTCE Draconium ingot from dust
//furnace.remove(<metaitem:ingotDraconium>);

//GTCE tiny pile -> GTCE dust
//packager.findRecipe(12, [<metaitem:dustTinyDraconium> * 9, <metaitem:circuit.integrated>.withTag({Configuration: 1, not_consumed: 1 as byte})], [null]).remove();

//GTCE small pile -> GTCE dust
//packager.findRecipe(12, [<metaitem:dustSmallDraconium> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 2, not_consumed: 1 as byte})], [null]).remove();

//Draconium nugget -> GTCE ingot
//packager.findRecipe(12, [<draconicevolution:nugget> * 9, <metaitem:circuit.integrated>.withTag({Configuration: 1, not_consumed: 1 as byte})], [null]).remove();

//macerator.findRecipe(2, [<draconicevolution:draconium_ingot>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<draconicevolution:draconium_ingot>)
//	.outputs(<draconicevolution:draconium_dust>)
//	.duration(30).EUt(8).buildAndRegister();

//macerator.findRecipe(2, [<ore:plateDraconium>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<ore:plateDraconium>)
//	.outputs(<draconicevolution:draconium_dust>)
//	.duration(30).EUt(8).buildAndRegister();

//macerator.findRecipe(32, [<ore:gearDraconium>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<ore:gearDraconium>)
//	.outputs(<draconicevolution:draconium_dust> * 4)
//	.duration(120).EUt(8).buildAndRegister();

//macerator.findRecipe(32, [<draconicevolution:draconium_block>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<draconicevolution:draconium_block>)
//	.outputs(<draconicevolution:draconium_dust> * 9)
//	.duration(270).EUt(8).buildAndRegister();

//macerator.findRecipe(8, [<gregtech:cable:4710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:4710>)
//	.outputs(<draconicevolution:draconium_dust> * 8)
//	.duration(240).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:3710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:3710>)
//	.outputs(<draconicevolution:draconium_dust> * 4)
//	.duration(120).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:2710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:2710>)
//	.outputs(<draconicevolution:draconium_dust> * 2)
//	.duration(60).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:1710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:1710>)
//	.outputs(<draconicevolution:draconium_dust>)
//	.duration(30).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:9710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:9710>)
//	.outputs(<draconicevolution:draconium_dust> * 8)
//	.duration(240).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:8710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:8710>)
//	.outputs(<draconicevolution:draconium_dust> * 4)
//	.duration(120).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:7710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:7710>)
//	.outputs(<draconicevolution:draconium_dust> * 2)
//	.duration(60).EUt(8).buildAndRegister();
//
//macerator.findRecipe(8, [<gregtech:cable:6710>], [null]).remove();
//macerator.recipeBuilder()
//	.inputs(<gregtech:cable:6710>)
//	.outputs(<draconicevolution:draconium_dust>)
//	.duration(30).EUt(8).buildAndRegister();

//alloy.findRecipe(32, [<metaitem:shape.mold.block>.withTag({not_consumed: 1 as byte}), <draconicevolution:draconium_ingot> * 9], [null]).remove();

//extruder.findRecipe(64, [<metaitem:shape.extruder.block>.withTag({not_consumed: 1 as byte}), <draconicevolution:draconium_ingot> * 9], [null]).remove();

//Awakened Draconium
//fluidextractor.recipeBuilder()
//	.inputs(<draconicevolution:nugget:1>)
//	.fluidOutputs([<liquid:awakened_draconium> * 16])
//	.duration(200).EUt(30).buildAndRegister();
//
//fluidextractor.recipeBuilder()
//	.inputs(<draconicevolution:draconic_ingot>)
//	.fluidOutputs([<liquid:awakened_draconium> * 144])
//	.duration(200).EUt(30).buildAndRegister();
//
//fluidextractor.recipeBuilder()
//	.inputs(<draconicevolution:draconic_block>)
//	.fluidOutputs([<liquid:awakened_draconium> * 1296])
//	.duration(200).EUt(30).buildAndRegister();

//fluidextractor.recipeBuilder()
//	.inputs(<ore:gearAwakenedDraconium>)
//	.fluidOutputs([<liquid:awakened_draconium> * 576])
//	.duration(200).EUt(30).buildAndRegister();

//fluidextractor.recipeBuilder()
//	.inputs(<ore:plateAwakenedDraconium>)
//	.fluidOutputs([<liquid:awakened_draconium> * 144])
//	.duration(200).EUt(30).buildAndRegister();

//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:awakened_draconium> * 144)
//	.notConsumable(<metaitem:shape.mold.nugget>)
//	.outputs([<draconicevolution:nugget:1> * 9])
//	.duration(200).EUt(30).buildAndRegister();
//
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:awakened_draconium> * 144)
//	.notConsumable(<metaitem:shape.mold.ingot>)
//	.outputs([<draconicevolution:draconic_ingot>])
//	.duration(200).EUt(30).buildAndRegister();
//
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:awakened_draconium> * 1296)
//	.notConsumable(<metaitem:shape.mold.block>)
//	.outputs([<draconicevolution:draconic_block>])
//	.duration(200).EUt(30).buildAndRegister();
//
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:awakened_draconium> * 144)
//	.notConsumable(<metaitem:shape.mold.plate>)
//	.outputs([<ore:plateAwakenedDraconium>.firstItem])
//	.duration(200).EUt(30).buildAndRegister();
//
//solidifier.recipeBuilder()
//	.fluidInputs(<liquid:awakened_draconium> * 576)
//	.notConsumable(<metaitem:shape.mold.gear>)
//	.outputs([<ore:gearAwakenedDraconium>.firstItem])
//	.duration(200).EUt(30).buildAndRegister();
