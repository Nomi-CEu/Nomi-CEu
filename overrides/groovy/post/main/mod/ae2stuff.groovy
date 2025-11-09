package post.main.mod

import net.minecraft.init.SoundEvents
import net.minecraft.item.EnumDyeColor
import post.classes.Common

// Network Visualisation Tool
// Not replacing the recipe; prevents breaking existing patterns
crafting.shapedBuilder()
    .output(item('ae2stuff:visualiser'))
    .matrix(
        'S S',
        'EPE',
        'FFF')
    .key('S', metaitem('sensor.lv'))
    .key('P', ore('itemIlluminatedPanel'))
    .key('E', item('appliedenergistics2:material', 24))
    .key('F', item('appliedenergistics2:material', 12))
    .register()

/* Wireless Connectors and Hubs */

for (String type : ['ae2stuff:wireless', 'ae2stuff:wireless_hub']) {
    // Init chisel group
    mods.chisel.carving.addGroup(type)
    mods.chisel.carving.setSound(type, SoundEvents.BLOCK_STONE_PLACE)

    mods.chisel.carving.addVariation(type, item(type))

    for (var color : EnumDyeColor.values()) {
        int wirelessMeta = color.metadata + 1 // + 1 because 0 is fluix

        // Hides dyed variants from JEI
        mods.jei.ingredient.hide(item(type, wirelessMeta))

        // Fixes dying recipes outputting 1 instead of 8
        crafting.shapedBuilder()
            .output(item(type, wirelessMeta) * 8)
            .matrix(
                'WWW',
                'WDW',
                'WWW')
            .key('W', item(type))
            .key('D', ore(Common.combineCamelCase('dye', color.name)))
            .replace().register()

        // Add to the chisel group
        mods.chisel.carving.addVariation(type, item(type, wirelessMeta))
    }
}
