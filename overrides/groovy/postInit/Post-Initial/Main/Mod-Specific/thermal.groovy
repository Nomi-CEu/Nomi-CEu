import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*
import crafttweaker.api.minecraft.CraftTweakerMC;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.item.IIngredient;
import crafttweaker.mods.jei.JEI;
import crafttweaker.CraftTweakerAPI;
// Fix Energy Cells in JEI
// Remove all Energy Cells, then add them back
hideItemIgnoreNBT(item('thermalexpansion:cell'))


IItemStack arcaneItems = CraftTweakerMC.getIItemStack(item('thermalexpansion:machine', 13).withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 1, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2], 'RSControl': (byte) 0, 'Energy': 0, 'Level': (byte) 4, 'Creative': (byte) 1]))
JEI.hide(arcaneItems)

IItemStack InsightfulCondenser = CraftTweakerMC.getIItemStack(item('thermalexpansion:device', 8).withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 1, (byte) 1, (byte) 2, (byte) 2, (byte) 2, (byte) 2], 'RSControl': (byte) 0, 'Energy': 0]))
JEI.hide(InsightfulCondenser)

IItemStack DecorativeDiffuser = CraftTweakerMC.getIItemStack(item('thermalexpansion:device', 9).withNbt(['Facing': (byte) 3, 'SideCache': [(byte) 0, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1], 'RSControl': (byte) 0, 'Energy': 0]))
JEI.hide(DecorativeDiffuser)

IItemStack PyroconvectiveLoop = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 352))
JEI.hide(PyroconvectiveLoop)

IItemStack FluxReconstruction = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 401));
JEI.hide(FluxReconstruction);

IItemStack ReagentRecovery = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 448));
JEI.hide(ReagentRecovery);

IItemStack IsentropicReservoir = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 656));
JEI.hide(IsentropicReservoir);

IItemStack ClosedLoopCooling = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 672));
JEI.hide(ClosedLoopCooling);

IItemStack DisjunctiveExtraction = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 704));
JEI.hide(DisjunctiveExtraction);

IItemStack PyroclasticInjection = CraftTweakerMC.getIItemStack(item('thermalexpansion:augment', 496));
JEI.hide(PyroclasticInjection);




//
//IItemStack creative_cell = CraftTweakerMC.getIItemStack(item('thermalexpansion:cell').withNbt(['Facing': (byte) 3,
//																							   'SideCache': [(byte) 2, (byte) 2, (byte) 2, (byte) 2, (byte) 2, (byte) 2],
//																							   'RSControl': (byte) 0, 'Energy': 500000000, 'Level': (byte) 4,
//																							   'Send': 250000, 'Recv': 250000, 'Creative': (byte) 1]))
//JEI.hide(creative_cell)
JEI.hide(CraftTweakerMC.getIItemStack(item('thermalexpansion:cell:*')))
//JEI.addItem(CraftTweakerMC.getIItemStack(item('thermalexpansion:cell:*')))


// Basic..Resonant
for (int level : 0..4) {
	mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 0, 'Level': (byte) level]))
}

mods.jei.ingredient.hide(item('thermalexpansion:cell'))

mods.jei.ingredient.hide(item('thermalexpansion:cell:*'))

// Creative
//mods.jei.ingredient.add(item('thermalexpansion:cell').withNbt(['Creative': (byte) 1, 'Level': (byte) 4]))

// Hide Unused Thermal Machines
removeAndHideItemIgnoreNBT(item('thermalexpansion:machine', 13)) // Arcane Ensorcellator
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 8)) // Insightful Condenser
removeAndHideItemIgnoreNBT(item('thermalexpansion:device', 9)) // Decorative Diffuser

// Hide Unused Augments
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 352)) // Pyroconvective Loop
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 401)) // Flux Reconstruction
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 448)) // Reagent Recovery
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 656)) // Isentropic Reservoir
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 672)) // Closed Loop Cooling
mods.jei.ingredient.removeAndHide(item('thermalexpansion:augment', 704)) // Disjunctive Extraction

mods.jei.ingredient.hide(item('thermalexpansion:cell'))
