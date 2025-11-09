package post.main.general.mid

import gregtech.api.recipes.Recipe

// Midgame Chemical Related Recipes

/* --- Rocket Fuel --- */

/* 1,1-Dimethylhydrazine */

// 2 fluid recipe: decrease EUt
mods.gregtech.chemical_reactor.changeByInput(null, [fluid('dimethylamine') * 1000, fluid('monochloramine') * 1000])
    .changeEUt { eut -> (int) (eut / 4) }
    .replaceAndRegister()

// 3 fluid recipe: make LCR specific
Recipe dimethylRecipe = mods.gregtech.chemical_reactor.find(null,
    [fluid('hypochlorous_acid') * 1000, fluid('ammonia') * 2000, fluid('methanol') * 2000])

// Remove from CR and LCR
mods.gregtech.chemical_reactor.getRecipeMap().removeRecipe(dimethylRecipe)

// Add to LCR
mods.gregtech.large_chemical_reactor.recipeBuilder()
    .fluidInputs(dimethylRecipe.fluidInputs)
    .fluidOutputs(dimethylRecipe.fluidOutputs)
    .duration(dimethylRecipe.duration).EUt(dimethylRecipe.EUt)
    .buildAndRegister()
