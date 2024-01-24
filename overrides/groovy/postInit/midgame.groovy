import com.nomiceu.nomilabs.util.LabsModeHelper

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.replaceRecipeOutput

if (LabsModeHelper.isNormal()) {
	// Assembly Control Casing (Change from Output 2 to Output 4)
	replaceRecipeOutput('casing_assembly_control', item('gregtech:multiblock_casing', 3) * 4)
}