package post.main.mod

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*
import static gregtech.api.GTValues.*

import com.mcmoddev.densemetals.init.ModBlocks
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.common.metatileentities.MetaTileEntities
import it.unimi.dsi.fastutil.objects.ObjectOpenHashSet
import net.minecraft.item.Item
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidUtil

// General Item/Category Removals. Some may be in other scripts.

/* Item Removals */

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

/* Remove Categories (Some appear randomly after /gs reload) */
mods.jei.category.with {
    // Avatitia
    hideCategory('Avatitia.Extreme')

    // DME
    if (LabsModeHelper.expert) {
        hideCategory('deepmoblearning.simulation_chamber')
        hideCategory('deepmoblearning.extraction_chamber')
        hideCategory('deepmoblearning.trial_keystone')
    }

    // EIO
    hideCategory('CombustionGenerator')
    hideCategory('GrindingBall')
    hideCategory('SagMill')
    hideCategory('SolarPanel')
    hideCategory('StirlingGenerator')
    hideCategory('LavaGenerator')

    // AR
    hideCategory('zmaster587.AR.rollingMachine')
    hideCategory('zmaster587.AR.lathe')
    hideCategory('zmaster587.AR.precisionAssembler')
    hideCategory('zmaster587.AR.sawMill')
    hideCategory('zmaster587.AR.chemicalReactor')
    hideCategory('zmaster587.AR.crystallizer')
    hideCategory('zmaster587.AR.electrolyzer')
    hideCategory('zmaster587.AR.arcFurnace')
    hideCategory('zmaster587.AR.platePresser')
    hideCategory('zmaster587.AR.centrifuge')

    // Armor Plus
    hideCategory('armorplus:lava_infuser_infusing')
    hideCategory('armorplus:high_tech_bench')
    hideCategory('armorplus:ulti_tech_bench')
    hideCategory('armorplus:workbench')

    // Vanilla
    if (LabsModeHelper.expert) {
        hideCategory('jeresources.mob')
    }
}

/* Recipe Catalyst Overrides */
// Crafting (Remove Thermal's Auto Crafter, and Add Avaritia's Compressed)
overrideRecipeCatalysts('minecraft.crafting',
    item('minecraft:crafting_table'),
    item('avaritia:compressed_crafting_table'),
    metaitem('workbench'),
    item('actuallyadditions:item_crafter_on_a_stick'),
    item('appliedenergistics2:molecular_assembler'),
    item('extrautils2:crafter'),
    item('enderio:block_crafter'),
    item('enderio:block_inventory_panel'))

// Smelting (add More Furnaces' Furnaces)
List<Object> furnaceCatalysts = [item('minecraft:furnace')]

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

overrideRecipeCatalysts('minecraft.smelting', furnaceCatalysts.toArray())

// Extended Crafting (Add PAuto ExCrafting Crafters)
overrideRecipeCatalysts('extendedcrafting:table_crafting_5x5',
    item('extendedcrafting:table_advanced'),
    item('packagedexcrafting:advanced_crafter'))

overrideRecipeCatalysts('extendedcrafting:table_crafting_7x7',
    item('extendedcrafting:table_elite'),
    item('packagedexcrafting:elite_crafter'))

overrideRecipeCatalysts('extendedcrafting:table_crafting_9x9',
    item('extendedcrafting:table_ultimate'),
    item('packagedexcrafting:ultimate_crafter'))

// Crafting Core (Add PAuto ExCrafting Combination Package Crafter + Marked Pedestals)
overrideRecipeCatalysts('extendedcrafting:combination_crafting',
    item('extendedcrafting:crafting_core'),
    item('extendedcrafting:pedestal'),
    item('packagedexcrafting:combination_crafter'),
    item('packagedexcrafting:marked_pedestal'))

// Draconic Fusion (Add Packaged Draconic Core)
overrideRecipeCatalysts('DraconicEvolution.Fusion',
    item('draconicevolution:fusion_crafting_core'),
    item('packageddraconic:fusion_crafter'))
