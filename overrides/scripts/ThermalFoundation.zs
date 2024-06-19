import mods.gregtech.recipe.RecipeMap;

// Define the item with NBT data
val cryobucket = <forge:bucketfilled>.withTag({FluidName: "cryotheum", Amount: 1000});

// Add tooltips to Gelid Cryotheum
<thermalfoundation:fluid_cryotheum>.addTooltip(format.red("Temperature: 1 K"));
<thermalfoundation:fluid_cryotheum>.addTooltip(format.green("State: Liquid"));
<thermalfoundation:fluid_cryotheum>.addTooltip(format.aqua("Cryogenic! Handle with care!"));

// Add tooltips to the Gelid Cryotheum Bucket
cryobucket.addTooltip(format.red("Temperature: 1 K"));
cryobucket.addTooltip(format.green("State: Liquid"));
cryobucket.addTooltip(format.aqua("Cryogenic! Handle with care!"));
