package post.classes

import net.minecraft.item.EnumDyeColor
import net.minecraft.item.ItemStack

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

    // Converts script ingredients to ItemStack for Sponge-safe handling.
    static ItemStack toItemStack(Object ingredient) {
        if (ingredient == null) return ItemStack.EMPTY
        if (ingredient instanceof ItemStack) return ingredient as ItemStack
        if (ingredient.hasProperty('first')) return ingredient.first as ItemStack
        return ItemStack.EMPTY
    }

    static ItemStack itemStack(String name) {
        return toItemStack(item(name))
    }

    static ItemStack itemStack(String name, int meta) {
        return toItemStack(item(name, meta))
    }

    // Dye helpers for cross-runtime enum metadata access.
    static EnumDyeColor getDyeByIndex(int index) {
        return EnumDyeColor.values()[index]
    }

    static int getDyeMeta(EnumDyeColor dye) {
        if (dye.hasProperty('metadata')) return dye.metadata as int
        if (dye.hasProperty('getMetadata')) return dye.getMetadata() as int
        return dye.ordinal()
    }

}
