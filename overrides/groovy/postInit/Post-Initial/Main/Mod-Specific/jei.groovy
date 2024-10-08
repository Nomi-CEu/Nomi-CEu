import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*

/* Item Removals */

// AR
mods.jei.ingredient.removeAndHide(item('advancedrocketry:crystal:*')) // Random Crystal Blocks

removeAndHideItemIgnoreNBT(item('advancedrocketry:bucketrocketfuel'))
removeAndHideItemIgnoreNBT(item('advancedrocketry:bucketnitrogen'))
removeAndHideItemIgnoreNBT(item('advancedrocketry:buckethydrogen'))
removeAndHideItemIgnoreNBT(item('advancedrocketry:bucketoxygen'))
removeAndHideItemIgnoreNBT(item('advancedrocketry:bucketenrichedlava'))

// Armor Plus
mods.jei.ingredient.removeAndHide(item('armorplus:block_melting_obsidian')) // Null Texture Item

// Thermal
removeAndHideItemIgnoreNBT(item('thermalexpansion:machine', 13)) // Arcane Ensorcellator
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 9)) // Decoctive Diffuser
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 8)) // Insightful Condenser

// Nomi Labs
if (LabsModeHelper.expert) {
	mods.jei.ingredient.removeAndHide(item('nomilabs:impossiblerealmdata'))
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
lootBoxes.forEach { removeAndHideItemIgnoreNBT(it) }

mods.jei.ingredient.removeAndHide(item('betterquesting:placeholder'))
mods.jei.ingredient.removeAndHide(fluid('betterquesting.placeholder'))

// Modded Buckets
hideItemIgnoreNBT(item('forge:bucketfilled'))

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
