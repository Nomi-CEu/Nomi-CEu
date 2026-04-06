package post.classes

import net.minecraft.item.ItemStack
import net.minecraft.item.crafting.Ingredient
import net.minecraft.nbt.NBTTagCompound
import net.minecraftforge.fml.common.registry.ForgeRegistries

class NBTUtil {

    private static final Map<Ingredient, ItemStack[]> INGREDIENT_MATCHING_STACKS_CACHE = new IdentityHashMap<>()

    // groovylint-disable-next-line UnnecessaryGetter
    static ItemStack[] ingredientMatchingStacks(Ingredient ingredient) {
        var cachedStacks = INGREDIENT_MATCHING_STACKS_CACHE.get(ingredient)
        if (cachedStacks != null) return cachedStacks

        for (var item : ForgeRegistries.ITEMS) {
            for (int meta = 0; meta < 128; meta++) {
                var candidate = new ItemStack(item, 1, meta)
                if (candidate.empty) continue
                if (!ingredient.apply(candidate)) continue

                ItemStack[] resolvedStacks = [candidate.copy()] as ItemStack[]
                INGREDIENT_MATCHING_STACKS_CACHE.put(ingredient, resolvedStacks)
                return resolvedStacks
            }
        }

        ItemStack[] resolvedStacks = [] as ItemStack[]
        INGREDIENT_MATCHING_STACKS_CACHE.put(ingredient, resolvedStacks)
        return resolvedStacks
    }

    static NBTTagCompound getTag(ItemStack stack) {
        // groovylint-disable-next-line UnnecessaryGetter
        return stack.getTagCompound() as NBTTagCompound
    }

}
