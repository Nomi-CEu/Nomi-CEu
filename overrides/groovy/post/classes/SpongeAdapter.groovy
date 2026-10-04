package post.classes

import net.minecraft.item.EnumDyeColor
import net.minecraft.item.ItemStack
import net.minecraft.item.crafting.Ingredient

/**
 * Central adapter for Sponge compatibility issues.
 * All workarounds for Sponge behavior should be implemented here.
 */
class SpongeAdapter {

    // Returns stack size for objects exposing either count or amount.
    static int getSize(Object obj) {
        if (obj == null) return 1
        if (obj.hasProperty('count')) return obj.count as int
        if (obj.hasProperty('amount')) return obj.amount as int
        return 1
    }

    // Sets stack size for objects exposing either count or amount.
    static void setSize(Object obj, int value) {
        if (obj == null) return
        if (obj.hasProperty('count')) obj.count = value
        else if (obj.hasProperty('amount')) obj.amount = value
    }

    static ItemStack[] matchingStacks(Ingredient ing) {
        return ing.hasProperty('matchingStacks') ? ing.matchingStacks : NBTUtil.ingredientMatchingStacks(ing)
    }

    // Backward-compatible alias for older call sites.
    static ItemStack[] getMatchingStacks(Ingredient ing) {
        return matchingStacks(ing)
    }

    // Dye helpers for cross-runtime enum metadata access.
    static EnumDyeColor getDyeByIndex(int index) {
        return EnumDyeColor.values()[index]
    }

    static int getDyeMeta(EnumDyeColor dye) {
        if (dye.hasProperty('metadata')) return dye.metadata as int
        return dye.ordinal()
    }

}
