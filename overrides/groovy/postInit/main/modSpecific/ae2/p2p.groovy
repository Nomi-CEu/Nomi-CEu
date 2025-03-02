package postInit.main.modSpecific.ae2

import classes.postInit.Common
import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient

import static gregtech.api.GTValues.*

// Create an OreDict for P2Ps
OreDictIngredient p2pOre = ore('ae2P2ps')
p2pOre.add(Common.meP2p)
p2pOre.add(Common.p2pVariants.collect { it -> it.value })

// Crafting Recipe: Shapeless, Any P2P (Ore Dict) -> ME P2P
crafting.addShapeless(Common.meP2p, [p2pOre])

// Assembler Recipes: Any P2P (Ore Dict) + Circuit -> Variant of P2P (Excluding ME)
for (int i : 0..Common.p2pVariants.size() - 1) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(p2pOre)
		.circuitMeta(i + 1)
		.outputs(Common.p2pVariants[i].value)
		.duration(10).EUt(VA[LV])
		.buildAndRegister()
}
