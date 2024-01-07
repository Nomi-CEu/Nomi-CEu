import com.jaquadro.minecraft.storagedrawers.api.storage.attribute.IFrameable

// Hand Framing Tool
crafting.addShaped(item("nomilabs:hand_framing_tool"), [
        [null, null, item("storagedrawers:framingtable")],
        [null, item("minecraft:stick"), null],
        [item("minecraft:stick"), null, null]
])

// Dummy Recipes for Hand Framing Tool
List<ItemStack> items = [
        item("storagedrawers:customdrawers"),
        item("storagedrawers:customdrawers", 1),
        item("storagedrawers:customdrawers", 2),
        item("storagedrawers:customdrawers", 3),
        item("storagedrawers:customdrawers", 4),
        item("storagedrawers:customtrim"),
        item("framedcompactdrawers:framed_compact_drawer"),
        item("framedcompactdrawers:framed_slave"),
        item("framedcompactdrawers:framed_drawer_controller"),
        item("nomilabs:hand_framing_tool")
]

for (ItemStack stack : items) {
    for (boolean trim : [true, false]) {
        for (boolean front : [true, false]) {
            crafting.addShaped(addNBT(stack, trim, front), [
                    [item("xtones:zane"), trim ? item("extendedcrafting:storage", 4) : null, null],
                    [front ? item("xtones:zane", 15) : null, stack, null],
                    [null, null, null]
            ])
        }
    }
}

ItemStack addNBT(ItemStack stack, boolean trim, boolean front) {
    def sideStack = item("xtones:zane")
    def trimStack = trim ? item("extendedcrafting:storage", 4) : ItemStack.EMPTY
    def frontStack = front ? item("xtones:zane", 15) : ItemStack.EMPTY

    stack = ((IFrameable) stack.getItem()).decorate(stack.copy(), sideStack, trimStack, frontStack)

    NBTTagCompound compound = stack.getTagCompound() ?: new NBTTagCompound()

    compound.setBoolean("labs-needs-hand-framing-description", true)
    stack.setTagCompound(compound)

    return stack
}

