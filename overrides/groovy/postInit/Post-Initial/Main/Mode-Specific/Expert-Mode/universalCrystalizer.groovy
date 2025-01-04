import com.nomiceu.nomilabs.util.LabsModeHelper

import static gregtech.api.GTValues.*

if (!LabsModeHelper.expert) return

// Universal Crystallizer Recipes
// crafting MUST have an eut below 1 UHV amp (2,097,152 EU/t)
// in order to run without using higher tier energy hatches

// Diamond
mods.gregtech.universal_crystallizer.recipeBuilder()
	.inputs(ore('dustCarbon') * 64, ore('dustCarbon') * 64, ore('dustCarbon') * 64, ore('dustCarbon') * 64, ore('dustCarbon') * 64, ore('dustCarbon') * 64, ore('dustCarbon') * 64, ore('dustCarbon') * 64)
	.outputs(item('minecraft:diamond') * 32)
	.fluidInputs(fluid('naquadah_enriched') * 3)
	.duration(12).EUt(VHA[UHV])
	.buildAndRegister()

// Empowered Blocks
var materials = [ore('dustRedstone'), ore('dustLapis'), ore('dustDiamond'), ore('dustCoal'), ore('dustEmerald'), ore('dustIron')]
for (int i = 0; i < materials.size(); i++) {
	mods.gregtech.universal_crystallizer.recipeBuilder()
		.inputs(materials[i] * 63)
		.outputs(item('actuallyadditions:block_crystal_empowered', i) * 7)
		.fluidInputs(fluid('naquadah_enriched') * 3)
		.duration(7).EUt(VH[UHV])
		.buildAndRegister()
}

// Crystal Matrix
mods.gregtech.universal_crystallizer.recipeBuilder()
	.inputs(ore('gemPerfectDiamond') * 3, item('minecraft:nether_star') * 9, ore('plateDiamond') * 27, ore('gemDiamond') * 27)
	.outputs(metaitem('nomilabs:ingotCrystalMatrix'))
	.fluidInputs(fluid('naquadah_enriched') * 3)
	.duration(12).EUt(VH[UHV])
	.buildAndRegister()

// Tritanium
mods.gregtech.universal_crystallizer.recipeBuilder()
	.inputs(ore('dustTitanium') * 18, ore('dustDuranium') * 9)
	.outputs(metaitem('blockTritanium'))
	.fluidInputs(fluid('naquadah_enriched') * 15)
	.duration(30).EUt((int) V[UHV])
	.buildAndRegister()

// Draconic Evolution Recipes
// In Fusion: 100 ticks
mods.gregtech.universal_crystallizer.recipeBuilder()
	.inputs(item('actuallyadditions:block_crystal_empowered', 4), metaitem('blockNetherStar') * 2, item('draconicevolution:draconic_core') * 4, item('armorplus:block_compressed_infused_lava_crystal') * 2)
	.outputs(item('draconicevolution:wyvern_core'))
	.fluidInputs(fluid('naquadah_enriched') * 30)
	.duration(100).EUt(VH[UHV])
	.buildAndRegister()

mods.gregtech.universal_crystallizer.recipeBuilder()
	.inputs(item('minecraft:nether_star'), item('draconicevolution:wyvern_core') * 4, metaitem('nomilabs:blockAwakenedDraconium') * 2)
	.outputs(item('draconicevolution:awakened_core'))
	.fluidInputs(fluid('naquadah_enriched') * 30)
	.duration(100).EUt(VA[UHV])
	.buildAndRegister()

mods.gregtech.universal_crystallizer.recipeBuilder()
	.inputs(ore('blockDraconium') * 5, item('draconicevolution:wyvern_core') * 4, item('draconicevolution:dragon_heart') * 2)
	.outputs(metaitem('nomilabs:blockAwakenedDraconium') * 5)
	.fluidInputs(fluid('naquadah_enriched') * 30)
	.duration(100).EUt((int) V[UHV])
	.buildAndRegister()
