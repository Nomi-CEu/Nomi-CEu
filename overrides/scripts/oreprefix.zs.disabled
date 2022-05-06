#loader gregtech
#priority 10

import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.IMaterialPredicate;
import mods.gregtech.material.Material;
import mods.gregtech.material.Elements;
import mods.gregtech.ore.OrePrefix;
import mods.gregtech.recipe.helpers;
import mods.gregtech.ore.IOreRecipeHandler;
import mods.gregtech.MaterialFlag;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.MaterialFlagBuilder;

val gemPerfectFlag = MaterialFlagBuilder.create("generate_perfect")
    .requireGem()
    .build();

<material:diamond>.addFlags(["generate_perfect"]);
<material:emerald>.addFlags(["generate_perfect"]);
<material:ruby>.addFlags(["generate_perfect"]);
<material:topaz>.addFlags(["generate_perfect"]);

val gemPerfect as OrePrefix = OrePrefix.registerOrePrefix("gemPerfect", 8, "gemPerfect", 1);
gemPerfect.setGenerationPredicate(function(mat as Material) as bool {
    return mat.hasFlag(gemPerfectFlag);
} as IMaterialPredicate);

gemPerfect.createMaterialItem();
