import io.sommers.packmode.PMConfig
import gregtech.api.recipes.category.RecipeCategories

// Assembly Control Casing
mods.gregtech.arc_furnace.removeByInput(30, [item('gregtech:multiblock_casing', 3)], [fluid('oxygen') * 932])
mods.gregtech.macerator.removeByInput(32, [item('gregtech:multiblock_casing', 3)], null)

if (PMConfig.getPackMode() == "normal") {
mods.gregtech.arc_furnace.recipeBuilder()
	.inputs(item('gregtech:multiblock_casing', 3))
	.fluidInputs(fluid('oxygen') * 932)
	.outputs(metaitem('nuggetTungstenSteel') * 15, metaitem('dustGraphene'), metaitem('nuggetTungsten') * 6, metaitem('nuggetIridium') * 5)
	.duration(932)
	.EUt(30)
	.category(RecipeCategories.ARC_FURNACE_RECYCLING)
	.buildAndRegister();

mods.gregtech.macerator.recipeBuilder()
	.inputs(item('gregtech:multiblock_casing', 3))
	.outputs(metaitem('dustSmallTungstenSteel') * 7, metaitem('dustRubber'), metaitem('dustGraphene'), metaitem('dustSmallTungsten') * 3)
	.duration(725)
	.EUt(30)
	.category(RecipeCategories.MACERATOR_RECYCLING)
	.buildAndRegister();
}
else {
mods.gregtech.arc_furnace.recipeBuilder()
	.inputs(item('gregtech:multiblock_casing', 3))
	.fluidInputs(fluid('oxygen') * 932)
	.outputs(metaitem('nuggetTungstenSteel') * 62, metaitem('dustGraphene') * 4, metaitem('nuggetTungsten') * 26, metaitem('nuggetIridium') * 22)
	.duration(932)
	.EUt(30)
	.category(RecipeCategories.ARC_FURNACE_RECYCLING)
	.buildAndRegister();

mods.gregtech.macerator.recipeBuilder()
	.inputs(item('gregtech:multiblock_casing', 3))
	.outputs(metaitem('dustSmallTungstenSteel') * 28, metaitem('dustRubber') * 4, metaitem('dustGraphene') * 4, metaitem('dustSmallTungsten') * 12)
	.duration(725)
	.EUt(30)
	.category(RecipeCategories.MACERATOR_RECYCLING)
	.buildAndRegister();
}

mods.gregtech.arc_furnace.removeByInput(30, [item('gregtech:multiblock_casing', 4)], [fluid('oxygen') * 3322])
if (PMConfig.getPackMode() == "expert") {
mods.gregtech.arc_furnace.recipeBuilder()
	.inputs(item('gregtech:multiblock_casing', 4))
	.fluidInputs(fluid('oxygen') * 3322)
	.outputs(metaitem('dustGraphene') * 24, metaitem('nuggetTungstenSteel') * 20, metaitem('ingotTungsten') * 16, metaitem('ingotRuridit') * 8)
	.duration(3322)
	.EUt(30)
	.category(RecipeCategories.ARC_FURNACE_RECYCLING)
	.buildAndRegister();

mods.gregtech.arc_furnace.recipeBuilder()
	.inputs(item('gregtech:multiblock_casing', 4))
	.outputs(metaitem('dustGraphene') * 24, metaitem('dustRubber') * 22, metaitem('dustTungstenSteel') * 20, metaitem('dustTungsten') * 17)
	.duration(2944)
	.EUt(30)
	.category(RecipeCategories.ARC_FURNACE_RECYCLING)
	.buildAndRegister();
}
