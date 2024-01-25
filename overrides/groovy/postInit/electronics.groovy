import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*
import static gregtech.api.recipes.RecipeMaps.*

// Pyrolyse Oven
replaceRecipeInput(metaitem('pyrolyse_oven'), [
		[metaitem('electric.piston.lv'), ore('circuitLv'), ore('wireGtQuadrupleCupronickel')],
		[ore('circuitLv'), metaitem('hull.ulv'), ore('circuitLv')],
		[metaitem('electric.piston.lv'), metaitem('electric.pump.lv'), ore('wireGtQuadrupleCupronickel')]])

// HV Coil
mods.gregtech.assembler.removeByInput(480, [metaitem('stickSteelMagnetic'), metaitem('wireFineBlackSteel') * 16, metaitem('circuit.integrated').withNbt([Configuration: 1])], null)
ASSEMBLER_RECIPES.recipeBuilder()
		.inputs(metaitem('stickSteelMagnetic'), metaitem('wireFineSilver') * 16)
		.circuitMeta(1)
		.outputs(metaitem('voltage_coil.hv'))
		.withRecycling()
		.duration(200)
		.EUt(480)
		.buildAndRegister()