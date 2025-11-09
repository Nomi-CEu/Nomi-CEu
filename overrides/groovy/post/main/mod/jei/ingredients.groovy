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
    var visibleDenseOres = ['iron', 'coal', 'gold', 'diamond', 'emerald', 'lapis', 'redstone']

    // The '.toString()' is important here to normalise the GStrings into Java Strings, to allow for proper set searching
    var exclusionSet = new ObjectOpenHashSet<>(visibleDenseOres.collect { type ->  "dense_${type}_ore".toString() })

    for (var denseOre : ModBlocks.DENSE_ORES) {
        if (exclusionSet.contains(denseOre.registryName.path))
            continue

        if (!denseOre.resolve()) continue // An 'invalid' dense ore

        log.info "Hiding Dense Ore ${denseOre.registryName}..."
        removeAndHide(new ItemStack(Item.getItemFromBlock(denseOre)))
    }

    // NuclearCraft
    removeAndHide(item('nuclearcraft:block_depleted_uranium'))

    // Nomi Labs
    if (LabsModeHelper.expert) {
        hide(item('nomilabs:impossiblerealmdata'))
    }

    if (LabsModeHelper.normal) {
        hide(fluid('liquid_nitrogen'))
    }

    // GregTech
    // Higher Tier Muffler Hatches
    for (var tier : [MV, HV, EV, IV, LuV, ZPM, UV]) {
        removeAndHide(MetaTileEntities.MUFFLER_HATCH[tier].stackForm)
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
