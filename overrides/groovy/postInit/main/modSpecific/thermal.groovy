package postInit.main.modSpecific

import com.nomiceu.nomilabs.groovy.SimpleIIngredient
import com.nomiceu.nomilabs.util.ItemMeta
import net.minecraft.item.ItemStack

/* Fix Tanks in JEI */
// Remove All, then add them back
mods.jei.ingredient.hide(item('thermalexpansion:tank'))

// Basic..Resonant
for (int level : 0..4) {
	mods.jei.ingredient.add(item('thermalexpansion:tank')
		.withNbt([RSControl: (byte) 0, 'Creative': (byte) 0, 'Level': (byte) level]))
}

// No Creative Tank

/* Fix Energy Cells in JEI */
// Remove all Energy Cells, then add them back
mods.jei.ingredient.hide(item('thermalexpansion:cell'))

// Basic..Resonant
for (int level : 0..4) {
	mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 0, 'Level': (byte) level]))
}

// Creative
mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 1, 'Level': (byte) 4]))

/* Hide Unused Augments */
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 352)) // Pyroconvective Loop
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 401)) // Flux Reconstruction
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 448)) // Reagent Recovery
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 656)) // Isentropic Reservoir
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 672)) // Closed Loop Cooling
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 704)) // Disjunctive Extraction

/* Other Hiding */
// Excavators
// (Replaced by GTCEu Spades)
mods.jei.ingredient.removeAndHide(item('redstonearsenal:tool.excavator_flux'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.excavator_diamond'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.excavator_iron'))

// Unused Items
mods.jei.hide(item('thermalfoundation:material', 264)) // Mana Infused Gear

/* Upgrade Recipes */
// Machines (Do each manually, side cache varies)
createAllUpgradeRecipes(item('thermalexpansion:machine', 4) // Phytogenic Insolator
	.withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 3, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2],
			  'RSControl': (byte) 0, 'Energy': 0]))
createAllUpgradeRecipes(item('thermalexpansion:machine', 5) // Compactor
	.withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 1, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2],
			  'RSControl': (byte) 0, 'Energy': 0]))
createAllUpgradeRecipes(item('thermalexpansion:machine', 9) // Energetic Infuser
	.withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 1, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2],
			  'RSControl': (byte) 0, 'Energy': 0]))
createAllUpgradeRecipes(item('thermalexpansion:machine', 14) // Glacial Precipitator
	.withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 1, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2],
			  'RSControl': (byte) 0, 'Energy': 0]))
createAllUpgradeRecipes(item('thermalexpansion:machine', 15) // Igneous Extruder
	.withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 1, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2],
			  'RSControl': (byte) 0, 'Energy': 0]))

// Dynamos
var dynamoMetas = [
    0, // Steam
	1, // Magmatic
	3, // Reactant
	5, // Numismatic
]
for (var meta : dynamoMetas) {
	createAllUpgradeRecipes(item('thermalexpansion:dynamo', meta)
		.withNbt(['Facing': (byte) 1, 'RSControl': (byte) 0, 'Energy': 0]))
}

// Misc
createAllUpgradeRecipes(item('thermalexpansion:tank')
		.withNbt(['RSControl': (byte) 0, 'Creative': (byte) 0]))
createAllUpgradeRecipes(item('thermalexpansion:cell')
	.withNbt(['Creative': (byte) 0]))

/* Upgrade Recipe Classes and Functions */
class UpgradeIngredient extends SimpleIIngredient {
	static String tagKey = 'Level'

	ItemStack toUpgrade
	Set<Byte> matchingLevels

	UpgradeIngredient(ItemStack toUpgrade, List<Integer> matchingLevels) {
		this.toUpgrade = toUpgrade
		this.matchingLevels = new HashSet<>(matchingLevels.collect {(byte) it})
	}

	@Override
	ItemStack[] getMatchingStacks() {
		return matchingLevels.stream()
			.map {
				var result = toUpgrade.copy()
				result.tagCompound.setByte(tagKey, it)
				return result
			}.toArray()
	}

	@Override
	boolean test(ItemStack itemStack) {
		if (!ItemMeta.compare(toUpgrade, itemStack)) return false

		// Check Level
		var tag = itemStack.tagCompound
		if (tag == null) return true

		return matchingLevels.contains(tag.getByte(tagKey))
	}
}

void createAllUpgradeRecipes(ItemStack toUpgrade) {
	// Upgrade
	for (var level : 1..4) {
		var result = toUpgrade.copy()
		result.tagCompound.setByte(UpgradeIngredient.tagKey, (byte) level)

		var upgrade = item('thermalfoundation:upgrade', level - 1) // Upgrades: 0 = Hardened, 1 = Reinforced, etc.

		createUpgradeRecipe(result, toUpgrade, upgrade, [level - 1])
	}

	// Conversion
	for (var level : 2..4) {
		var result = toUpgrade.copy()
		result.tagCompound.setByte(UpgradeIngredient.tagKey, (byte) level)

		var upgrade = item('thermalfoundation:upgrade', 33 + level - 2) // Upgrades: 33 = Reinforced, 34 = Signalum, etc.

		createUpgradeRecipe(result, toUpgrade, upgrade, (0..level - 2).toList())
	}
}

void createUpgradeRecipe(ItemStack result, ItemStack toUpgrade, ItemStack upgrade, List<Integer> levels) {
	crafting.shapelessBuilder()
		.output(result)
		.input(new UpgradeIngredient(toUpgrade, levels), upgrade)
		.strictJEIHandling()
		.register()
}

/* Remove Obsolete Recipes */
List<ItemStack> ingots = [
	item('advancedrocketry:productingot'), // Titanium Aluminide
	item('advancedrocketry:productingot', 1), // Titanium Iridium Alloy
	item('nuclearcraft:ingot', 12), // Aluminium
	item('thermalfoundation:material', 128), // Copper
	item('thermalfoundation:material', 129), // Tin
	item('thermalfoundation:material', 130), // Silver
	item('thermalfoundation:material', 131), // Lead
	item('thermalfoundation:material', 132), // Aluminium
	item('thermalfoundation:material', 133), // Nickel
	item('thermalfoundation:material', 134), // Platinum
	item('thermalfoundation:material', 135), // Iridium
	item('thermalfoundation:material', 160), // Steel
	item('thermalfoundation:material', 161), // Electrum
	item('thermalfoundation:material', 162), // Invar
	item('thermalfoundation:material', 163), // Bronze
	item('thermalfoundation:material', 164), // Constantan
	item('thermalfoundation:material', 165), // Signalum
	item('thermalfoundation:material', 166), // Lumium
	item('thermalfoundation:material', 167), // Enderium
]
ingots.forEach { mods.thermalexpansion.compactor.removeByInput(it) }

mods.thermalexpansion.compactor.removeByOutput(item('thermalfoundation:material', 264)) // Mana Infused Gear
