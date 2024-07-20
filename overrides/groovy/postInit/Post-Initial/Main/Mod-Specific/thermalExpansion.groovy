import static com.nomiceu.nomilabs.groovy.GroovyHelpers.JEIHelpers.*

/* Item Removals */
void removeAugments() {
mods.hei.removeAndHide(item('thermalexpansion:augment', 352)) // Pyroconvective Loop
mods.hei.removeAndHide(item('thermalexpansion:augment', 401)) // Flux Reconstruction
mods.hei.removeAndHide(item('thermalexpansion:augment', 402)) // Parabolic Flux Coupling
mods.hei.removeAndHide(item('thermalexpansion:augment', 448)) // Reagent Recovery
mods.hei.removeAndHide(item('thermalexpansion:augment', 656)) // Isentropic Reservoir
mods.hei.removeAndHide(item('thermalexpansion:augment', 672)) // Closed Loop Cooling
mods.hei.removeAndHide(item('thermalexpansion:augment', 704)) // Disjunctive Extraction
}
removeAugments()
