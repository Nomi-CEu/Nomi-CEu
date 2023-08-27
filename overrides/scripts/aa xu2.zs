import mods.gregtech.recipe.RecipeMap;

print("--- loading aa xu2.zs ---");
	
# *======= Empowerer =======*
	
mods.thermalexpansion.Compactor.removeGearRecipe(<actuallyadditions:item_crystal_empowered> * 4);
mods.thermalexpansion.Compactor.removeGearRecipe(<actuallyadditions:item_crystal_empowered:1> * 4);
mods.thermalexpansion.Compactor.removeGearRecipe(<actuallyadditions:item_crystal_empowered:2> * 4);
mods.thermalexpansion.Compactor.removeGearRecipe(<actuallyadditions:item_crystal_empowered:3> * 4);
mods.thermalexpansion.Compactor.removeGearRecipe(<actuallyadditions:item_crystal_empowered:4> * 4);
mods.thermalexpansion.Compactor.removeGearRecipe(<actuallyadditions:item_crystal_empowered:5> * 4);



//Empowered Restonia
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered>);
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered>);
mods.actuallyadditions.Empowerer.removeRecipe(<moreplates:empowered_restonia_gear>);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered>, <actuallyadditions:block_crystal>, <metaitem:gemAlmandine>, <metaitem:ingotRedAlloy>, <gregtech:meta_item_1:85>.withTag({Fluid: {FluidName: "sulfuric_acid", Amount: 1000}}), <extendedcrafting:material:19>, 1000000, 400);


//Empowered Palis 
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:1>);
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:1>);
mods.actuallyadditions.Empowerer.removeRecipe(<moreplates:empowered_palis_gear>);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:1>, <actuallyadditions:block_crystal:1>, <metaitem:gemSapphire>, <thermalfoundation:material:136>, <metaitem:fluid_cell>.withTag({Fluid: {FluidName: "water", Amount: 1000}}), <extendedcrafting:material:16>, 1000000, 400);


//Empowered Enori
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:5>);
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:5>);
mods.actuallyadditions.Empowerer.removeRecipe(<moreplates:empowered_enori_gear>);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:5>, <actuallyadditions:block_crystal:5>, <metaitem:gemApatite>, <metaitem:ingotEndSteel>, <metaitem:fluid_cell>.withTag({Fluid: {FluidName: "helium", Amount: 1000}}), <extendedcrafting:material:14>, 1000000, 400);


//Empowered Void Crystal
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:3>);
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:3>);
mods.actuallyadditions.Empowerer.removeRecipe(<moreplates:empowered_void_gear>);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:3>, <actuallyadditions:block_crystal:3>, <actuallyadditions:item_misc:5>, <metaitem:ingotDarkSteel>, <metaitem:fluid_cell>.withTag({Fluid: {FluidName: "oil", Amount: 1000}}), <extendedcrafting:material:15>, 1000000, 400);


//Empowered Diamatine
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:2>);
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:2>);
mods.actuallyadditions.Empowerer.removeRecipe(<moreplates:empowered_diamatine_gear>);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:2>, <actuallyadditions:block_crystal:2>, <extendedcrafting:material:40>, <extendedcrafting:material:24>, <metaitem:fluid_cell>.withTag({Fluid: {FluidName: "nitrogen_dioxide", Amount: 1000}}), <extendedcrafting:material:18>, 1000000, 400);



//Empowered Emerald
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:item_crystal_empowered:4>);
mods.actuallyadditions.Empowerer.removeRecipe(<actuallyadditions:block_crystal_empowered:4>);
mods.actuallyadditions.Empowerer.removeRecipe(<moreplates:empowered_emeradic_gear>);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal:4>, <contenttweaker:stabilizeduranium>, <metaitem:ingotVibrantAlloy>, <metaitem:fluid_cell>.withTag({Fluid: {FluidName: "argon", Amount: 1000}}), <extendedcrafting:material:17>, 1000000, 400);

//Black Quartz
electrolyzer.recipeBuilder()
	.inputs([<metaitem:dustQuartzite> * 4])
	.outputs([<actuallyadditions:item_dust:7>])
	.duration(400).EUt(90).buildAndRegister();

autoclave.recipeBuilder()
	.inputs([<actuallyadditions:item_dust:7>])
	.fluidInputs(<liquid:water> * 250)
	.chancedOutput(<actuallyadditions:item_misc:5>, 7000, 1000)
	.duration(1200).EUt(24).buildAndRegister();

autoclave.recipeBuilder()
	.inputs([<actuallyadditions:item_dust:7>])
	.fluidInputs(<liquid:distilled_water> * 50)
	.outputs(<actuallyadditions:item_misc:5>)
	.duration(600).EUt(24).buildAndRegister();		
	
//Long Range Breaker
recipes.remove(<actuallyadditions:block_directional_breaker>);
recipes.addShaped(<actuallyadditions:block_directional_breaker>, [
[<metaitem:plateVibrantAlloy>,<actuallyadditions:block_crystal:2>,<metaitem:plateVibrantAlloy>], 
[<actuallyadditions:block_breaker>,<actuallyadditions:block_breaker>,<actuallyadditions:block_breaker>], 
[<metaitem:plateVibrantAlloy>,<actuallyadditions:block_crystal:4>,<metaitem:plateVibrantAlloy>]]);	
	
//AA Ender Pearl Block
recipes.remove(<actuallyadditions:block_misc:6>);	
recipes.remove(<actuallyadditions:block_phantomface>);	
recipes.addShaped(<actuallyadditions:block_phantomface>, [
[null, <ore:chestWood>, null], 
[<actuallyadditions:item_crystal_empowered:2>, <ore:blockEnderPearl>, <actuallyadditions:item_crystal_empowered:2>], 
[null, <actuallyadditions:item_misc:8>, null]]);
	
//AA Iron Casing
recipes.remove(<actuallyadditions:block_misc:9>);	
recipes.addShaped(<actuallyadditions:block_misc:9>, [
[<metaitem:plateAluminium>,<metaitem:plateAluminium>,<metaitem:plateAluminium>], 
[<metaitem:plateAluminium>,<actuallyadditions:item_misc:5>,<metaitem:plateAluminium>], 
[<metaitem:plateAluminium>,<metaitem:plateAluminium>,<metaitem:plateAluminium>]]);
<actuallyadditions:block_misc:9>.displayName = "Aluminium Casing";	

//AA Atomic Reconstructor	
recipes.remove(<actuallyadditions:block_atomic_reconstructor>);	
recipes.addShaped(<actuallyadditions:block_atomic_reconstructor>, [
[<metaitem:plateLead>,<metaitem:plateLead>,<metaitem:emitter.mv>], 
[<metaitem:plateLead>,<actuallyadditions:block_misc:9>,<metaitem:lensEmerald>], 
[<metaitem:plateLead>,<metaitem:plateLead>,<metaitem:emitter.mv>]]);

//Display Stand
recipes.remove(<actuallyadditions:block_display_stand>);	
recipes.addShaped(<actuallyadditions:block_display_stand>, [
[<metaitem:stickDarkSteel>,<metaitem:plateVibrantAlloy>,<metaitem:stickDarkSteel>], 
[<metaitem:plateVibrantAlloy>,<actuallyadditions:block_misc:9>,<metaitem:plateVibrantAlloy>], 
[<metaitem:stickDarkSteel>,<metaitem:plateVibrantAlloy>,<metaitem:stickDarkSteel>]]);

//Empowerer
recipes.remove(<actuallyadditions:block_empowerer>);	
recipes.addShaped(<actuallyadditions:block_empowerer>, [
[<metaitem:plateTungstenCarbide>,<actuallyadditions:block_crystal:5>,<metaitem:plateTungstenCarbide>], 
[<actuallyadditions:block_crystal:5>,<actuallyadditions:block_display_stand>,<actuallyadditions:block_crystal:5>], 
[<metaitem:plateTungstenCarbide>,<actuallyadditions:block_crystal:5>,<metaitem:plateTungstenCarbide>]]);

//Basic Coil
recipes.remove(<actuallyadditions:item_misc:7>);	
recipes.addShaped(<actuallyadditions:item_misc:7>, [
[null,<ore:wireGtSingleConductiveIron>,<actuallyadditions:item_crystal>], 
[<ore:wireGtSingleConductiveIron>,<actuallyadditions:item_crystal>,<ore:wireGtSingleConductiveIron>], 
[<actuallyadditions:item_crystal>,<ore:wireGtSingleConductiveIron>,null]]);

//Advanced Coil
recipes.remove(<actuallyadditions:item_misc:8>);	
recipes.addShaped(<actuallyadditions:item_misc:8>, [
[<ore:wireGtSingleEnergeticAlloy>,<ore:wireGtSingleEnergeticAlloy>,<ore:wireGtSingleEnergeticAlloy>], 
[<ore:wireGtSingleEnergeticAlloy>,<actuallyadditions:item_misc:7>,<ore:wireGtSingleEnergeticAlloy>], 
[<ore:wireGtSingleEnergeticAlloy>,<ore:wireGtSingleEnergeticAlloy>,<ore:wireGtSingleEnergeticAlloy>]]);

//XU2 Machine Block
recipes.removeByRecipeName("extrautils2:machine_base");
recipes.addShaped(<extrautils2:machine>, [
[<metaitem:plateSteel>,<metaitem:plateSteel>,<metaitem:plateSteel>], 
[<metaitem:plateSteel>,<actuallyadditions:item_misc:5>,<metaitem:plateSteel>], 
[<metaitem:plateSteel>,<metaitem:plateSteel>,<metaitem:plateSteel>]]);		
	
var furnGen = <extrautils2:machine>.withTag({Type: "extrautils2:generator"});
var redPlate = <metaitem:plateRedAlloy>;

// Polished Stone
recipes.remove(<extrautils2:decorativesolid:2>);
autoclave.recipeBuilder()
    .inputs([<minecraft:stone>])
    .fluidInputs([<liquid:water> * 200])
    .outputs([<extrautils2:decorativesolid:2>])
    .duration(100).EUt(7).buildAndRegister();

autoclave.recipeBuilder()
    .inputs([<minecraft:stone>])
    .fluidInputs([<liquid:distilled_water> * 36])
    .outputs([<extrautils2:decorativesolid:2>])
    .duration(100).EUt(7).buildAndRegister();

// remove xu2 shortcut hopper
recipes.removeByRecipeName("extrautils2:shortcut_hopper");

//XU2 Generators
recipes.remove(furnGen);
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_survival"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_redstone"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_pink"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_overclock"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_death"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_ender"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_dragonsbreath"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_ice"}));	
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}));	

recipes.addShaped(furnGen, [
	[<metaitem:plateWroughtIron>,<metaitem:plateWroughtIron>,<metaitem:plateWroughtIron>],
	[<metaitem:plateWroughtIron>,<minecraft:furnace>,<metaitem:plateWroughtIron>],
	[<metaitem:plateRedAlloy>,<metaitem:plateRedAlloy>,<metaitem:plateRedAlloy>]]);

recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_survival"}), [
	[<ore:compressed4xCobblestone>, <ore:compressed4xCobblestone>, <ore:compressed4xCobblestone>], 
	[<ore:compressed4xCobblestone>, <extrautils2:machine>, <ore:compressed4xCobblestone>], 
	[redPlate, furnGen, redPlate]]);

recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"}), [
	[<metaitem:dustAgar>, <minecraft:potato>, <metaitem:dustAgar>], 
	[<minecraft:potato>, <extrautils2:machine>, <minecraft:potato>], 
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}), [
	[<ore:dustPyrotheum>, <metaitem:plateGold>, <ore:dustPyrotheum>], 
	[<metaitem:plateGold>, <extrautils2:machine>, <metaitem:plateGold>], 
	[redPlate, furnGen, redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_redstone"}), [
	[<metaitem:plateTantalum>, <ore:blockRedAlloy>, <metaitem:plateTantalum>], 
	[<metaitem:plateTantalum>, <extrautils2:machine>, <metaitem:plateTantalum>], 
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_ender"}), [
	[<metaitem:sensor.ev>, <metaitem:plateEnderPearl>, <metaitem:sensor.ev>], 
	[<metaitem:plateEnderPearl>, <extrautils2:machine>, <metaitem:plateEnderPearl>], 
	[redPlate, furnGen, redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"}), [
	[<metaitem:springNichrome>,<metaitem:springNichrome>,<metaitem:springNichrome>], 
	[<metaitem:springNichrome>,<extrautils2:machine>,<metaitem:springNichrome>], 
	[redPlate, furnGen, redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_pink"}), [
	[<metaitem:dye.pink>, <metaitem:dye.pink>, <metaitem:dye.pink>], 
	[<metaitem:dye.pink>, <extrautils2:machine>, <metaitem:dye.pink>], 
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_overclock"}), [
	[<metaitem:wireGtQuadrupleUraniumRhodiumDinaquadide>,<metaitem:wireGtQuadrupleUraniumRhodiumDinaquadide>,<metaitem:wireGtQuadrupleUraniumRhodiumDinaquadide>], 
	[<metaitem:wireGtQuadrupleUraniumRhodiumDinaquadide>,<extrautils2:machine>,<metaitem:wireGtQuadrupleUraniumRhodiumDinaquadide>], 
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}), [
	[<metaitem:plateDoubleIncoloyMa956>,<ore:blockVanadiumSteel>,<metaitem:plateDoubleIncoloyMa956>], 
	[<metaitem:plateDoubleIncoloyMa956>,<extrautils2:machine>,<metaitem:plateDoubleIncoloyMa956>], 
	[redPlate, furnGen, redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), [
	[<metaitem:blockPolybenzimidazole>,<minecraft:slime>,<metaitem:blockPolybenzimidazole>],
	[<minecraft:slime>,<extrautils2:machine>,<minecraft:slime>],
	[redPlate, furnGen, redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_death"}), [
	[<metaitem:plateEndSteel>,<enderio:item_material:42>,<metaitem:plateEndSteel>],
	[<metaitem:plateEndSteel>,<extrautils2:machine>,<metaitem:plateEndSteel>],
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_ice"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}), [
	[<metaitem:magic_energy_absorber>,<metaitem:magic_energy_absorber>,<metaitem:magic_energy_absorber>], 
	[<metaitem:magic_energy_absorber>,<extrautils2:machine>,<metaitem:magic_energy_absorber>], 
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_dragonsbreath"}), [
	[<metaitem:blockCobaltBrass>, <minecraft:end_rod:*>, <metaitem:blockCobaltBrass>], 
	[<minecraft:purpur_block:*>, <extrautils2:machine>, <minecraft:purpur_block:*>], 
	[redPlate, <extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"}), redPlate]]);
	
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_ice"}), [
	[<nuclearcraft:block_ice>,<nuclearcraft:block_ice>,<nuclearcraft:block_ice>], 
	[<nuclearcraft:block_ice>,<extrautils2:machine>,<nuclearcraft:block_ice>], 
	[redPlate, furnGen, redPlate]]);
	
recipes.addShaped(<draconicevolution:generator>, [
	[<ore:plateDraconium>,<ore:plateDraconium>,<ore:plateDraconium>], 
	[<ore:plateDraconium>,<extrautils2:machine>,<ore:plateDraconium>], 
	[<ore:blockStellite100>, furnGen, <ore:blockStellite100>]]);
		
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"}), [
	[<metaitem:plateNetherStar>,<metaitem:plateNetherStar>,<metaitem:plateNetherStar>], 
	[<metaitem:plateNetherStar>,<extrautils2:machine>,<metaitem:plateNetherStar>], 
	[<ore:blockDuranium>, <draconicevolution:generator>, <ore:blockDuranium>]]);
	
	
	
	
	
//Resonator
recipes.remove(<extrautils2:resonator>);
recipes.addShaped(<extrautils2:resonator>, [
	[<extrautils2:ingredients>, <metaitem:plateRedAlloy>, <extrautils2:ingredients>], 
	[<metaitem:plateRedAlloy>, <extrautils2:machine>,<metaitem:plateRedAlloy>], 
	[<extrautils2:ingredients>, <metaitem:plateRedAlloy>, <extrautils2:ingredients>]]);

//Farmer
recipes.remove(<actuallyadditions:block_farmer>);
recipes.addShaped(<actuallyadditions:block_farmer>, [
	[<actuallyadditions:block_crystal:3>, <minecraft:wheat_seeds>, <actuallyadditions:block_crystal:3>], 
	[<enderio:item_material:73>, <actuallyadditions:block_misc:9>, <enderio:item_material:73>], 
	[<actuallyadditions:block_crystal:3>, <enderio:item_material:73>, <actuallyadditions:block_crystal:3>]]);

//Drill
recipes.remove(<actuallyadditions:item_drill:3>);
recipes.addShaped(<actuallyadditions:item_drill:3>, [
	[<actuallyadditions:block_crystal:3>, <actuallyadditions:block_crystal:2>, <metaitem:toolHeadDrillDiamond>], 
	[<metaitem:gearEnergeticAlloy>, <actuallyadditions:item_misc:16>, <actuallyadditions:block_crystal:2>], 
	[<metaitem:blockEnergeticAlloy>, <metaitem:gearEnergeticAlloy>, <actuallyadditions:block_crystal:3>]]);	

//Vertical Digger	
recipes.remove(<actuallyadditions:block_miner>);
//recipes.addShaped(<actuallyadditions:block_miner>, [
//	[<actuallyadditions:block_misc:9>, <gregtech:meta_tool:23>, <actuallyadditions:block_misc:9>], 
//	[<actuallyadditions:block_crystal:3>, <thermalinnovation:drill:2>, <actuallyadditions:block_crystal:3>], 
//	[<actuallyadditions:block_misc:9>, <actuallyadditions:item_drill:*>, <actuallyadditions:block_misc:9>]]);
	
//Ender Casing
recipes.remove(<actuallyadditions:block_misc:8>);	
recipes.addShaped(<actuallyadditions:block_misc:8>, [
	[<metaitem:plateEnderPearl>, <metaitem:platePulsatingIron>, <metaitem:plateEnderPearl>],
	[<metaitem:platePulsatingIron>, <actuallyadditions:block_misc:2>, <metaitem:platePulsatingIron>], 
	[<metaitem:plateEnderPearl>, <metaitem:platePulsatingIron>, <metaitem:plateEnderPearl>]]);

//Trash Can (Items)
recipes.remove(<extrautils2:trashcan>);
recipes.addShaped(<extrautils2:trashcan>, [
	[null, <minecraft:iron_trapdoor>, null],
	[<metaitem:plateIron>, <minecraft:chest>, <metaitem:plateIron>],
	[null, <metaitem:plateIron>, null]]);

//Trash Can (Fluid)
recipes.remove(<extrautils2:trashcanfluid>);
recipes.addShaped(<extrautils2:trashcanfluid>, [
	[null, <minecraft:iron_trapdoor>, null],
	[<metaitem:plateIron>, <minecraft:bucket>, <metaitem:plateIron>],
	[null, <metaitem:plateIron>, null]]);

//Trash Can (Energy)
recipes.remove(<extrautils2:trashcanenergy>);
recipes.addShaped(<extrautils2:trashcanenergy>, [
	[null, <minecraft:iron_trapdoor>, null],
	[<metaitem:plateIron>, <minecraft:redstone_block>, <metaitem:plateIron>],
	[null, <metaitem:plateIron>, null]]);
	
	
//medium and large crate
recipes.remove(<actuallyadditions:block_giant_chest_medium>);
recipes.remove(<actuallyadditions:block_giant_chest_large>);
recipes.addShaped(<actuallyadditions:block_giant_chest_medium>, [
	[<actuallyadditions:block_crystal:2>, <ore:plankWood>, <actuallyadditions:block_crystal:2>], 
	[<actuallyadditions:block_giant_chest>,<ore:plankWood>, <actuallyadditions:block_giant_chest>], 
	[<actuallyadditions:block_crystal:2>, <ore:plankWood>, <actuallyadditions:block_crystal:2>]]);
	
recipes.addShaped(<actuallyadditions:block_giant_chest_large>, [
	[<actuallyadditions:block_crystal_empowered:2>, <ore:plankWood>, <actuallyadditions:block_crystal_empowered:2>], 
	[<actuallyadditions:block_giant_chest_medium>,<actuallyadditions:block_giant_chest_medium>,<actuallyadditions:block_giant_chest_medium>], 
	[<actuallyadditions:block_crystal_empowered:2>, <ore:plankWood>, <actuallyadditions:block_crystal_empowered:2>]]);
	
// Remove existing xu2 mill recipes	
recipes.remove(<extrautils2:passivegenerator>);	
recipes.remove(<extrautils2:passivegenerator:1>);	
recipes.remove(<extrautils2:passivegenerator:2>);	
recipes.remove(<extrautils2:passivegenerator:3>);	
recipes.remove(<extrautils2:passivegenerator:4>);	
recipes.remove(<extrautils2:passivegenerator:5>);	
recipes.remove(<extrautils2:passivegenerator:8>);	
recipes.remove(<extrautils2:chunkloader>);	

//GP Solar
recipes.addShaped(<extrautils2:passivegenerator>, [
	[null,<solarflux:solar_panel_1>,null], 
	[<extrautils2:decorativesolid:2>, <extrautils2:ingredients>, <extrautils2:decorativesolid:2>]]);

//GP Lunar
recipes.addShaped(<extrautils2:passivegenerator:1>, [
	[null, <extrautils2:ingredients:3>, null], 
	[<extrautils2:ingredients:3>,<extrautils2:passivegenerator>,<extrautils2:ingredients:3>],
	[null, <extrautils2:ingredients:3>, null]]);
	
//Lava Mill
recipes.addShaped(<extrautils2:passivegenerator:2>, [
	[<extrautils2:decorativesolid:3>, <extrautils2:ingredients:1>, <extrautils2:decorativesolid:3>], 
	[<extrautils2:ingredients>, <meta_tile_entity:hull.mv>, <extrautils2:ingredients>], 
	[<extrautils2:decorativesolid:3>, <armorplus:block_infused_lava_crystal>, <extrautils2:decorativesolid:3>]]);
	
//Water Mill
recipes.addShaped(<extrautils2:passivegenerator:3>, [
	[<extrautils2:decorativesolid:3>,  <extrautils2:ingredients:1>, <extrautils2:decorativesolid:3>], 
	[<metaitem:electric.pump.mv>, <meta_tile_entity:hull.mv>, <metaitem:electric.pump.mv>], 
	[<extrautils2:decorativesolid:3>,  <extrautils2:ingredients:1>, <extrautils2:decorativesolid:3>]]);
	
//Wind Mill	
recipes.addShaped(<extrautils2:passivegenerator:4>, [
	[<extrautils2:decorativesolid:3>, <extrautils2:ingredients>, <extrautils2:decorativesolid:3>], 
	[<metaitem:rotorSteel>, <extrautils2:ingredients:1>, <meta_tile_entity:hull.mv>], 
	[<extrautils2:decorativesolid:3>, <extrautils2:ingredients>, <extrautils2:decorativesolid:3>]]);
	
//Fire Mill
recipes.addShaped(<extrautils2:passivegenerator:5>, [
	[<extrautils2:decorativesolid:3>, <extrautils2:ingredients:1>, <extrautils2:decorativesolid:3>], 
	[<extrautils2:ingredients>, <meta_tile_entity:hull.mv>, <extrautils2:ingredients>], 
	[<extrautils2:decorativesolid:3>, <extrautils2:ingredients:13>, <extrautils2:decorativesolid:3>]]);
	
//Chunk Loader
recipes.addShaped(<extrautils2:chunkloader>, [
	[<metaitem:stickEnergeticAlloy>, <extrautils2:ingredients:2>, <metaitem:stickEnergeticAlloy>], 
	[<metaitem:stickEnergeticAlloy>, <metaitem:blockEnergeticAlloy>, <metaitem:stickEnergeticAlloy>], 
	[null, <metaitem:blockEnergeticAlloy>, null]]);

//Dragon Mill
recipes.addShaped(<extrautils2:passivegenerator:8>, [
	[<metaitem:blockRuridit>,<metaitem:blockRuridit>,<metaitem:blockRuridit>], 
	[<extrautils2:ingredients:2>, <metaitem:blockNetherStar>, <extrautils2:ingredients:2>], 
	[<extrautils2:decorativesolid:3>, <extrautils2:ingredients:2>, <extrautils2:decorativesolid:3>]]);
	
//Iron Drum
recipes.removeByRecipeName("extrautils2:drum_256");
recipes.addShaped(<extrautils2:drum:1>, [
	[<metaitem:plateWroughtIron>, <minecraft:heavy_weighted_pressure_plate:*>, <metaitem:plateWroughtIron>], 
	[<metaitem:plateWroughtIron>, <minecraft:cauldron:*>, <metaitem:plateWroughtIron>], 
	[<metaitem:plateWroughtIron>, <minecraft:heavy_weighted_pressure_plate:*>, <metaitem:plateWroughtIron>]]);
	
//Reinforced Drum
recipes.removeByRecipeName("extrautils2:drum_4096");
recipes.addShaped(<extrautils2:drum:2>, [
	[<metaitem:blockPolyvinylChloride>, <meta_tile_entity:drum.stainless_steel>, <metaitem:blockPolyvinylChloride>], 
	[<metaitem:blockPolyvinylChloride>, <extrautils2:drum:1>, <metaitem:blockPolyvinylChloride>], 
	[<metaitem:blockPolyvinylChloride>, <meta_tile_entity:drum.stainless_steel>, <metaitem:blockPolyvinylChloride>]]);
	
//Demonic	
recipes.removeByRecipeName("extrautils2:drum_65536");
mods.extendedcrafting.TableCrafting.addShaped(<extrautils2:drum:3>,[
	[<extrautils2:simpledecorative:1>,<moreplates:demon_plate>,<moreplates:demon_plate>,<moreplates:demon_plate>,<extrautils2:simpledecorative:1>],
	[<extrautils2:simpledecorative:1>,<metaitem:plateDoubleWatertightSteel>,<metaitem:plateDoubleWatertightSteel>,<metaitem:plateDoubleWatertightSteel>,<extrautils2:simpledecorative:1>],
	[<extrautils2:simpledecorative:1>,<metaitem:plateDoubleWatertightSteel>,<extrautils2:drum:2>,<metaitem:plateDoubleWatertightSteel>,<extrautils2:simpledecorative:1>],
	[<extrautils2:simpledecorative:1>,<metaitem:plateDoubleWatertightSteel>,<metaitem:plateDoubleWatertightSteel>,<metaitem:plateDoubleWatertightSteel>,<extrautils2:simpledecorative:1>],
	[<extrautils2:simpledecorative:1>,<moreplates:demon_plate>,<moreplates:demon_plate>,<moreplates:demon_plate>,<extrautils2:simpledecorative:1>]]);		
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}));
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), [
	[null, <minecraft:writable_book>, null],
	[<ore:gemDiamond>, <extrautils2:machine>, <ore:gemDiamond>],
	[<metaitem:plateSteel>,<metaitem:plateSteel>,<metaitem:plateSteel>]]);
	
//Solar
recipes.remove(<actuallyadditions:block_furnace_solar>);
recipes.addShaped(<actuallyadditions:block_furnace_solar>, [
	[<extrautils2:ingredients>, <solarflux:solar_panel_1>, <extrautils2:ingredients>],
	[null,<extrautils2:decorativesolid:3>,null]]);

//Drill Core
recipes.remove(<actuallyadditions:item_misc:16>);
<actuallyadditions:item_misc:16>.addTooltip(format.red("Acquired by exploration of Lost Cities buildings or vanilla dungeons."));
// Coin tooltip is done in normalmode.zs


// Canola Press
recipes.removeByRecipeName("actuallyadditions:recipes132");
recipes.addShaped(<actuallyadditions:block_canola_press>, [
	[<metaitem:plateSteel>, <actuallyadditions:block_crystal:5>, <metaitem:plateSteel>], 
	[<metaitem:electric.piston.mv>, null, <metaitem:electric.piston.mv>], 
	[<metaitem:plateSteel>, <actuallyadditions:item_misc:8>, <metaitem:plateSteel>]]);
<actuallyadditions:block_canola_press>.addTooltip(format.green("Turns Canola into Canola Oil. Requires RF."));  

	
<actuallyadditions:item_misc:13>.addTooltip(format.green("Canola can be turned into Canola Oil via a Canola Press. This is a somewhat slow machine and requres RF to function."));

<actuallyadditions:item_knife>.addTooltip(format.red("When making Hamburgers, make sure to place this in the Crafting Table last! Otherwise, Bio Mash will be created."));
	
print("--- ActuallyAdditions.zs initialized ---");
