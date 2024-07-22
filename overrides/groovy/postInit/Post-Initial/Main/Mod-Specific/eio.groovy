import net.minecraft.item.ItemStack
import classes.postInit.EioPrefixes

/* Cleanup EIO Glasses in JEI
 * Since we are lazy, remove all, then add back the original
 */
for (var stack in EioPrefixes.getAllItems()) {
	mods.jei.ingredient.hide(new ItemStack(stack.getItem(), 1, Short.MAX_VALUE))
	mods.jei.ingredient.add(stack.copy())
}
