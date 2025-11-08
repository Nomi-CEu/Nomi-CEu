// SIDE: CLIENT
// ^, JEI Ingredient Removals affects Client Only

package post.main.mod.jei

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*
import static gregtech.api.GTValues.*

import com.mcmoddev.densemetals.init.ModBlocks
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.common.metatileentities.MetaTileEntities
import it.unimi.dsi.fastutil.objects.ObjectOpenHashSet
import net.minecraft.item.Item
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidUtil

/* General Item Removals. Some item removals may be in other scripts. */
mods.jei.ingredient.with {
    // AR
    hide(item('advancedrocketry:crystal:*')) // Random Crystal Blocks
    hide(item('advancedrocketry:quartzcrucible'))
    hide(item('advancedrocketry:iquartzcrucible'))

    hide(item('advancedrocketry:bucketrocketfuel'))
    hide(item('advancedrocketry:bucketnitrogen'))
    hide(item('advancedrocketry:buckethydrogen'))
    hide(item('advancedrocketry:bucketoxygen'))
    hide(item('advancedrocketry:bucketenrichedlava'))

    // Armor Plus
    hide(item('armorplus:block_melting_obsidian')) // Null Texture Item

    // Dense Ores
    var visibleDenseOres = ['iron', 'coal', 'diamond', 'emerald', 'lapis', 'redstone']

    // The '.toString()' is important here to normalise the GStrings into Java Strings, to allow for proper set searching
    var exclusionSet = new ObjectOpenHashSet<>(visibleDenseOres.collect { type ->  "dense_${type}_ore".toString() })

    for (var denseOre : ModBlocks.DENSE_ORES) {
        if (exclusionSet.contains(denseOre.registryName.path))
            continue

        if (!denseOre.resolve()) continue // An 'invalid' dense ore

        println "Hiding Dense Ore ${denseOre.registryName}..."
        removeAndHide(new ItemStack(Item.getItemFromBlock(denseOre)))
    }

    // NuclearCraft
    removeAndHide(item('nuclearcraft:block_depleted_uranium'))

    // Nomi Labs
    if (LabsModeHelper.expert) {
        hide(item('nomilabs:impossiblerealmdata'))
    }

    if (LabsModeHelper.normal) {
        removeAndHide(item('nomilabs:densemagma'))
        hide(fluid('liquid_nitrogen'))
    }

    // GregTech
    // Higher Tier Muffler Hatches
    for (var tier : [MV, HV, EV, IV, LuV, ZPM, UV]) {
        removeAndHide(MetaTileEntities.MUFFLER_HATCH[tier].stackForm)
    }

    // Ore variants and byproducts
    removeAndHide(item('gregtech:ore_draconium_0', 0))
    removeAndHide(item('gregtech:ore_draconium_0', 1))
    removeAndHide(item('gregtech:ore_osmiridium_8020_0', 1))
    removeAndHide(item('gregtech:ore_osmiridium_8020_0', 2))
    removeAndHide(item('gregtech:ore_iridosmine_8020_0', 1))
    removeAndHide(item('gregtech:ore_iridosmine_8020_0', 2))
    removeAndHide(item('gregtech:ore_kaemanite_0', 1))
    removeAndHide(item('gregtech:ore_kaemanite_0', 2))
    removeAndHide(item('gregtech:ore_fluorite_0', 1))
    removeAndHide(item('gregtech:ore_fluorite_0', 2))
    removeAndHide(item('gregtech:ore_darmstadtite_0', 0))
    removeAndHide(item('gregtech:ore_darmstadtite_0', 1))
    removeAndHide(item('gregtech:ore_laurite_0', 0))
    removeAndHide(item('gregtech:ore_laurite_0', 2))
    removeAndHide(item('gregtech:ore_cuprorhodsite_0', 0))
    removeAndHide(item('gregtech:ore_cuprorhodsite_0', 2))
    removeAndHide(item('gregtech:ore_aluminium_0', 1))
    removeAndHide(item('gregtech:ore_beryllium_0', 2))
    removeAndHide(item('gregtech:ore_cobalt_0', 0))
    removeAndHide(item('gregtech:ore_cobalt_0', 1))
    removeAndHide(item('gregtech:ore_cobalt_0', 2))
    removeAndHide(item('gregtech:ore_iron_0', 1))
    removeAndHide(item('gregtech:ore_iron_0', 2))
    removeAndHide(item('gregtech:ore_lead_0', 1))
    removeAndHide(item('gregtech:ore_lead_0', 2))
    removeAndHide(item('gregtech:ore_lithium_0', 1))
    removeAndHide(item('gregtech:ore_molybdenum_0', 2))
    removeAndHide(item('gregtech:ore_neodymium_0', 2))
    removeAndHide(item('gregtech:ore_nickel_0', 1))
    removeAndHide(item('gregtech:ore_nickel_0', 2))
    removeAndHide(item('gregtech:ore_palladium_0', 1))
    removeAndHide(item('gregtech:ore_platinum_0', 1))
    removeAndHide(item('gregtech:ore_plutonium_0', 0))
    removeAndHide(item('gregtech:ore_plutonium_0', 1))
    removeAndHide(item('gregtech:ore_plutonium_0', 2))
    removeAndHide(item('gregtech:ore_silver_0', 2))
    removeAndHide(item('gregtech:ore_sulfur_0', 2))
    removeAndHide(item('gregtech:ore_thorium_0', 2))
    removeAndHide(item('gregtech:ore_tin_0', 2))
    removeAndHide(item('gregtech:ore_naquadah_0', 1))
    removeAndHide(item('gregtech:ore_naquadah_0', 2))
    removeAndHide(item('gregtech:ore_certus_quartz_0', 2))
    removeAndHide(item('gregtech:ore_almandine_0', 2))
    removeAndHide(item('gregtech:ore_asbestos_0', 1))
    removeAndHide(item('gregtech:ore_asbestos_0', 2))
    removeAndHide(item('gregtech:ore_banded_iron_0', 2))
    removeAndHide(item('gregtech:ore_blue_topaz_0', 0))
    removeAndHide(item('gregtech:ore_blue_topaz_0', 2))
    removeAndHide(item('gregtech:ore_brown_limonite_0', 2))
    removeAndHide(item('gregtech:ore_calcite_0', 1))
    removeAndHide(item('gregtech:ore_calcite_0', 2))
    removeAndHide(item('gregtech:ore_cassiterite_sand_0', 1))
    removeAndHide(item('gregtech:ore_cassiterite_sand_0', 2))
    removeAndHide(item('gregtech:ore_chalcopyrite_0', 1))
    removeAndHide(item('gregtech:ore_chalcopyrite_0', 2))
    removeAndHide(item('gregtech:ore_chromite_0', 0))
    removeAndHide(item('gregtech:ore_chromite_0', 1))
    removeAndHide(item('gregtech:ore_cinnabar_0', 2))
    removeAndHide(item('gregtech:ore_coal_0', 1))
    removeAndHide(item('gregtech:ore_coal_0', 2))
    removeAndHide(item('gregtech:ore_cobaltite_0', 2))
    removeAndHide(item('gregtech:ore_diamond_0', 1))
    removeAndHide(item('gregtech:ore_diamond_0', 2))
    removeAndHide(item('gregtech:ore_emerald_0', 2))
    removeAndHide(item('gregtech:ore_galena_0', 1))
    removeAndHide(item('gregtech:ore_galena_0', 2))
    removeAndHide(item('gregtech:ore_garnierite_0', 1))
    removeAndHide(item('gregtech:ore_garnierite_0', 2))
    removeAndHide(item('gregtech:ore_green_sapphire_0', 1))
    removeAndHide(item('gregtech:ore_green_sapphire_0', 2))
    removeAndHide(item('gregtech:ore_grossular_0', 2))
    removeAndHide(item('gregtech:ore_bauxite_0', 1))
    removeAndHide(item('gregtech:ore_lazurite_0', 1))
    removeAndHide(item('gregtech:ore_lazurite_0', 2))
    removeAndHide(item('gregtech:ore_magnesite_0', 1))
    removeAndHide(item('gregtech:ore_magnesite_0', 2))
    removeAndHide(item('gregtech:ore_magnetite_0', 1))
    removeAndHide(item('gregtech:ore_molybdenite_0', 2))
    removeAndHide(item('gregtech:ore_powellite_0', 2))
    removeAndHide(item('gregtech:ore_pyrite_0', 2))
    removeAndHide(item('gregtech:ore_pyrolusite_0', 2))
    removeAndHide(item('gregtech:ore_pyrope_0', 1))
    removeAndHide(item('gregtech:ore_pyrope_0', 2))
    removeAndHide(item('gregtech:ore_rock_salt_0', 1))
    removeAndHide(item('gregtech:ore_rock_salt_0', 2))
    removeAndHide(item('gregtech:ore_ruby_0', 2))
    removeAndHide(item('gregtech:ore_salt_0', 1))
    removeAndHide(item('gregtech:ore_salt_0', 2))
    removeAndHide(item('gregtech:ore_saltpeter_0', 2))
    removeAndHide(item('gregtech:ore_sapphire_0', 2))
    removeAndHide(item('gregtech:ore_sodalite_0', 1))
    removeAndHide(item('gregtech:ore_sodalite_0', 2))
    removeAndHide(item('gregtech:ore_spessartine_0', 1))
    removeAndHide(item('gregtech:ore_spessartine_0', 2))
    removeAndHide(item('gregtech:ore_stibnite_0', 2))
    removeAndHide(item('gregtech:ore_tetrahedrite_0', 2))
    removeAndHide(item('gregtech:ore_topaz_0', 2))
    removeAndHide(item('gregtech:ore_uraninite_0', 1))
    removeAndHide(item('gregtech:ore_wulfenite_0', 2))
    removeAndHide(item('gregtech:ore_yellow_limonite_0', 2))
    removeAndHide(item('gregtech:ore_nether_quartz_0', 2))
    removeAndHide(item('gregtech:ore_quartzite_0', 2))
    removeAndHide(item('gregtech:ore_graphite_0', 1))
    removeAndHide(item('gregtech:ore_graphite_0', 2))
    removeAndHide(item('gregtech:ore_bornite_0', 0))
    removeAndHide(item('gregtech:ore_chalcocite_0', 0))
    removeAndHide(item('gregtech:ore_chalcocite_0', 2))
    removeAndHide(item('gregtech:ore_realgar_0', 1))
    removeAndHide(item('gregtech:ore_realgar_0', 2))
    removeAndHide(item('gregtech:ore_bastnasite_0', 2))
    removeAndHide(item('gregtech:ore_pentlandite_0', 2))
    removeAndHide(item('gregtech:ore_spodumene_0', 1))
    removeAndHide(item('gregtech:ore_spodumene_0', 2))
    removeAndHide(item('gregtech:ore_lepidolite_0', 2))
    removeAndHide(item('gregtech:ore_glauconite_sand_0', 1))
    removeAndHide(item('gregtech:ore_glauconite_sand_0', 2))
    removeAndHide(item('gregtech:ore_malachite_0', 1))
    removeAndHide(item('gregtech:ore_malachite_0', 2))
    removeAndHide(item('gregtech:ore_mica_0', 1))
    removeAndHide(item('gregtech:ore_mica_0', 2))
    removeAndHide(item('gregtech:ore_barite_0', 2))
    removeAndHide(item('gregtech:ore_alunite_0', 0))
    removeAndHide(item('gregtech:ore_alunite_0', 2))
    removeAndHide(item('gregtech:ore_talc_0', 1))
    removeAndHide(item('gregtech:ore_talc_0', 2))
    removeAndHide(item('gregtech:ore_soapstone_0', 1))
    removeAndHide(item('gregtech:ore_soapstone_0', 2))
    removeAndHide(item('gregtech:ore_kyanite_0', 1))
    removeAndHide(item('gregtech:ore_kyanite_0', 2))
    removeAndHide(item('gregtech:ore_oilsands_0', 1))
    removeAndHide(item('gregtech:ore_olivine_0', 1))
    removeAndHide(item('gregtech:ore_olivine_0', 2))
    removeAndHide(item('gregtech:ore_opal_0', 1))
    removeAndHide(item('gregtech:ore_opal_0', 2))
    removeAndHide(item('gregtech:ore_amethyst_0', 1))
    removeAndHide(item('gregtech:ore_amethyst_0', 2))
    removeAndHide(item('gregtech:ore_lapis_0', 1))
    removeAndHide(item('gregtech:ore_lapis_0', 2))
    removeAndHide(item('gregtech:ore_apatite_0', 1))
    removeAndHide(item('gregtech:ore_apatite_0', 2))
    removeAndHide(item('gregtech:ore_tricalcium_phosphate_0', 1))
    removeAndHide(item('gregtech:ore_tricalcium_phosphate_0', 2))
    removeAndHide(item('gregtech:ore_garnet_red_0', 1))
    removeAndHide(item('gregtech:ore_garnet_red_0', 2))
    removeAndHide(item('gregtech:ore_garnet_yellow_0', 1))
    removeAndHide(item('gregtech:ore_garnet_yellow_0', 2))
    removeAndHide(item('gregtech:ore_pollucite_0', 1))
    removeAndHide(item('gregtech:ore_pollucite_0', 2))
    removeAndHide(item('gregtech:ore_bentonite_0', 1))
    removeAndHide(item('gregtech:ore_bentonite_0', 2))
    removeAndHide(item('gregtech:ore_fullers_earth_0', 1))
    removeAndHide(item('gregtech:ore_fullers_earth_0', 2))
    removeAndHide(item('gregtech:ore_pitchblende_0', 1))
    removeAndHide(item('gregtech:ore_monazite_0', 2))
    removeAndHide(item('gregtech:ore_trona_0', 0))
    removeAndHide(item('gregtech:ore_trona_0', 1))
    removeAndHide(item('gregtech:ore_trona_0', 2))
    removeAndHide(item('gregtech:ore_gypsum_0', 1))
    removeAndHide(item('gregtech:ore_gypsum_0', 2))
    removeAndHide(item('gregtech:ore_zeolite_0', 1))
    removeAndHide(item('gregtech:ore_zeolite_0', 2))
    removeAndHide(item('gregtech:ore_redstone_0', 2))
    removeAndHide(item('gregtech:ore_electrotine_0', 2))
    removeAndHide(item('gregtech:ore_diatomite_0', 2))
    removeAndHide(item('gregtech:ore_granitic_mineral_sand_0', 1))
    removeAndHide(item('gregtech:ore_granitic_mineral_sand_0', 2))
    removeAndHide(item('gregtech:ore_garnet_sand_0', 1))
    removeAndHide(item('gregtech:ore_garnet_sand_0', 2))
    removeAndHide(item('gregtech:ore_basaltic_mineral_sand_0', 1))
    removeAndHide(item('gregtech:ore_basaltic_mineral_sand_0', 2))
    removeAndHide(item('gregtech:meta_dust_impure', 23)) // Cobalt
    removeAndHide(item('gregtech:meta_dust_pure', 23))
    removeAndHide(item('gregtech:meta_crushed', 23))
    removeAndHide(item('gregtech:meta_crushed_purified', 23))
    removeAndHide(item('gregtech:meta_crushed_centrifuged', 23))
    removeAndHide(item('gregtech:meta_dust_impure', 81)) // Plutonium 239
    removeAndHide(item('gregtech:meta_dust_pure', 81))
    removeAndHide(item('gregtech:meta_crushed', 81))
    removeAndHide(item('gregtech:meta_crushed_purified', 81))
    removeAndHide(item('gregtech:meta_crushed_centrifuged', 81))
    removeAndHide(item('gregtech:meta_dust', 2031)) // Trona
    removeAndHide(item('gregtech:meta_dust_small', 2031))
    removeAndHide(item('gregtech:meta_dust_tiny', 2031))
    removeAndHide(item('gregtech:meta_dust_impure', 2031))
    removeAndHide(item('gregtech:meta_dust_pure', 2031))
    removeAndHide(item('gregtech:meta_crushed', 2031))
    removeAndHide(item('gregtech:meta_crushed_purified', 2031))
    removeAndHide(item('gregtech:meta_crushed_centrifuged', 2031))

    if (LabsModeHelper.normal) {
        removeAndHide(item('gregtech:ore_darmstadtite_0', 2))
        removeAndHide(item('gregtech:ore_cooperite_0', 1))
        removeAndHide(item('gregtech:ore_tantalite_0', 2))
        removeAndHide(item('gregtech:ore_pentlandite_0', 1))
        removeAndHide(item('nomilabs:meta_dust', 110)) // Darmstadtite
        removeAndHide(item('nomilabs:meta_dust_small', 110))
        removeAndHide(item('nomilabs:meta_dust_tiny', 110))
        removeAndHide(item('nomilabs:meta_dust_impure', 110))
        removeAndHide(item('nomilabs:meta_dust_pure', 110))
        removeAndHide(item('nomilabs:meta_crushed', 110))
        removeAndHide(item('nomilabs:meta_crushed_purified', 110))
        removeAndHide(item('nomilabs:meta_crushed_centrifuged', 110))
    }
    
    if (LabsModeHelper.expert) {
        removeAndHide(item('gregtech:ore_snowchestite_0', 1))
        removeAndHide(item('gregtech:ore_snowchestite_0', 2))
        removeAndHide(item('gregtech:ore_dulysite_0', 0))
        removeAndHide(item('gregtech:ore_dulysite_0', 1))
        removeAndHide(item('gregtech:ore_lithium_0', 0))
        removeAndHide(item('gregtech:ore_neodymium_0', 0))
        removeAndHide(item('gregtech:ore_platinum_0', 0))
        removeAndHide(item('gregtech:ore_sulfur_0', 0))
        removeAndHide(item('gregtech:ore_thorium_0', 0))
        removeAndHide(item('gregtech:ore_naquadah_0', 0))
        removeAndHide(item('gregtech:ore_cooperite_0', 0))
        removeAndHide(item('gregtech:ore_powellite_0', 0))
        removeAndHide(item('gregtech:ore_saltpeter_0', 0))
        removeAndHide(item('gregtech:ore_topaz_0', 0))
        removeAndHide(item('gregtech:ore_barite_0', 0))
        removeAndHide(item('gregtech:ore_electrotine_0', 0))
        removeAndHide(item('gregtech:meta_dust_impure', 124)) // Naquadah
        removeAndHide(item('gregtech:meta_dust_pure', 124))
        removeAndHide(item('gregtech:meta_crushed', 124))
        removeAndHide(item('gregtech:meta_crushed_purified', 124))
        removeAndHide(item('gregtech:meta_crushed_centrifuged', 124))
    }

    // Extended Crafting
    // Ender & Enhanced Ender
    hide(item('extendedcrafting:storage', 5)) // Block of Ender
    hide(item('extendedcrafting:material', 49)) // Enhanced Ender Nugget

    // Better Questing
    List<ItemStack> lootBoxes = [
        item('bq_standard:loot_chest'),
        item('bq_standard:loot_chest', 25),
        item('bq_standard:loot_chest', 50),
        item('bq_standard:loot_chest', 75),
        item('bq_standard:loot_chest', 100),
        item('bq_standard:loot_chest', 101),
        item('bq_standard:loot_chest', 102),
        item('bq_standard:loot_chest', 103),
        item('bq_standard:loot_chest', 104),
    ]
    lootBoxes.forEach { box -> hide(box) }

    hide(item('betterquesting:placeholder'))
    hide(fluid('betterquesting.placeholder'))

    // Modded Buckets
    hideItemIgnoreNBT(item('forge:bucketfilled'))

    // Add back Creosote Bucket, has usages in recipes and furnace
    add(FluidUtil.getFilledBucket(fluid('creosote') * 1000))

    // Add Concrete Cell to JEI
    add(metaitem('fluid_cell').withNbt(['Fluid' : ['FluidName' : 'concrete', 'Amount' : 1000]]))
}
