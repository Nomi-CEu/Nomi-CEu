// MODS_LOADED: fluxnetworks
// ^, Only runs when a player adds Flux Networks themselves

package post.addon

// Remove category for flux dust in-world craft and hide all 3 no longer used items
mods.jei.category.remove('flux')
mods.jei.ingredient.hide(item('fluxnetworks:flux'))
mods.jei.ingredient.removeAndHide(item('fluxnetworks:fluxcore')) // Have to removeAndHide as it shows up for uses/eye of ender/obsidian otherwise
mods.jei.ingredient.hide(item('fluxnetworks:fluxblock'))
