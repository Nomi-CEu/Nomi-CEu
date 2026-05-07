// MODS_LOADED: pvj
// ^, Only runs when a player adds Project: Vibrant Journey themselves

package post.addon.pvj

import static post.classes.addon.PVJConsts.*


mods.jei.ingredient.with {
    /* These items should probably not show up in JEI, and only in world */

    // Leaves and Twigs
    for (VANILLA_TREE_TYPE in VANILLA_TREE_TYPES) {
        hide(item("pvj:fallenleaves_${VANILLA_TREE_TYPE}"))
        hide(item("pvj:${VANILLA_TREE_TYPE}_twigs"))
    }
    hide(item("pvj:fallenleaves_darkoak"))
    hide(item("pvj:dark_oak_twigs"))
    for (TREE_TYPE in TREE_TYPES) {
        hide(item("pvj:fallenleaves_${TREE_TYPE}"))
        hide(item("pvj:${TREE_TYPE}_twigs"))
    }
    hide(item('pvj:fallenleaves_dead'))

    // Door tiles
    for (WOOD_TYPE in WOOD_TYPES) {
        hide(item("pvj:${WOOD_TYPE}_door"))
    }

    // Formations
    hide(item('pvj:rock_formation'))
    hide(item('pvj:ice_formation'))

    /* These items appear twice in JEI */

    // Duplicate leaves
    for (TREE_TYPE in TREE_TYPES) {
        hide(item("pvj:leaves_${TREE_TYPE}", 3))
    }

    // Duplicate brick wall
    hide(item('pvj:cobblestone_brick_wall', 1))

    // Duplicate from vanilla cobweb
    hide(item('pvj:pvj_cobweb'))
}
