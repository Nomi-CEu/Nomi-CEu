import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import gregtech.api.recipes.ingredients.GTRecipeItemInput
import gregtech.api.unification.OreDictUnifier

import static gregtech.api.unification.material.Materials.*
import static gregtech.api.unification.ore.OrePrefix.*

/* Add Extruder Recipes from Pulps to Blocks/Rods */

// Polymer Materials (Skipping Raw Rubber, no blocks or rods)
var materials = [
    Rubber,
    SiliconeRubber,
    StyreneButadieneRubber,
    Epoxy,
    ReinforcedEpoxyResin,
    Polyethylene,
    PolyvinylChloride,
    Polytetrafluoroethylene,
    Polybenzimidazole,
    PolyphenyleneSulfide,
    Polycaprolactam,
]

var prefixes = [
    block,
    stick,
]

for (def material : materials) {
    var dust = OreDictUnifier.get(dust, material)
    for (def prefix : prefixes) {
        var stack = OreDictUnifier.get(prefix, material)
        if (stack.empty) continue

        mods.gregtech.extruder.changeByOutput([stack], null)
            .forEach { ChangeRecipeBuilder builder ->
                builder.changeInput(0) {
                    new GTRecipeItemInput(dust)
                }.buildAndRegister()
            }
    }
}
