import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import net.minecraft.item.ItemStack

import static gregtech.api.GTValues.*

// Standardise fluix dust
ore('dustFluix').add(item('appliedenergistics2:material', 8))

// Conversion Recipes (DEPRECATED)
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:material', 59))
	.input(item('ae2wtlib:infinity_booster_card'))
	.register()
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:wireless_crafting_terminal'))
	.input(item('wct:wct'))
	.register()
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:material', 60))
	.input(item('wct:magnet_card'))
	.register()

// JEI
mods.jei.ingredient.removeAndHide(item('appliedenergistics2:material', 0))

// AE2 Certus -> GT Certus
crafting.remove('appliedenergistics2:misc/deconstruction_certus_quartz_pillar')
crafting.remove('appliedenergistics2:misc/deconstruction_certus_quartz_block')
crafting.remove('appliedenergistics2:misc/deconstruction_certus_chiseled_quartz')

crafting.shapelessBuilder()
	.output(metaitem('gemCertusQuartz') * 4)
	.input(item('appliedenergistics2:quartz_block').or(item('appliedenergistics2:quartz_pillar')).or(item('appliedenergistics2:chiseled_quartz_block')))
	.register()

// Name Press
mods.gregtech.laser_engraver.recipeBuilder()
	.outputs(item('appliedenergistics2:material', 21))
	.inputs(ore('blockVanadiumSteel'))
	.notConsumable(ore('craftingLensWhite'))
	.changeRecycling()
	.duration(1600).EUt(VA[MV])
	.buildAndRegister()

// Certus Block
crafting.remove('appliedenergistics2:decorative/certus_quartz_block')
crafting.shapedBuilder()
	.output(item('appliedenergistics2:quartz_block'))
	.matrix(
		'CC',
		'CC')
	.key('C', metaitem('gemCertusQuartz'))
	.register()

// Skystone
mods.gregtech.alloy_smelter.recipeBuilder()
	.outputs(item('appliedenergistics2:sky_stone_block'))
	.inputs(item('minecraft:stone'), item('minecraft:end_stone'))
	.duration(200).EUt(VHA[LV])
	.buildAndRegister()

// Skystone Dust
mods.gregtech.macerator.recipeBuilder()
	.outputs(item('appliedenergistics2:material', 45))
	.inputs(item('appliedenergistics2:sky_stone_block'))
	.duration(45).EUt(VA[ULV])
	.buildAndRegister()

/* Presses, Circuits & Processors */

// Silicon (done manually, is unique)

// Inscriber Silicon Press
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material', 19))
mods.gregtech.laser_engraver.recipeBuilder()
	.outputs(item('appliedenergistics2:material', 19))
	.inputs(ore('blockVanadiumSteel'))
	.notConsumable(ore('craftingLensLightBlue'))
	.changeRecycling()
	.duration(1600).EUt(VA[MV])
	.buildAndRegister()

// Printed Silicon
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material', 20))
mods.appliedenergistics2.inscriber.recipeBuilder()
	.input(ore('plateSilicon'))
	.top(item('appliedenergistics2:material', 19))
	.output(item('appliedenergistics2:material', 20))
	.inscribe().register()

mods.appliedenergistics2.inscriber.recipeBuilder()
	.input(ore('itemSilicon'))
	.top(item('appliedenergistics2:material', 19))
	.output(item('appliedenergistics2:material', 20))
	.inscribe().register()

var applyProcessorChange = { OreDictIngredient lens, OreDictIngredient plate, ItemStack press, ItemStack circuit, ItemStack processor ->
	/* Presses */
	mods.appliedenergistics2.inscriber.removeByOutput(press)
	mods.gregtech.laser_engraver.recipeBuilder()
		.outputs(press)
		.inputs(ore('blockVanadiumSteel'))
		.notConsumable(lens)
		.changeRecycling()
		.duration(1600).EUt(VA[MV])
		.buildAndRegister()

	/* Circuits */
	mods.appliedenergistics2.inscriber.removeByOutput(circuit)
	mods.appliedenergistics2.inscriber.recipeBuilder()
		.input(plate)
		.top(press)
		.output(circuit)
		.inscribe().register()

	/* Processors */
	mods.appliedenergistics2.inscriber.removeByOutput(processor)
	mods.appliedenergistics2.inscriber.recipeBuilder()
		.input(ore('circuitLv'))
		.top(circuit)
		.bottom(item('appliedenergistics2:material', 20)) // Silicon
		.output(processor)
		.press().register()
}

// Calculation
applyProcessorChange(ore('craftingLensBlue'), ore('plateCertusQuartz'), item('appliedenergistics2:material', 13), item('appliedenergistics2:material', 16), item('appliedenergistics2:material', 23))

// Engineering
applyProcessorChange(ore('craftingLensRed'), ore('plateDiamond'), item('appliedenergistics2:material', 14), item('appliedenergistics2:material', 17), item('appliedenergistics2:material', 24))

// Logic
applyProcessorChange(ore('craftingLensGreen'), ore('plateGold'), item('appliedenergistics2:material', 15), item('appliedenergistics2:material', 18), item('appliedenergistics2:material', 22))


