import com.google.common.base.CaseFormat
import com.nomiceu.nomilabs.util.LabsModeHelper
import com.nomiceu.nomilabs.groovy.SimpleIIngredient
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.Fluid
import net.minecraftforge.fluids.FluidStack
import net.minecraftforge.fluids.FluidUtil
import net.minecraftforge.fluids.capability.CapabilityFluidHandler
import net.minecraftforge.fluids.capability.IFluidHandlerItem

import static com.nomiceu.nomilabs.util.LabsTranslate.Translatable
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translate
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable

/*
 * Allows recipes with buckets to accept all fluid containers.
 * Also adds other misc. fluid crafting recipes.
 */

/* Starter OreDicts */
ore('dough').add(item('actuallyadditions:item_misc', 4))
ore('dough').add(item('actuallyadditions:item_misc', 9))

/* Existing Replacements (Recipe itself not changed) */

/* Water Bucket */

// AE2 Cable Cleaning
var caseConverter = CaseFormat.LOWER_UNDERSCORE.converterTo(CaseFormat.UPPER_CAMEL)
for (var entry : [0: 'glass', 20: 'covered', 40: 'smart', 60: 'dense_smart', 500: 'dense_covered']) {
	var cables = ore("ae2Colored${caseConverter.convert(entry.value)}Cable")
	var output = item('appliedenergistics2:part', entry.key + 16)

	for (var meta : entry.key..entry.key + 15) {
		cables.add(item('appliedenergistics2:part', meta))
	}

	crafting.remove("appliedenergistics2:network/cables/${entry.value}_fluix_clean")
	crafting.shapelessBuilder()
		.output(output)
		.input(cables, fluidIng(fluid('water')))
		.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('water')))
		.replace().register()
}

// Paper
crafting.remove('thermalfoundation:paper')
crafting.shapelessBuilder()
	.output(item('minecraft:paper') * 2)
	.input(ore('dustWood'), ore('dustWood'), ore('dustWood'), ore('dustWood'), fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.register()

// Podzol
crafting.remove('thermalfoundation:block_podzol')
crafting.shapelessBuilder()
	.output(item('minecraft:dirt', 2))
	.input(ore('treeLeaves'), ore('treeLeaves'), item('minecraft:dirt', 1),
		item('thermalfoundation:fertilizer', 1), fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.register()

// Mycelium
crafting.remove('thermalfoundation:block_mycelium')
crafting.shapelessBuilder()
	.output(item('minecraft:mycelium'))
	.input(item('minecraft:brown_mushroom'), item('minecraft:red_mushroom'), item('minecraft:dirt', 1),
		item('thermalfoundation:fertilizer', 1), fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.register()

// Little Tiles Water
crafting.shapelessBuilder()
	.output(item('littletiles:lttransparentcoloredblock', 5) * 2)
	.input(fluidIng(fluid('water')), fluidIng(fluid('water')))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.replace().register()

// Waterstone
crafting.shapedBuilder()
	.output(item('chisel:waterstone') * 8)
	.matrix('AAA', 'ABA', 'AAA')
	.key('A', item('minecraft:stone'))
	.key('B', fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.replace().register()

// Water Mob Filter
crafting.remove('darkutils:filter_water')
crafting.shapedBuilder()
	.output(item('darkutils:filter', 5) * 4)
	.matrix('ABA', 'BCB', 'ABA')
	.key('A', ore('fenceGateWood'))
	.key('B', ore('stone'))
	.key('C', fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.register()

// Rice Slimeball
crafting.remove('actuallyadditions:recipes24')
crafting.shapedBuilder()
	.output(item('actuallyadditions:item_misc', 12) * 4)
	.matrix(' A ', 'ABA', ' A ')
	.key('A', item('actuallyadditions:item_misc', 9))
	.key('B', fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.register()

// Ring of Liquid Banning
crafting.shapedBuilder()
	.output(item('actuallyadditions:item_water_removal_ring'))
	.matrix('ABA', 'BCB', 'ABA')
	.key('A', fluidIng(fluid('water')))
	.key('B', item('actuallyadditions:item_crystal_empowered', 2))
	.key('C', item('actuallyadditions:item_misc', 6))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(2, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(6, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(8, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.replace().register()

// Red Machine -> Blank Machine
crafting.remove('enderio:deco_block_1_1_f')
crafting.shapelessBuilder()
	.output(item('enderio:block_decoration1', 1))
	.input(item('enderio:block_decoration1', 13), fluidIng(fluid('water')))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.register()

// Hard Mode Recipes
if (LabsModeHelper.expert) {
	// Paper
	crafting.remove('gregtech:paper')
	crafting.shapedBuilder()
		.output(item('minecraft:paper') * 2)
		.matrix(' M ', 'DDD', ' W ')
		.key('M', ore('toolMallet'))
		.key('D', ore('dustPaper'))
		.key('W', fluidIng(fluid('water')))
		.setInputTooltip(7, IngredientFluidBucket.getInputTooltip(fluid('water')))
		.register()

	// Bricks
	crafting.remove('gregtech:brick_from_water')
	crafting.shapedBuilder()
		.output(item('minecraft:brick_block') * 2)
		.matrix('BBB', 'BWB', 'BBB')
		.key('B', item('minecraft:brick'))
		.key('W', fluidIng(fluid('water')))
		.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
		.register()

	// Concrete Bucket recipe is changed, see below
}

/* Lava Bucket */

// Little Tiles Lava
crafting.shapelessBuilder()
	.output(item('littletiles:ltcoloredblock', 12))
	.input(fluidIng(fluid('lava')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.replace().register()

// Lavastone
crafting.shapedBuilder()
	.output(item('chisel:lavastone') * 8)
	.matrix('AAA', 'ABA', 'AAA')
	.key('A', item('minecraft:stone'))
	.key('B', fluidIng(fluid('lava')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.replace().register()

// Nullifier
crafting.removeByOutput(item('thermalexpansion:device', 1))
crafting.shapedBuilder()
	.output(item('thermalexpansion:device', 1)
		.withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 0, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1],
				  'RSControl': (byte) 0, 'Energy': 0]))
	.matrix(' A ', 'BCB', 'DED')
	.key('A', fluidIng(fluid('lava')))
	.key('B', item('minecraft:brick_block'))
	.key('C', item('thermalexpansion:frame', 64))
	.key('D', ore('gearIron'))
	.key('E', item('thermalfoundation:material', 512))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.register()

// Void Satchel
crafting.shapedBuilder()
	.output(item('thermalexpansion:satchel', 100))
	.matrix(' A ', 'BCB', 'A A')
	.key('A', item('minecraft:leather'))
	.key('B', ore('stone'))
	.key('C', fluidIng(fluid('lava')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.replace().register()

/* Milk Bucket */

// White Water
crafting.shapelessBuilder()
	.output(item('littletiles:lttransparentcoloredblock', 6))
	.input(fluidIng(fluid('milk')), item('littletiles:lttransparentcoloredblock', 5))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

// White Lava
crafting.shapelessBuilder()
	.output(item('littletiles:ltcoloredblock', 14))
	.input(fluidIng(fluid('milk')), item('littletiles:ltcoloredblock', 12))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

// Pet Mob Filter
crafting.remove('darkutils:filter_pet')
crafting.shapedBuilder()
	.output(item('darkutils:filter', 7) * 4)
	.matrix('ABA', 'BCB', 'ABA')
	.key('A', ore('fenceGateWood'))
	.key('B', ore('stone'))
	.key('C', fluidIng(fluid('milk')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.register()

// Chocolate Coin
crafting.shapelessBuilder()
	.output(metaitem('coin.chocolate'))
	.input(ore('dustCocoa'), ore('foilGold'), fluidIng(fluid('milk')), ore('dustSugar'))
	.setInputTooltip(3, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

// Cheese
crafting.shapelessBuilder()
	.output(item('actuallyadditions:item_food'))
	.input(fluidIng(fluid('milk')), ore('egg'))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

// Chocolate
crafting.shapedBuilder()
	.output(item('actuallyadditions:item_food', 9) * 3)
	.matrix('C C', 'CMC', 'C C')
	.key('C', item('minecraft:dye', 3))
	.key('M', fluidIng(fluid('milk')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

// Chocolate Cake
crafting.shapedBuilder()
	.output(item('actuallyadditions:item_food', 8))
	.matrix('MMM', 'CCC', 'EDS')
	.key('M', fluidIng(fluid('milk')))
	.key('C', item('minecraft:dye', 3))
	.key('E', ore('egg'))
	.key('D', ore('dough'))
	.key('S', ore('dustSugar'))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.setInputTooltip(2, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

/* Misc */

// Treated Wood
crafting.shapedBuilder()
	.output(item('gregtech:planks', 1) * 8)
	.matrix('AAA', 'ABA', 'AAA')
	.key('A', ore('plankWood'))
	.key('B', fluidIng(fluid('creosote')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('creosote')))
	.replace().register()

// Torch
crafting.shapedBuilder()
	.output(item('minecraft:torch') * 16)
	.matrix('AB', 'C ')
	.key('A', ore('wool'))
	.key('B', fluidIng(fluid('creosote')))
	.key('C', ore('stick'))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('creosote')))
	.replace().register()

// Concrete Cell + Firebricks
if (LabsModeHelper.expert) {
	crafting.shapedBuilder()
		.output(IngredientFluidBucket.fillStack(metaitem('fluid_cell'), fluid('concrete') * 1000))
		.matrix('ABC', 'ADE', ' F ')
		.key('A', ore('dustCalcite'))
		.key('B', metaitem('fluid_cell'))
		.key('C', ore('dustStone'))
		.key('D', fluidIng(fluid('water')))
		.key('E', ore('dustQuartzSand'))
		.key('F', ore('dustClay'))
		.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
		.replace().register()

	crafting.shapedBuilder()
		.output(item('gregtech:metal_casing', 1))
		.matrix('BGB', 'BCB', 'BGB')
		.key('B', metaitem('brick.fireclay'))
		.key('G', ore('dustGypsum'))
		.key('C', fluidIng(fluid('concrete')))
		.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('concrete')))
		.replace().register()
}

/* New Recipes */

if (LabsModeHelper.normal) {
	// Dust -> Clay
	crafting.shapelessBuilder()
		.output(item('minecraft:clay'))
		.input(item('nomilabs:block_dust'), fluidIng(fluid('water')))
		.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('water')))
		.register()
}

// NC Water Source
crafting.shapedBuilder()
	.output(item('nuclearcraft:water_source'))
	.matrix('AAA', 'B B', 'AAA')
	.key('A', LabsModeHelper.expert ? ore('plateDoubleSteel') : ore('plateWroughtIron'))
	.key('B', fluidIng(fluid('water')))
    .setInputTooltip(3, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(5, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.replace().register()

// NC Cobblestone Generator
crafting.shapedBuilder()
	.output(item('nuclearcraft:cobblestone_generator'))
	.matrix('AAA', 'B C', 'AAA')
	.key('A', LabsModeHelper.expert ? ore('plateBlackSteel') : ore('plateWroughtIron'))
	.key('B', fluidIng(fluid('water')))
	.key('C', fluidIng(fluid('lava')))
	.setInputTooltip(3, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(5, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.setOutputTooltip(translatable('nomiceu.tooltip.mixed.mirrorable'))
	.replace().mirrored().register()

// Lava Factory
crafting.shapedBuilder()
	.output(item('actuallyadditions:block_lava_factory_controller'))
	.matrix('ABA', 'CDC')
	.key('A', item('actuallyadditions:item_misc', 8)) // Advanced Coil
	.key('B', item('actuallyadditions:block_misc', 7)) // Lava Factory Casing
	.key('C', fluidIng(fluid('lava')))
	.key('D', item('morefurnaces:furnaceblock', 3)) // Obsidian Furnace
	.setInputTooltip(6, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.setInputTooltip(8, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.replace().register()

// Pyroclastic Injection
crafting.shapedBuilder()
	.output(item('thermalexpansion:augment', 496))
	.matrix('ABA', 'BCB', 'ABA')
	.key('A', ore('ingotMithril'))
	.key('B', ore('plateMithril'))
	.key('C', fluidIng(fluid('water')))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.replace().register()

// Obsidian Quick Craft
crafting.shapelessBuilder()
	.output(item('minecraft:obsidian'))
	.input(fluidIng(fluid('water')), fluidIng(fluid('lava')))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('water')))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('lava')))
	.register()

// Cake Base
crafting.shapedBuilder()
	.output(item('enderio:item_material', 70))
	.matrix('SMS', 'DDD')
	.key('S', ore('dustSugar'))
	.key('M', fluidIng(fluid('milk')))
	.key('D', ore('dough'))
	.setInputTooltip(4, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

// Cake
crafting.shapedBuilder()
	.output(item('minecraft:cake'))
	.matrix('BBB', 'SES', 'DDD')
	.key('B', fluidIng(fluid('milk')))
	.key('S', ore('dustSugar'))
	.key('E', ore('egg'))
	.key('D', ore('dough'))
	.setInputTooltip(0, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.setInputTooltip(1, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.setInputTooltip(2, IngredientFluidBucket.getInputTooltip(fluid('milk')))
	.replace().register()

/* Classes and Helpers */

// IIngredient Class that Matches Based on FluidStack in Containers
class IngredientFluidBucket extends SimpleIIngredient {
	public static final AMOUNT = 1000
	// Example Fills (excludes bucket)
	private static final List<ItemStack> fillables = [
		metaitem('fluid_cell'),
		metaitem('fluid_cell.universal'),
		metaitem('nomilabs:bronze_cell'),
		metaitem('large_fluid_cell.steel'),
		metaitem('large_fluid_cell.aluminium'),
		metaitem('large_fluid_cell.stainless_steel'),
		metaitem('large_fluid_cell.titanium'),
		metaitem('large_fluid_cell.tungstensteel'),
		metaitem('fluid_cell.glass_vial'),
		metaitem('drum.bronze'),
		metaitem('drum.gold'),
		metaitem('drum.steel'),
		metaitem('drum.aluminium'),
		metaitem('drum.stainless_steel'),
		metaitem('drum.titanium'),
		metaitem('drum.tungstensteel'),
		item('enderio:block_tank'),
		item('enderio:block_tank', 1),
		item('thermalexpansion:tank').withNbt(['RSControl': (byte) 0, 'Creative': (byte) 0, 'Level': (byte) 0]),
		item('thermalexpansion:tank').withNbt(['RSControl': (byte) 0, 'Creative': (byte) 0, 'Level': (byte) 1]),
		item('thermalexpansion:tank').withNbt(['RSControl': (byte) 0, 'Creative': (byte) 0, 'Level': (byte) 2]),
		item('thermalexpansion:tank').withNbt(['RSControl': (byte) 0, 'Creative': (byte) 0, 'Level': (byte) 3]),
		item('thermalexpansion:tank').withNbt(['RSControl': (byte) 0, 'Creative': (byte) 0, 'Level': (byte) 4]),
	]

	private final FluidStack stack
	private final ItemStack[] matchingStacks

	IngredientFluidBucket(FluidStack stack) {
		this.stack = stack * AMOUNT

		List<ItemStack> matchingStacks = [FluidUtil.getFilledBucket(this.stack)]

		for (ItemStack fill : fillables) {
			var toFill = fill.copy()

			var handler = getHandler(toFill)
			if (handler == null) continue

			int capacity = handler.tankProperties[0].capacity
			if (capacity <= 0) capacity = AMOUNT

			int filled = handler.fill(stack * capacity, true)

			if (filled == capacity)
				matchingStacks.add(toFill)
		}

		this.matchingStacks = matchingStacks.toArray()
	}

	@Override
	ItemStack[] getMatchingStacks() { return matchingStacks }

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

	static ItemStack fillStack(ItemStack itemStack, FluidStack fluidStack) {
		var toFill = itemStack.copy()
		getHandler(toFill)?.fill(fluidStack, true)
		return toFill
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

	static Translatable[] getInputTooltip(FluidStack fluidStack) {
		return new Translatable[] {
			new TranslatableFluidTooltip(fluidStack.fluid),
			translatable('nomiceu.tooltip.mixed.accepts_fluid_container')
		}
	}
}

/**
 * Simple wrapper class so we can use translated name of fluid in tooltip
 */
class TranslatableFluidTooltip extends Translatable {
	Fluid fluid

	TranslatableFluidTooltip(Fluid fluid) {
		super('nomiceu.tooltip.mixed.accepts_fluid')
		this.fluid = fluid
	}

	@Override
	protected String translateThis() {
		String fluidName = translate(fluid.unlocalizedName)
		return translate(key, fluidName)
	}
}

static IngredientFluidBucket fluidIng(FluidStack stack) {
	return new IngredientFluidBucket(stack)
}
