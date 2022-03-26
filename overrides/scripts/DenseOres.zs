import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;

/*
	This file provides compatibility for DenseMetals.
	Adds ore dictionary entries for dense ores.
	Registers chemical reactor recipes to turn one dense ore into 16 regular ores.

	denseOres is an associative array:
	{
		ore_dictionary_entry : [ dense_ore_stack, regular_ore_stack ]
	}
*/

val denseOres as IItemStack[][IOreDictEntry] = {
	<ore:denseOreRedstone>   : [ <densemetals:dense_redstone_ore> , <gregtech:ore_redstone_0>   ]
	, <ore:denseOreEmerald>  : [ <densemetals:dense_emerald_ore>  , <gregtech:ore_emerald_0>    ]
	, <ore:denseOreDiamond>  : [ <densemetals:dense_diamond_ore>  , <gregtech:ore_diamond_0>    ]
	, <ore:denseOreIron>     : [ <densemetals:dense_iron_ore>     , <gregtech:ore_iron_0>       ]
	, <ore:denseOreLapis>    : [ <densemetals:dense_lapis_ore>    , <gregtech:ore_lapis_0>      ]
	, <ore:denseOreGold>     : [ <densemetals:dense_gold_ore>     , <gregtech:ore_gold_0>       ]
	, <ore:denseOreCoal>     : [ <densemetals:dense_coal_ore>     , <gregtech:ore_coal_0>       ]
	, <ore:denseOreMagma>    : [ <contenttweaker:densemagma>      , <minecraft:magma>           ]
	, <ore:denseOreOilsands> : [ <contenttweaker:denseoilshale>   , <gregtech:ore_oilsands_0:2> ]
};

val fluidCatalyst = <liquid:nitric_acid> * 1000;
val regularOrePerDense = 16;
val recipeDuration = 200;
val recipeEUt = 500;

for oreDictEntry, itemStacks in denseOres {
	val denseOreStack = itemStacks[0] as IItemStack;
	val regularOreStack = itemStacks[1] as IItemStack;

	// Add ore dictionary entry
	oreDictEntry.add(denseOreStack);

	// Chemical reactor recipe, 1 dense -> 16 regular
	reactor.recipeBuilder()
		.inputs(oreDictEntry)
		.fluidInputs(fluidCatalyst)
		.outputs([regularOreStack * regularOrePerDense])
		.duration(recipeDuration)
		.EUt(recipeEUt)
		.buildAndRegister();
}
