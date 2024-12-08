import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import net.minecraft.item.ItemStack

import static gregtech.api.GTValues.*

/* Usable Blocks */
// ME Drive
crafting.shapedBuilder()
	.output(item('appliedenergistics2:drive'))
	.matrix(
		'PEP',
		'LCL',
		'PSP')
	.key('P', metaitem('plateAluminium'))
	.key('E', metaitem('emitter.mv'))
	.key('L', ore('circuitLv'))
	.key('C', item('appliedenergistics2:chest'))
	.key('S', metaitem('sensor.mv'))
	.replace().register()

// ME Inscriber
crafting.shapedBuilder()
	.output(item('appliedenergistics2:inscriber'))
	.matrix(
		'DPD',
		'FHD',
		'DPD')
	.key('D', metaitem('nomilabs:plateDarkSteel'))
	.key('P', metaitem('electric.piston.mv'))
	.key('F', item('appliedenergistics2:material', 7))
	.key('H', metaitem('hull.mv'))
	.replace().register()

// Crafting CPU
crafting.shapedBuilder()
	.output(item('appliedenergistics2:crafting_unit'))
	.matrix(
		'PCP',
		'FLF',
		'PCP')
	.key('P', metaitem('plateAluminium'))
	.key('C', item('appliedenergistics2:material', 23))
	.key('F', item('appliedenergistics2:part', 16))
	.key('L', item('appliedenergistics2:material', 22))
	.replace().register()

// Molecular Assembler
crafting.shapedBuilder()
	.output(item('appliedenergistics2:molecular_assembler'))
	.matrix(
		'PGP',
		'ACF',
		'PGP')
	.key('P', metaitem('plateAluminium'))
	.key('G', item('appliedenergistics2:quartz_glass'))
	.key('A', item('appliedenergistics2:material', 44))
	.key('C', metaitem('workbench'))
	.key('F', item('appliedenergistics2:material', 43))
	.replace().register()

// Matter Condensor
crafting.shapedBuilder()
	.output(item('appliedenergistics2:condenser'))
	.matrix(
		'PPP',
		'PSP',
		'PPP')
	.key('P', metaitem('plateTitanium'))
	.key('S', metaitem('quantumstar'))
	.replace().register()

// Energy Acceptor
crafting.shapedBuilder()
	.output(item('appliedenergistics2:energy_acceptor'))
	.matrix(
		'PFP',
		'FHF',
		'PFP')
	.key('P', metaitem('nomilabs:plateElectricalSteel'))
	.key('F', item('moreplates:fluix_plate'))
	.key('H', metaitem('hull.lv'))
	.replace().register()

// Charger
crafting.shapedBuilder()
	.output(item('appliedenergistics2:charger'))
	.matrix(
		'DCD',
		'D  ',
		'DCD')
	.key('D', metaitem('nomilabs:plateDarkSteel'))
	.key('C', metaitem('plateCertusQuartz'))
	.replace().register()

// ME Chest
crafting.shapedBuilder()
	.output(item('appliedenergistics2:chest'))
	.matrix(
		'GPG',
		'CSF',
		'DQD')
	.key('G', item('appliedenergistics2:quartz_glass'))
	.key('P', item('appliedenergistics2:part', 180))
	.key('C', item('appliedenergistics2:material', 10))
	.key('S', item('actuallyadditions:block_giant_chest'))
	.key('F', item('appliedenergistics2:material', 12))
	.key('D', ore('blockDarkSteel'))
	.key('Q', item('appliedenergistics2:material', 11))
	.replace().register()

// Quantum Ring
crafting.shapedBuilder()
	.output(item('appliedenergistics2:quantum_ring'))
	.matrix(
		'PCP',
		'EQE',
		'PCP')
	.key('P', metaitem('plateStainlessSteel'))
	.key('C', item('appliedenergistics2:material', 23))
	.key('E', item('appliedenergistics2:material', 24))
	.key('Q', metaitem('quantumstar'))
	.replace().register()

// Interfaces
var makeInterface = { String recipeName, OreDictIngredient plate, ItemStack moving, ItemStack interfaceStack ->
	crafting.remove(recipeName)
	crafting.shapedBuilder()
		.output(interfaceStack)
		.matrix(
			'PRP',
			'AMF',
			'PPP')
		.key('P', plate)
		.key('R', moving)
		.key('A', item('appliedenergistics2:material', 44))
		.key('M', metaitem('hull.mv'))
		.key('F', item('appliedenergistics2:material', 43))
		.register()
}

// Interface
makeInterface('appliedenergistics2:network/blocks/interfaces_interface', ore('plateAluminium'), metaitem('robot.arm.mv'), item('appliedenergistics2:interface'))

// Fluid Interface
makeInterface('appliedenergistics2:network/blocks/fluid_interfaces_interface', ore('plateLapis'), metaitem('electric.pump.mv'), item('appliedenergistics2:fluid_interface'))

/* Cables */
// Quartz Fiber
crafting.removeByOutput(item('appliedenergistics2:part', 140))
mods.gregtech.wiremill.recipeBuilder()
	.inputs(item('appliedenergistics2:material', 11))
	.outputs(item('appliedenergistics2:part', 140) * 2)
	.duration(100).EUt(VHA[LV])
	.buildAndRegister()

// Glass Cable
crafting.remove('appliedenergistics2:network/cables/glass_fluix')
mods.gregtech.alloy_smelter.recipeBuilder()
	.inputs(ore('dustFluix'), item('appliedenergistics2:part', 140))
	.outputs(item('appliedenergistics2:part', 16) * 2)
	.duration(50).EUt(VHA[LV])
	.buildAndRegister()

// Covered Cable
crafting.remove('appliedenergistics2:network/cables/covered_fluix')
for (var rubber in [fluid('rubber') * 144, fluid('styrene_butadiene_rubber') * 36, fluid('silicone_rubber') * 76]) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(item('appliedenergistics2:part', 16))
		.fluidInputs(rubber)
		.outputs(item('appliedenergistics2:part', 36))
		.duration(100).EUt(VA[ULV])
		.buildAndRegister()
}

// ME Conduit
crafting.removeByOutput(item('enderio:item_me_conduit'))
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('appliedenergistics2:part', 36) * 3, item('enderio:item_material', 4) * 6)
	.outputs(item('enderio:item_me_conduit') * 8)
	.duration(100).EUt(VHA[LV])
	.buildAndRegister()


/* Block Parts */
/* Planes */
var makePlane = { OreDictIngredient plate, ItemStack core, ItemStack plane ->
	crafting.shapedBuilder()
		.output(plane)
		.matrix(
			'FFF',
			'PAP')
		.key('F', item('moreplates:fluix_plate'))
		.key('P', plate)
		.key('A', core)
		.replace().register()
}

// Formation Plane
makePlane(ore('plateAluminium'), item('appliedenergistics2:material', 43), item('appliedenergistics2:part', 320))

// Annihilation Plane
makePlane(ore('plateAluminium'), item('appliedenergistics2:material', 44), item('appliedenergistics2:part', 300))

// Fluid Formation Plane
makePlane(ore('plateLapis'), item('appliedenergistics2:material', 43), item('appliedenergistics2:part', 321))

// Fluid Annihilation Plane
makePlane(ore('plateLapis'), item('appliedenergistics2:material', 44), item('appliedenergistics2:part', 302))

/* Level Emitters */
var makeEmitter = { OreDictIngredient plate, ItemStack emitter ->
	crafting.shapedBuilder()
		.output(emitter)
		.matrix(
			'TP',
			'CR')
		.key('T', item('minecraft:redstone_torch'))
		.key('P', plate)
		.key('C', item('appliedenergistics2:material', 23))
		.key('R', ore('stickStainlessSteel'))
		.replace().register()
}

// Item Emitter
makeEmitter(ore('plateAluminium'), item('appliedenergistics2:part', 280))

// Fluid Emitter
makeEmitter(ore('plateLapis'), item('appliedenergistics2:part', 281))

/* Terminals */
// ME Terminal
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 380))
	.input(ore('itemIlluminatedPanel'))
	.input(ore('circuitLv'))
	.replace().register()

// Pattern Terminal
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 340))
	.input(item('appliedenergistics2:material', 24))
	.input(item('appliedenergistics2:part', 380))
	.input(item('appliedenergistics2:material', 52))
	.replace().register()

// Fluid Terminal
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 520))
	.input(item('appliedenergistics2:part', 380))
	.input(metaitem('plateLapis'))
	.input(item('appliedenergistics2:material', 22))
	.replace().register()

// Extended Processing Pattern Terminal
crafting.shapedBuilder()
	.output(item('appliedenergistics2:part', 341))
	.matrix(
		'A',
		'B',
		'C')
	.key('A', item('appliedenergistics2:part', 340))
	.key('B', ore('circuitEv'))
	.key('C', item('packagedauto:encoder'))
	.replace().register()

// Configuration Fluid Interface Terminal
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 522))
	.input(item('appliedenergistics2:part', 520))
	.input(item('appliedenergistics2:material', 24))
	.input(item('appliedenergistics2:fluid_interface').or(item('appliedenergistics2:part', 441)))
	.replace().register()

/* Buses */
var makeImportBus = { OreDictIngredient plate, ItemStack bus ->
	crafting.shapedBuilder()
		.output(bus)
		.matrix(
			' A ',
			'PEP')
		.key('A', item('appliedenergistics2:material', 44))
		.key('P', plate)
		.key('E', metaitem('electric.piston.mv'))
		.replace().register()
}

var makeExportBus = { OreDictIngredient plate, ItemStack bus ->
	crafting.shapedBuilder()
		.output(bus)
		.matrix(
			'PEP',
			' A ')
		.key('P', plate)
		.key('E', item('appliedenergistics2:material', 43))
		.key('A', metaitem('electric.piston.mv'))
		.replace().register()
}

// Import Bus
makeImportBus(ore('plateAluminium'), item('appliedenergistics2:part', 240))

// Fluid Import Bus
makeImportBus(ore('plateLapis'), item('appliedenergistics2:part', 241))

// Export Bus
makeExportBus(ore('plateAluminium'), item('appliedenergistics2:part', 260))

// Fluid Export Bus
makeExportBus(ore('plateLapis'), item('appliedenergistics2:part', 261))

// Storage Bus
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 220))
	.input(metaitem('electric.piston.mv'), item('appliedenergistics2:interface'))
	.replace().register()

// Fluid Storage Bus
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 221))
	.input(metaitem('electric.pump.mv'), item('appliedenergistics2:fluid_interface'))
	.replace().register()

// Oredict Storage Bus
crafting.shapelessBuilder()
	.output(item('appliedenergistics2:part', 222))
	.input(item('appliedenergistics2:part', 220), metaitem('ore_dictionary_filter'))

/* Misc Block Parts */
// P2P Tunnel
crafting.shapedBuilder()
	.output(item('appliedenergistics2:part', 460))
	.matrix(
		' P ',
		'PEP',
		'FFF')
	.key('P', metaitem('plateStainlessSteel'))
	.key('E', item('appliedenergistics2:material', 24))
	.key('F', ore('plateFluix'))
	.replace().register()

// Illuminated Panel
crafting.remove('appliedenergistics2:network/parts/panels_semi_dark_monitor')
crafting.shapedBuilder()
	.output(item('appliedenergistics2:part', 180))
	.matrix(
		'GGG',
		'PPP')
	.key('G', item('appliedenergistics2:quartz_glass'))
	.key('P', item('moreplates:fluix_plate'))
	.register()

// Cable Anchor
crafting.replaceShapeless(item('appliedenergistics2:part', 120), [ore('boltSteel')])

/* Misc Blocks */
// Vibrant Quartz Glass
crafting.removeByOutput(item('appliedenergistics2:quartz_vibrant_glass'))
mods.gregtech.alloy_smelter.recipeBuilder()
	.inputs(item('appliedenergistics2:quartz_glass'), ore('ingotVibrantAlloy'))
	.outputs(item('appliedenergistics2:quartz_vibrant_glass'))
	.duration(80).EUt(VHA[LV])
	.buildAndRegister()

