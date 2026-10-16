// MODS_LOADED: pvj
// ^, Only runs when a player adds Project: Vibrant Journey themselves

package post.addon.pvj

import static post.classes.addon.PVJConsts.*

void addCutting(Collection<ItemStack> output, Collection<IIngredient> input) {
    mods.gregtech.cutter.recipeBuilder()
        .inputs(input)
        .fluidInputs(liquid('water') * 4)
        .outputs(output)
        .duration(400).EUt(7)
        .buildAndRegister()

    mods.gregtech.cutter.recipeBuilder()
        .inputs(input)
        .fluidInputs(liquid('distilled_water') * 3)
        .outputs(output)
        .duration(300).EUt(7)
        .buildAndRegister()

    mods.gregtech.cutter.recipeBuilder()
        .inputs(input)
        .fluidInputs(liquid('lubricant') * 1)
        .outputs(output)
        .duration(200).EUt(7)
        .buildAndRegister()
}

for (WOOD_TYPE in WOOD_TYPES) {
    def items = [
        log : item("pvj:log_${WOOD_TYPE}"),
        planks : item("pvj:planks_${WOOD_TYPE}"),
        stairs : item("pvj:${WOOD_TYPE}_stairs"),
        slab : item("pvj:${WOOD_TYPE}_slab"),
        fence : item("pvj:${WOOD_TYPE}_fence"),
        fenceGate : item("pvj:${WOOD_TYPE}_fence_gate"),
        trapdoor : item("pvj:${WOOD_TYPE}_trapdoor"),
        door : item("pvj:${WOOD_TYPE}_door_item"),
        boat : item("pvj:${WOOD_TYPE}_boat"),
        button : item("pvj:${WOOD_TYPE}_button"),
        pressurePlate : item("pvj:${WOOD_TYPE}_pressure_plate"),
    ]

    /*
    TODO:   Pretty sure the recipes are different in NM and HM.
            Maybe rebuilding recipes isn't even worth it for some of these
    */

    // Planks
    crafting.with {
        remove("pvj:${WOOD_TYPE}_planks")
        addShapeless("PVJ Planks ${WOOD_TYPE}", items.planks * 2, [items.log])
        shapedBuilder()
            .name("PVJ Planks ${WOOD_TYPE} saw")
            .output(items.planks * 4)
            .matrix('S', 'L')
            .key('S', ore('toolSaw'))
            .key('L', items.log)
            .register()
    }
    addCutting([items.planks * 6, metaitem('dustWood') * 2], [items.log])

    // Stairs
    mods.gregtech.assembler.recipeBuilder()
        .inputs(items.planks * 6)
        .outputs(items.stairs * 4)
        .circuitMeta(7)
        .duration(100).EUt(1).buildAndRegister()

    // Slab
    crafting.with {
        remove("pvj:${WOOD_TYPE}_slab")
        shapedBuilder()
            .name("PVJ Slab ${WOOD_TYPE}")
            .output(items.slab * 2)
            .matrix('SP')
            .key('S', ore('toolSaw'))
            .key('P', items.planks)
            .register()
        shapedBuilder()
            .name("PVJ Planks ${WOOD_TYPE} slabs")
            .output(items.planks)
            .matrix('S', 'S')
            .key('S', items.slab)
            .register()
    }
    addCutting([items.slab * 2], [items.planks])

    // Fence
    crafting.with {
        remove("pvj:${WOOD_TYPE}_fence")
        shapedBuilder()
            .name("PVJ Fence ${WOOD_TYPE}")
            .output(items.fence)
            .matrix('PSP', 'PSP', 'PSP')
            .key('P', items.planks)
            .key('S', ore('stickWood'))
            .register()
    }
    mods.gregtech.assembler.recipeBuilder()
        .inputs(items.planks)
        .outputs(items.fence)
        .circuitMeta(1)
        .duration(100).EUt(4)
        .buildAndRegister()

    // Fence Gate
    crafting.with {
        remove("pvj:${WOOD_TYPE}_fence_gate")
        shapedBuilder()
            .name("PVJ Fence Gate ${WOOD_TYPE}")
            .output(items.fenceGate)
            .matrix('F F', 'SPS', 'SPS')
            .key('P', items.planks)
            .key('S', ore('stickWood'))
            .key('F', ore('itemFlint'))
            .register()
        shapedBuilder()
            .name("PVJ GregtTech Fence Gate ${WOOD_TYPE}")
            .output(items.fenceGate * 2)
            .matrix('ITI', 'SPS', 'SPS')
            .key('P', items.planks)
            .key('I', ore('screwIron'))
            .key('T', ore('toolScrewdriver'))
            .key('S', ore('stickWood'))
            .register()
    }
    mods.gregtech.assembler.recipeBuilder()
        .inputs(items.planks * 2, ore('stickWood') * 2)
        .outputs(items.fenceGate)
        .circuitMeta(2)
        .duration(100).EUt(4)
        .buildAndRegister()

    // Trapdoor
    crafting.remove("pvj:${WOOD_TYPE}_trapdoor")

    // Door
    crafting.with {
        remove("pvj:${WOOD_TYPE}_door")
        shapedBuilder()
            .name("PVJ Door ${WOOD_TYPE}")
            .output(items.door)
            .matrix('PTS', 'PRI', 'PPC')
            .key('P', items.planks)
            // TODO: consider adding oredic to PVJ's other trapdoors and using oredic here
            .key('T', item('minecraft:trapdoor'))
            .key('S', ore('toolScrewdriver'))
            .key('R', ore('ringIron'))
            .key('I', ore('screwIron'))
            .key('C', ore('toolSaw'))
            .register()
    }
    mods.gregtech.assembler.recipeBuilder()
        .inputs(items.planks * 4, item('minecraft:trapdoor'))
        .outputs(items.door)
        .fluidInputs(liquid('iron') * 16)
        .duration(400).EUt(4)
        .buildAndRegister()

    // Boat
    crafting.with {
        remove("pvj:${WOOD_TYPE}_boat")
        shapedBuilder()
            .name("PVJ Boat ${WOOD_TYPE}")
            .output(items.boat)
            .matrix('PSP', 'PKP', 'HHH')
            .key('P', items.planks)
            .key('H', items.slab)
            .key('S', item('minecraft:wooden_shovel'))
            .key('K', ore('toolKnife'))
            .register()
    }
    mods.gregtech.assembler.recipeBuilder()
        .inputs(items.planks * 5)
        .outputs(items.boat)
        .circuitMeta(15)
        .duration(100).EUt(4)
        .buildAndRegister()

    // Button
    crafting.remove("pvj:${WOOD_TYPE}_button")

    // Pressure Plate
    crafting.remove("pvj:${WOOD_TYPE}_pressure_plate")
}
