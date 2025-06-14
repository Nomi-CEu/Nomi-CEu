import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder

import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.RecipeMaps
import gregtech.api.recipes.chance.output.impl.ChancedItemOutput
import gregtech.api.recipes.ingredients.nbtmatch.NBTCondition
import gregtech.api.recipes.ingredients.nbtmatch.NBTMatcher
import gregtech.api.recipes.recipeproperties.CleanroomProperty
import gregtech.api.recipes.recipeproperties.ResearchProperty
import gregtech.api.recipes.recipeproperties.TemperatureProperty

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.GTRecipeHelpers.*
import static gregtech.api.GTValues.*

  
mods.gregtech.cyclotron.recipeBuilder()
        .inputs(item('gregtech:meta_foil', 64))
        .fluidInputs(fluid('hydrogen') * 1000)
        .outputs(item('nomilabs:meta_foil', 20))
        .EUt(VA[UHV]).duration(600)
        .buildAndRegister()
mods.gregtech.cyclotron.recipeBuilder()
        .inputs(item('gregtech:meta_foil', 66))
        .fluidInputs(fluid('hydrogen') * 1000)
        .outputs(item('nomilabs:meta_foil', 120))
        .EUt(VA[UHV]).duration(600)
        .buildAndRegister()
mods.gregtech.particle_accelerator.recipeBuilder()
        .inputs(item('gregtech:meta_ingot', 66))
        .fluidInputs(fluid('hydrogen') * 1000)
        .outputs(item('nomilabs:meta_ingot', 120))
        .EUt(VA[UEV]).duration(600)
        .buildAndRegister()
mods.gregtech.particle_accelerator.recipeBuilder()
        .inputs(item('gregtech:meta_ingot', 64))
        .fluidInputs(fluid('hydrogen') * 1000)
        .outputs(item('nomilabs:meta_ingot', 20))
        .EUt(VA[UEV]).duration(600)
        .buildAndRegister()
mods.gregtech.assembly_line.recipeBuilder()
        .inputs(item('gregtech:meta_item_1', 209) * 4, item('gregtech:meta_item_1', 149) * 2, item('gregtech:meta_item_1', 497) * 8, ore('circuitUv') * 8, ore('pipeHugeFluidNeutronium') * 4, ore('plateTrinaquadalloy') * 8)
        .fluidInputs(fluid('tritanium') * 1152)
        .outputs(item('nomilabs:acceleration_coil))
        .stationResearch(b -> b.researchStack(item('gregtech:fusion_casing', 1)).CWUt(128))
        .EUt(VA[UHV]).duration(600)
        .buildAndRegister()


  
