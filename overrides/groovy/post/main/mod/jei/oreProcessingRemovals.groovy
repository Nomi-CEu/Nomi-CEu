// SIDE: CLIENT
// ^, JEI Ingredient Removals affects Client Only

package post.main.mod.jei

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.MaterialHelpers.hideMaterial

import com.mcmoddev.densemetals.init.ModBlocks
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.unification.material.Material
import it.unimi.dsi.fastutil.objects.ObjectOpenHashSet

/* Unobtainable Ore Removals */
mods.jei.ingredient.with {
    // Dense Ores
    var visibleDenseOres = ['iron', 'coal', 'diamond', 'emerald', 'lapis', 'redstone']

    // The '.toString()' is important here to normalise the GStrings into Java Strings, to allow for proper set searching
    var exclusionSet = new ObjectOpenHashSet<>(visibleDenseOres.collect { type ->  "dense_${type}_ore".toString() })

    for (var denseOre : ModBlocks.DENSE_ORES) {
        if (exclusionSet.contains(denseOre.registryName.path))
            continue

        if (!denseOre.resolve()) continue // An 'invalid' dense ore

        log.info "Hiding Dense Ore ${denseOre.registryName}..."
        hide(new ItemStack(Item.getItemFromBlock(denseOre)))
    }

    // GregTech Ores
    var removeOres = { Material mat, Integer... metas ->
        for (var meta : metas) {
            hide(item("gregtech:ore_${mat}_0", meta))
        }
    }

    var normal = 0
    var nether = 1
    var end = 2

    // Custom Materials
    removeOres(material('nomilabs:draconium'), normal, nether)
    removeOres(material('nomilabs:osmiridium_8020'), nether, end)
    removeOres(material('nomilabs:iridosmine_8020'), nether, end)
    removeOres(material('nomilabs:kaemanite'), nether, end)
    removeOres(material('nomilabs:fluorite'), nether, end)
    removeOres(material('nomilabs:laurite'), normal, end)
    removeOres(material('nomilabs:cuprorhodsite'), normal, end)
    // Elemental Materials
    removeOres(material('aluminium'), nether)
    removeOres(material('beryllium'), end)
    removeOres(material('cobalt'), normal, nether, end)
    removeOres(material('iron'), nether, end)
    removeOres(material('lead'), nether, end)
    removeOres(material('lithium'), nether)
    removeOres(material('molybdenum'), end)
    removeOres(material('neodymium'), end)
    removeOres(material('nickel'), nether, end)
    removeOres(material('palladium'), nether)
    removeOres(material('platinum'), nether)
    removeOres(material('plutonium'), normal, nether, end)
    removeOres(material('silver'), end)
    removeOres(material('sulfur'), end)
    removeOres(material('thorium'), end)
    removeOres(material('tin'), end)
    removeOres(material('naquadah'), nether, end)
    // First Degree Materials
    removeOres(material('certus_quartz'), end)
    removeOres(material('almandine'), end)
    removeOres(material('asbestos'), nether, end)
    removeOres(material('banded_iron'), end)
    removeOres(material('blue_topaz'), normal, end)
    removeOres(material('brown_limonite'), end)
    removeOres(material('calcite'), nether, end)
    removeOres(material('cassiterite_sand'), nether, end)
    removeOres(material('chalcopyrite'), nether, end)
    removeOres(material('chromite'), normal, nether)
    removeOres(material('cinnabar'), end)
    removeOres(material('coal'), nether, end)
    removeOres(material('cobaltite'), end)
    removeOres(material('diamond'), nether, end)
    removeOres(material('emerald'), end)
    removeOres(material('galena'), nether, end)
    removeOres(material('garnierite'), nether, end)
    removeOres(material('green_sapphire'), nether, end)
    removeOres(material('grossular'), end)
    removeOres(material('bauxite'), nether)
    removeOres(material('lazurite'), nether, end)
    removeOres(material('magnesite'), nether, end)
    removeOres(material('magnetite'), nether)
    removeOres(material('molybdenite'), end)
    removeOres(material('powellite'), end)
    removeOres(material('pyrite'), end)
    removeOres(material('pyrolusite'), end)
    removeOres(material('pyrope'), nether, end)
    removeOres(material('rock_salt'), nether, end)
    removeOres(material('ruby'), end)
    removeOres(material('salt'), nether, end)
    removeOres(material('saltpeter'), end)
    removeOres(material('sapphire'), end)
    removeOres(material('sodalite'), nether, end)
    removeOres(material('spessartine'), nether, end)
    removeOres(material('stibnite'), end)
    removeOres(material('tetrahedrite'), end)
    removeOres(material('topaz'), end)
    removeOres(material('uraninite'), nether)
    removeOres(material('wulfenite'), end)
    removeOres(material('yellow_limonite'), end)
    removeOres(material('nether_quartz'), end)
    removeOres(material('quartzite'), end)
    removeOres(material('graphite'), nether, end)
    removeOres(material('bornite'), normal)
    removeOres(material('chalcocite'), normal, end)
    removeOres(material('realgar'), nether, end)
    removeOres(material('bastnasite'), end)
    removeOres(material('pentlandite'), end)
    removeOres(material('spodumene'), nether, end)
    removeOres(material('lepidolite'), end)
    removeOres(material('glauconite_sand'), nether, end)
    removeOres(material('malachite'), nether, end)
    removeOres(material('mica'), nether, end)
    removeOres(material('barite'), end)
    removeOres(material('alunite'), normal, end)
    removeOres(material('talc'), nether, end)
    removeOres(material('soapstone'), nether, end)
    removeOres(material('kyanite'), nether, end)
    // Unknown Composition Materials
    removeOres(material('oilsands'), nether)
    // Second Degree Materials
    removeOres(material('olivine'), nether, end)
    removeOres(material('opal'), nether, end)
    removeOres(material('amethyst'), nether, end)
    removeOres(material('lapis'), nether, end)
    removeOres(material('apatite'), nether, end)
    removeOres(material('tricalcium_phosphate'), nether, end)
    removeOres(material('garnet_red'), nether, end)
    removeOres(material('garnet_yellow'), nether, end)
    removeOres(material('pollucite'), nether, end)
    removeOres(material('bentonite'), nether, end)
    removeOres(material('fullers_earth'), nether, end)
    removeOres(material('pitchblende'), nether)
    removeOres(material('monazite'), end)
    removeOres(material('gypsum'), nether, end)
    removeOres(material('zeolite'), nether, end)
    removeOres(material('redstone'), end)
    // Higher Degree Materials
    removeOres(material('electrotine'), end)
    removeOres(material('diatomite'), end)
    removeOres(material('granitic_mineral_sand'), nether, end)
    removeOres(material('garnet_sand'), nether, end)
    removeOres(material('basaltic_mineral_sand'), nether, end)

    // Cobalt Ore Processing Line
    hide(metaitem('dustImpureCobalt'))
    hide(metaitem('dustPureCobalt'))
    hide(metaitem('crushedCobalt'))
    hide(metaitem('crushedPurifiedCobalt'))
    hide(metaitem('crushedCentrifugedCobalt'))
    // Plutonium-239 Ore Processing Line
    hide(metaitem('dustImpurePlutonium'))
    hide(metaitem('dustPurePlutonium'))
    hide(metaitem('crushedPlutonium'))
    hide(metaitem('crushedPurifiedPlutonium'))
    hide(metaitem('crushedCentrifugedPlutonium'))

    hideMaterial(material('trona'))

    if (LabsModeHelper.normal) {
        // Ores only available through Expert-only Missions
        hide(item('nomilabs:densemagma'))
        removeOres(material('cooperite'), nether)
        removeOres(material('tantalite'), end)
        removeOres(material('pentlandite'), nether)
    }

    if (LabsModeHelper.expert) {
        // Microverse Materials
        removeOres(material('snowchestite'), nether, end)
        removeOres(material('darmstadtite'), normal, nether)
        removeOres(material('dulysite'), normal, nether)
        // Ores only available through Nomicoins
        removeOres(material('lithium'), normal)
        removeOres(material('neodymium'), normal)
        removeOres(material('platinum'), normal)
        removeOres(material('sulfur'), normal)
        removeOres(material('thorium'), normal)
        removeOres(material('naquadah'), normal)
        removeOres(material('cooperite'), normal)
        removeOres(material('powellite'), normal)
        removeOres(material('saltpeter'), normal)
        removeOres(material('topaz'), normal)
        removeOres(material('barite'), normal)
        removeOres(material('electrotine'), normal)

        // Naquadah Ore Processing Line
        hide(metaitem('dustImpureNaquadah'))
        hide(metaitem('dustPureNaquadah'))
        hide(metaitem('crushedNaquadah'))
        hide(metaitem('crushedPurifiedNaquadah'))
        hide(metaitem('crushedCentrifugedNaquadah'))
    }
}
