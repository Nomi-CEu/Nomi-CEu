package postInit.main.modSpecific

import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.common.metatileentities.MetaTileEntities
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidUtil

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*
import static gregtech.api.GTValues.*

// General Item/Category Removals. Some may be in other scripts.

/* Item Removals */

// AR
mods.jei.ingredient.hide(item('advancedrocketry:crystal:*')) // Random Crystal Blocks
mods.jei.ingredient.hide(item('advancedrocketry:quartzcrucible'))
mods.jei.ingredient.hide(item('advancedrocketry:iquartzcrucible'))

mods.jei.ingredient.hide(item('advancedrocketry:bucketrocketfuel'))
mods.jei.ingredient.hide(item('advancedrocketry:bucketnitrogen'))
mods.jei.ingredient.hide(item('advancedrocketry:buckethydrogen'))
mods.jei.ingredient.hide(item('advancedrocketry:bucketoxygen'))
mods.jei.ingredient.hide(item('advancedrocketry:bucketenrichedlava'))

// Armor Plus
mods.jei.ingredient.hide(item('armorplus:block_melting_obsidian')) // Null Texture Item

// NuclearCraft
mods.jei.ingredient.removeAndHide(item('nuclearcraft:block_depleted_uranium'))

// Nomi Labs
if (LabsModeHelper.expert) {
	mods.jei.ingredient.hide(item('nomilabs:impossiblerealmdata'))
}

if (LabsModeHelper.normal) {
	mods.jei.ingredient.hide(fluid('liquid_nitrogen'))
}

// GregTech
// Higher Tier Muffler Hatches
for (var tier : [MV, HV, EV, IV, LuV, ZPM, UV]) {
	mods.jei.ingredient.removeAndHide(MetaTileEntities.MUFFLER_HATCH[tier].getStackForm())
}

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
lootBoxes.forEach { mods.jei.ingredient.hide(it) }

mods.jei.ingredient.hide(item('betterquesting:placeholder'))
mods.jei.ingredient.hide(fluid('betterquesting.placeholder'))

// Modded Buckets
hideItemIgnoreNBT(item('forge:bucketfilled'))

// Add back Creosote Bucket, has usages in recipes and furnace
mods.jei.ingredient.add(FluidUtil.getFilledBucket(fluid('creosote') * 1000))

// Add Concrete Cell to JEI
mods.jei.ingredient.add(metaitem('fluid_cell').withNbt(['Fluid': ['FluidName': 'concrete', 'Amount': 1000]]))

/* Remove Categories (Appear Randomly after /gs reload) */
// Avatitia
mods.jei.category.hideCategory('Avatitia.Extreme')

// DME
if (LabsModeHelper.expert) {
	mods.jei.category.hideCategory('deepmoblearning.simulation_chamber')
	mods.jei.category.hideCategory('deepmoblearning.extraction_chamber')
	mods.jei.category.hideCategory('deepmoblearning.trial_keystone')
}

// EIO
mods.jei.category.hideCategory('CombustionGenerator')
mods.jei.category.hideCategory('GrindingBall')
mods.jei.category.hideCategory('SagMill')
mods.jei.category.hideCategory('SolarPanel')
mods.jei.category.hideCategory('StirlingGenerator')
mods.jei.category.hideCategory('LavaGenerator')

// AR
mods.jei.category.hideCategory('zmaster587.AR.rollingMachine')
mods.jei.category.hideCategory('zmaster587.AR.lathe')
mods.jei.category.hideCategory('zmaster587.AR.precisionAssembler')
mods.jei.category.hideCategory('zmaster587.AR.sawMill')
mods.jei.category.hideCategory('zmaster587.AR.chemicalReactor')
mods.jei.category.hideCategory('zmaster587.AR.crystallizer')
mods.jei.category.hideCategory('zmaster587.AR.electrolyzer')
mods.jei.category.hideCategory('zmaster587.AR.arcFurnace')
mods.jei.category.hideCategory('zmaster587.AR.platePresser')
mods.jei.category.hideCategory('zmaster587.AR.centrifuge')

// Armor Plus
mods.jei.category.hideCategory('armorplus:lava_infuser_infusing')
mods.jei.category.hideCategory('armorplus:high_tech_bench')
mods.jei.category.hideCategory('armorplus:ulti_tech_bench')
mods.jei.category.hideCategory('armorplus:workbench')

// Vanilla
if (LabsModeHelper.expert) {
    mods.jei.category.hideCategory('jeresources.mob')
}

/* Recipe Catalyst Overrides */
// Crafting (Remove Thermal's Auto Crafter, and Add Avaritia's Compressed)
overrideRecipeCatalysts('minecraft.crafting',
	item('minecraft:crafting_table'),
	item('avaritia:compressed_crafting_table'),
	metaitem('workbench'),
	item('actuallyadditions:item_crafter_on_a_stick'),
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
	furnaceCatalysts.add(furnace.getStackForm())
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

// Draconic Fusion (Add Packaged Draconic Core)
overrideRecipeCatalysts('DraconicEvolution.Fusion',
	item('draconicevolution:fusion_crafting_core'),
	item('packageddraconic:fusion_crafter'))

//ZBGT integration
if (!Loader.isModLoaded('zbgt')) {
	mods.jei.ingredient.removeAndHide(item('nomilabs:creativecomputationmold'))
}
