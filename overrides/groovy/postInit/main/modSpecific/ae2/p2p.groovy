package postInit.main.modSpecific.ae2

import classes.Common

import static gregtech.api.GTValues.*

// Create an OreDict for P2Ps
ore_dict.add('ae2P2ps', Common.meP2p)

for(var item : Common.p2pVariants) {
	ore_dict.add('ae2P2ps', item.value)
}

// Crafting Recipe: Shapeless, Any P2P (Ore Dict) -> ME P2P
crafting.addShapeless(Common.meP2p, [ore('ae2P2ps')])

// Assembler Recipes: Any P2P (Ore Dict) + Circuit -> Variant of P2P (Excluding ME)
for (int i : 0..Common.p2pVariants.size() - 1) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('ae2P2ps'))
		.circuitMeta(i + 1)
		.outputs(Common.p2pVariants[i].value)
		.duration(10).EUt(VA[LV])
		.buildAndRegister()
}
