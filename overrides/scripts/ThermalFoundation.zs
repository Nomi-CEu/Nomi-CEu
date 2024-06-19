import mods.gregtech.recipe.RecipeMap;


//Tooltips
val cryobucket = <thermalfoundation:item.forge:bucketfilled.withTag(["FluidName": "cryotheum", "Amount": 1000])>; // Define Cryotheum Bucket Item
<thermalfoundation:fluid_cryotheum>.addTooltip(format.red("Temperature: 1 K")); // Gelid Cryotheum
<thermalfoundation:fluid_cryotheum>.addTooltip(format.green("State: Liquid")); // Gelid Cryotheum
<thermalfoundation:fluid_cryotheum>.addTooltip(format.aqua("Cryogenic! Handle with care!")); // Gelid Cryotheum
cryobucket.addTooltip(format.red("Temperature: 1 K")); // Gelid Cryotheum
cryobucket.addTooltip(format.green("State: Liquid")); // Gelid Cryotheum
cryobucket.addTooltip(format.aqua("Cryogenic! Handle with care!")); // Gelid Cryotheum
