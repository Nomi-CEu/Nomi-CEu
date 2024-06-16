package ae2

import static gregtech.api.GTValues.*

/* Usable Items */
// Meteorite Compass
crafting.removeByOutput(item('appliedenergistics2:sky_compass'))
crafting.shapedBuilder()
	.output(item('appliedenergistics2:sky_compass'))
	.matrix(
		'VPV',
		'PCP',
		'VPV')
	.key('V', item('actuallyadditions:item_crystal:3'))
	.key('P', metaitem('nomilabs:plateDarkSteel'))
	.key('C', item('appliedenergistics2:material:1'))
	.replace().register()

// Memory Card
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:memory_card'))
	.input(item('appliedenergistics2:material:25'))
	.input(ore('circuitHv'))
	.replace().register()

// Network Tool
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:network_tool'))
	.input(ore('itemIlluminatedPanel'), item('actuallyadditions:item_laser_wrench'))
	.replace().register()

/* Materials */
// Pattern
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:52') * 8)
	.matrix(
		'WWW',
		'PCP',
		'PPP')
	.key('W', metaitem('wireFineSilver'))
	.key('P', metaitem('platePlastic'))
	.key('C', ore('circuitHv'))
	.replace().register()

// Fluix Plate
mods.gregtech.compressor.recipeBuilder()
	.inputs(item('appliedenergistics2:material:7'))
	.outputs(item('moreplates:fluix_plate'))
	.duration(20).EUt(VHA[LV])
	.buildAndRegister()

mods.gregtech.compressor.recipeBuilder()
	.inputs(item('appliedenergistics2:material:12'))
	.outputs(item('moreplates:fluix_plate'))
	.duration(20).EUt(VHA[LV])
	.buildAndRegister()

// Wireless Part
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:41'))
	.matrix(
		' E ',
		'PFP',
		' P ')
	.key('E', metaitem('emitter.ev'))
	.key('P', metaitem('plateTitanium'))
	.key('F', item('appliedenergistics2:material:9'))
	.replace().register()

// Basic Card
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:25'))
	.matrix(
		'WP ',
		'WCP',
		'WP ')
	.key('W', ore('wireFineCopper'))
	.key('P', ore('plateIron'))
	.key('C', item('appliedenergistics2:material:23'))
	.replace().register()

// Advanced Card
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:28'))
	.matrix(
		'WP ',
		'WCP',
		'WP ')
	.key('W', ore('wireFineAluminium'))
	.key('P', ore('plateElectricalSteel'))
	.key('C', item('appliedenergistics2:material:23'))
	.replace().register()

/* Storage */
// Storage Cell Removals
crafting.remove('appliedenergistics2:network/cells/storage_cell_1k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_4k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_16k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_64k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_1k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_4k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_16k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_64k')

// Storage Housing
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:39'))
	.matrix(
		'WPW',
		'P P',
		'WPW')
	.key('W', metaitem('wireFineRedAlloy'))
	.key('P', metaitem('nomilabs:plateElectricalSteel'))
	.replace().register()

// 1k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:35'))
	.matrix('GPG',
		'PCP',
		'GPG')
	.key('G', item('minecraft:glass'))
	.key('P', metaitem('plateRedAlloy'))
	.key('C', ore('circuitLv'))
	.replace().register()

// 4k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:36'))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('minecraft:glass'))
	.key('B', item('appliedenergistics2:material:22'))
	.key('C', item('appliedenergistics2:material:35'))
	.key('D', ore('circuitMv'))
	.replace().register()

// 16k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:37'))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('minecraft:glass'))
	.key('B', item('appliedenergistics2:material:24'))
	.key('C', item('appliedenergistics2:material:36'))
	.key('D', ore('circuitHv'))
	.replace().register()

// 64k Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:38'))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('appliedenergistics2:material:22'))
	.key('B', item('appliedenergistics2:material:24'))
	.key('C', item('appliedenergistics2:material:37'))
	.key('D', ore('circuitEv'))
	.replace().register()

// 1k Fluid Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:54'))
	.matrix(
		'GPG',
		'PCP',
		'GPG')
	.key('G', item('minecraft:glass'))
	.key('P', metaitem('plateLapis'))
	.key('C', ore('circuitLv'))
	.replace().register()

// 4k Fluid Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:55'))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('minecraft:glass'))
	.key('B', item('appliedenergistics2:material:22'))
	.key('C', item('appliedenergistics2:material:54'))
	.key('D', ore('circuitMv'))
	.replace().register()

// 16k Fluid Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:56'))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('minecraft:glass'))
	.key('B', item('appliedenergistics2:material:24'))
	.key('C', item('appliedenergistics2:material:55'))
	.key('D', ore('circuitHv'))
	.replace().register()

// 64k Fluid Storage
crafting.shapedBuilder()
	.output(item('appliedenergistics2:material:57'))
	.matrix(
		'ABA',
		'CDC',
		'ACA')
	.key('A', item('appliedenergistics2:material:22'))
	.key('B', item('appliedenergistics2:material:24'))
	.key('C', item('appliedenergistics2:material:56'))
	.key('D', ore('circuitEv'))
	.replace().register()
