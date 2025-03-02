package postInit.main.general.lateGame

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.builders.AssemblyLineRecipeBuilder
import gregtech.api.recipes.recipeproperties.ResearchProperty

import static gregtech.api.GTValues.*

// ZPM Field Generator
mods.gregtech.assembly_line.changeByOutput([metaitem('field.generator.zpm')], null)
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { AssemblyLineRecipeBuilder recipe ->
			recipe.fluidInputs(fluid('awakened_draconium') * 1296)
		}.copyProperties(ResearchProperty.instance)
		.replaceAndRegister()
	}

// UV Field Generator (HM Only)
if (LabsModeHelper.expert) {
	mods.gregtech.assembly_line.changeByOutput([metaitem('field.generator.uv')], null)
		.forEach { ChangeRecipeBuilder builder ->
			builder.builder { AssemblyLineRecipeBuilder recipe ->
				recipe.fluidInputs(fluid('taranium') * 288)
			}.copyProperties(ResearchProperty.instance)
			.replaceAndRegister()
		}
}

// Dark Soularium Jetplate
mods.gregtech.assembly_line.recipeBuilder()
	.inputWildNBT(item('simplyjetpacks:itemjetpack', 8))
	.inputs(item('simplyjetpacks:metaitemmods', 4) * 2, item('extrautils2:angelring'), item('enderio:item_material', 16) * 2, item('nomilabs:doublecompressedoctadiccapacitor'), ore('circuitLuv') * 4, item('simplyjetpacks:metaitemmods', 11) * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152)
	.outputs(item('simplyjetpacks:itemjetpack', 9))
	.stationResearch(b -> b.researchStack(item('simplyjetpacks:metaitemmods', 11)).CWUt(16))
	.duration(3000).EUt(VA[LuV])
	.buildAndRegister()

// Flux-Infused Jetplate
mods.gregtech.assembly_line.recipeBuilder()
	.inputWildNBT(item('simplyjetpacks:itemjetpack', 17))
	.inputWildNBT(item('redstonearsenal:armor.plate_flux'))
	.inputs(item('simplyjetpacks:metaitemmods', 21), item('extrautils2:angelring'), item('nomilabs:compressedoctadiccapacitor') * 2, ore('circuitLuv') * 4, item('simplyjetpacks:metaitemmods', 30) * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152)
	.outputs(item('simplyjetpacks:itemjetpack', 18))
	.stationResearch(b -> b.researchStack(item('simplyjetpacks:metaitemmods', 30)).CWUt(16))
	.duration(3000).EUt(VA[LuV])
	.buildAndRegister()

// Rotary Hearth Furnace
if (LabsModeHelper.normal) {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('electric_blast_furnace'), ore('circuitUv') * 4, metaitem('field.generator.luv') * 4, metaitem('springNaquadahAlloy') * 4, metaitem('plateDenseNaquadahAlloy') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
		.fluidInputs(fluid('soldering_alloy') * 1152)
		.outputs(metaitem('gcym:mega_blast_furnace'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(metaitem('electric_blast_furnace')).CWUt(16))
		.duration(1200).EUt(VA[LuV])
		.buildAndRegister()
} else {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('electric_blast_furnace'), ore('circuitUhv') * 4, metaitem('field.generator.uv') * 4, metaitem('springTritanium') * 4, metaitem('plateTritanium') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
		.fluidInputs(fluid('soldering_alloy') * 1152)
		.outputs(metaitem('gcym:mega_blast_furnace'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(metaitem('electric_blast_furnace')).CWUt(128).EUt(VA[UHV]))
		.duration(1200).EUt(VA[UV])
		.buildAndRegister()
}

// Bulk Blast Chiller
if (LabsModeHelper.normal) {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('vacuum_freezer'), ore('circuitUv') * 4, metaitem('field.generator.luv') * 4, metaitem('pipeNormalFluidNaquadah') * 4, metaitem('plateDenseNaquadahAlloy') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
		.fluidInputs(fluid('soldering_alloy') * 1152)
		.outputs(metaitem('gcym:mega_vacuum_freezer'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(metaitem('vacuum_freezer')).CWUt(16))
		.duration(1200).EUt(VA[LuV])
		.buildAndRegister()
} else {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('vacuum_freezer'), ore('circuitUhv') * 4, metaitem('field.generator.uv') * 4, metaitem('pipeNormalFluidDuranium') * 4, metaitem('plateDenseTritanium') * 4, metaitem('wireGtQuadrupleUraniumRhodiumDinaquadide') * 4)
		.fluidInputs(fluid('soldering_alloy') * 1152)
		.outputs(metaitem('gcym:mega_vacuum_freezer'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(metaitem('vacuum_freezer')).CWUt(128).EUt(VA[UHV]	))
		.duration(1200).EUt(VA[UV])
		.buildAndRegister()
}

// Naquadah Reactor 1
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('cover.screen'), item('appliedenergistics2:spatial_pylon') * 3, ore('circuitZpm'), item('gregtech:transparent_casing', 1) * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152, fluid('omnium') * 32)
	.outputs(metaitem('nomilabs:naquadah_reactor_1'))
	.stationResearch(b -> b.researchStack(metaitem('boltNaquadah')).CWUt(16))
	.duration(1500).EUt(VA[ZPM])
	.buildAndRegister()

// Naquadah Reactor 2
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('cover.screen'), item('appliedenergistics2:spatial_pylon') * 3, ore('circuitUv'), item('gregtech:transparent_casing', 1) * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152, fluid('omnium') * 288)
	.outputs(metaitem('nomilabs:naquadah_reactor_2'))
	.stationResearch(b -> b.researchStack(metaitem('nomilabs:naquadah_reactor_1')).CWUt(64).EUt(VA[UV]))
	.duration(1500).EUt(VA[UV])
	.buildAndRegister()

// Universal Navigator
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('nomilabs:frameMicroversium'), metaitem('nomilabs:plateMicroversium') * 24, metaitem('gravistar'), metaitem('sensor.uv') * 2, metaitem('robot.arm.uv') * 2, ore('circuitUhv'), metaitem('plateDenseNaquadahAlloy') * 2, metaitem('wireGtQuadrupleEnrichedNaquadahTriniumEuropiumDuranide') * 4, metaitem('wireFineTritanium') * 64)
	.fluidInputs(fluid('soldering_alloy') * 1152, fluid('naquadria') * 576)
	.outputs(item('nomilabs:universalnavigator'))
	.stationResearch(b -> b.researchStack(item('nomilabs:stellarcreationdata')).CWUt(96).EUt(VA[UV]))
	.duration(6000).EUt(VA[UV])
	.buildAndRegister()

// Ultimate Material
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(item('draconicevolution:dragon_heart'), item('armorplus:material', 1) * 4, item('armorplus:material', 2) * 8, item('armorplus:material', 3) * 12)
	.outputs(item('armorplus:material', 4))
	.stationResearch(b -> b.researchStack(item('draconicevolution:dragon_heart')).CWUt(96).EUt(VA[UV]))
	.duration(600).EUt(VA[UV])
	.buildAndRegister()

// Reactor Stabilizer Rotor Assembly
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(ore('frameGtAwakenedDraconium'), ore('gearAwakenedDraconium'), ore('plateAwakenedDraconium') * 2, item('draconicevolution:reactor_part', 1) * 2, item('draconicevolution:reactor_part', 2) * 2)
	.fluidInputs(fluid('soldering_alloy') * 1152)
	.outputs(item('draconicevolution:reactor_part', 3))
	.stationResearch(b -> b.researchStack(metaitem('nomilabs:gearAwakenedDraconium')).CWUt(96).EUt(VA[UV]))
	.duration(600).EUt(VA[UV])
	.buildAndRegister()

// Reactor Stabilizer Focus Ring
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(ore('frameGtAwakenedDraconium'), item('draconicevolution:awakened_core'), ore('ringAwakenedDraconium') * 4, ore('plateCrystalMatrix') * 4, item('advsolars:sunnarium_plate') * 4)
	.fluidInputs(fluid('soldering_alloy') * 1152)
	.outputs(item('draconicevolution:reactor_part', 4))
	.stationResearch(b -> b.researchStack(metaitem('nomilabs:ringAwakenedDraconium')).CWUt(96).EUt(VA[UV]))
	.duration(600).EUt(VA[UV])
	.buildAndRegister()

// Reactor Stabilizer Frame
mods.gregtech.assembly_line.recipeBuilder()
	.inputs(ore('frameGtAwakenedDraconium'), ore('gearAwakenedDraconium'), item('draconicevolution:awakened_core'), metaitem('sensor.zpm') * 2, metaitem('emitter.zpm') * 2, ore('plateElite') * 6)
	.fluidInputs(fluid('soldering_alloy') * 1152)
	.outputs(item('draconicevolution:reactor_part'))
	.stationResearch(b -> b.researchStack(metaitem('nomilabs:frameAwakenedDraconium')).CWUt(96).EUt(VA[UV]))
	.duration(750).EUt(VA[UV])
	.buildAndRegister()

// Simulation Supercomputer
if (LabsModeHelper.normal) {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(item('gcym:large_multiblock_casing', 11), ore('plateTrinaquadalloy') * 6, item('deepmoblearning:simulation_chamber') * 4, item('nomilabs:heartofauniverse'), metaitem('robot.arm.uv') * 2, metaitem('field.generator.uv') * 2, ore('circuitUhv') * 4, item('draconicevolution:draconic_energy_core'))
		.fluidInputs(fluid('soldering_alloy') * 1152)
		.outputs(metaitem('nomilabs:dme_sim_chamber'))
		.stationResearch(b -> b.researchStack(item('deepmoblearning:simulation_chamber')).CWUt(128).EUt(VA[UHV]))
		.duration(1200).EUt(VA[UHV])
		.buildAndRegister()
}
