package post.main.general.mid

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.toGtInput

import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.recipeproperties.CleanroomProperty

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
        builder.removeInputs(-1)
            .builder { RecipeBuilder recipe ->
                recipe.inputs(ore('wireFineTungstenSteel') * 16)
            }.copyProperties(CleanroomProperty.instance)
            .replaceAndRegister()
    }

// IV: Tier 3 (Quantumprocesor Assembly)
mods.gregtech.circuit_assembler.changeByOutput([metaitem('circuit.quantum_assembly')], null)
    .forEach { ChangeRecipeBuilder builder ->
        builder.removeInputs(-1)
            .builder { RecipeBuilder recipe ->
                recipe.inputs(ore('wireFineLumium') * 16)
            }.copyProperties(CleanroomProperty.instance)
            .replaceAndRegister()
    }

// ZPM: Tier 1 (Quantumprocessor Mainframe)
mods.gregtech.circuit_assembler.changeByOutput([metaitem('circuit.quantum_mainframe')], null)
    .forEach { ChangeRecipeBuilder builder ->
        builder.removeInputs(-1)
            .builder { RecipeBuilder recipe ->
                recipe.inputs(ore('wireGtSingleSignalum') * 48)
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
