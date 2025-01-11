import com.cleanroommc.groovyscript.api.IIngredient
import com.jaquadro.minecraft.storagedrawers.api.storage.attribute.IFrameable
import com.nomiceu.nomilabs.groovy.ShapedDummyRecipe
import com.nomiceu.nomilabs.util.ItemMeta
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable

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
			def recipeStack = addNBT(stack, trim, front)

			crafting.shapedBuilder()
				.output(recipeStack)
				.matrix('ST ', 'FI ', '   ')
				.key('S', item("xtones:zane"))
				.key('T', trim ? item("extendedcrafting:storage", 4) : IIngredient.EMPTY)
				.key('F', front ? item("xtones:zane", 15) : IIngredient.EMPTY)
				.key('I', stack)
				.recipeClassFunction((output, width, height, ingredients) -> new ShapedDummyRecipe(output, ingredients, width, height, false))
				.setOutputTooltip(
					ItemMeta.compare(tool, recipeStack) ?
						translatable("nomiceu.tooltip.labs.hand_framing.tool") :
						translatable("nomiceu.tooltip.labs.hand_framing.drawer"),
					translatable("nomiceu.tooltip.labs.hand_framing.top_left"),
					translatable("nomiceu.tooltip.labs.hand_framing.top_right"),
					translatable("nomiceu.tooltip.labs.hand_framing.bottom_left")
				).register()
		}
	}
}

static ItemStack addNBT(ItemStack stack, boolean trim, boolean front) {
	def sideStack = item("xtones:zane")
	def trimStack = trim ? item("extendedcrafting:storage", 4) : ItemStack.EMPTY
	def frontStack = front ? item("xtones:zane", 15) : ItemStack.EMPTY

	def frameable = (IFrameable) stack.getItem()
	stack = frameable.decorate(stack.copy(), sideStack, trimStack, frontStack)
	if (stack == null)
		return stack

	return stack
}
