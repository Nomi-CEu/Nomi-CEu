import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack

import static gregtech.api.GTValues.*

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

replaceCannerRecipe(item('nuclearcraft:cooler', 1), fluid('water') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 2), fluid('redstone') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 3), fluid('quartz') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 4), fluid('gold') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 5), fluid('glowstone') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 6), fluid('lapis') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 7), fluid('diamond') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 8), fluid('liquid_helium') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 9), fluid('enderium') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 10), fluid('cryotheum') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 11), fluid('iron') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 12), fluid('emerald') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 13), fluid('copper') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 14), fluid('tin') * 1000)
replaceCannerRecipe(item('nuclearcraft:cooler', 15), fluid('magnesium') * 1000)
