import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;


print("--- CraftingCoreUpgrade.zs initialized ---");

	#Crafting Core Recipes
recipes.remove(<extendedcrafting:crafting_core>);
recipes.addShaped(<extendedcrafting:crafting_core>, [
	[<ore:plateBlackSteel>, <extendedcrafting:material:10>, <ore:plateBlackSteel>],
	[<extendedcrafting:material:16>, <actuallyadditions:block_empowerer>, <extendedcrafting:material:16>],
	[<ore:plateBlackSteel>, <enderio:item_endergy_conduit:10>, <ore:plateBlackSteel>]]);

	
var outputInputMap as IIngredient[][IItemStack] = {
	#Empowered Canola Seed
	<actuallyadditions:item_misc:24> : [
		<actuallyadditions:item_misc:23>,	//crystallized canola seed
		<actuallyadditions:item_canola_seed>,
		<actuallyadditions:item_canola_seed>,
		<actuallyadditions:item_canola_seed>,
		<actuallyadditions:item_canola_seed>
	],
	#Empowered Restonia
	<actuallyadditions:block_crystal_empowered> : [
		<actuallyadditions:block_crystal>,
		<ore:ingotRedAlloy>,
		<ore:gemAlmandine>,
		<gregtech:meta_item_1:85>.withTag({Fluid: {FluidName: "sulfuric_acid", Amount: 1000}}),
		<extendedcrafting:material:19>		//conflux component
	],
	#Empowered Palis
	<actuallyadditions:block_crystal_empowered:1> : [
		 <actuallyadditions:block_crystal:1>, 
		 <ore:gemSapphire>,
		 <ore:ingotMithril>, 
		 <metaitem:fluid_cell>.withTag({Fluid: {FluidName: "water", Amount: 1000}}), 
		 <extendedcrafting:material:16>
	],
	#Empowered Diamatine
	<actuallyadditions:block_crystal_empowered:2> : [
		<actuallyadditions:block_crystal:2>,
		<extendedcrafting:material:40>, 
		<extendedcrafting:material:24>, 
		<metaitem:fluid_cell>.withTag({Fluid: {FluidName: "nitrogen_dioxide", Amount: 1000}}), 
		<extendedcrafting:material:18>
	],
	#Empowered Void Crystal
	<actuallyadditions:block_crystal_empowered:3> : [
		<actuallyadditions:block_crystal:3>, 
		<ore:gemQuartzBlack>,
		<ore:ingotDarkSteel>,
		<metaitem:fluid_cell>.withTag({Fluid: {FluidName: "oil", Amount: 1000}}), 
		<extendedcrafting:material:15>
	],
	#Empowered Emeradic
	<actuallyadditions:block_crystal_empowered:4> : [
		<actuallyadditions:block_crystal:4>, 
		<contenttweaker:stabilizeduranium>, 
		<ore:ingotVibrantAlloy>, 
		<metaitem:fluid_cell>.withTag({Fluid: {FluidName: "argon", Amount: 1000}}), 
		<extendedcrafting:material:17>
	],
	#Empowered Enori
	<actuallyadditions:block_crystal_empowered:5> : [
		<actuallyadditions:block_crystal:5>, 
		<ore:gemApatite>,
		<ore:ingotEndSteel>,
		<metaitem:fluid_cell>.withTag({Fluid: {FluidName: "helium", Amount: 1000}}), 
		<extendedcrafting:material:14>
	]
};

for output, inputArray in outputInputMap {
	var input as IItemStack = inputArray[0];
	mods.extendedcrafting.CombinationCrafting.addRecipe(
		output, 
		4000000,
		400000,
		input, [
			inputArray[1],
			inputArray[2],
			inputArray[3],
			inputArray[4]
		]);
}




