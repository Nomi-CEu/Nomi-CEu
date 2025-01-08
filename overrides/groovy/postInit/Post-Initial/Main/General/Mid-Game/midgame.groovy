import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.chance.output.impl.ChancedItemOutput

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.chanced
import static gregtech.api.GTValues.*

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
	[[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
	 [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
	 [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])

// Make Rare Earth Centrifuging Output Full Dusts
mods.gregtech.centrifuge.removeByInput([metaitem('dustRareEarth')], null)
mods.gregtech.centrifuge.recipeBuilder()
    .inputs(metaitem('dustRareEarth'))
    .chancedOutput(metaitem('dustCadmium'), 625, 100)
    .chancedOutput(metaitem('dustNeodymium'), 625, 100)
    .chancedOutput(metaitem('dustSamarium'), 625, 100)
    .chancedOutput(metaitem('dustCerium'), 625, 100)
    .chancedOutput(metaitem('dustYttrium'), 625, 100)
    .chancedOutput(metaitem('dustLanthanum'), 625, 100)
    .duration(64).EUt(VA[LV])
    .buildAndRegister()

// Nether Star Block -> Nether Star
crafting.addShapeless(item('minecraft:nether_star') * 9, [ore('blockNetherStar')])

// Nitrogen -> Liquid Nitrogen
if (LabsModeHelper.expert) {
	mods.gregtech.vacuum_freezer.recipeBuilder()
		.fluidInputs(fluid('nitrogen') * 1000)
		.fluidOutputs(fluid('liquid_nitrogen') * 1000)
		.duration(90).EUt(VA[HV])
		.buildAndRegister()
}

/* Nuclear Related Chanced Output Changes */

// Buff Thorium Yields from Black Granite
mods.gregtech.macerator.changeByInput([item('gregtech:stone_smooth')], null)
	.changeEachChancedOutput { ChancedItemOutput output ->
		return chanced(output.ingredient, output.chance, 700) // Original: 1%, + 0.4%, New: 1%, +7%
	}.replaceAndRegister()

// Add Thorium Yields from Granite + LEGACY: Change Stone Dust to Small Stone Dust
mods.gregtech.macerator.changeByInput([item('minecraft:stone', 1)], null)
	.builder { RecipeBuilder builder ->
		builder.clearChancedOutput()
			.chancedOutput(metaitem('dustSmallStone'), 100, 40)
			.chancedOutput(metaitem('dustThorium'), 100, 500)
	}.replaceAndRegister()

// Buff Uranium Yields from Red Granite
mods.gregtech.macerator.changeByInput([item('gregtech:stone_smooth', 1)], null)
	.changeEachChancedOutput { ChancedItemOutput output ->
		return chanced(output.ingredient, 100, 100) // Original: 0.1%, + 0.05%, New: 1%, +1%
	}.replaceAndRegister()
