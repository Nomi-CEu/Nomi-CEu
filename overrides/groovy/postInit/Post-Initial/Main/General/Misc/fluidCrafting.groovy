import com.nomiceu.nomilabs.util.LabsModeHelper
import com.nomiceu.nomilabs.groovy.SimpleIIngredient
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack
import net.minecraftforge.fluids.FluidUtil
import net.minecraftforge.fluids.capability.CapabilityFluidHandler
import net.minecraftforge.fluids.capability.IFluidHandlerItem

/*
 * Allows Recipes with Water/Lava Bucket to Accept All Fluid Containers.
 * Also adds other misc. fluid crafting recipes.
 */

/* Existing Replacements */

// Water Bucket

// Lava Bucket

// Milk Bucket

/* New Recipes */

if (LabsModeHelper.normal) {
	// Dust -> Clay
	crafting.addShapeless(item('minecraft:clay'), [item('nomilabs:block_dust'), fluidIng(fluid('water'))])
}

// NC Water Source
crafting.shapedBuilder()
	.output(item('nuclearcraft:water_source'))
	.matrix(
		'AAA',
		'B B',
		'AAA')
	.key('A', LabsModeHelper.expert ? ore('plateDoubleSteel') : ore('plateWroughtIron'))
	.key('B', fluidIng(fluid('water')))
	.replace()
	.register()

// NC Cobblestone Generator
crafting.shapedBuilder()
	.output(item('nuclearcraft:cobblestone_generator'))
	.matrix(
		'AAA',
		'B C',
		'AAA')
	.key('A', LabsModeHelper.expert ? ore('plateBlackSteel') : ore('plateWroughtIron'))
	.key('B', fluidIng(fluid('water')))
	.key('C', fluidIng(fluid('lava')))
	.replace()
	.mirrored()
	.register()

// Lava Factory
crafting.shapedBuilder()
	.output(item('actuallyadditions:block_lava_factory_controller'))
	.matrix(
		'ABA',
		'CDC')
	.key('A', item('actuallyadditions:item_misc', 8)) // Advanced Coil
	.key('B', item('actuallyadditions:block_misc', 7)) // Lava Factory Casing
	.key('C', fluidIng(fluid('lava')))
	.key('D', item('morefurnaces:furnaceblock', 3)) // Obsidian Furnace
	.replace()
	.mirrored()
	.register()

// Pyroclastic Injection
crafting.shapedBuilder()
	.output(item('thermalexpansion:augment', 496))
	.matrix(
		'ABA',
		'BCB',
		'ABA')
	.key('A', ore('ingotMithril'))
	.key('B', ore('plateMithril'))
	.key('C', fluidIng(fluid('water')))
	.replace()
	.register()

// Obsidian Quick Craft
crafting.addShapeless(item('minecraft:obsidian'), [fluidIng(fluid('water')), fluidIng(fluid('lava'))])

/* Classes and Helpers */

// IIngredient Class that Matches Based on FluidStack in Containers
class IngredientFluidBucket extends SimpleIIngredient {
	static AMOUNT = 1000

	FluidStack stack
	ItemStack bucketForm

	IngredientFluidBucket(FluidStack stack) {
		this.stack = stack * AMOUNT
		this.bucketForm = FluidUtil.getFilledBucket(stack)
	}

	@Override
	ItemStack[] getMatchingStacks() { return new ItemStack[]{ bucketForm } }

	@Override
	boolean test(ItemStack itemStack) {
		var handler = getHandler(itemStack)

		if (handler == null) return false

		FluidStack drained = handler.drain(stack, false)
		return drained != null && drained.amount >= AMOUNT && drained.isFluidEqual(stack)
	}

	@Override
	ItemStack applyTransform(ItemStack matchedInput) {
		matchedInput = matchedInput.copy()

		if (matchedInput.getItem().hasContainerItem(matchedInput))
			return super.applyTransform(matchedInput)

		var handler = getHandler(matchedInput)
		if (handler == null) return super.applyTransform(matchedInput)
		handler.drain(stack, true)

		return handler.getContainer() * 1
	}

	static IFluidHandlerItem getHandler(ItemStack itemStack) {
		if (itemStack.isEmpty()) return null

		IFluidHandlerItem handler = null
		if (itemStack.hasCapability(CapabilityFluidHandler.FLUID_HANDLER_ITEM_CAPABILITY, null)) {
			if (itemStack.getCount() > 1) {
				itemStack = itemStack.copy()
				itemStack.setCount(1)
			}
			handler = itemStack.getCapability(CapabilityFluidHandler.FLUID_HANDLER_ITEM_CAPABILITY, null)
		}
		return handler
	}
}

static IngredientFluidBucket fluidIng(FluidStack stack) {
	return new IngredientFluidBucket(stack)
}
