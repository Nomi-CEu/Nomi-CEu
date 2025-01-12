package postInit.main.modSpecific

import static gregtech.api.GTValues.*

// Crafting Removals
crafting.removeByOutput(item('nae2:material'))
crafting.removeByOutput(item('nae2:material', 1))
crafting.removeByOutput(item('nae2:material', 2))
crafting.removeByOutput(item('nae2:material', 3))
crafting.removeByOutput(item('nae2:material', 4))
crafting.removeByOutput(item('nae2:material', 5))
crafting.removeByOutput(item('nae2:material', 6))
crafting.removeByOutput(item('nae2:material', 7))
crafting.removeByOutput(item('nae2:material', 8))
crafting.removeByOutput(item('nae2:part'))
crafting.removeByOutput(item('nae2:reconstruction_chamber'))
crafting.remove("nae2:block/exposer")

/* Item Storage */
// Void Storage Component
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('appliedenergistics2:material', 35), item('appliedenergistics2:material', 44) * 2, ore('circuitHv'))
	.outputs(item('nae2:material'))
	.duration(100).EUt(VA[HV])
	.buildAndRegister()

// 256k Storage (Tin Recipe is Auto Generated from the Soldering Alloy Recipe)
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('appliedenergistics2:quartz_glass') * 4, ore('plateTitanium') * 4, ore('circuitIv'), item('appliedenergistics2:material', 24), metaitem('field.generator.lv'), ore('wireFineRedAlloy') * 16)
	.fluidInputs(fluid('soldering_alloy') * 72)
	.outputs(item('nae2:material', 1))
	.duration(200).EUt(VA[IV])
	.buildAndRegister()

// 1024k Storage
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('nae2:material', 1), ore('circuitLuv'), item('appliedenergistics2:material', 24) * 4, ore('plateSignalum') * 4, ore('foilPolybenzimidazole') * 4, ore('gemExquisiteCertusQuartz'), metaitem('field.generator.mv'), ore('wireFineGold') * 16, ore('wireGtSingleEndSteel') * 4)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('nae2:material', 2))
	.scannerResearch(b -> b.researchStack(item('nae2:material', 1)))
	.duration(400).EUt(VA[LuV])
	.buildAndRegister()

// 4096k Storage
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('nae2:material', 2), ore('circuitZpm'), item('appliedenergistics2:material', 24) * 4, ore('plateRuridit') * 4, ore('foilPolybenzimidazole') * 4, ore('gemExquisiteCertusQuartz'), metaitem('field.generator.hv'), ore('wireFineGold') * 32, ore('wireGtSingleEndSteel') * 8)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('nae2:material', 3))
	.stationResearch(b -> b.researchStack(item('nae2:material', 2)).CWUt(16))
	.duration(800).EUt(VA[ZPM])
	.buildAndRegister()

// 16384k Storage
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('nae2:material', 3), ore('circuitUv'), item('appliedenergistics2:material', 24) * 4, ore('plateTrinium') * 4, ore('foilPolybenzimidazole') * 4, ore('gemExquisiteCertusQuartz'), metaitem('field.generator.ev'), ore('wireFineGold') * 64, ore('wireGtSingleEndSteel') * 16)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('nae2:material', 4))
	.stationResearch(b -> b.researchStack(item('nae2:material', 3)).CWUt(48))
	.duration(1600).EUt(VA[UV])
	.buildAndRegister()

/* Fluid Storage */
// 256k Fluid Storage (Tin Recipe is Auto Generated from the Soldering Alloy Recipe)
mods.gregtech.assembler.recipeBuilder()
	.inputs(item('appliedenergistics2:quartz_glass') * 4, ore('plateCobaltBrass') * 4, ore('circuitIv'), item('appliedenergistics2:material', 22), metaitem('field.generator.lv'), ore('wireFineRedAlloy') * 16)
	.fluidInputs(fluid('soldering_alloy') * 72)
	.outputs(item('nae2:material', 5))
	.duration(200).EUt(VA[IV])
	.buildAndRegister()

// 1024k Fluid Storage
mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material', 6))
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('nae2:material', 5), ore('circuitLuv'), item('appliedenergistics2:material', 22) * 4, ore('plateWatertightSteel') * 4, ore('foilPolybenzimidazole') * 4, ore('gemExquisiteCertusQuartz'), metaitem('field.generator.mv'), ore('wireFineGold') * 16, ore('wireGtSingleEndSteel') * 4)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.scannerResearch(b -> b.researchStack(item('nae2:material', 5)))
	.duration(400).EUt(VA[LuV])
	.buildAndRegister()

// 4096k Fluid Storage
mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material', 7))
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('nae2:material', 6), ore('circuitZpm'), item('appliedenergistics2:material', 22) * 4, ore('plateRuridit') * 4, ore('foilPolybenzimidazole') * 4, ore('gemExquisiteCertusQuartz'), metaitem('field.generator.hv'), ore('wireFineGold') * 32, ore('wireGtSingleEndSteel') * 8)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.stationResearch(b -> b.researchStack(item('nae2:material', 6)).CWUt(16))
	.duration(800).EUt(VA[ZPM])
	.buildAndRegister()

// 16384k Fluid Storage
mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material', 8))
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('nae2:material', 7), ore('circuitUv'), item('appliedenergistics2:material', 22) * 4, ore('plateTrinium') * 4, ore('foilPolybenzimidazole') * 4, ore('gemExquisiteCertusQuartz'), metaitem('field.generator.ev'), ore('wireFineGold') * 64, ore('wireGtSingleEndSteel') * 16)
	.fluidInputs(fluid('soldering_alloy') * 576)
	.stationResearch(b -> b.researchStack(item('nae2:material', 7)).CWUt(48))
	.duration(1600).EUt(VA[UV])
	.buildAndRegister()

/* Special Parts */
// ME Beam Former
mods.gregtech.assembler.recipeBuilder()
	.outputs(item('nae2:part') * 2)
	.inputs(item('appliedenergistics2:quartz_glass') * 4, item('appliedenergistics2:material', 23) * 2, ore('circuitEv'), ore('plateGlowstone') * 4, item('appliedenergistics2:material', 41), item('appliedenergistics2:part', 16) * 4)
	.duration(200).EUt(VA[EV])
	.buildAndRegister()

// Reconstruction Chamber
mods.gregtech.assembler.recipeBuilder()
	.outputs(item('nae2:reconstruction_chamber'))
	.inputs(item('actuallyadditions:block_misc', 9), item('appliedenergistics2:quartz_glass') * 4, ore('plateBlackSteel') * 4, ore('craftingLensGlass'), ore('circuitHv'), metaitem('sensor.hv'), item('appliedenergistics2:material', 24) * 2)
	.duration(200).EUt(VA[HV])
	.buildAndRegister()

// ME Storage Exposer
mods.gregtech.assembler.recipeBuilder()
	.outputs(item('nae2:exposer'))
	.inputs(item('appliedenergistics2:part', 220) * 4, item('appliedenergistics2:material', 47), ore('plateStainlessSteel') * 4, ore('circuitHv') * 2, metaitem('emitter.hv'), metaitem('sensor.hv'), item('appliedenergistics2:material', 43) * 2)
	.duration(200).EUt(VA[HV])
	.buildAndRegister()

