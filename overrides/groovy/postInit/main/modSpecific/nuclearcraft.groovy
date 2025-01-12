package postInit.main.modSpecific

import com.nomiceu.nomilabs.util.ItemMeta
import mezz.jei.api.ingredients.VanillaTypes
import nc.enumm.MetaEnums
import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import nc.fluid.FluidMolten
import nc.init.NCCoolantFluids
import nc.init.NCFissionFluids
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack

import static gregtech.api.GTValues.*
import static com.nomiceu.nomilabs.groovy.NCActiveCoolerHelper.changeCoolerRecipe

/* Hide Molten Salt Reactor Fluids */
for (var toHide : NCFissionFluids.fluidList) {
	mods.jei.ingredient.hide(VanillaTypes.FLUID, new FluidStack(toHide, 1))
}

for (var toHide : NCCoolantFluids.fluidList) {
	// Ignore Normal Molten Fluids
	if (toHide instanceof FluidMolten) continue;
	mods.jei.ingredient.hide(VanillaTypes.FLUID, new FluidStack(toHide, 1))
}

// LEGACY: NC Uranium 238 Block -> GT Uranium 238 Block
crafting.addShapeless(metaitem('blockUranium'), [item('nuclearcraft:block_depleted_uranium')])

// Thorium -> Prepared Thorium
for (var thorium : [ore('dustThorium'), ore('ingotThorium')]) {
	mods.gregtech.thermal_centrifuge.recipeBuilder()
		.inputs(thorium)
		.outputs(item('nuclearcraft:thorium', 4))
		.duration(950).EUt(48) // Special Case: Reduced Power Consumption & Match Other NC Recipes
		.buildAndRegister()
}

/* Fuel Values */
Map<String, List<Integer>> fuelMetas = [
    'thorium': [0],
	'uranium': [0, 2, 4, 6],
	'neptunium': [0, 2],
	'plutonium': [0, 2, 4, 6],
	'americium': [0, 2],
	'curium': [0, 2, 4, 6, 8, 10],
	'berkelium': [0, 2],
	'californium': [0, 2, 4, 6]
]

var u235 = Tuple.tuple(new ItemMeta(item('nuclearcraft:uranium', 4)), metaitem('ingotUranium235'))
var u238 = Tuple.tuple(new ItemMeta(item('nuclearcraft:uranium', 8)), metaitem('ingotUranium'))
var p239 = Tuple.tuple(new ItemMeta(item('nuclearcraft:plutonium', 4)), metaitem('ingotPlutonium'))
var p241 = Tuple.tuple(new ItemMeta(item('nuclearcraft:plutonium', 8)), metaitem('ingotPlutonium241'))

var u235Tiny = Tuple.tuple(new ItemMeta(item('nuclearcraft:uranium', 6)), metaitem('nuggetUranium235'))
var u238Tiny = Tuple.tuple(new ItemMeta(item('nuclearcraft:uranium', 10)), metaitem('nuggetUranium'))
var p239Tiny = Tuple.tuple(new ItemMeta(item('nuclearcraft:plutonium', 6)), metaitem('nuggetPlutonium'))
var p241Tiny = Tuple.tuple(new ItemMeta(item('nuclearcraft:plutonium', 10)), metaitem('nuggetPlutonium241'))

var checkReplacementsOrDefault = { ItemStack stack, Tuple2<ItemMeta, ItemStack>... toReplace ->
	for (var replacement : toReplace) {
		if (replacement.v1.compareWith(stack))
			return replacement.v2 * stack.count
	}

	return stack
}

/* Fuel Decomposition Recipe Changes */
// Replace NC U235 and U238 with GT Versions
for (var meta : fuelMetas['uranium']) {
	mods.gregtech.thermal_centrifuge.changeByInput([item('nuclearcraft:fuel_uranium', meta)], null)
		.changeEachOutput { ItemStack stack -> checkReplacementsOrDefault(stack, u235, u238) }
		.replaceAndRegister()
}

// Replace NC P239 and U241 with GT Versions
for (var meta : fuelMetas['plutonium']) {
	mods.gregtech.thermal_centrifuge.changeByInput([item('nuclearcraft:fuel_plutonium', meta)], null)
		.changeEachOutput { ItemStack stack -> checkReplacementsOrDefault(stack, p239, p241) }
		.replaceAndRegister()
}

/* Depleted Fuel Recycling Changes */
// Increase All Outputs by 10%
// Replace NC U235, U238, P239 and P241 with GT Versions
for (var fuel : fuelMetas) {
	for (var meta : fuel.value) {
		mods.gregtech.centrifuge.changeByInput([item("nuclearcraft:depleted_fuel_${fuel.key}", meta)], null)
			.changeEachOutput { ItemStack stack ->
				stack = checkReplacementsOrDefault(stack, u235Tiny, u238Tiny, p239Tiny, p241Tiny)
				stack.count = (int) Math.ceil(stack.count * 1.1f)
				return stack
			}.replaceAndRegister()
	}
}

// Change Active Cooler Recipe from NC Helium -> GT Liquid Helium
changeCoolerRecipe(fluid('liquid_helium'), MetaEnums.CoolerType.HELIUM)

// Replace Cooler Crafting Recipes with Canner Recipes
def replaceCannerRecipe = (ItemStack cooler, FluidStack fluid) -> {
	crafting.removeByOutput(cooler)
	mods.gregtech.canner.recipeBuilder()
		.inputs(item('nuclearcraft:cooler'))
		.fluidInputs(fluid)
		.outputs(cooler)
		.duration(400).EUt(VA[LV])
		.buildAndRegister()
}

// Add a Hidden version of Cooler Canner Recipe, using Solids (LEGACY RECIPES)
def addLegacyCoolerRecipe = (ItemStack cooler, OreDictIngredient ing) -> {
	mods.gregtech.canner.recipeBuilder()
		.hidden()
		.inputs(item('nuclearcraft:cooler'), ing * 16)
		.outputs(cooler)
		.duration(400).EUt(VA[LV])
		.buildAndRegister()
}

replaceCannerRecipe(item('nuclearcraft:cooler', 1), fluid('water') * 1000)

replaceCannerRecipe(item('nuclearcraft:cooler', 2), fluid('redstone') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 2), ore('dustRedstone'))

replaceCannerRecipe(item('nuclearcraft:cooler', 3), fluid('quartz') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 3), ore('dustNetherQuartz'))

replaceCannerRecipe(item('nuclearcraft:cooler', 4), fluid('gold') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 4), ore('dustGold'))

replaceCannerRecipe(item('nuclearcraft:cooler', 5), fluid('glowstone') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 5), ore('dustGlowstone'))

replaceCannerRecipe(item('nuclearcraft:cooler', 6), fluid('lapis') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 6), ore('dustLapis'))

replaceCannerRecipe(item('nuclearcraft:cooler', 7), fluid('diamond') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 7), ore('dustDiamond'))

replaceCannerRecipe(item('nuclearcraft:cooler', 8), fluid('liquid_helium') * 1000)

replaceCannerRecipe(item('nuclearcraft:cooler', 9), fluid('enderium') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 9), ore('dustEnderium'))

replaceCannerRecipe(item('nuclearcraft:cooler', 10), fluid('cryotheum') * 1000)

replaceCannerRecipe(item('nuclearcraft:cooler', 11), fluid('iron') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 11), ore('dustIron'))

replaceCannerRecipe(item('nuclearcraft:cooler', 12), fluid('emerald') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 12), ore('dustEmerald'))

replaceCannerRecipe(item('nuclearcraft:cooler', 13), fluid('copper') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 13), ore('dustCopper'))

replaceCannerRecipe(item('nuclearcraft:cooler', 14), fluid('tin') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 14), ore('dustTin'))

replaceCannerRecipe(item('nuclearcraft:cooler', 15), fluid('magnesium') * (L * 9))
addLegacyCoolerRecipe(item('nuclearcraft:cooler', 15), ore('dustMagnesium'))

