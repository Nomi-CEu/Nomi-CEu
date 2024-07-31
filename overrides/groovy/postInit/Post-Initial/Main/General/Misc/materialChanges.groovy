import static gregtech.api.GTValues.*

// Rhodium Plated Palladium -> Rhodium Plated Lumium-Palladium
material('rhodium_plated_palladium')
	.changeComposition()
	.setComponents([materialstack('palladium') * 3, materialstack('rhodium'), materialstack('nomilabs:lumium') * 2])
	.changeABS()
	.changeMixer()
	.changeDecompositionRecipes()
	.changeChemicalFormula()
	.change()

/* Black Steel */

// Can't use change composition to remove, as that is only performed at the end of running scripts, and if not removed, conflicts will occur.
// TODO Make this use change composition when that accepts non-material Item Stacks

// Remove ABS Recipes
mods.gregtech.alloy_blast_smelter.removeByOutput(null, [fluid('black_steel')])

// Remove Mixer Recipes
mods.gregtech.mixer.removeByOutput([metaitem('dustBlackSteel')], null)

// Remove Decomp Recipe
mods.gregtech.centrifuge.removeByInput([metaitem('dustBlackSteel')], null)

// Normal Mixer Recipe
mods.gregtech.mixer.recipeBuilder()
	.inputs(metaitem('dustSteel') * 3, metaitem('dustBlackBronze') * 2, item('actuallyadditions:item_crystal', 3) * 2, item('extrautils2:ingredients', 4) * 2)
	.outputs(metaitem('dustBlackSteel') * 9)
	.duration(200).EUt(VHA[LV])
	.buildAndRegister()

/* Black Steel Shortcut */
// Normal recipe would be 50 ticks per recipe at HV overclock, plus 125 ticks for the Black Bronze step,
// for a total of 375 ticks. This recipe is 5 batches at once, so is equivalent time but saves a step.
mods.gregtech.mixer.recipeBuilder()
	.inputs(metaitem('dustSteel') * 15, metaitem('dustCopper') * 6, metaitem('dustGold') * 2, metaitem('dustSilver') * 2, item('actuallyadditions:item_crystal', 3) * 10, item('extrautils2:ingredients', 4) * 10)
	.outputs(metaitem('dustBlackSteel') * 45)
	.duration(375).EUt(VHA[HV])
	.buildAndRegister()

// Decomp Recipe
mods.gregtech.centrifuge.recipeBuilder()
	.inputs(metaitem('dustBlackSteel') * 9)
	.outputs(metaitem('dustSteel') * 3, metaitem('dustBlackBronze') * 2, item('actuallyadditions:item_crystal', 3) * 2, item('extrautils2:ingredients', 4) * 2)
	.duration(480).EUt(VA[LV] * 2)
	.buildAndRegister()

// Change Chem Formula
material('black_steel')
	.changeComposition()
	.setComponents([materialstack('black_bronze') * 2, materialstack('steel') * 3])
	.changeChemicalFormula()
	.change()
