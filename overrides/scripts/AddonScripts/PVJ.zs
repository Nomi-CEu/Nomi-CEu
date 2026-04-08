#modloaded pvj

import crafttweaker.item.IItemStack;

function addCutting(output as IItemStack[],
                    input as IItemStack[]) {
    cutter.recipeBuilder()
        .inputs(input)
        .fluidInputs(<liquid:water> * 4)
        .outputs(output)
        .duration(400).EUt(7).buildAndRegister();
    cutter.recipeBuilder()
        .inputs(input)
        .fluidInputs(<liquid:distilled_water> * 3)
        .outputs(output)
        .duration(300).EUt(7).buildAndRegister();
    cutter.recipeBuilder()
        .inputs(input)
        .fluidInputs(<liquid:lubricant> * 1)
        .outputs(output)
        .duration(200).EUt(7).buildAndRegister();
}

# Balance wood
val wood_types = [
    "willow",
    "mangrove",
    "palm",
    "redwood",
    "fir",
    "pine",
    "aspen",
    "maple",
    "baobab",
    "cottonwood",
    "juniper",
    "cherry_blossom",
    "jacaranda",
] as string[];

for wood_type in wood_types {
    var item_log = itemUtils.getItem("pvj:log_" + wood_type) as IItemStack;

    // Planks
    var item_planks = itemUtils.getItem("pvj:planks_" + wood_type) as IItemStack;
    recipes.remove(item_planks);
    recipes.addShapeless("PVJ Planks " + wood_type, item_planks * 2, [item_log]);
    recipes.addShaped("PVJ Planks " + wood_type + " saw", item_planks * 4, [
        [<ore:toolSaw>],
        [item_log]
    ]);
    addCutting([item_planks * 6, <gregtech:meta_dust:1617> * 2], [item_log]);

    // Stairs
    var item_stairs = itemUtils.getItem("pvj:" + wood_type + "_stairs") as IItemStack;
    assembler.recipeBuilder()
        .inputs(item_planks * 6)
        .outputs(item_stairs * 4)
        .circuit(7)
        .duration(100).EUt(1).buildAndRegister();

    // Stairs
    var item_slab = itemUtils.getItem("pvj:" + wood_type + "_slab") as IItemStack;
    recipes.remove(item_slab);
    recipes.addShaped("PVJ Slab " + wood_type, item_slab * 2, [
        [<ore:toolSaw>, item_planks]
    ]);
    recipes.addShaped("PVJ Planks " + wood_type + " slabs", item_planks, [
        [item_slab],
        [item_slab]
    ]);
    addCutting([item_slab * 2], [item_planks]);

    // Fence
    var item_fence = itemUtils.getItem("pvj:" + wood_type + "_fence") as IItemStack;
    recipes.remove(item_fence);
    recipes.addShaped("PVJ Fence " + wood_type, item_fence, [
        [item_planks, <ore:stickWood>, item_planks],
        [item_planks, <ore:stickWood>, item_planks],
        [item_planks, <ore:stickWood>, item_planks]
    ]);
    assembler.recipeBuilder()
        .inputs(item_planks)
        .outputs(item_fence)
        .circuit(1)
        .duration(100).EUt(4).buildAndRegister();

    // Gate Fence
    var item_fence_gate = itemUtils.getItem("pvj:" + wood_type + "_fence_gate") as IItemStack;
    recipes.remove(item_fence_gate);
    recipes.addShaped("PVJ Fence Gate " + wood_type, item_fence_gate, [
        [<ore:itemFlint>, null, <ore:itemFlint>],
        [<ore:stickWood>, item_planks, <ore:stickWood>],
        [<ore:stickWood>, item_planks, <ore:stickWood>]
    ]);
    recipes.addShaped("PVJ GregTech Fence Gate " + wood_type, item_fence_gate * 2, [
        [<ore:screwIron>, <ore:toolScrewdriver>, <ore:screwIron>],
        [<ore:stickWood>, item_planks, <ore:stickWood>],
        [<ore:stickWood>, item_planks, <ore:stickWood>]
    ]);
    assembler.recipeBuilder()
        .inputs(item_planks * 2, <ore:stickWood> * 2)
        .outputs(item_fence_gate)
        .circuit(2)
        .duration(100).EUt(4).buildAndRegister();

    // Trapdoor
    var item_trapdoor = itemUtils.getItem("pvj:" + wood_type + "_trapdoor") as IItemStack;
    recipes.remove(item_trapdoor);

    // Door
    var item_door = itemUtils.getItem("pvj:" + wood_type + "_door_item") as IItemStack;
    recipes.remove(item_door);
    recipes.addShaped("PVJ Door " + wood_type, item_door, [
        [item_planks, <minecraft:trapdoor>, <ore:toolScrewdriver>],
        [item_planks, <ore:ringIron>, <ore:screwIron>],
        [item_planks, item_planks, <ore:toolSaw>]
    ]);
    assembler.recipeBuilder()
        .inputs(item_planks * 4, <minecraft:trapdoor>)
        .outputs(item_door)
        .fluidInputs(<liquid:iron> * 16)
        .duration(400).EUt(4).buildAndRegister();

    // Boat
    var item_boat = itemUtils.getItem("pvj:" + wood_type + "_boat") as IItemStack;
    recipes.remove(item_boat);
    recipes.addShaped("PVJ Boat " + wood_type, item_boat, [
        [item_planks, <minecraft:wooden_shovel>, item_planks],
        [item_planks, <ore:toolKnife>, item_planks],
        [item_slab, item_slab, item_slab]
    ]);
    assembler.recipeBuilder()
        .inputs(item_planks * 5)
        .outputs(item_boat)
        .circuit(15)
        .duration(100).EUt(4).buildAndRegister();

    // Button
    var item_button = itemUtils.getItem("pvj:" + wood_type + "_button") as IItemStack;
    recipes.remove(item_button);

    // Pressure Plate
    var item_pressure_plate = itemUtils.getItem("pvj:" + wood_type + "_pressure_plate") as IItemStack;
    recipes.remove(item_pressure_plate);
}
