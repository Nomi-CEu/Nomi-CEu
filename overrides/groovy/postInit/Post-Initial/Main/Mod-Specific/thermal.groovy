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

// Hide Unused Thermal Machines
mods.jei.ingredient.hide(item('thermalexpansion:device', 8)) // Insightful Condenser
mods.jei.ingredient.hide(item('thermalexpansion:device', 9)) // Decoctive Diffuser

// Hide Unused Augments
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 352)) // Pyroconvective Loop
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 401)) // Flux Reconstruction
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 448)) // Reagent Recovery
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 656)) // Isentropic Reservoir
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 672)) // Closed Loop Cooling
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 704)) // Disjunctive Extraction

