package postInit.main.general.lateGame

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.MiscHelpers.removeDraconicFusionRecipe
import static gregtech.api.GTValues.*

// Wyvern Core
removeDraconicFusionRecipe(item('minecraft:emerald_block'), item('draconicevolution:wyvern_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('actuallyadditions:block_crystal_empowered', 4))
	.input(metaitem('blockNetherStar'), metaitem('blockNetherStar'), item('draconicevolution:draconic_core'), item('draconicevolution:draconic_core'), item('draconicevolution:draconic_core'), item('draconicevolution:draconic_core'), item('armorplus:block_compressed_infused_lava_crystal'), item('armorplus:block_compressed_infused_lava_crystal'))
	.output(item('draconicevolution:wyvern_core'))
	.energy(22_000_000).tierNormal()
	.register()

// Chaotic Solar Panel
removeDraconicFusionRecipe(item('draconicevolution:chaotic_core'), item('solarflux:solar_panel_chaotic') * 4)
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:chaotic_core'))
	.input(item('solarflux:solar_panel_draconic'), item('draconicevolution:draconic_energy_core'), item('draconicevolution:draconic_energy_core'), item('solarflux:solar_panel_draconic'))
	.output(item('solarflux:solar_panel_chaotic') * 2)
	.energy(3_250_000_000).tierChaotic()
	.register()

// Neutronium Solar Panel
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('solarflux:solar_panel_chaotic'))
	.input(item('draconicevolution:chaotic_core'), item('draconicevolution:chaotic_core'), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), item('extendedcrafting:storage', 4), item('extendedcrafting:storage', 4), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), item('draconicevolution:chaotic_core'), item('draconicevolution:chaotic_core'))
	.output(item('solarflux:solar_panel_neutronium'))
	.energy(13_500_000_000).tierChaotic()
	.register()

// Draconic Solar Panel
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:draconic_energy_core'))
	.input(item('solarflux:solar_panel_wyvern'), item('solarflux:solar_panel_wyvern'), item('enderio:item_endergy_conduit', 11), item('enderio:item_endergy_conduit', 11), item('draconicevolution:wyvern_energy_core'), item('draconicevolution:wyvern_energy_core'), item('enderio:item_endergy_conduit', 11), item('enderio:item_endergy_conduit', 11), item('solarflux:solar_panel_wyvern'), item('solarflux:solar_panel_wyvern'))
	.output(item('solarflux:solar_panel_draconic') * 2)
	.energy(1_750_000_000).tierDraconic()
	.register()

// Wyvern Solar Panel
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:wyvern_energy_core'))
	.input(item('solarflux:solar_panel_8'), item('solarflux:solar_panel_8'), item('enderio:item_endergy_conduit', 10), item('enderio:item_endergy_conduit', 10), metaitem('nomilabs:blockDraconium'), metaitem('nomilabs:blockDraconium'), item('enderio:item_endergy_conduit', 10), item('enderio:item_endergy_conduit', 10), item('solarflux:solar_panel_8'), item('solarflux:solar_panel_8'))
	.output(item('solarflux:solar_panel_wyvern') * 2)
	.energy(850_000_000).tierWyvern()
	.register()

// Reactor Core
removeDraconicFusionRecipe(item('draconicevolution:chaos_shard'), item('draconicevolution:reactor_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('extendedcrafting:material', 13))
	.input(metaitem('nomilabs:blockAwakenedDraconium'), metaitem('nomilabs:blockAwakenedDraconium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), item('nomilabs:stabilizedeinsteinium'), item('nomilabs:stabilizedeinsteinium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('nomilabs:blockAwakenedDraconium'), metaitem('nomilabs:blockAwakenedDraconium'))
	.output(item('draconicevolution:reactor_core'))
	.energy(2_500_000_000).tierDraconic()
	.register()

// Chaotic Fusion Crafting Injector
removeDraconicFusionRecipe(item('draconicevolution:crafting_injector', 2), item('draconicevolution:crafting_injector', 3))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:crafting_injector', 2))
	.input(item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), metaitem('nomilabs:blockCrystalMatrix'), metaitem('nomilabs:blockCrystalMatrix'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'))
	.output(item('draconicevolution:crafting_injector', 3))
	.energy(3_000_000_000).tierDraconic()
	.register()

// Draconic Fusion Crafting Injector
removeDraconicFusionRecipe(item('draconicevolution:crafting_injector', 1), item('draconicevolution:crafting_injector', 2))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:crafting_injector', 1))
	.input(item('minecraft:nether_star'), item('minecraft:dragon_egg'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), item('minecraft:dragon_egg'), item('minecraft:nether_star'))
	.output(item('draconicevolution:crafting_injector', 2))
	.energy(1_000_000_000).tierWyvern()
	.register()

// Energy Core Stabilizer
removeDraconicFusionRecipe(item('draconicevolution:particle_generator'), item('draconicevolution:particle_generator', 2))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:particle_generator'))
	.input(item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2))
	.output(item('draconicevolution:particle_generator', 2))
	.energy(40_000_000).tierWyvern()
	.register()

// Reactor Stabilizer
removeDraconicFusionRecipe(item('draconicevolution:reactor_part'), item('draconicevolution:reactor_component'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:reactor_part'))
	.input(item('draconicevolution:reactor_part', 4), item('draconicevolution:reactor_part', 3), item('draconicevolution:draconic_energy_core'), item('draconicevolution:draconic_energy_core'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'))
	.output(item('draconicevolution:reactor_component'))
	.energy(7_000_000_000).tierChaotic()
	.register()

// Draconium Infused Obisidan
removeDraconicFusionRecipe(item('minecraft:obsidian'), item('draconicevolution:infused_obsidian'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('enderio:block_reinforced_obsidian'))
	.input(item('extrautils2:compressedcobblestone', 3), metaitem('nomilabs:blockDarkSteel'), metaitem('nomilabs:dustDraconium'), metaitem('nomilabs:dustDraconium'), item('thermalfoundation:material', 1024), item('thermalfoundation:material', 1024), item('armorplus:compressed_obsidian'), item('armorplus:compressed_obsidian'), item('armorplus:lava_crystal', 1), item('armorplus:lava_crystal', 1))
	.output(item('draconicevolution:infused_obsidian'))
	.energy(10_500_000).tierNormal()
	.register()

// Draconic Energy Core
removeDraconicFusionRecipe(item('draconicevolution:wyvern_energy_core'), item('draconicevolution:draconic_energy_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:wyvern_energy_core'))
	.input(metaitem('nomilabs:ingotAwakenedDraconium'), metaitem('nomilabs:ingotAwakenedDraconium'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'), metaitem('energy.module'), metaitem('energy.module'), item('actuallyadditions:block_crystal_empowered'), item('actuallyadditions:block_crystal_empowered'), metaitem('nomilabs:ingotAwakenedDraconium'), metaitem('nomilabs:ingotAwakenedDraconium'))
	.output(item('draconicevolution:draconic_energy_core'))
	.energy(42_000_000).tierDraconic()
	.register()

// Awakened Draconium Blocks
removeDraconicFusionRecipe(item('draconicevolution:draconium_block') * 4, item('draconicevolution:draconic_block') * 4)
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(metaitem('nomilabs:blockDraconium') * 5)
	.input(item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), item('draconicevolution:dragon_heart'), item('draconicevolution:dragon_heart'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'))
	.output(metaitem('nomilabs:blockAwakenedDraconium') * 5)
	.energy(4_000_000_000).tierWyvern()
	.register()

// Awakened Core
removeDraconicFusionRecipe(item('minecraft:nether_star'), item('draconicevolution:awakened_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('minecraft:nether_star'))
	.input(item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), metaitem('nomilabs:blockAwakenedDraconium'), metaitem('nomilabs:blockAwakenedDraconium'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'))
	.output(item('draconicevolution:awakened_core'))
	.energy(500_000_000).tierWyvern()
	.register()

// Chaotic Core
removeDraconicFusionRecipe(item('draconicevolution:chaos_shard'), item('draconicevolution:chaotic_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(metaitem('gravistar'))
	.input(item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('extendedcrafting:material', 32), item('extendedcrafting:material', 32), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'))
	.output(item('draconicevolution:chaotic_core'))
	.energy(3_000_000_000).tierChaotic()
	.register()

// Advanced Disolcator
removeDraconicFusionRecipe(item('draconicevolution:dislocator'), item('draconicevolution:dislocator_advanced'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:dislocator'))
	.input(item('minecraft:ender_pearl'), metaitem('nomilabs:ingotDraconium'), item('minecraft:ender_pearl'), metaitem('nomilabs:ingotDraconium'), item('minecraft:ender_pearl'), metaitem('nomilabs:ingotDraconium'), item('minecraft:dragon_egg'), metaitem('nomilabs:ingotDraconium'))
	.output(item('draconicevolution:dislocator_advanced'))
	.energy(10_000_000).tierDraconic()
	.register()

/* Packaged Draconic Recipes */

// Fusion Package Crafter
removeDraconicFusionRecipe(item('draconicevolution:fusion_crafting_core'), item('packageddraconic:fusion_crafter'))
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('draconicevolution:fusion_crafting_core'), item('extendedcrafting:interface') * 4, item('packagedauto:me_package_component') * 4, item('extendedcrafting:material', 12) * 4, metaitem('field.generator.iv'), metaitem('wireFineRuridit') * 64)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('packageddraconic:fusion_crafter'))
	.duration(400).EUt(VA[LuV])
	.buildAndRegister()

// Marked Fusion Pedestals
crafting.remove('packageddraconic:marked_basic_injector')
crafting.remove('packageddraconic:marked_draconic_injector')
crafting.remove('packageddraconic:marked_wyvern_injector')
crafting.remove('packageddraconic:marked_chaotic_injector')

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('draconicevolution:crafting_injector'), item('extendedcrafting:material', 19), metaitem('sensor.iv'), ore('gearDraconium'))
	.outputs(item('packageddraconic:marked_basic_injector'))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('draconicevolution:crafting_injector', 1), item('extendedcrafting:material', 19), metaitem('sensor.iv'), ore('gearDraconium'))
	.outputs(item('packageddraconic:marked_wyvern_injector'))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('draconicevolution:crafting_injector', 2), item('extendedcrafting:material', 19), metaitem('sensor.iv'), ore('gearDraconium'))
	.outputs(item('packageddraconic:marked_draconic_injector'))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('draconicevolution:crafting_injector', 3), item('extendedcrafting:material', 19), metaitem('sensor.iv'), ore('gearDraconium'))
	.outputs(item('packageddraconic:marked_chaotic_injector'))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('packageddraconic:marked_basic_injector'))
	.input(item('draconicevolution:wyvern_core'), item('draconicevolution:draconic_core'), item('minecraft:nether_star'), item('minecraft:nether_star'), item('draconicevolution:draconic_core'), ore('blockDraconium'), item('minecraft:nether_star'), item('minecraft:nether_star'))
	.output(item('packageddraconic:marked_wyvern_injector'))
	.energy(256_000).tierNormal()
	.register()

mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('packageddraconic:marked_wyvern_injector'))
	.input(item('minecraft:nether_star'), item('minecraft:dragon_egg'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), item('minecraft:dragon_egg'), item('minecraft:nether_star'))
	.output(item('packageddraconic:marked_draconic_injector'))
	.energy(1_000_000_000).tierWyvern()
	.register()

mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('packageddraconic:marked_draconic_injector'))
	.input(item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), metaitem('nomilabs:blockCrystalMatrix'), metaitem('nomilabs:blockCrystalMatrix'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'))
	.output(item('packageddraconic:marked_chaotic_injector'))
	.energy(3_000_000_000).tierDraconic()
	.register()

crafting.addShapeless(item('draconicevolution:crafting_injector'), [item('packageddraconic:marked_basic_injector')])
crafting.addShapeless(item('draconicevolution:crafting_injector', 1), [item('packageddraconic:marked_wyvern_injector')])
crafting.addShapeless(item('draconicevolution:crafting_injector', 2), [item('packageddraconic:marked_draconic_injector')])
crafting.addShapeless(item('draconicevolution:crafting_injector', 3), [item('packageddraconic:marked_chaotic_injector')])
