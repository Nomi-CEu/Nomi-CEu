package postInit.addon.zbgt

import static gregtech.api.GTValues.*

mods.gregtech.creative_tank_provider.recipeBuilder()
	.notConsumable(item('nomilabs:creativeportabletankmold'))
	.inputs(item('minecraft:paper'))
	.outputs(metaitem('zbgt:creative_computation_provider'))
	.duration(500)
	.EUt(100000)
	.buildAndRegister()

mods.gregtech.creative_tank_provider.recipeBuilder()
	.notConsumable(metaitem('infinite_energy'))
	.inputs(item('extrautils2:trashcanenergy'))
	.outputs(metaitem('zbgt:creative_energy_sink'))
	.duration(500)
	.EUt(100000)
	.buildAndRegister()

mods.gregtech.creative_tank_provider.recipeBuilder()
	.notConsumable(metaitem('infinite_energy'))
	.inputs(item('minecraft:redstone_block'))
	.outputs(metaitem('zbgt:creative_energy_source'))
	.duration(500)
	.EUt(100000)
	.buildAndRegister()

mods.gregtech.creative_tank_provider.recipeBuilder()
	.notConsumable(metaitem('infinite_energy'))
	.inputs(item('minecraft:redstone_block'))
	.outputs(item('zbgt:creative_heating_coil'))
	.duration(500)
	.EUt(100000)
	.buildAndRegister()

mods.gregtech.precise_assembler_recipes.recipeBuilder()
	.inputs(item('avaritia:resource', 5), item('gregtech:wire_coil', 7) * 512)
	.fluidInputs(fluid('neutronium') * 512000, fluid('pyrotheum') * 20000000)
	.outputs(item('zbgt:creative_heating_coil'))
	.casingTier(4)
	.duration(200).EUt(VA[MAX])
	.buildAndRegister()

