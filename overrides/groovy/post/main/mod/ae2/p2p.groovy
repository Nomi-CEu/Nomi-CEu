package post.main.mod.ae2

import static gregtech.api.GTValues.*

import static post.classes.Common.*

import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient

// Create an OreDict for P2Ps
OreDictIngredient p2pOre = ore('ae2P2ps')
p2pOre.add(item('appliedenergistics2:part', 460))
p2pOre.add((p2pVariants*.value))

// Crafting Recipe: Shapeless, Any P2P (Ore Dict) -> ME P2P
crafting.addShapeless(item('appliedenergistics2:part', 460), [p2pOre])

// Assembler Recipes: Any P2P (Ore Dict) + Circuit -> Variant of P2P (Excluding ME)
for (int i : 0..p2pVariants.size() - 1) {
    mods.gregtech.assembler.recipeBuilder()
        .inputs(p2pOre)
        .circuitMeta(i + 1)
        .outputs(p2pVariants[i].value)
        .duration(10).EUt(VA[LV])
        .buildAndRegister()
}
