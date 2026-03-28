package post.main.mod.jei

import gregtech.common.metatileentities.MetaTileEntities

/* Recipe Catalyst Overrides (Client & Server) */
var replaceCatalysts = { String category, List<ItemStack> stacks ->
    mods.jei.catalyst.removeByType(category)
    mods.jei.catalyst.add(category, stacks)
}

// Crafting (Remove Thermal's Auto Crafter, and Add Avaritia's Compressed)
replaceCatalysts('minecraft.crafting',
    [item('minecraft:crafting_table'),
    item('avaritia:compressed_crafting_table'),
    metaitem('workbench'),
    item('actuallyadditions:item_crafter_on_a_stick'),
    item('appliedenergistics2:molecular_assembler'),
    item('extrautils2:crafter'),
    item('enderio:block_crafter'),
    item('enderio:block_inventory_panel')])

// Smelting (add More Furnaces' Furnaces)
List<ItemStack> furnaceCatalysts = [item('minecraft:furnace')]

for (var meta : [0, 5, 6, 1, 2, 3]) { // in tier order
    furnaceCatalysts.add(item('morefurnaces:furnaceblock', meta))
}

furnaceCatalysts.add(metaitem('steam_furnace_bronze'))
furnaceCatalysts.add(metaitem('steam_furnace_steel'))

for (var furnace : MetaTileEntities.ELECTRIC_FURNACE) {
    if (furnace == null) continue
    furnaceCatalysts.add(furnace.stackForm)
}

furnaceCatalysts.add(metaitem('steam_oven'))
furnaceCatalysts.add(metaitem('multi_furnace'))

replaceCatalysts('minecraft.smelting', furnaceCatalysts)

// Extended Crafting (Add PAuto ExCrafting Crafters)
replaceCatalysts('extendedcrafting:table_crafting_5x5',
    [item('extendedcrafting:table_advanced'),
    item('packagedexcrafting:advanced_crafter')])

replaceCatalysts('extendedcrafting:table_crafting_7x7',
    [item('extendedcrafting:table_elite'),
    item('packagedexcrafting:elite_crafter')])

replaceCatalysts('extendedcrafting:table_crafting_9x9',
    [item('extendedcrafting:table_ultimate'),
    item('packagedexcrafting:ultimate_crafter')])

// Crafting Core (Add PAuto ExCrafting Combination Package Crafter + Marked Pedestals)
replaceCatalysts('extendedcrafting:combination_crafting',
    [item('extendedcrafting:crafting_core'),
    item('extendedcrafting:pedestal'),
    item('packagedexcrafting:combination_crafter'),
    item('packagedexcrafting:marked_pedestal')])

// Draconic Fusion (Add Packaged Draconic Core)
replaceCatalysts('DraconicEvolution.Fusion',
    [item('draconicevolution:fusion_crafting_core'),
    item('packageddraconic:fusion_crafter')])
