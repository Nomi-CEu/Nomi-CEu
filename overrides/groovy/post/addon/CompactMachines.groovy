// MODS_LOADED: compactmachines3
// ^, Only runs when a player adds Compact Machines themselves

package post.addon

import static gregtech.api.GTValues.*

mods.jei.category.remove('compactmachines3.MultiblockMiniaturization')
mods.jei.ingredient.removeAndHide(item('compactmachines3:fieldprojector'))

crafting.remove('compactmachines3:psd')

crafting.shapedBuilder()
        .output(item('compactmachines3:psd'))
        .matrix(' S ', 'EBE', ' C ')
        .key('S', metaitem('cover.screen'))
        .key('E', metaitem('emitter.hv'))
        .key('B', item('minecraft:book'))
        .key('C', ore('circuitHv'))

crafting.shapedBuilder()
        .output(item('compactmachines3:wallbreakable'))
        .matrix('FFF', 'FSF', 'FFF')
        .key('F', ore('frameGtHslaSteel'))
        .key('S', metaitem('sensor.hv'))

for (int i = 0; i < 3; i++) {
    def hvRecipeParams = [
        wallMultiplier : i * 8 + 8,
        circ : i + 1,
        outputMetaId : i,
    ]

    def ivRecipeParams = [
        wallMultiplier : i * 8 + 32,
        circ : i + 4,
        outputMetaId : i + 3,
    ]

    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('compactmachines3:wallbreakable') * hvRecipeParams.wallMultiplier,
                ore('frameGtUltimet') * 4,
                metaitem('field.generator.hv'))
        .circuitMeta(hvRecipeParams.circ)
        .outputs(item('compactmachines3:machine', hvRecipeParams.outputMetaId))
        .duration(200).EUt(VA[HV])
        .buildAndRegister()

    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('compactmachines3:wallbreakable') * ivRecipeParams.wallMultiplier,
                ore('frameGtUltimet') * 4,
                metaitem('field.generator.iv'))
        .circuitMeta(ivRecipeParams.circ)
        .outputs(item('compactmachines3:machine', ivRecipeParams.outputMetaId))
        .duration(200).EUt(VA[IV])
        .buildAndRegister()
}

mods.gregtech.assembler.recipeBuilder()
    .inputs(ore('frameGtUltimet'),
            metaitem('passthrough_hatch_item'),
            metaitem('passthrough_hatch_fluid'),
            metaitem('diode.hv'))
    .outputs(item('compactmachines3:tunneltool') * 4)
    .duration(100).EUt(VA[HV])
    .buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
    .inputs(ore('frameGtUltimet'), item('enderio:item_redstone_conduit'))
    .outputs(item('compactmachines3:redstonetunneltool') * 4)
    .duration(100).EUt(VA[HV])
    .buildAndRegister()

