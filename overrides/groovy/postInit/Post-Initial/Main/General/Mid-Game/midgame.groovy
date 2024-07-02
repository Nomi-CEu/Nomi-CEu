import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
	[[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
	 [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
	 [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])

// PBI ingots into block
crafting.addShapeless(metaitem('blockPolybenzimidazole'), [ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole'), ore('ingotPolybenzimidazole')])

// PBI block into ingots
crafting.addShapeless(metaitem('ingotPolybenzimidazole') * 9, [ore('blockPolybenzimidazole')])
