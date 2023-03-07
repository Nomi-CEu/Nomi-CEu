import mods.gregtech.recipe.RecipeMap;

recipes.remove(<draconicevolution:draconic_core>);
recipes.addShaped(<draconicevolution:draconic_core>, [
	[<metaitem:ingotDraconium>, <ore:ingotTungstenCarbide>, <metaitem:ingotDraconium>],
	[<ore:ingotTungstenCarbide>, <actuallyadditions:block_crystal_empowered:1>, <ore:ingotTungstenCarbide>], 
	[<metaitem:ingotDraconium>, <ore:ingotTungstenCarbide>, <metaitem:ingotDraconium>]]);

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

recipes.remove(<draconicevolution:energy_storage_core>);
recipes.addShaped(<draconicevolution:energy_storage_core>, [
	[<ore:ingotDraconium>,<ore:ingotDraconium>,<ore:ingotDraconium>],
	[<draconicevolution:wyvern_energy_core>,<draconicevolution:wyvern_core> ,<draconicevolution:wyvern_energy_core>],
	[<ore:ingotDraconium>,<ore:ingotDraconium>,<ore:ingotDraconium>]
]);

recipes.addShapeless(<metaitem:dustDraconium>, [<draconicevolution:draconium_dust>]);

// Hacky fix for broken DE stuff
//<ore:ingotDraconiumAwakened>.add(<metaitem:ingotAwakenedDraconium>);

<draconicevolution:draconic_ingot>.displayName = "Activated Awakened Draconium Ingot";
<draconicevolution:draconium_block>.displayName = "Activated Draconium Block";
<draconicevolution:draconic_block>.displayName = "Activated Awakened Draconium Block";

recipes.removeByRecipeName("draconicevolution:draconic_ingot_1");
recipes.removeByRecipeName("draconicevolution:draconium_ingot_1");
recipes.removeByRecipeName("draconicevolution:draconium_block");

// Conversion Recipes
recipes.addShapeless(<metaitem:blockDraconium>, [<draconicevolution:draconium_block>]);
recipes.addShapeless(<metaitem:blockAwakenedDraconium>, [<draconicevolution:draconic_block>]);

/*
chemical_bath.recipeBuilder()
	.inputs(<metaitem:blockDraconium>)
	.fluidInputs(<liquid:americium> * 432)
	.outputs(<draconicevolution:draconium_block>)
	.duration(200)
	.EUt(30720)
	.buildAndRegister();

chemical_bath.recipeBuilder()
	.inputs(<metaitem:blockAwakenedDraconium>)
	.fluidInputs(<liquid:einsteinium> * 1296)
	.outputs(<draconicevolution:draconic_block>)
	.duration(200)
	.EUt(122880)
	.buildAndRegister();
*/
