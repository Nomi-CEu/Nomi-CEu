import com.nomiceu.nomilabs.util.LabsModeHelper

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecyclingHelpers.*
import static gregtech.api.GTValues.*

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
