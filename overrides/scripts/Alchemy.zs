import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.material.MaterialRegistry;
import crafttweaker.item.IItemStack;

import scripts.common.makeShaped as makeShaped;


//Wooden Gear
recipes.remove(<enderio:item_material:9>);
recipes.addShaped(<enderio:item_material:9>, [[null,<ore:stickWood>,null],
	[<ore:stickWood>,null,<ore:stickWood>],
	[null,<ore:stickWood>,null]]);

//Wooden Shears
recipes.remove(<thermalfoundation:tool.shears_wood>);
recipes.addShaped(<thermalfoundation:tool.shears_wood>, [[null,<ore:stickWood>,null],
	[<ore:stickWood>,null,<ore:stickWood>],
	[<enderio:item_material:9>,<ore:stickWood>,null]]);

//Fertilizer 
recipes.addShaped("actuallyadditions_fertilizer", <actuallyadditions:item_fertilizer> * 8, [[<minecraft:sand>,<metaitem:gemApatite>,<minecraft:sand>]]);

recipes.remove(<dimensionaledibles:overworld_cake>);
recipes.remove(<dimensionaledibles:nether_cake>);
recipes.remove(<dimensionaledibles:end_cake>);
recipes.remove(<dimensionaledibles:island_cake>);
recipes.remove(<dimensionaledibles:custom_cake>);

//Overworld Cake
recipes.addShaped(<dimensionaledibles:overworld_cake>, [[<minecraft:redstone>, <metaitem:dustGold>, <minecraft:redstone>], [<ore:treeSapling>, <enderio:item_material:70>, <ore:treeSapling>],[<metaitem:plant_ball>,<minecraft:diamond>,<metaitem:plant_ball>]]);

//End Cake
recipes.addShaped(<dimensionaledibles:end_cake>, [[<ore:dustEndstone>,<ore:dustEndstone>,<ore:dustEndstone>], [<minecraft:ender_eye>, <enderio:item_material:70>, <minecraft:ender_eye>],[<metaitem:plateBlackSteel>,<metaitem:plateBlackSteel>,<metaitem:plateBlackSteel>]]);

//Void World Cake
makeShaped("of_void_cake", <dimensionaledibles:custom_cake>.withTag({dimID: 119, cakeName: "Void World"}),
	["ABC",
	 "DED",
	 "FFF"],
	{ A : <actuallyadditions:item_crystal:0>,	// Restonia Crystal
	  B : <actuallyadditions:item_crystal:1>,	// Palis Crystal
	  C : <actuallyadditions:item_crystal:4>,	// Emeradic Crystal
	  D : <ore:dustPulsating>,			// Pulsating Dust
	  E : <enderio:item_material:70>,			// Cake Base
	  F : <metaitem:plateAluminium>
	}
);
