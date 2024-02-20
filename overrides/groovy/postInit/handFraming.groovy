import com.jaquadro.minecraft.storagedrawers.api.storage.attribute.IFrameable
import com.nomiceu.nomilabs.util.ItemMeta
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.addRecipeOutputTooltip
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translate

// Hand Framing Tool
crafting.addShaped("hand_framing_tool_recipe", item("nomilabs:hand_framing_tool"), [
        [null, null, item("storagedrawers:framingtable")],
        [null, item("minecraft:stick"), null],
        [item("minecraft:stick"), null, null]
])

// Dummy Hand Framing Recipes

// Specify Hand Framing Tool separately, so we can add its tooltip properly
List<ItemStack> items = [
        item("storagedrawers:customdrawers"),
        item("storagedrawers:customdrawers", 1),
        item("storagedrawers:customdrawers", 2),
        item("storagedrawers:customdrawers", 3),
        item("storagedrawers:customdrawers", 4),
        item("storagedrawers:customtrim"),
        item("framedcompactdrawers:framed_compact_drawer"),
        item("framedcompactdrawers:framed_slave"),
        item("framedcompactdrawers:framed_drawer_controller")
]

ItemStack tool = item("nomilabs:hand_framing_tool")
items.add(tool)

for (ItemStack stack : items) {
    for (boolean trim : [true, false]) {
        for (boolean front : [true, false]) {
            def recipeName = getRecipeName(stack, trim, front)
            def recipeStack = addNBT(stack, trim, front)
            crafting.addShaped(recipeName, recipeStack, [
                    [item("xtones:zane"), trim ? item("extendedcrafting:storage", 4) : null, null],
                    [front ? item("xtones:zane", 15) : null, stack, null],
                    [null, null, null]
            ])
            addRecipeOutputTooltip(recipeStack, resource(recipeName),
                    ItemMeta.compare(tool, recipeStack) ?
                            translate("tooltip.hand_framing.tool") :
                            translate("tooltip.hand_framing.drawer"),
                    translate("tooltip.hand_framing.top_left"),
                    translate("tooltip.hand_framing.top_right"),
                    translate("tooltip.hand_framing.bottom_left"))
        }
    }
}

static String getRecipeName(ItemStack stack, boolean trim, boolean front) {
    String baseName = "nomiceu:hand_framing_"

    if (stack.getItem().getRegistryName() != null)
        baseName = baseName + stack.getItem().getRegistryName().getNamespace() + "_" + stack.getItem().getRegistryName().getPath()

    baseName = baseName + "." + stack.getMetadata() + "_side"
    if (trim) baseName = baseName + "_trim"
    if (front) baseName = baseName + "_front"
    return baseName
}

static ItemStack addNBT(ItemStack stack, boolean trim, boolean front) {
    def sideStack = item("xtones:zane")
    def trimStack = trim ? item("extendedcrafting:storage", 4) : ItemStack.EMPTY
    def frontStack = front ? item("xtones:zane", 15) : ItemStack.EMPTY

    stack = ((IFrameable) stack.getItem()).decorate(stack.copy(), sideStack, trimStack, frontStack)

    return stack
}

