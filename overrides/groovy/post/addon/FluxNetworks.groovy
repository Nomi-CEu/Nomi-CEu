// MODS_LOADED: fluxnetworks
// ^, Only runs when a player adds Flux Networks themselves

package post.addon

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TooltipHelpers.addTooltip
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable

// Remove category for flux dust in-world craft and hide all 3 no longer used items
mods.jei.category.remove('flux')
mods.jei.ingredient.hide(item('fluxnetworks:flux'))
// Have to removeAndHide as it shows up for uses of eye of ender/obsidian otherwise
mods.jei.ingredient.removeAndHide(item('fluxnetworks:fluxcore'))
mods.jei.ingredient.hide(item('fluxnetworks:fluxblock'))

// Flux Plug
crafting.remove('fluxnetworks:tile.fluxnetworks.fluxplug')
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxplug'))
    .matrix(
        'XEX',
        'CFC',
        'XUX')
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('E', metaitem('emitter.luv')) // LuV Emitter
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .key('U', metaitem('energy_converter.luv.16')) // 16x LuV Converter
    .register()

// Legacy Plug
// Avoid breaking patterns
// TODO remove in 1.8
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxplug'))
    .matrix(
        'CSC',
        'XFX',
        'CUC')
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('S', metaitem('sensor.luv')) // LuV Sensor
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .key('U', metaitem('energy_converter.luv.16')) // 16x LuV Converter
    .setOutputTooltip(translatable('nomiceu.tooltip.mixed.deprecated_recipe'))
    .register()

// Flux Point
crafting.remove('fluxnetworks:tile.fluxnetworks.fluxpoint')
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxpoint'))
    .matrix(
        'XSX',
        'CFC',
        'XUX')
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('S', metaitem('sensor.luv')) // LuV Sensor
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .key('U', metaitem('energy_converter.luv.16')) // 16x LuV Converter
    .register()

// Legacy Point
// Avoid breaking patterns
// TODO remove in 1.8
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxpoint'))
    .matrix(
        'CUC',
        'XFX',
        'CSC')
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('S', metaitem('sensor.luv')) // LuV Sensor
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .key('U', metaitem('energy_converter.luv.16')) // 16x LuV Converter
    .setOutputTooltip(translatable('nomiceu.tooltip.mixed.deprecated_recipe'))
    .register()

// Flux Controller
crafting.remove('fluxnetworks:tile.fluxnetworks.fluxcontroller')
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxcontroller'))
    .matrix(
        'SPE',
        'CBC',
        'XFX')
    .key('S', metaitem('sensor.luv')) // LuV Sensor
    .key('P', item('extrautils2:playerchest')) // XU2 Player Chest
    .key('E', metaitem('emitter.luv')) // LuV Emitter
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('B', metaitem('battery_buffer.luv.4')) // 16x LuV Battery Buffer
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .register()

// Basic Flux Storage
crafting.remove('fluxnetworks:tile.fluxnetworks.fluxstorage')
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxstorage'))
    .matrix(
        'SAE',
        'CBC',
        'XFX')
    .key('S', metaitem('sensor.luv')) // LuV Sensor
    .key('A', metaitem('energy_crystal')) // Energium Crystal
    .key('E', metaitem('emitter.luv')) // LuV Emitter
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('B', metaitem('battery_buffer.luv.4')) // 4x LuV Battery Buffer
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .register()

// Herculean Flux Storage
crafting.remove('fluxnetworks:tile.fluxnetworks.herculeanfluxstorage')
crafting.shapedBuilder()
    .output(item('fluxnetworks:herculeanfluxstorage'))
    .matrix(
        'XAX',
        'CBC',
        'XFX')
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('A', metaitem('lapotron_crystal')) // Lapotron Crystal
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('B', item('fluxnetworks:fluxstorage')) // Basic Flux Storage
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .register()

// Gargantuan Flux Storage
crafting.remove('fluxnetworks:tile.fluxnetworks.gargantuanfluxstorage')
crafting.shapedBuilder()
    .output(item('fluxnetworks:gargantuanfluxstorage'))
    .matrix(
        'XAX',
        'CBC',
        'XFX')
    .key('X', item('enderio:item_endergy_conduit:11')) // Drac. Superconductor Conduit
    .key('A', metaitem('energy.lapotronic_orb')) // Lapotronic Energy Orb
    .key('C', ore('circuitLuv')) // Any LuV Circuit
    .key('B', item('fluxnetworks:herculeanfluxstorage')) // Herculean Flux Storage
    .key('F', item('actuallyadditions:block_phantom_energyface')) // Phantom Energyface
    .register()

// Flux Configurator
crafting.remove('fluxnetworks:item.fluxnetworks.fluxconfigurator')
crafting.shapedBuilder()
    .output(item('fluxnetworks:fluxconfigurator'))
    .matrix(
        '  S',
        ' R ',
        'R  ')
    .key('S', metaitem('sensor.luv')) // LuV Sensor
    .key('R', ore('stickEnderium')) // Enderium Rod
    .register()

// Tooltips
// Flux Storages
// Specify that they help with "network stability"
addTooltip(item('fluxnetworks:fluxstorage'), [
    translatable('nomiceu.tooltip.addon.ae2fc.storages.1'),
    translatable('nomiceu.tooltip.addon.ae2fc.storages.2'),
])
addTooltip(item('fluxnetworks:herculeanfluxstorage'), [
    translatable('nomiceu.tooltip.addon.ae2fc.storages.1'),
    translatable('nomiceu.tooltip.addon.ae2fc.storages.2'),
])
addTooltip(item('fluxnetworks:gargantuanfluxstorage'), [
    translatable('nomiceu.tooltip.addon.ae2fc.storages.1'),
    translatable('nomiceu.tooltip.addon.ae2fc.storages.2'),
])
