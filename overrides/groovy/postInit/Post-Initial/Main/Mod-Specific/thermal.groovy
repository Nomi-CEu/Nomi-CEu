import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*

// Fix Energy Cells in JEI
// Remove all Energy Cells, then add them back
hideItemIgnoreNBT(item('thermalexpansion:cell'))

// Basic..Resonant
for (int level : 0..4) {
	mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 0, 'Level': (byte) level]))
}

// Creative
mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 1, 'Level': (byte) 4]))

// Hide Unused Thermal Machines
removeAndHideItemIgnoreNBT(item('thermalexpansion:machine', 13)) // Arcane Ensorcellator
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 8)) // Insightful Condenser
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 9)) // Decoctive Diffuser
