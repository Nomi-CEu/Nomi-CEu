// MODS_LOADED: ae2fc
// ^, Makes the script not run as long as AE2 FC isn't a mod in the player's instance.

package postInit.addon

import static gregtech.api.GTValues.*

// Remove existing recipes
crafting.remove('ae2fc:fluid_discretizer')
crafting.remove('ae2fc:fluid_pattern_encoder')
crafting.remove('ae2fc:burette')
crafting.remove('ae2fc:dual_interface')
crafting.remove('ae2fc:fluid_level_maintainer')
crafting.remove('ae2fc:part_fluid_pattern_ex_terminal')
crafting.remove('ae2fc:ultimate_encoder')
crafting.remove('ae2fc:fluid_assembler')

// Fluid Discretizer recipe
crafting.shapedBuilder().name('ae2fc:fluid_discretizer')
	.output(item('ae2fc:fluid_discretizer'))
	.matrix('EIE',
			'PGP',
			'EFE')
	.key('E', ore('plateEnergeticAlloy'))
	.key('I', item('appliedenergistics2:part', 220)) // Storage Bus
	.key('P', item('appliedenergistics2:material', 24)) // Engineering Processor
	.key('G', metaitem('field.generator.lv'))
	.key('F', item('appliedenergistics2:part', 221)) // Fluid Storage Bus
	.register()

// Fluid Pattern Encoder recipe
crafting.shapedBuilder().name('ae2fc:fluid_pattern_encoder')
	.output(item('ae2fc:fluid_pattern_encoder'))
	.matrix(' S ',
			'EWE',
			' P ')
	.key('S', metaitem('sensor.mv'))
	.key('E', item('appliedenergistics2:material', 24)) // Engineering Processor
	.key('W', item('minecraft:crafting_table'))
	.key('P', item('appliedenergistics2:material', 54)) // 1k Fluid Storage Component
	.register()

// Precision Burette recipe
mods.gregtech.assembler.recipeBuilder()
	.inputs(
		metaitem('hull.mv'),
		metaitem('sensor.mv'),
		metaitem('fluid_cell.glass_vial') * 2,
		item('appliedenergistics2:material', 23) * 2, // Calculation Processor
		item('appliedenergistics2:quartz_vibrant_glass') * 4
	)
	.outputs(item('ae2fc:burette'))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Dual Interface recipe
crafting.addShapeless(item('ae2fc:dual_interface'), [
		item('appliedenergistics2:interface'),
		item('appliedenergistics2:fluid_interface'),
		item('appliedenergistics2:material', 23), // Calculation Processor
		ore('circuitHv')
	]
)

// Fluid Level Maintainer recipe
crafting.shapedBuilder().name('ae2fc:fluid_level_maintainer')
	.output(item('ae2fc:fluid_level_maintainer'))
	.matrix('MEM',
			'PCP',
			'MAM')
	.key('M', ore('ingotBlueSteel'))
	.key('E', item('appliedenergistics2:part', 281)) // Fluid Level Emitter
	.key('P', item('appliedenergistics2:material', 22)) // Logic Processor
	.key('C', ore('circuitIv'))
	.key('A', item('appliedenergistics2:material', 53)) // Crafting Card
	.register()

// Extended Fluid Pattern Terminal recipe
crafting.shapedBuilder().name('ae2fc:part_fluid_pattern_ex_terminal')
	.output(item('ae2fc:part_fluid_pattern_ex_terminal'))
	.matrix('T',
			'C',
			'E')
	.key('T', item('ae2fc:part_fluid_pattern_terminal'))
	.key('C', ore('circuitEv'))
	.key('E', item('packagedauto:encoder'))
	.register()

// Ultimate Encoder recipe
crafting.shapedBuilder().name('ae2fc:ultimate_encoder')
	.output(item('ae2fc:ultimate_encoder'))
	.matrix(' T ',
			'PFP',
			' C ')
	.key('T', item('appliedenergistics2:part', 341)) // Extended Pattern Terminal
	.key('P', item('appliedenergistics2:material', 24)) // Engineering Processor
	.key('F', item('ae2fc:fluid_pattern_encoder'))
	.key('C', item('extendedcrafting:material', 11)) // Ultimate Catalyst
	.register()

// Fluid Assembler recipe
crafting.shapedBuilder().name('ae2fc:fluid_assembler')
	.output(item('ae2fc:fluid_assembler'))
	.matrix('MFM',
			'PAP',
			'MFM')
	.key('M', ore('plateIron'))
	.key('F', item('appliedenergistics2:material', 54)) // 1k Fluid Storage Component
	.key('P', item('appliedenergistics2:material', 22)) // Logic Processor
	.key('A', item('appliedenergistics2:molecular_assembler'))
	.register()
