package postInit.main.general.earlyGame

import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilderCollection
import com.nomiceu.nomilabs.groovy.RecipePredicates
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.builders.SimpleRecipeBuilder
import gregtech.client.utils.TooltipHelper
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.addRecipeInputTooltip
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable
import static gregtech.api.GTValues.*

// Change Recipe for AA's Crafting Table on a Stick to be Stick + Table
crafting.replaceShapeless(item('actuallyadditions:item_crafter_on_a_stick'),
	[item('minecraft:stick'), item('minecraft:crafting_table')])

// Remove Avaritia Double Compressed -> Compressed Crafting Table Recipe (Double Compressed is Unobtainable and Removed)
crafting.remove('avaritia:blocks/crafting/un_double_compressed_crafting_table')

if (LabsModeHelper.expert) {
	// Log -> Stick Shortcut (Expert Mode)
	crafting.shapedBuilder()
		.output(item('minecraft:stick') * 4)
		.matrix('B', 'B')
		.key('B', ore('logWood'))
		.register()

	// Remove endercore paper recipe
	crafting.remove('endercore:shapeless_paper')

	// Remove aa paper recipe (with rice)
	crafting.remove('actuallyadditions:recipes23')

	// Allow rice -> paper through chad
	crafting.shapedBuilder()
		.output(metaitem('dustPaper') * 2)
		.matrix('RRR', ' M ')
		.key('R', item('actuallyadditions:item_food', 16))
		.key('M', ore('toolMortar'))
		.register()
} else {
	// Remove mc paper recipe, is useless with endercore's shapeless one
	crafting.remove('minecraft:paper')
}

// Compressed Coke Clay Recipe
// Add Input Tooltip for Non-Consumed Wooden Form
addRecipeInputTooltip('gregtech:compressed_coke_clay', 4,
	translatable("nomiceu.tooltip.mixed.not_consumed").addFormat(TooltipHelper.BLINKING_CYAN))

// Wood Pulp
// Output 4 for Normal, 2 for Expert
crafting.addShapeless(metaitem('dustWood') * (LabsModeHelper.expert ? 2 : 4), [ore('logWood'), ore('toolMortar')])

// Remove Thermal Foundation's clay recipe, slag is unobtainable
crafting.remove('thermalfoundation:clay_ball')

// Furnaces
// Iron Furnace
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('craftingFurnace'), ore('ingotIron') * 8)
	.circuitMeta(8)
	.outputs(item('morefurnaces:furnaceblock'))
	.changeRecycling()
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Copper Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 5), [
	[ore('ingotCopper'), ore('ingotCopper'), ore('ingotCopper')],
	[ore('ingotCopper'), item('morefurnaces:furnaceblock'), ore('ingotCopper')],
	[ore('ingotCopper'), ore('ingotCopper'), ore('ingotCopper')]])

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('morefurnaces:furnaceblock'), ore('ingotCopper') * 8)
	.circuitMeta(8)
	.outputs(item('morefurnaces:furnaceblock', 5))
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Silver Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 6), [
	[ore('ingotSilver'), ore('ingotSilver'), ore('ingotSilver')],
	[ore('ingotSilver'), item('morefurnaces:furnaceblock', 5), ore('ingotSilver')],
	[ore('ingotSilver'), ore('ingotSilver'), ore('ingotSilver')]])

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('morefurnaces:furnaceblock', 5), ore('ingotSilver') * 8)
	.circuitMeta(8)
	.outputs(item('morefurnaces:furnaceblock', 6))
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Gold Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 1), [
	[item('minecraft:gold_ingot'), item('minecraft:gold_ingot'), item('minecraft:gold_ingot')],
	[item('minecraft:gold_ingot'), item('morefurnaces:furnaceblock', 6), item('minecraft:gold_ingot')],
	[item('minecraft:gold_ingot'), item('minecraft:gold_ingot'), item('minecraft:gold_ingot')]])

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('morefurnaces:furnaceblock', 6), ore('ingotGold') * 8)
	.circuitMeta(8)
	.outputs(item('morefurnaces:furnaceblock', 1))
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Diamond Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 2), [
	[item('minecraft:diamond'), item('minecraft:diamond'), item('minecraft:diamond')],
	[item('minecraft:diamond'), item('morefurnaces:furnaceblock', 1), item('minecraft:diamond')],
	[item('minecraft:diamond'), item('minecraft:diamond'), item('minecraft:diamond')]])

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('morefurnaces:furnaceblock', 1), ore('gemDiamond') * 8)
	.circuitMeta(8)
	.outputs(item('morefurnaces:furnaceblock', 2))
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Obsidian Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 3), [
	[item('minecraft:obsidian'), item('minecraft:obsidian'), item('minecraft:obsidian')],
	[item('morefurnaces:furnaceblock', 2), item('minecraft:obsidian'), item('morefurnaces:furnaceblock', 2)],
	[item('minecraft:obsidian'), item('minecraft:obsidian'), item('minecraft:obsidian')]])

mods.gregtech.assembler.recipeBuilder()
	.inputs(item('morefurnaces:furnaceblock', 2) * 2, ore('blockObsidian') * 7)
	.circuitMeta(8)
	.outputs(item('morefurnaces:furnaceblock', 3))
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Steam Oven & Grinder (Follows Furnaces, so Steam Oven's recycling can have copper furnace included)
if (LabsModeHelper.normal) {
	replaceRecipeInput(metaitem('steam_oven'), [
		[item('gregtech:metal_casing'), metaitem('gearInvar'), item('gregtech:metal_casing')],
		[item('gregtech:boiler_firebox_casing'), item('morefurnaces:furnaceblock', 5), item('gregtech:boiler_firebox_casing')],
		[item('gregtech:metal_casing'), metaitem('gearInvar'), item('gregtech:metal_casing')]
	])

	replaceRecipeInput(metaitem('steam_grinder'), [
		[item('gregtech:metal_casing'), metaitem('gearPotin'), item('gregtech:metal_casing')],
		[item('gregtech:metal_casing'), item('minecraft:diamond'), item('gregtech:metal_casing')],
		[item('gregtech:metal_casing'), metaitem('gearPotin'), item('gregtech:metal_casing')]
	])
}

// Drill Core Assembler Recipe
if (LabsModeHelper.expert) {
	mods.gregtech.assembler.recipeBuilder()
		.inputWildNBT(metaitem('power_unit.lv'))
		.inputs(metaitem('electric.motor.lv') * 4, metaitem('cableGtSingleTin') * 4, metaitem('gearSmallSteel') * 4)
		.circuitMeta(2)
		.outputs(item('actuallyadditions:item_misc', 16))
		.duration(100).EUt(VA[ULV])
		.buildAndRegister()
}


// Ender Lily Extractor Recipe
mods.gregtech.extractor.recipeBuilder()
	.inputs(item('extrautils2:enderlilly'))
	.fluidOutputs(fluid('ender') * 25)
	.duration(80).EUt(VA[ULV])
	.buildAndRegister()

// Coated Circuit Board
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('plateWood'))
	.fluidInputs(fluid('glue') * 100)
	.circuitMeta(1)
	.outputs(metaitem('board.coated'))
	.duration(100).EUt(VA[ULV])
	.buildAndRegister()

// Circuit Board (Move from Wood Plate + Glue + Foil to Coated Circuit Board + Foil)
mods.gregtech.assembler.recipeBuilder()
	.inputs(metaitem('board.coated'), ore('foilCopper') * 4)
	.outputs(metaitem('circuit_board.basic'))
	.duration(100).EUt(VA[ULV])
	.replace().buildAndRegister()

/* ULV Covers */
List<OreDictIngredient> rings = [ore('ringRubber'), ore('ringSiliconeRubber'), ore('ringStyreneButadieneRubber')]
List<OreDictIngredient> plates = [ore('plateSiliconeRubber'), ore('plateStyreneButadieneRubber')]
List<FluidStack> fluids = [fluid('rubber'), fluid('silicone_rubber'), fluid('styrene_butadiene_rubber')]

ItemStack motor = metaitem('ulv_covers:electric.motor.ulv')
ItemStack piston = metaitem('ulv_covers:electric.piston.ulv')
ItemStack pump = metaitem('ulv_covers:electric.pump.ulv')
ItemStack conveyor = metaitem('ulv_covers:conveyor.module.ulv')
ItemStack robotArm = metaitem('ulv_covers:robot.arm.ulv')

// Crafting: Pump, Copper Pipe -> Bronze Small Pipe, SiR and SBR Options
crafting.removeByOutput(pump)
for (var ring : rings) {
	crafting.shapedBuilder()
		.output(pump)
		.matrix('PS', 'MR')
		.key('P', ore('pipeTinyFluidBronze'))
		.key('S', ore('rotorBronze'))
		.key('M', motor)
		.key('R', ring)
		.register()
}

// Crafting: Conveyor, SiR and SBR Options
for (var plate : plates) {
	crafting.shapedBuilder()
		.output(conveyor)
		.matrix('PC', 'MP')
		.key('P', plate)
		.key('C', ore('cableGtSingleLead'))
		.key('M', motor)
		.register()
}

// Assembler: Motor
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('wireGtSingleTin') * 2, ore('stickBronze'), ore('stickIronMagnetic'))
	.outputs(motor)
	.duration(50).EUt(VA[ULV])
	.buildAndRegister()

// Assembler: Piston
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('stickBronze'), ore('plateBronze'), ore('gearSmallBronze'), motor)
	.outputs(piston)
	.duration(50).EUt(VA[ULV])
	.buildAndRegister()

// Assembler: Pump
for (var ring : rings) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('pipeTinyFluidBronze'), ore('rotorBronze'), ring, motor)
		.outputs(pump)
		.duration(50).EUt(VA[ULV])
		.buildAndRegister()
}

// Assembler: Conveyor
for (var fluid : fluids) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(ore('cableGtSingleLead'), motor)
		.fluidInputs(fluid * 288)
		.outputs(conveyor)
		.duration(50).EUt(VA[ULV])
		.buildAndRegister()
}

// Assembler: Robot Arm
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('stickBronze'), motor, piston, ore('circuitUlv'))
	.outputs(robotArm)
	.duration(50).EUt(VA[ULV])
	.buildAndRegister()

// Coke -> 16 Tiny Coke
crafting.addShapeless(item('nomilabs:tiny_coke') * 16, [ore('fuelCoke')])

/* Early Cell Recipes */
// Basic Cell: Crafting
crafting.shapedBuilder()
	.output(metaitem('fluid_cell'))
	.matrix('PHP', ' R ')
	.key('P', ore('plateTin'))
	.key('H', ore('toolHammer'))
	.key('R', ore('ringIron'))
	.register()

// Bronze Cell: Assembler
mods.gregtech.assembler.recipeBuilder()
	.inputs(ore('plateDoubleBronze') * 2, ore('ringTin') * 2)
	.outputs(metaitem('nomilabs:bronze_cell'))
	.duration(200).EUt(VA[LV])
	.buildAndRegister()

// Bronze Cell: Crafting
crafting.shapedBuilder()
	.output(metaitem('nomilabs:bronze_cell'))
	.matrix('PHP', 'RRR')
	.key('P', ore('plateDoubleBronze'))
	.key('H', ore('toolHammer'))
	.key('R', ore('ringTin'))
	.register()

// Steel Cell: Crafting
crafting.shapedBuilder()
	.output(metaitem('large_fluid_cell.steel'))
	.matrix('PHP', 'RRR')
	.key('P', ore('plateDoubleSteel'))
	.key('H', ore('toolHammer'))
	.key('R', ore('ringBronze'))
	.register()

// Lubricant Alternatives (Per Oil)
ChangeRecipeBuilderCollection<SimpleRecipeBuilder> lubeRecipes = mods.gregtech.brewery.changeByOutput(
	RecipePredicates.hasExactlyFluidInput(fluid('oil') * 1000),
	null, [fluid('lubricant') * 1000])

// Raw Oil: 2x Input, 0.5x Output
lubeRecipes.forEach {
	it.builder {
		it.clearFluidInputs()
			.fluidInputs(fluid('oil_medium') * 2000)
	}.buildAndRegister()
}

// Light Oil: 1x Input, 0.5x Output
lubeRecipes.copy().forEach {
	it.builder {
		it.clearFluidInputs()
			.fluidInputs(fluid('oil_light') * 1000)
	}.changeEachFluidOutput {
		return it * (it.amount / 2)
	}.buildAndRegister()
}

// Heavy Oil: 1x Input, 4x Output
lubeRecipes.copy().forEach {
	it.builder {
		it.clearFluidInputs()
			.fluidInputs(fluid('oil_heavy') * 1000)
	}.changeEachFluidOutput {
		return it * (it.amount * 4)
	}.buildAndRegister()
}
