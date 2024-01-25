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

// Refresh HV Energy and HV Dynamo Recipes
// Since stacks are not stored, they cannot simply be reloaded, we must recall.
// TODO Remove once we get Recursive Recycling Removal
changeStackRecycling(metaitem('energy_hatch.input.hv'), [metaitem('hull.hv'), metaitem('springGold') * 2, metaitem('plate.low_power_integrated_circuit') * 2, metaitem('voltage_coil.hv')])
changeStackRecycling(metaitem('energy_hatch.output.hv'), [metaitem('hull.hv'), metaitem('cableGtSingleGold') * 2, metaitem('plate.low_power_integrated_circuit') * 2, metaitem('voltage_coil.hv')])
