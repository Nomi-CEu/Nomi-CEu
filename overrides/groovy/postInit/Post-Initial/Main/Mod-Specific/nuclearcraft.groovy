import nc.enumm.MetaEnums
import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack

import static gregtech.api.GTValues.*
import static com.nomiceu.nomilabs.groovy.NCActiveCoolerHelper.changeCoolerRecipe

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

