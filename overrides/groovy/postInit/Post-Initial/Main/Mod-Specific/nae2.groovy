import gregtech.api.recipes.builders.AssemblerRecipeBuilder
import net.minecraftforge.fluids.FluidStack

import static gregtech.api.GTValues.*

// Removals
crafting.removeByOutput(item('nae2:material:1'))
crafting.removeByOutput(item('nae2:material:2'))
crafting.removeByOutput(item('nae2:material:3'))
crafting.removeByOutput(item('nae2:material:4'))
crafting.removeByOutput(item('nae2:material:5'))
crafting.removeByOutput(item('nae2:material:6'))
crafting.removeByOutput(item('nae2:material:7'))
crafting.removeByOutput(item('nae2:material:8'))

/* Item Storage */
// 256k Storage (Tin Recipe is Auto Generated from the Soldering Alloy Recipe)
mods.gregtech.assembler.recipeBuilder()
	.inputs(metaitem('field.generator.lv'), ore('circuitIv'), item('appliedenergistics2:material:24'))
	.fluidInputs(fluid('soldering_alloy') * 72)
	.outputs(item('nae2:material:1'))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

// 1024k Storage
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.mv'), ore('circuitLuv'), item('nae2:material:1'))
	.fluidInputs(fluid('soldering_alloy') * 144)
	.outputs(item('nae2:material:2'))
	.scannerResearch(b -> b.researchStack(item('nae2:material:1')))
	.duration(200).EUt(VA[LuV])
	.buildAndRegister()

// 4096k Storage
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.hv'), ore('circuitZpm'), item('nae2:material:2'))
	.fluidInputs(fluid('soldering_alloy') * 288)
	.outputs(item('nae2:material:3'))
	.stationResearch(b -> b.researchStack(item('nae2:material:2')).CWUt(16))
	.duration(400).EUt(VA[ZPM])
	.buildAndRegister()

// 16384k Storage
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.ev'), ore('circuitUv'), item('nae2:material:3'))
	.fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('nae2:material:4'))
	.stationResearch(b -> b.researchStack(item('nae2:material:3')).CWUt(48))
	.duration(800).EUt(VA[UV])
	.buildAndRegister()

/* Fluid Storage */
// 256k Fluid Storage (Tin Recipe is Auto Generated from the Soldering Alloy Recipe)
mods.gregtech.assembler.recipeBuilder()
	.inputs(metaitem('field.generator.lv'), ore('circuitIv'), item('appliedenergistics2:material:22'))
	.fluidInputs(fluid('soldering_alloy') * 72)
	.outputs(item('nae2:material:5'))
	.duration(100).EUt(VA[IV])
	.buildAndRegister()

// 1024k Fluid Storage
mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:6'))
	.inputs(metaitem('field.generator.mv'), ore('circuitLuv'), item('nae2:material:5'))
	.fluidInputs(fluid('soldering_alloy') * 144)
	.scannerResearch(b -> b.researchStack(item('nae2:material:5')))
	.duration(200).EUt(VA[LuV])
	.buildAndRegister()

// 4096k Fluid Storage
mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:7'))
	.inputs(metaitem('field.generator.hv'), ore('circuitZpm'), item('nae2:material:6'))
	.fluidInputs(fluid('soldering_alloy') * 288)
	.stationResearch(b -> b.researchStack(item('nae2:material:6')).CWUt(16))
	.duration(400).EUt(VA[ZPM])
	.buildAndRegister()

// 16384k Fluid Storage
mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:8'))
	.inputs(metaitem('field.generator.ev'), ore('circuitUv'), item('nae2:material:7'))
	.fluidInputs(fluid('soldering_alloy') * 576)
	.stationResearch(b -> b.researchStack(item('nae2:material:7')).CWUt(48))
	.duration(800).EUt(VA[UV])
	.buildAndRegister()
