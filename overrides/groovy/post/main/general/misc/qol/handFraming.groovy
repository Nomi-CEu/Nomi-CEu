package post.main.general.misc.qol

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable

import com.cleanroommc.groovyscript.api.IIngredient
import com.jaquadro.minecraft.storagedrawers.api.storage.attribute.IFrameable
import com.nomiceu.nomilabs.groovy.ShapedDummyRecipe
import com.nomiceu.nomilabs.util.ItemMeta
import net.minecraft.item.ItemStack

// Hand Framing Tool
crafting.addShaped('hand_framing_tool_recipe', item('nomilabs:hand_framing_tool'), [
    [null, null, item('storagedrawers:framingtable')],
    [null, item('minecraft:stick'), null],
    [item('minecraft:stick'), null, null],
])

// Dummy Hand Framing Recipes

// Specify Hand Framing Tool separately, so we can add its tooltip properly
List<ItemStack> items = [
    item('storagedrawers:customdrawers').first,
    item('storagedrawers:customdrawers', 1).first,
    item('storagedrawers:customdrawers', 2).first,
    item('storagedrawers:customdrawers', 3).first,
    item('storagedrawers:customdrawers', 4).first,
    item('storagedrawers:customtrim').first,
    item('framedcompactdrawers:framed_compact_drawer').first,
    item('framedcompactdrawers:framed_slave').first,
    item('framedcompactdrawers:framed_drawer_controller').first,
]

ItemStack tool = item('nomilabs:hand_framing_tool').first
items.add(tool)

for (ItemStack stack : items) {
    for (boolean trim : [true, false]) {
        for (boolean front : [true, false]) {
            var recipeStack = addNBT(stack, trim, front)

            crafting.shapedBuilder()
                .output(recipeStack)
                .matrix('ST ', 'FI ', '   ')
                .key('S', item('xtones:zane'))
                .key('T', trim ? item('extendedcrafting:storage', 4) : IIngredient.EMPTY)
                .key('F', front ? item('xtones:zane', 15) : IIngredient.EMPTY)
                .key('I', stack)
                .recipeClassFunction { output, width, height, ingredients ->
                    new ShapedDummyRecipe(output, ingredients, width, height, false)
                }.setOutputTooltip(
                    ItemMeta.compare(tool, recipeStack) ?
                        translatable('nomiceu.tooltip.labs.hand_framing.tool') :
                        translatable('nomiceu.tooltip.labs.hand_framing.drawer'),
                    translatable('nomiceu.tooltip.labs.hand_framing.top_left'),
                    translatable('nomiceu.tooltip.labs.hand_framing.top_right'),
                    translatable('nomiceu.tooltip.labs.hand_framing.bottom_left')
                ).register()
        }
    }
}

static ItemStack addNBT(ItemStack stack, boolean trim, boolean front) {
    ItemStack sideStack = item('xtones:zane').first
    ItemStack trimStack = trim ? item('extendedcrafting:storage', 4).first : IIngredient.EMPTY.first
    ItemStack frontStack = front ? item('xtones:zane', 15).first : IIngredient.EMPTY.first
    var frameable = (IFrameable) stack.item
    return frameable.decorate(stack.copy(), sideStack, trimStack, frontStack)
}
