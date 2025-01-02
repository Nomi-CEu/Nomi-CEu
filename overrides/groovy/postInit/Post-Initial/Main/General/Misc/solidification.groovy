import static gregtech.api.GTValues.*

/* All Solidification and Stabilization Recipes */

// Bromine
mods.gregtech.fluid_solidifier.recipeBuilder()
	.fluidInputs(fluid('bromine') * 1000)
	.notConsumable(metaitem('shape.mold.ball'))
	.outputs(item('nomilabs:solidifiedbromine'))
	.duration(500).EUt(VHA[LV])
	.buildAndRegister()
