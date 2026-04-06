package post.classes

/**
 * Central adapter for Sponge compatibility issues.
 * All workarounds for Sponge behavior should be implemented here.
 */
class SpongeAdaptor {

    /**
     * Returns stack size for objects exposing either count or amount.
     */
    static int getItemStackSize(Object obj) {
        if (obj == null) return 1
        if (obj.hasProperty('count')) return obj.count as int
        if (obj.hasProperty('amount')) return obj.amount as int
        return 1
    }

    /**
     * Sets stack size for objects exposing either count or amount.
     */
    static void setItemStackSize(Object obj, int value) {
        if (obj == null) return
        if (obj.hasProperty('count')) obj.count = value
        else if (obj.hasProperty('amount')) obj.amount = value
    }

}
