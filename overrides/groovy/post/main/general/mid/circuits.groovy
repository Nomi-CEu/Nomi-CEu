import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.recipeproperties.CleanroomProperty

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.toGtInput

// EV: Tier 1 (Workstation)
mods.gregtech.circuit_assembler.changeByOutput([metaitem('circuit.workstation')], null)
    .forEach { ChangeRecipeBuilder builder ->
        builder.changeInput(-1) {
            toGtInput(ore('boltVibrantAlloy') * 16)
        }.copyProperties(CleanroomProperty.instance)
            .replaceAndRegister()
    }

// IV: Tier 2 (Nano Supercomputer)
mods.gregtech.circuit_assembler.changeByOutput([metaitem('circuit.nano_computer')], null)
    .forEach { ChangeRecipeBuilder builder ->
        builder.removeInputs(-1, -2)
            .builder { RecipeBuilder recipe ->
                recipe.inputs(ore('wireFineLumium') * 8, ore('wireFineTungstenSteel') * 16)
            }.copyProperties(CleanroomProperty.instance)
            .replaceAndRegister()
    }

// ZPM: Tier 2 (Crystal Supercomputer)
mods.gregtech.circuit_assembler.changeByOutput([metaitem('circuit.crystal_computer')], null)
    .forEach { ChangeRecipeBuilder builder ->
        builder.changeInput(-1) {
            toGtInput(ore('wireFineEnderium') * 32)
        }.copyProperties(CleanroomProperty.instance)
            .replaceAndRegister()
    }
