package postInit.main.modSpecific

import static gregtech.api.GTValues.*

// Conductive Plate
mods.gregtech.assembler.recipeBuilder()
	.inputs(metaitem('plateRedAlloy'), item('projectred-core:resource_item'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 1))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Pointer
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('circuitUlv'), item('projectred-core:resource_item'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 12))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Wired Plate
mods.gregtech.assembler.recipeBuilder()
	.inputs(metaitem('wireGtSingleRedAlloy'), item('projectred-core:resource_item'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 2))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Bundled Plate
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('projectred-core:resource_item'), ore('projredBundledCable'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 3))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Platformed Plate
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('projectred-core:resource_item') * 3, item('projectred-core:resource_item', 2) * 2, ore('frameGtWood'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 4))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Anode
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('projectred-core:resource_item'), ore('plateRedstone'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 10))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Cathode
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('projectred-core:resource_item'), ore('boltRedAlloy'))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 11))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Silicon Chip
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('projectred-core:resource_item') * 3, item('projectred-core:resource_item', 320))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 20))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

// Energized Silicon Chip
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('projectred-core:resource_item') * 3, item('projectred-core:resource_item', 341))
	.circuitMeta(7)
	.outputs(item('projectred-core:resource_item', 21))
	.duration(100).EUt(VA[LV])
	.buildAndRegister()

