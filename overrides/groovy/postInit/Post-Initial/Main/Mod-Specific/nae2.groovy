
// 256k Storage
crafting.removeByOutput(item('nae2:material:1'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.lv'), ore('circuitIv'), item('appliedenergistics2:material:24'))
	.fluidInputs(fluid('soldering_alloy') * 144)
	.outputs(item('nae2:material:1'))
	.scannerResearch(b -> b.researchStack(item('appliedenergistics2:material:38')))
	.duration(200)
	.EUt(15360)
	.buildAndRegister()

// 1024k Storage
crafting.removeByOutput(item('nae2:material:2'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.mv'), ore('circuitLuv'), item('nae2:material:1'))
	.fluidInputs(fluid('soldering_alloy') * 144)
	.outputs(item('nae2:material:2'))
	.scannerResearch(b -> b.researchStack(item('nae2:material:1')))
	.duration(200)
	.EUt(30720)
	.buildAndRegister()

// 4096k Storage
crafting.removeByOutput(item('nae2:material:3'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.hv'), ore('circuitZpm'), item('nae2:material:2'))
	.fluidInputs(fluid('soldering_alloy') * 288)
	.outputs(item('nae2:material:3'))
	.stationResearch(b -> b.researchStack(metaitem('quantum_chest.iv')).CWUt(16))
	.duration(400)
	.EUt(61440)
	.buildAndRegister()

// 16384k Storage
crafting.removeByOutput(item('nae2:material:4'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.ev'), ore('circuitUv'), item('nae2:material:3'))
	.fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('nae2:material:4'))
	.stationResearch(b -> b.researchStack(metaitem('quantum_chest.luv')).CWUt(32))
	.duration(600)
	.EUt(122880)
	.buildAndRegister()

// 256k Fluid Storage
crafting.removeByOutput(item('nae2:material:5'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:5'))
	.inputs(metaitem('field.generator.lv'), ore('circuitIv'), item('appliedenergistics2:material:22'))
	.fluidInputs(fluid('soldering_alloy') * 144)
	.scannerResearch(b -> b.researchStack(item('appliedenergistics2:material:57')))
	.duration(200)
	.EUt(15360)
	.buildAndRegister()

// 1024k Fluid Storage
crafting.removeByOutput(item('nae2:material:6'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:6'))
	.inputs(metaitem('field.generator.mv'), ore('circuitLuv'), item('nae2:material:5'))
	.fluidInputs(fluid('soldering_alloy') * 144)
	.scannerResearch(b -> b.researchStack(item('nae2:material:5')))
	.duration(200)
	.EUt(30720)
	.buildAndRegister()

// 4096k Fluid Storage
crafting.removeByOutput(item('nae2:material:7'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:7'))
	.inputs(metaitem('field.generator.hv'), ore('circuitZpm'), item('nae2:material:6'))
	.fluidInputs(fluid('soldering_alloy') * 288)
	.stationResearch(b -> b.researchStack(metaitem('quantum_tank.iv')).CWUt(16))
	.duration(400)
	.EUt(61440)
	.buildAndRegister()

// 16384k Fluid Storage
crafting.removeByOutput(item('nae2:material:8'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:8'))
	.inputs(metaitem('field.generator.ev'), ore('circuitUv'), item('nae2:material:7'))
	.fluidInputs(fluid('soldering_alloy') * 576)
	.stationResearch(b -> b.researchStack(metaitem('quantum_tank.luv')).CWUt(32))
	.duration(600)
	.EUt(122880)
	.buildAndRegister()
