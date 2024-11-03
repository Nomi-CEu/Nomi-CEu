import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*
import crafttweaker.api.minecraft.CraftTweakerMC;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.mods.jei.JEI;
import crafttweaker.CraftTweakerAPI;

// Fix Energy Cells in JEI
// Remove all Energy Cells, then add them back
hideItemIgnoreNBT(item('thermalexpansion:cell'))
//hideItemIgnoreNBT(item('thermalexpansion:cell'))

// Basic..Resonant
for (int level : 0..4) {
	mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 0, 'Level': (byte) level]))
}

JEI.addItem(CraftTweakerMC.getIItemStack(item('thermalexpansion:cell:*')))

// Creative
mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 1, 'Level': (byte) 4]))

// Hide Unused Thermal Machines
removeAndHideItemIgnoreNBT(item('thermalexpansion:machine', 13)) // Arcane Ensorcellator
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 8)) // Insightful Condenser
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 9)) // Decoctive Diffuser

// Hide Unused Augments
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 352)) // Pyroconvective Loop
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 401)) // Flux Reconstruction
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 448)) // Reagent Recovery
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 656)) // Isentropic Reservoir
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 672)) // Closed Loop Cooling
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 704)) // Disjunctive Extraction

