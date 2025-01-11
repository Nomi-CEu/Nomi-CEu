import de.ellpeck.actuallyadditions.api.recipe.EmpowererRecipe
import gregtech.api.items.metaitem.MetaItem
import gregtech.common.items.MetaItems
import net.minecraft.item.ItemStack
import net.minecraft.item.crafting.Ingredient
import net.minecraftforge.fluids.FluidStack
import net.minecraftforge.fluids.capability.CapabilityFluidHandler

import com.nomiceu.nomilabs.groovy.SimpleIIngredient

import java.awt.Color

// Actually Additions Specific Modifications

/* Helpers */
var setupEmpowerer = { int blockItemMeta, Color particleColor ->
	return mods.actuallyadditions.empowerer.recipeBuilder()
		.mainInput(item('actuallyadditions:block_crystal', blockItemMeta))
		.output(item('actuallyadditions:block_crystal_empowered', blockItemMeta))
		.particleColor(particleColor.getRGB())
		.energy(1_000_000)
		.time(400)
}

var removeEmpowerer = { int blockItemMeta, ItemStack gear ->
	mods.actuallyadditions.empowerer.removeByOutput(item('actuallyadditions:item_crystal_empowered', blockItemMeta))
	mods.actuallyadditions.empowerer.removeByOutput(item('actuallyadditions:block_crystal_empowered', blockItemMeta))
	mods.actuallyadditions.empowerer.removeByOutput(gear)
}

var setupAndRemoveEmpowerer = { int blockItemMeta, ItemStack gear, Color particleColor ->
	removeEmpowerer(blockItemMeta, gear)
	return setupEmpowerer(blockItemMeta, particleColor)
}

var fillMetaItem = { FluidStack toFill, MetaItem.MetaValueItem item ->
	var fill = item.stackForm
	var fluidCap = fill.getCapability(CapabilityFluidHandler.FLUID_HANDLER_ITEM_CAPABILITY, null)
	if (fluidCap == null) return fill;

	fluidCap.fill(toFill * 1000, true)
	return fluidCap.container
}

/* Custom Empowerer Recipes */

// Empowered Restonia
setupAndRemoveEmpowerer(0, item('moreplates:empowered_restonia_gear'), Color.RED)
	.input(ore('gemAlmandine'), ore('ingotRedAlloy'), fillMetaItem(fluid('sulfuric_acid'), MetaItems.FLUID_CELL_GLASS_VIAL), item('extendedcrafting:material', 19))
	.register()

// Empowered Palis
setupAndRemoveEmpowerer(1, item('moreplates:empowered_palis_gear'), Color.BLUE)
	.input(ore('gemSapphire'), item('thermalfoundation:material', 136), fillMetaItem(fluid('water'), MetaItems.FLUID_CELL), item('extendedcrafting:material', 16))
	.register()

// Empowered Diamatine
setupAndRemoveEmpowerer(2, item('moreplates:empowered_diamatine_gear'), Color.CYAN)
	.input(item('extendedcrafting:material', 40), item('extendedcrafting:material', 24), fillMetaItem(fluid('nitrogen_dioxide'), MetaItems.FLUID_CELL), item('extendedcrafting:material', 18))
	.register()

// Empowered Void
removeEmpowerer(3, item('moreplates:empowered_void_gear'))
for (var oilType : ['oil', 'oil_heavy', 'oil_medium', 'oil_light']) {
	setupEmpowerer(3, Color.DARK_GRAY)
		.input(item('actuallyadditions:item_misc', 5), ore('ingotDarkSteel'), fillMetaItem(fluid(oilType), MetaItems.FLUID_CELL), item('extendedcrafting:material', 15))
		.register()
}

// Empowered Emeradic
setupAndRemoveEmpowerer(4, item('moreplates:empowered_emeradic_gear'), Color.GREEN)
	.input(item('nomilabs:stabilizeduranium'), ore('ingotVibrantAlloy'), fillMetaItem(fluid('argon'), MetaItems.FLUID_CELL), item('extendedcrafting:material', 17))
	.register()

// Empowered Enori
setupAndRemoveEmpowerer(5, item('moreplates:empowered_enori_gear'), Color.WHITE)
	.input(ore('gemApatite'), ore('ingotEndSteel'), fillMetaItem(fluid('helium'), MetaItems.FLUID_CELL), item('extendedcrafting:material', 14))
	.register()

/* For EVERY Empowerer Recipe, add a Combination Crafting Recipe */

// IIngredient Class that Matches Based on MC Ing
class IngredientMCEmpower extends SimpleIIngredient {
	Ingredient ing

	IngredientMCEmpower(Ingredient ing) { this.ing = ing }

	@Override
	Ingredient toMcIngredient() { return ing }

	@Override
	ItemStack[] getMatchingStacks() { return ing.getMatchingStacks() }

	@Override
	boolean test(ItemStack itemStack) { return ing.apply(itemStack) }
}

mods.actuallyadditions.empowerer.streamRecipes()
	.forEach { EmpowererRecipe recipe ->
		mods.extendedcrafting.combination_crafting.recipeBuilder()
			.input(new IngredientMCEmpower(recipe.input))
			.pedestals(new IngredientMCEmpower(recipe.standOne))
			.pedestals(new IngredientMCEmpower(recipe.standTwo))
			.pedestals(new IngredientMCEmpower(recipe.standThree))
			.pedestals(new IngredientMCEmpower(recipe.standFour))
			.output(recipe.output)
			.totalCost(4_000_000)
			.costPerTick(400_000)
			.register()
	}
