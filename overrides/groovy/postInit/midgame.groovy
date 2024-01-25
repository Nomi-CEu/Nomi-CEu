import com.nomiceu.nomilabs.util.LabsModeHelper

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

if (LabsModeHelper.isNormal()) {
	// Assembly Control Casing (Change from Output 2 to Output 4)
	replaceRecipeOutput(item('gregtech:multiblock_casing', 3) * 2, item('gregtech:multiblock_casing', 3) * 4)

	// Sterilizing Filter
	crafting.replaceShaped(metaitem('blacklight'), [
			[metaitem('screwTungstenCarbide'), metaitem('plateTungstenCarbide'), metaitem('screwTungstenCarbide')],
			[null, metaitem('springHssg'), null],
			[ore('circuitIv'), metaitem('plateTungstenCarbide'), metaitem('cableGtSinglePlatinum')]
	])

	replaceRecipeShaped(item('gregtech:cleanroom_casing', 2) * 2, item('gregtech:cleanroom_casing', 2) * 1, [
			[metaitem('pipeLargeFluidPolybenzimidazole'), metaitem('emitter.luv'), metaitem('pipeLargeFluidPolybenzimidazole')],
			[metaitem('item_filter'), metaitem('blacklight'), metaitem('item_filter')],
			[metaitem('electric.motor.luv'), ore('frameGtBlackSteel'), metaitem('rotorIridium')]
	])
}