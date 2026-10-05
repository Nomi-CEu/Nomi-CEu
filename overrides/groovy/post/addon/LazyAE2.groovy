// MODS_LOADED: threng
// ^, Only runs when a player adds Lazy AE2 themselves

package post.addon

import static gregtech.api.GTValues.*

mods.appliedenergistics2.inscriber.removeByOutput(item('threng:material', 2))

mods.threng.centrifuge.removeByOutput(item('appliedenergistics2:material', 45))
mods.threng.centrifuge.removeByOutput(item('appliedenergistics2:material', 46))

furnace.removeByOutput(item('threng:material'))

mods.jei.category.hideCategory('threng.agg')
mods.jei.category.hideCategory('threng.energize')

ore_dict.remove('dustCoal', item('threng:material', 3))

crafting.with {
    remove('threng:machine_core')
    remove('threng:spec_core_64')
    remove('threng:ma_frame')
    remove('threng:spec_core_64')
    remove('threng:spec_core_64')
    remove('threng:ma_io_port')
    remove('threng:ma_vent')
    remove('threng:ma_controller')
    remove('threng:ma_mod_cpu')
    remove('threng:ma_mod_pattern')
}

mods.threng.centrifuge.removeByOutput(item('appliedenergistics2:material', 10))
mods.threng.centrifuge.recipeBuilder()
    .input(metaitem('gregtech:gemCertusQuartz'))
    .output(item('appliedenergistics2:material', 10))
    .register()

mods.gregtech.alloy_smelter.recipeBuilder()
    .inputs(ore('ingotEndSteel'), ore('dustFluix'))
    .outputs(item('threng:material'))
    .duration(400).EUt(VA[EV])
    .buildAndRegister()

mods.gregtech.autoclave.recipeBuilder()
    .inputs(item('enderio:item_material', 19))
    .fluidInputs(fluid('radon') * 1000)
    .outputs(item('threng:material', 5))
    .duration(400).EUt(VA[EV])

for (var tinLike : [fluid('tin') * (L * 2), fluid('soldering_alloy') * L]) {
    mods.gregtech.circuit_assembler.recipeBuilder()
    .inputs(ore('frameGtTitanium'),
            ore('circuitIv'),
            item('appliedenergistics2:material', 24) * 3,
            item('threng:material') * 4,
            item('appliedenergistics2:part', 16) * 4)
    .fluidInputs(tinLike)
    .outputs(item('threng:material', 4))
    .duration(400).EUt(VA[EV])
    .buildAndRegister()
}

mods.gregtech.assembler.recipeBuilder()
    .inputs(ore('frameGtBlackSteel'),
        ore('circuitIv'),
        item('threng:material', 6),
        metaitem('sensor.ev') * 4,
        item('appliedenergistics2:part', 16) * 16,
        item('appliedenergistics2:material', 6) * 64)
    .outputs(item('threng:material', 13))
    .duration(600).EUt(VA[EV])
    .buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
    .inputs(item('threng:big_assembler'), metaitem('electric.motor.hv'))
    .outputs(item('threng:big_assembler', 1))
    .duration(100).EUt(VA[EV])
    .buildAndRegister()

for (var plasticLike : [fluid('plastic') * (L * 2), fluid('polytetrafluoroethylene') * L, fluid('polybenzimidazole') * (L / 2)]) {
    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('threng:material', 5) * 4,
                ore('frameGtBlueSteel') * 4,
                item('extrautils2:crafter'),
                ore('circuitHv'))
        .fluidInputs(plasticLike)
        .outputs(item('threng:big_assembler') * 4)
        .duration(150).EUt(VA[EV])
        .buildAndRegister()

    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('threng:big_assembler') * 4,
                ore('pipeNormalItemPlatinum') * 4,
                item('appliedenergistics2:interface') * 4)
        .fluidInputs(plasticLike)
        .outputs(item('threng:big_assembler', 5))
        .duration(150).EUt(VA[EV])
        .buildAndRegister()

    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('threng:big_assembler') * 4,
                item('appliedenergistics2:material', 24) * 4,
                item('appliedenergistics2:interface') * 4,
                item('appliedenergistics2:molecular_assembler'))
        .fluidInputs(plasticLike)
        .outputs(item('threng:big_assembler', 3))
        .duration(150).EUt(VA[EV])
        .buildAndRegister()

    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('threng:big_assembler') * 4,
                item('threng:material', 6) * 4,
                item('appliedenergistics2:crafting_accelerator') * 4,
                item('appliedenergistics2:interface') * 4,
                item('appliedenergistics2:molecular_assembler'))
        .fluidInputs(plasticLike)
        .outputs(item('threng:big_assembler', 4))
        .duration(150).EUt(VA[EV])
        .buildAndRegister()

    mods.gregtech.assembler.recipeBuilder()
        .inputs(item('threng:big_assembler') * 4,
                item('threng:material', 4) * 4,
                item('appliedenergistics2:interface') * 4,
                item('appliedenergistics2:part', 16) * 4,
                item('appliedenergistics2:molecular_assembler'),
                item('threng:material', 14) * 4,
                metaitem('field.generator.iv') * 4,
                ore('circuitIv') * 4)
        .fluidInputs(plasticLike)
        .outputs(item('threng:big_assembler', 2))
        .duration(150).EUt(VA[EV])
        .buildAndRegister()
}

crafting.removeByOutput(item('threng:machine', 2))
crafting.shapedBuilder()
        .output(item('threng:machine', 2))
        .matrix('SIC', 'GUG', 'LFE')
        .key('S', item('appliedenergistics2:material', 19))
        .key('L', item('appliedenergistics2:material', 15))
        .key('E', item('appliedenergistics2:material', 14))
        .key('C', item('appliedenergistics2:material', 13))
        .key('I', item('ae2stuff:inscriber'))
        .key('G', item('appliedenergistics2:quartz_glass'))
        .key('U', item('threng:material', 4))
        .key('F', item('appliedenergistics2:material', 43))

mods.threng.etcher.with {
    removeByOutput(item('appliedenergistics2:material', 22))
    removeByOutput(item('appliedenergistics2:material', 23))
    removeByOutput(item('appliedenergistics2:material', 24))
    removeByOutput(item('threng:material', 6))
    removeByOutput(item('threng:material', 14))

    recipeBuilder()
        .input(ore('circuitLv'))
        .top(ore('plateGold'))
        .bottom(ore('plateSilicon'))
        .output(item('appliedenergistics2:material', 22))
        .register()
    recipeBuilder()
        .input(ore('circuitLv'))
        .top(ore('plateCertusQuartz'))
        .bottom(ore('plateSilicon'))
        .output(item('appliedenergistics2:material', 23))
        .register()
    recipeBuilder()
        .input(ore('circuitLv'))
        .top(ore('plateGold'))
        .bottom(ore('plateDiamond'))
        .output(item('appliedenergistics2:material', 24))
        .register()

    recipeBuilder()
        .input(ore('circuitEv'))
        .top(item('threng:material', 5))
        .bottom(ore('plateSilicon'))
        .output(item('threng:material', 6))
        .register()
    recipeBuilder()
        .input(ore('circuitEv'))
        .top(item('threng:material', 13))
        .bottom(ore('plateSilicon'))
        .output(item('threng:material', 14))
        .register()
}

mods.jei.ingredient.with {
    removeAndHide(item('threng:machine'))
    removeAndHide(item('threng:machine', 5))
    removeAndHide(item('threng:material', 1))
    removeAndHide(item('threng:material', 2))
    removeAndHide(item('threng:material', 3))
    removeAndHide(item('threng:material', 7))
    removeAndHide(item('threng:material', 8))
    removeAndHide(item('threng:material', 9))
    removeAndHide(item('threng:material', 10))
    removeAndHide(item('threng:material', 11))
    removeAndHide(item('threng:material', 12))
}
