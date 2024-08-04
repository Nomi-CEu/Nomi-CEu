import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;


print("--- CraftingCoreUpgrade.zs initialized ---");

	#Crafting Core Recipes
recipes.remove(<extendedcrafting:crafting_core>);
recipes.addShaped(<extendedcrafting:crafting_core>, [
	[<ore:plateBlackSteel>, <extendedcrafting:material:10>, <ore:plateBlackSteel>],
	[<extendedcrafting:material:16>, <actuallyadditions:block_empowerer>, <extendedcrafting:material:16>],
	[<ore:plateBlackSteel>, <enderio:item_endergy_conduit:10>, <ore:plateBlackSteel>]]);
