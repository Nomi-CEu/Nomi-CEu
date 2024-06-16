import static com.nomiceu.nomilabs.groovy.GroovyHelpers.MiscHelpers.removeDraconicFusionRecipe

// Wyvern Core
removeDraconicFusionRecipe(item('minecraft:emerald_block'), item('draconicevolution:wyvern_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('actuallyadditions:block_crystal_empowered', 4))
	.input(metaitem('blockNetherStar'), metaitem('blockNetherStar'), item('draconicevolution:draconic_core'), item('draconicevolution:draconic_core'), item('draconicevolution:draconic_core'), item('draconicevolution:draconic_core'), item('armorplus:block_compressed_infused_lava_crystal'), item('armorplus:block_compressed_infused_lava_crystal'))
	.output(item('draconicevolution:wyvern_core'))
	.energy(21943000)
	.tierNormal()
	.register()

// Chaotic Solar Panel
removeDraconicFusionRecipe(item('draconicevolution:chaotic_core'), item('solarflux:solar_panel_chaotic') * 4)
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:chaotic_core'))
	.input(item('solarflux:solar_panel_draconic'), item('draconicevolution:draconic_energy_core'), item('draconicevolution:draconic_energy_core'), item('solarflux:solar_panel_draconic'))
	.output(item('solarflux:solar_panel_chaotic') * 2)
	.energy(3355440000)
	.tierChaotic()
	.register()

// Neutronium Solar Panel
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('solarflux:solar_panel_chaotic'))
	.input(item('draconicevolution:chaotic_core'), item('draconicevolution:chaotic_core'), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), item('extendedcrafting:storage', 4), item('extendedcrafting:storage', 4), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), metaitem('nomilabs:wireGtSingleDraconicSuperconductor'), item('draconicevolution:chaotic_core'), item('draconicevolution:chaotic_core'))
	.output(item('solarflux:solar_panel_neutronium'))
	.energy(13421760000)
	.tierChaotic()
	.register()

// Draconic Solar Panel
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:draconic_energy_core'))
	.input(item('solarflux:solar_panel_wyvern'), item('solarflux:solar_panel_wyvern'), item('enderio:item_endergy_conduit', 11), item('enderio:item_endergy_conduit', 11), item('draconicevolution:wyvern_energy_core'), item('draconicevolution:wyvern_energy_core'), item('enderio:item_endergy_conduit', 11), item('enderio:item_endergy_conduit', 11), item('solarflux:solar_panel_wyvern'), item('solarflux:solar_panel_wyvern'))
	.output(item('solarflux:solar_panel_draconic') * 2)
	.energy(1677720000)
	.tierDraconic()
	.register()

// Wyvern Solar Panel
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:wyvern_energy_core'))
	.input(item('solarflux:solar_panel_8'), item('solarflux:solar_panel_8'), item('enderio:item_endergy_conduit', 10), item('enderio:item_endergy_conduit', 10), metaitem('nomilabs:blockDraconium'), metaitem('nomilabs:blockDraconium'), item('enderio:item_endergy_conduit', 10), item('enderio:item_endergy_conduit', 10), item('solarflux:solar_panel_8'), item('solarflux:solar_panel_8'))
	.output(item('solarflux:solar_panel_wyvern') * 2)
	.energy(838860000)
	.tierWyvern()
	.register()

// Reactor Core
removeDraconicFusionRecipe(item('draconicevolution:chaos_shard'), item('draconicevolution:reactor_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('extendedcrafting:material', 13))
	.input(metaitem('nomilabs:blockAwakenedDraconium'), metaitem('nomilabs:blockAwakenedDraconium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), item('nomilabs:stabilizedeinsteinium'), item('nomilabs:stabilizedeinsteinium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('nomilabs:blockAwakenedDraconium'), metaitem('nomilabs:blockAwakenedDraconium'))
	.output(item('draconicevolution:reactor_core'))
	.energy(2600000000)
	.tierDraconic()
	.register()

// Chaotic Fusion Crafting Injector
removeDraconicFusionRecipe(item('draconicevolution:crafting_injector', 2), item('draconicevolution:crafting_injector', 3))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:crafting_injector', 2))
	.input(item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), metaitem('nomilabs:blockCrystalMatrix'), metaitem('nomilabs:blockCrystalMatrix'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'))
	.output(item('draconicevolution:crafting_injector', 3))
	.energy(3000000000)
	.tierDraconic()
	.register()

// Draconic Fusion Crafting Injector
removeDraconicFusionRecipe(item('draconicevolution:crafting_injector', 1), item('draconicevolution:crafting_injector', 2))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:crafting_injector', 1))
	.input(item('minecraft:nether_star'), item('minecraft:dragon_egg'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), item('minecraft:dragon_egg'), item('minecraft:nether_star'))
	.output(item('draconicevolution:crafting_injector', 2))
	.energy(1000000000)
	.tierWyvern()
	.register()

// Energy Core Stabilizer
removeDraconicFusionRecipe(item('draconicevolution:particle_generator'), item('draconicevolution:particle_generator', 2))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:particle_generator'))
	.input(item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2), item('actuallyadditions:block_crystal_empowered', 2))
	.output(item('draconicevolution:particle_generator', 2))
	.energy(40000000)
	.tierWyvern()
	.register()

// Reactor Stabilizer
removeDraconicFusionRecipe(item('draconicevolution:reactor_part'), item('draconicevolution:reactor_component'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:reactor_part'))
	.input(item('draconicevolution:reactor_part', 4), item('draconicevolution:reactor_part', 3), item('draconicevolution:draconic_energy_core'), item('draconicevolution:draconic_energy_core'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'))
	.output(item('draconicevolution:reactor_component'))
	.energy(7040000000)
	.tierChaotic()
	.register()

// Draconium Infused Obisidan
removeDraconicFusionRecipe(item('minecraft:obsidian'), item('draconicevolution:infused_obsidian'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('enderio:block_reinforced_obsidian'))
	.input(item('extrautils2:compressedcobblestone', 3), metaitem('nomilabs:blockDarkSteel'), metaitem('nomilabs:dustDraconium'), metaitem('nomilabs:dustDraconium'), item('thermalfoundation:material', 1024), item('thermalfoundation:material', 1024), item('armorplus:compressed_obsidian'), item('armorplus:compressed_obsidian'), item('armorplus:lava_crystal', 1), item('armorplus:lava_crystal', 1))
	.output(item('draconicevolution:infused_obsidian'))
	.energy(10485700)
	.tierNormal()
	.register()

// Draconic Energy Core
removeDraconicFusionRecipe(item('draconicevolution:wyvern_energy_core'), item('draconicevolution:draconic_energy_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:wyvern_energy_core'))
	.input(metaitem('nomilabs:ingotAwakenedDraconium'), metaitem('nomilabs:ingotAwakenedDraconium'), item('draconicevolution:awakened_core'), item('draconicevolution:awakened_core'), metaitem('energy.module'), metaitem('energy.module'), item('actuallyadditions:block_crystal_empowered'), item('actuallyadditions:block_crystal_empowered'), metaitem('nomilabs:ingotAwakenedDraconium'), metaitem('nomilabs:ingotAwakenedDraconium'))
	.output(item('draconicevolution:draconic_energy_core'))
	.energy(41943000)
	.tierDraconic()
	.register()

// Awakened Draconium Blocks
removeDraconicFusionRecipe(item('draconicevolution:draconium_block') * 4, item('draconicevolution:draconic_block') * 4)
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(metaitem('nomilabs:blockDraconium') * 5)
	.input(item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), item('draconicevolution:dragon_heart'), item('draconicevolution:dragon_heart'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'))
	.output(metaitem('nomilabs:blockAwakenedDraconium') * 5)
	.energy(4000000000)
	.tierWyvern()
	.register()

// Awakened Core
removeDraconicFusionRecipe(item('minecraft:nether_star'), item('draconicevolution:awakened_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('minecraft:nether_star'))
	.input(item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'), metaitem('nomilabs:blockAwakenedDraconium'), metaitem('nomilabs:blockAwakenedDraconium'), item('draconicevolution:wyvern_core'), item('draconicevolution:wyvern_core'))
	.output(item('draconicevolution:awakened_core'))
	.energy(500000000)
	.tierWyvern()
	.register()

// Chaotic Core
removeDraconicFusionRecipe(item('draconicevolution:chaos_shard'), item('draconicevolution:chaotic_core'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(metaitem('gravistar'))
	.input(item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('extendedcrafting:material', 32), item('extendedcrafting:material', 32), metaitem('ingotNeutronium'), metaitem('ingotNeutronium'), item('draconicevolution:chaos_shard'), item('draconicevolution:chaos_shard'))
	.output(item('draconicevolution:chaotic_core'))
	.energy(3000000000)
	.tierChaotic()
	.register()

// Advanced Disolcator
removeDraconicFusionRecipe(item('draconicevolution:dislocator'), item('draconicevolution:dislocator_advanced'))
mods.draconicevolution.fusion.recipeBuilder()
	.catalyst(item('draconicevolution:dislocator'))
	.input(item('minecraft:ender_pearl'), metaitem('nomilabs:ingotDraconium'), item('minecraft:ender_pearl'), metaitem('nomilabs:ingotDraconium'), item('minecraft:ender_pearl'), metaitem('nomilabs:ingotDraconium'), item('minecraft:dragon_egg'), metaitem('nomilabs:ingotDraconium'))
	.output(item('draconicevolution:dislocator_advanced'))
	.energy(10000000)
	.tierDraconic()
	.register()
