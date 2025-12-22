package post.main.mod

import static post.classes.Common.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable

import net.minecraft.init.SoundEvents
import net.minecraft.item.EnumDyeColor

// Network Visualisation Tool
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

// Legacy recipe
// Remove and add back the old recipe to place it below our new;
// but don't fully remove it to not break patterns (new one is cheaper anyways)
// TODO Remove Old Recipe in 1.8
crafting.remove('ae2stuff:recipe6')
crafting.shapedBuilder()
    .output(item('ae2stuff:visualiser'))
    .matrix(
        'S S',
        'EPE',
        'FFF')
    .key('S', item('appliedenergistics2:material', 41))
    .key('P', ore('itemIlluminatedPanel'))
    .key('E', item('appliedenergistics2:material', 24))
    .key('F', item('appliedenergistics2:material', 12))
    .setOutputTooltip(translatable('nomiceu.tooltip.mixed.deprecated_recipe'))
    .register()

/* Wireless Connectors and Hubs */

// Wireless Connector
crafting.shapedBuilder()
    .output(item('ae2stuff:wireless') * 2)
    .matrix(
        'BEB',
        'IWI',
        'FEF')
    .key('B', item('nae2:part'))
    .key('F', item('appliedenergistics2:material', 12))
    .key('E', item('appliedenergistics2:material', 24))
    .key('I', metaitem('plateStainlessSteel'))
    .key('W', metaitem('wireless'))
    .register()

// Legacy recipe
// Remove and add back the old recipe to place it below our new;
// but don't fully remove it to not break patterns (new one is cheaper anyways)
// TODO Remove Old Recipe in 1.8
crafting.remove('ae2stuff:recipe2')
crafting.shapedBuilder()
    .output(item('ae2stuff:wireless'))
    .matrix(
        'FEF',
        'IWI',
        'FEF')
    .key('F', item('appliedenergistics2:material', 12))
    .key('E', item('appliedenergistics2:material', 24))
    .key('I', ore('ingotIron'))
    .key('W', item('appliedenergistics2:material', 41))
    .setOutputTooltip(translatable('nomiceu.tooltip.mixed.deprecated_recipe'))
    .register()

// Wireless Setup
crafting.shapedBuilder()
    .output(item('ae2stuff:wireless_kit'))
    .matrix('EW', 'T ')
    .key('E', item('appliedenergistics2:material', 24))
    .key('W', metaitem('wireless'))
    .key('T', item('appliedenergistics2:network_tool'))
    .register()

// Legacy recipe
// Remove and add back the old recipe to place it below our new;
// but don't fully remove it to not break patterns (new one is cheaper anyways)
// TODO Remove Old Recipe in 1.8
crafting.remove('ae2stuff:recipe4')
crafting.shapedBuilder()
    .output(item('ae2stuff:wireless_kit'))
    .matrix('EW', 'T ')
    .key('E', item('appliedenergistics2:material', 24))
    .key('W', item('appliedenergistics2:material', 41))
    .key('T', item('appliedenergistics2:network_tool'))
    .setOutputTooltip(translatable('nomiceu.tooltip.mixed.deprecated_recipe'))
    .register()

// Advanced Wireless Setup
crafting.shapedBuilder()
    .output(item('ae2stuff:adv_wireless_kit'))
    .matrix('TC', 'S ')
    .key('T', item('ae2stuff:wireless_kit'))
    .key('C', item('appliedenergistics2:controller'))
    .key('S', item('appliedenergistics2:material', 36))
    .replace().register()

// Misc changes
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
            .key('D', ore(combineCamelCase('dye', color.name)))
            .replace().register()

        // Add to the chisel group
        mods.chisel.carving.addVariation(type, item(type, wirelessMeta))
    }
}
