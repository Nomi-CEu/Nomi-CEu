import com.nomiceu.nomilabs.util.LabsModeHelper

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
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
