package postInit.main.modSpecific

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import net.minecraft.item.ItemStack
import classes.postInit.Common

import static gregtech.api.GTValues.*

/* Cleanup EIO Glasses in JEI, removing the dyed versions of each variant of glass
 * Since we are lazy, remove all, then add back the original
 */
for (var stack in Common.eioGlasses) {
	mods.jei.ingredient.hide(new ItemStack(stack.getItem(), 1, Short.MAX_VALUE))
	mods.jei.ingredient.add(stack.copy())
}

// ME Conduit - Crafting Table
crafting.shapedBuilder()
	.output(item('enderio:item_me_conduit'))
	.matrix('BBB', 'PPP', 'BBB')
	.key('B', ore('itemConduitBinder'))
	.key('P', item('appliedenergistics2:part', 36))
	.replace().register()

// ME Conduit
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('appliedenergistics2:part', 36) * 3, item('enderio:item_material', 4) * 6)
	.outputs(item('enderio:item_me_conduit') * 2)
	.duration(100).EUt(VHA[LV])
	.buildAndRegister()

// Dense ME Conduit - Assembler
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('enderio:item_me_conduit') * 4, ore('itemConduitBinder') * 5)
	.outputs(item('enderio:item_me_conduit', 1) * 2)
	.duration(80).EUt(VHA[LV])
	.buildAndRegister();

// Replace the 'old' Glowstone nano particles with the 'not old' one
// Not really serving any purpose, but removing the need for two items that do the same thing
mods.jei.ingredient.hide(item('enderio:block_holy_fog'))
mods.gregtech.macerator.changeByOutput([item('enderio:block_holy_fog')], null)
	.forEach { ChangeRecipeBuilder b ->
		b.changeEachOutput {item('enderio:block_holier_fog') }
			.replaceAndRegister()
	}
// Fix Reaper Enchanter Recipe
mods.enderio.enchanter.remove(enchantment('draconicevolution:enchant_reaper'))

mods.enderio.enchanter.recipeBuilder()
	.enchantment(enchantment('draconicevolution:enchant_reaper'))
	.input(ore('blockDraconium'))
	.xpCostMultiplier(1)
	.register()
