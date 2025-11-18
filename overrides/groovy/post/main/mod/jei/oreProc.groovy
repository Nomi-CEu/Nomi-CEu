// SIDE: CLIENT
// ^, JEI Ingredient Removals affects Client Only

package post.main.mod.jei

import static com.nomiceu.nomilabs.gregtech.material.registry.LabsMaterials.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.MaterialHelpers.hideMaterial
import static gregtech.api.unification.material.Materials.*
import static gregtech.api.unification.ore.OrePrefix.*

import com.mcmoddev.densemetals.init.ModBlocks
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.unification.OreDictUnifier
import gregtech.api.unification.material.Material
import it.unimi.dsi.fastutil.objects.ObjectOpenHashSet
import net.minecraft.item.Item
import net.minecraft.item.ItemStack

/* Unobtainable Ore Removals */
mods.jei.ingredient.with {
    // Vanilla Ores
    hide(item('minecraft:iron_ore>'))
    hide(item('minecraft:coal_ore>'))
    hide(item('minecraft:redstone_ore>'))
    hide(item('minecraft:diamond_ore>'))
    hide(item('minecraft:lapis_ore>'))
    hide(item('minecraft:gold_ore>'))
    hide(item('minecraft:emerald_ore>'))
    hide(item('minecraft:quartz_ore>'))

    // Dense Ores
    var visibleDenseOres = [Iron, Coal, Diamond, Emerald, Lapis, Redstone]

    // The '.toString()' is important here to normalise the GStrings into Java Strings, to allow for proper set searching
    var exclusionSet = new ObjectOpenHashSet<>(visibleDenseOres.collect { mat ->  "dense_${mat}_ore".toString() })

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

    var removeAllProcessing =  { Material mat ->
        removeOres(mat, normal, nether, end)

        for (var prefix : [dustImpure, dustPure, crushed, crushedPurified, crushedCentrifuged]) {
            hide(OreDictUnifier.get(prefix, mat))
        }
    }

    // Custom Materials
    removeOres(Draconium, normal, nether)
    removeOres(Osmiridium8020, nether, end)
    removeOres(Iridosmine8020, nether, end)
    removeOres(Kaemanite, nether, end)
    removeOres(Fluorite, nether, end)
    removeOres(Laurite, normal, end)
    removeOres(Cuprorhodsite, normal, end)

    // Elemental Materials
    removeOres(Aluminium, nether)
    removeOres(Beryllium, end)
    removeOres(Iron, nether, end)
    removeOres(Lead, nether, end)
    removeOres(Lithium, nether)
    removeOres(Molybdenum, end)
    removeOres(Neodymium, end)
    removeOres(Nickel, nether, end)
    removeOres(Palladium, nether)
    removeOres(Platinum, nether)
    removeOres(Silver, end)
    removeOres(Sulfur, end)
    removeOres(Thorium, end)
    removeOres(Tin, end)

    // First Degree Materials
    removeOres(CertusQuartz, end)
    removeOres(Almandine, end)
    removeOres(Asbestos, nether, end)
    removeOres(BandedIron, end)
    removeOres(BlueTopaz, normal, end)
    removeOres(BrownLimonite, end)
    removeOres(Calcite, nether, end)
    removeOres(CassiteriteSand, nether, end)
    removeOres(Chalcopyrite, nether, end)
    removeOres(Chromite, normal, nether)
    removeOres(Cinnabar, end)
    removeOres(Coal, nether, end)
    removeOres(Cobaltite, end)
    removeOres(Diamond, nether, end)
    removeOres(Emerald, end)
    removeOres(Galena, nether, end)
    removeOres(Garnierite, nether, end)
    removeOres(GreenSapphire, nether, end)
    removeOres(Grossular, end)
    removeOres(Bauxite, nether)
    removeOres(Lazurite, nether, end)
    removeOres(Magnesite, nether, end)
    removeOres(Magnetite, nether)
    removeOres(Molybdenite, end)
    removeOres(Powellite, end)
    removeOres(Pyrite, end)
    removeOres(Pyrolusite, end)
    removeOres(Pyrope, nether, end)
    removeOres(RockSalt, nether, end)
    removeOres(Ruby, end)
    removeOres(Salt, nether, end)
    removeOres(Saltpeter, end)
    removeOres(Sapphire, end)
    removeOres(Sodalite, nether, end)
    removeOres(Spessartine, nether, end)
    removeOres(Stibnite, end)
    removeOres(Tetrahedrite, end)
    removeOres(Topaz, end)
    removeOres(Uraninite, nether)
    removeOres(Wulfenite, end)
    removeOres(YellowLimonite, end)
    removeOres(NetherQuartz, end)
    removeOres(Quartzite, end)
    removeOres(Graphite, nether, end)
    removeOres(Bornite, normal)
    removeOres(Chalcocite, normal, end)
    removeOres(Realgar, nether, end)
    removeOres(Bastnasite, end)
    removeOres(Pentlandite, end)
    removeOres(Spodumene, nether, end)
    removeOres(Lepidolite, end)
    removeOres(GlauconiteSand, nether, end)
    removeOres(Malachite, nether, end)
    removeOres(Mica, nether, end)
    removeOres(Barite, end)
    removeOres(Alunite, normal, end)
    removeOres(Talc, nether, end)
    removeOres(Soapstone, nether, end)
    removeOres(Kyanite, nether, end)

    // Unknown Composition Materials
    removeOres(Oilsands, nether)

    // Second Degree Materials
    removeOres(Olivine, nether, end)
    removeOres(Opal, nether, end)
    removeOres(Amethyst, nether, end)
    removeOres(Lapis, nether, end)
    removeOres(Apatite, nether, end)
    removeOres(TricalciumPhosphate, nether, end)
    removeOres(GarnetRed, nether, end)
    removeOres(GarnetYellow, nether, end)
    removeOres(Pollucite, nether, end)
    removeOres(Bentonite, nether, end)
    removeOres(FullersEarth, nether, end)
    removeOres(Pitchblende, nether)
    removeOres(Monazite, end)
    removeOres(Gypsum, nether, end)
    removeOres(Zeolite, nether, end)
    removeOres(Redstone, end)

    // Higher Degree Materials
    removeOres(Electrotine, end)
    removeOres(Diatomite, end)
    removeOres(GraniticMineralSand, nether, end)
    removeOres(GarnetSand, nether, end)
    removeOres(BasalticMineralSand, nether, end)

    // Full Removals
    removeAllProcessing(Cobalt)
    removeAllProcessing(Plutonium239)
    hideMaterial(Trona)

    if (LabsModeHelper.normal) {
        // Ores only available through Expert-only Missions
        removeOres(Cooperite, nether)
        removeOres(Tantalite, end)
        removeOres(Pentlandite, nether)

        // Different hiding for NM/HM
        removeOres(Naquadah, nether, end)
    }

    if (LabsModeHelper.expert) {
        // Microverse Materials
        removeOres(Snowchestite, nether, end)
        removeOres(Darmstadtite, normal, nether)
        removeOres(Dulysite, normal, nether)

        // Ores only available through Nomicoins
        removeOres(Lithium, normal)
        removeOres(Neodymium, normal)
        removeOres(Platinum, normal)
        removeOres(Sulfur, normal)
        removeOres(Thorium, normal)
        removeOres(Cooperite, normal)
        removeOres(Powellite, normal)
        removeOres(Saltpeter, normal)
        removeOres(Topaz, normal)
        removeOres(Barite, normal)
        removeOres(Electrotine, normal)

        // Full Removals
        removeAllProcessing(Naquadah)
    }
}
