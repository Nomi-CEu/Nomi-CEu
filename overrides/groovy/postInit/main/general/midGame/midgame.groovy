package postInit.main.general.midGame

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.chance.output.impl.ChancedItemOutput

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.chanced
import static gregtech.api.GTValues.*

// Processing Array
replaceRecipeInput(metaitem('processing_array'),
	[[ore('circuitLuv'), item('advsolars:sunnarium'), ore('circuitLuv')],
	 [metaitem('robot.arm.iv'), metaitem('hull.iv'), metaitem('robot.arm.iv')],
	 [ore('circuitLuv'), metaitem('tool.datastick'), ore('circuitLuv')]])

// Make Rare Earth Centrifuging Output Full Dusts
mods.gregtech.centrifuge.removeByInput([metaitem('dustRareEarth')], null)
mods.gregtech.centrifuge.recipeBuilder()
    .inputs(metaitem('dustRareEarth'))
    .chancedOutput(metaitem('dustCadmium'), 625, 100)
    .chancedOutput(metaitem('dustNeodymium'), 625, 100)
    .chancedOutput(metaitem('dustSamarium'), 625, 100)
    .chancedOutput(metaitem('dustCerium'), 625, 100)
    .chancedOutput(metaitem('dustYttrium'), 625, 100)
    .chancedOutput(metaitem('dustLanthanum'), 625, 100)
    .duration(64).EUt(VA[LV])
    .buildAndRegister()

// Rework the EM Separator for Naquadah (More Enriched Naquadah, Less Naquadah)
mods.gregtech.electromagnetic_separator.changeByInput([metaitem('dustPureNaquadah')], null)
	.builder { RecipeBuilder builder ->
		builder.clearChancedOutput().clearOutputs()
			.outputs(metaitem('dustNaquadahEnriched'))
			.chancedOutput(metaitem('dustNaquadahEnriched'), 2000, 500)
			.chancedOutput(metaitem('dustNaquadah'), 5000, 375)
	}.replaceAndRegister()

// Nether Star Block -> Nether Star
crafting.addShapeless(item('minecraft:nether_star') * 9, [ore('blockNetherStar')])

// Nitrogen -> Liquid Nitrogen
if (LabsModeHelper.expert) {
	mods.gregtech.vacuum_freezer.recipeBuilder()
		.fluidInputs(fluid('nitrogen') * 1000)
		.fluidOutputs(fluid('liquid_nitrogen') * 1000)
		.duration(90).EUt(VA[HV])
		.buildAndRegister()
}

// Add Ore Dict for Radium Salt
ore('dustRadiumSalt').add(item('nomilabs:radiumsalt'))

/* Nuclear Related Chanced Output Changes */

// Buff Thorium Yields from Black Granite
mods.gregtech.macerator.changeByInput([item('gregtech:stone_smooth')], null)
	.changeEachChancedOutput { ChancedItemOutput output ->
		return chanced(output.ingredient, output.chance, 700) // Original: 1%, + 0.4%, New: 1%, +7%
	}.replaceAndRegister()

// Add Thorium Yields from Granite + LEGACY: Change Stone Dust to Small Stone Dust
mods.gregtech.macerator.changeByInput([item('minecraft:stone', 1)], null)
	.builder { RecipeBuilder builder ->
		builder.clearChancedOutput()
			.chancedOutput(metaitem('dustSmallStone'), 100, 40)
			.chancedOutput(metaitem('dustThorium'), 100, 500)
	}.replaceAndRegister()

// Buff Uranium Yields from Red Granite
mods.gregtech.macerator.changeByInput([item('gregtech:stone_smooth', 1)], null)
	.changeEachChancedOutput { ChancedItemOutput output ->
		return chanced(output.ingredient, 100, 100) // Original: 0.1%, + 0.05%, New: 1%, +1%
	}.replaceAndRegister()

// Maceration of Dilithium and Black Quartz Ore
// Critical to ensure they work in ore drills (multiblock)
mods.gregtech.macerator.recipeBuilder()
	.inputs(ore('oreDilithium'))
	.outputs(item('libvulpes:productdust') * 2)
	.duration(200).EUt(VA[HV])
	.buildAndRegister()

mods.gregtech.macerator.recipeBuilder()
	.inputs(ore('oreQuartzBlack'))
	.outputs(item('actuallyadditions:item_dust', 7) * 2)
	.duration(200).EUt(VA[HV])
	.buildAndRegister()

// Rock Breaker Recipes for Netherrack and Endstone (HV and LuV)
mods.gregtech.rock_breaker.recipeBuilder()
	.notConsumable(item('nomilabs:solidifiedneon'))
	.outputs(item('minecraft:netherrack'))
	.duration(16).EUt(VA[HV])
	.buildAndRegister()

mods.gregtech.rock_breaker.recipeBuilder()
	.notConsumable(item('nomilabs:solidifiedkrypton'))
	.outputs(item('minecraft:end_stone'))
	.duration(16).EUt(VA[LuV])
	.buildAndRegister()

/* Netherrack & Endstone Dust Processing Changes */

// Add Lava to Netherrack Centrifuging
mods.gregtech.centrifuge.changeByInput([metaitem('dustNetherrack')], null)
	.builder { RecipeBuilder recipe ->
		recipe.fluidOutputs(fluid('lava') * 120)
	}.replaceAndRegister()

// Endstone Maceration: Replace Tungstate with Ender Pearl
mods.gregtech.macerator.changeByInput([item('minecraft:end_stone')], null)
	.builder { RecipeBuilder recipe ->
		recipe.clearChancedOutput()
			.chancedOutput(metaitem('dustTinyEnderPearl'), 500, 120)
	}.replaceAndRegister()

// Endstone Centrifusion: Change Output Amounts and Chances
mods.gregtech.centrifuge.changeByInput([metaitem('dustEndstone')], null)
	.builder { RecipeBuilder recipe ->
		recipe.clearOutputs()
			.clearChancedOutput()
			.outputs(item('minecraft:sand'), metaitem('dustSmallTungstate'))
			.chancedOutput(metaitem('dustTinyPlatinum'), 5000, 2000)
			.duration(40).EUt(LabsModeHelper.expert ? VA[IV] : VA[EV])
	}.replaceAndRegister()
