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

hideItemIgnoreNBT(item('advancedrocketry:bucketrocketfuel'))
hideItemIgnoreNBT(item('advancedrocketry:bucketnitrogen'))
hideItemIgnoreNBT(item('advancedrocketry:buckethydrogen'))
hideItemIgnoreNBT(item('advancedrocketry:bucketoxygen'))
hideItemIgnoreNBT(item('advancedrocketry:bucketenrichedlava'))

// Armor Plus
mods.jei.ingredient.hide(item('armorplus:block_melting_obsidian')) // Null Texture Item

// Nomi Labs
if (LabsModeHelper.expert) {
	mods.jei.ingredient.hide(item('nomilabs:impossiblerealmdata'))
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
lootBoxes.forEach { hideItemIgnoreNBT(it) }

mods.jei.ingredient.hide(item('betterquesting:placeholder'))
mods.jei.ingredient.hide(fluid('betterquesting.placeholder'))

// Modded Buckets
hideItemIgnoreNBT(item('forge:bucketfilled'))

// Add back Creosote Bucket, has usages in recipes and furnace
mods.jei.ingredient.add(FluidUtil.getFilledBucket(fluid('creosote') * 1000))

// Add back Concrete Bucket, used in Firebricks
if (LabsModeHelper.expert)
	mods.jei.ingredient.add(FluidUtil.getFilledBucket(fluid('concrete') * 1000))

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
