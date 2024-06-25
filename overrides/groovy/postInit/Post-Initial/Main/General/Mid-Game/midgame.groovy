import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
        [[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
         [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
         [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])

// PBI ingots into block
def ingotPolybenzimidazole = ore('ingotPolybenzimidazole')
def blockPolybenzimidazole = metaitem('blockPolybenzimidazole')
def inputList1 = [ingotPolybenzimidazole] * 9 // Create a list with 9 instances of ingotPolybenzimidazole
crafting.addShapeless(blockPolybenzimidazole, inputList1)

// PBI block into ingots
def blockPolybenzimidazole2 = ore('blockPolybenzimidazole') // Redefining to avoid conflicts
def ingotPolybenzimidazole2 = metaitem('ingotPolybenzimidazole')
def inputList2 = [blockPolybenzimidazole2] * 9 // Create a list with 9 instances of blockPolybenzimidazole
crafting.addShapeless(ingotPolybenzimidazole2 * 9, inputList2)
