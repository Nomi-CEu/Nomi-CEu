import mods.gregtech.recipe.RecipeMap;

recipes.remove(<draconicevolution:draconic_core>);
recipes.addShaped(<draconicevolution:draconic_core>, [
	[<metaitem:nomilabs:ingotDraconium>, <ore:ingotTungstenCarbide>, <metaitem:nomilabs:ingotDraconium>],
	[<ore:ingotTungstenCarbide>, <actuallyadditions:block_crystal_empowered:1>, <ore:ingotTungstenCarbide>], 
	[<metaitem:nomilabs:ingotDraconium>, <ore:ingotTungstenCarbide>, <metaitem:nomilabs:ingotDraconium>]]);

assembler.recipeBuilder()
	.inputs(<metaitem:nomilabs:ingotDraconium> * 4, <ore:ingotTungstenCarbide> * 4, <actuallyadditions:block_crystal_empowered:1>)
	.outputs(<draconicevolution:draconic_core>)
	.duration(100).EUt(16).buildAndRegister();

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
assembly_line.recipeBuilder()
	.inputs(<gregtech:multiblock_casing:3>, <actuallyadditions:block_crystal_empowered:5>, <metaitem:plateEuropium>, <draconicevolution:draconic_core> * 2, <enderio:item_material:16> * 4)
	.fluidInputs(<liquid:soldering_alloy> * 1152)
	.outputs(<draconicevolution:crafting_injector>)
	.property("research", <actuallyadditions:block_crystal_empowered:5>)
	.duration(600).EUt(30720).buildAndRegister();

// Fusion crafting core
recipes.remove(<draconicevolution:fusion_crafting_core>);
assembly_line.recipeBuilder()
	.inputs(<metaitem:frameHsse>, <ore:plateTungstenCarbide> * 6, <draconicevolution:draconic_core> * 4, <ore:gemNetherStar> * 4, <metaitem:sensor.iv> * 2, <ore:circuitIv> * 2, <ore:blockLapis> * 8)
	.fluidInputs(<liquid:soldering_alloy> * 1152)
	.outputs(<draconicevolution:fusion_crafting_core>)
	.property("research", <draconicevolution:draconic_core>)
	.duration(1200).EUt(30720).buildAndRegister();

//Reactor Stabalizer Frame
recipes.remove(<draconicevolution:reactor_part>);	
// Moved to Groovy

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
// Moved to Groovy
	
recipes.remove(<draconicevolution:reactor_part:4>);
// Moved to Groovy
	
// Particle Generator
recipes.remove(<draconicevolution:particle_generator>);
assembly_line.recipeBuilder()
	.inputs(<metaitem:frameTungstenCarbide>, <ore:plateDraconium> * 6, <draconicevolution:draconic_core>, <ore:rodBlaze> * 10, <metaitem:emitter.ev> * 3, <actuallyadditions:block_crystal_empowered> * 4)
	.fluidInputs(<liquid:soldering_alloy> * 1152)
	.outputs(<draconicevolution:particle_generator>)
	.property("research", <actuallyadditions:block_crystal_empowered>)
	.duration(1200).EUt(30720).buildAndRegister();

recipes.remove(<draconicevolution:energy_storage_core>);

// Infused Lava Crystal Blocks
compressor.recipeBuilder()
	.inputs(<armorplus:lava_crystal:1> * 9)
	.outputs(<armorplus:block_infused_lava_crystal>)
	.duration(300).EUt(2).buildAndRegister();

compressor.recipeBuilder()
	.inputs(<armorplus:block_infused_lava_crystal> * 9)
	.outputs(<armorplus:block_compressed_infused_lava_crystal>)
	.duration(300).EUt(2).buildAndRegister();

assembly_line.recipeBuilder()
	.inputs(<metaitem:frameTungstenCarbide>, <ore:plateDraconium> * 6, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_energy_core> * 4, <metaitem:field.generator.iv> * 2, <metaitem:wireGtSingleVanadiumGallium> * 12)
	.fluidInputs(<liquid:soldering_alloy> * 1152)
	.outputs(<draconicevolution:energy_storage_core>)
	.property("research", <draconicevolution:wyvern_energy_core>)
	.duration(1200).EUt(30720).buildAndRegister();

recipes.removeByRecipeName("draconicevolution:draconic_ingot_1");
recipes.removeByRecipeName("draconicevolution:draconium_ingot_1");
recipes.removeByRecipeName("draconicevolution:draconium_block");

/*
chemical_bath.recipeBuilder()
	.inputs(<metaitem:nomilabs:blockDraconium>)
	.fluidInputs(<liquid:americium> * 432)
	.outputs(<draconicevolution:draconium_block>)
	.duration(200)
	.EUt(30720)
	.buildAndRegister();

chemical_bath.recipeBuilder()
	.inputs(<metaitem:nomilabs:blockAwakenedDraconium>)
	.fluidInputs(<liquid:einsteinium> * 1296)
	.outputs(<draconicevolution:draconic_block>)
	.duration(200)
	.EUt(122880)
	.buildAndRegister();
*/
