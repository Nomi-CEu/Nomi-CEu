import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
	[[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
	 [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
	 [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])

// Replace small piles from Rare Earth centrifuging with large piles
mods.gregtech.centrifuge.removeByInput(20, [metaitem('dustRareEarth')], null)
mods.gregtech.centrifuge.recipeBuilder()
    .inputs(metaitem('dustRareEarth'))
    .chancedOutput(metaitem('dustCadmium'), 625, 100)
    .chancedOutput(metaitem('dustNeodymium'), 625, 100)
    .chancedOutput(metaitem('dustSamarium'), 625, 100)
    .chancedOutput(metaitem('dustCerium'), 625, 100)
    .chancedOutput(metaitem('dustYttrium'), 625, 100)
    .chancedOutput(metaitem('dustLanthanum'), 625, 100)
    .duration(64)
    .EUt(20)
    .buildAndRegister()
