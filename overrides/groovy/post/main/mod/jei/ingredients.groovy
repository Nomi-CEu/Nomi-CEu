// SIDE: CLIENT
// ^, JEI Ingredient Removals and Description Changes affects Client Only

package post.main.mod.jei

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*
import static gregtech.api.GTValues.*

import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.common.metatileentities.MetaTileEntities
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidUtil

/* General Item Removals and Description Changes. Some item removals may be in other scripts. */
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

    // NuclearCraft
    removeAndHide(item('nuclearcraft:block_depleted_uranium'))

    // Nomi Labs
    if (LabsModeHelper.expert) {
        hide(item('nomilabs:nomicoin'))
        hide(item('nomilabs:nomicoin5'))
        hide(item('nomilabs:nomicoin25'))
        hide(item('nomilabs:nomicoin100'))
        hide(item('nomilabs:woodenwidget'))
        hide(item('nomilabs:woodwidgetleft'))
        hide(item('nomilabs:woodwidgetright'))
        hide(item('nomilabs:stonewidget'))
        hide(item('nomilabs:stonewidgetup'))
        hide(item('nomilabs:stonewidgetdown'))
        hide(item('nomilabs:alloywidget'))
        hide(item('nomilabs:enderwidget'))
        hide(item('nomilabs:impossiblerealmdata'))
        hide(item('nomilabs:creativeportabletankmold'))
    }

    if (LabsModeHelper.normal) {
        hide(item('nomilabs:densemagma'))
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

    // Bountiful
    if (LabsModeHelper.expert) {
        removeAndHide(item('bountiful:bountyboarditem'))
        removeAndHide(item('bountiful:bounty'))
    }

    // Modded Buckets
    hideItemIgnoreNBT(item('forge:bucketfilled'))

    // Add back Creosote Bucket, has usages in recipes and furnace
    add(FluidUtil.getFilledBucket(fluid('creosote') * 1000))

    // Add Concrete Cell to JEI
    add(metaitem('fluid_cell').withNbt(['Fluid' : ['FluidName' : 'concrete', 'Amount' : 1000]]))
}

/* Descriptions */

// AE2 Seeds: Change advice to use crystal growth chamber
replaceDescription(item('appliedenergistics2:material', 10), 'nomiceu.jei.description.pure_certus')
replaceDescription(item('appliedenergistics2:material', 11), 'nomiceu.jei.description.pure_quartz')
replaceDescription(item('appliedenergistics2:material', 12), 'nomiceu.jei.description.pure_fluix')
