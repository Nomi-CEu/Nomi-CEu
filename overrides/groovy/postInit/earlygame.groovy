import com.nomiceu.nomilabs.util.LabsModeHelper

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

// Furnaces
// Iron Furnace
mods.gregtech.assembler.recipeBuilder()
        .inputs(ore('craftingFurnace'), ore('ingotIron') * 8)
        .circuitMeta(8)
        .outputs(item('morefurnaces:furnaceblock'))
        .duration(100).EUt(7)
        .buildAndRegister()

changeStackRecycling(item('morefurnaces:furnaceblock'), [item('minecraft:furnace'), item('minecraft:iron_ingot') * 8])

//Copper Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 5), [
        [ore('ingotCopper'), ore('ingotCopper'), ore('ingotCopper')],
        [ore('ingotCopper'), item('morefurnaces:furnaceblock'), ore('ingotCopper')],
        [ore('ingotCopper'), ore('ingotCopper'), ore('ingotCopper')]])

mods.gregtech.assembler.recipeBuilder()
        .inputs(item('morefurnaces:furnaceblock'), ore('ingotCopper') * 8)
        .circuitMeta(8)
        .outputs(item('morefurnaces:furnaceblock', 5))
        .duration(100).EUt(7)
        .buildAndRegister()

//Silver Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 6), [
        [ore('ingotSilver'), ore('ingotSilver'), ore('ingotSilver')],
        [ore('ingotSilver'), item('morefurnaces:furnaceblock', 5), ore('ingotSilver')],
        [ore('ingotSilver'), ore('ingotSilver'), ore('ingotSilver')]])

mods.gregtech.assembler.recipeBuilder()
        .inputs(item('morefurnaces:furnaceblock', 5), ore('ingotSilver') * 8)
        .circuitMeta(8)
        .outputs(item('morefurnaces:furnaceblock', 6))
        .duration(100).EUt(7)
        .buildAndRegister()

//Gold Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 1), [
        [item('minecraft:gold_ingot'), item('minecraft:gold_ingot'), item('minecraft:gold_ingot')],
        [item('minecraft:gold_ingot'), item('morefurnaces:furnaceblock', 6), item('minecraft:gold_ingot')],
        [item('minecraft:gold_ingot'), item('minecraft:gold_ingot'), item('minecraft:gold_ingot')]])

mods.gregtech.assembler.recipeBuilder()
        .inputs(item('morefurnaces:furnaceblock', 6), ore('ingotGold') * 8)
        .circuitMeta(8)
        .outputs(item('morefurnaces:furnaceblock', 1))
        .duration(100).EUt(7)
        .buildAndRegister()

//Diamond Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 2), [
        [item('minecraft:diamond'), item('minecraft:diamond'), item('minecraft:diamond')],
        [item('minecraft:diamond'), item('morefurnaces:furnaceblock', 1), item('minecraft:diamond')],
        [item('minecraft:diamond'), item('minecraft:diamond'), item('minecraft:diamond')]])

mods.gregtech.assembler.recipeBuilder()
        .inputs(item('morefurnaces:furnaceblock', 1), ore('gemDiamond') * 8)
        .circuitMeta(8)
        .outputs(item('morefurnaces:furnaceblock', 2))
        .duration(100).EUt(7)
        .buildAndRegister()

//Obsidian Furnace
replaceRecipeInput(item('morefurnaces:furnaceblock', 3), [
        [item('minecraft:obsidian'), item('minecraft:obsidian'), item('minecraft:obsidian')],
        [item('morefurnaces:furnaceblock', 2), item('minecraft:obsidian'), item('morefurnaces:furnaceblock', 2)],
        [item('minecraft:obsidian'), item('minecraft:obsidian'), item('minecraft:obsidian')]])

mods.gregtech.assembler.recipeBuilder()
        .inputs(item('morefurnaces:furnaceblock', 2) * 2, ore('blockObsidian') * 7)
        .circuitMeta(8)
        .outputs(item('morefurnaces:furnaceblock', 3))
        .duration(100).EUt(7)
        .buildAndRegister()

// Steam (Follows Furnaces, so Steam Oven's recycling can have copper furnace included)
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