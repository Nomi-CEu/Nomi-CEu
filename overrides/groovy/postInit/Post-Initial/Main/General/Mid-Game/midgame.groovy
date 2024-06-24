import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
		[[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
		 [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
		 [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])



// PBI ingots into block
PBIingot = ore('ingotPolybenzimidazole')
crafting.addShapeless(metaitem('blockPolybenzimidazole'), PBIingot * 9)

// PBI block into ingots
 
crafting.addShapeless(metaitem('ingotPolybenzimidazole') * 9, ore('blockPolybenzimidazole'))
