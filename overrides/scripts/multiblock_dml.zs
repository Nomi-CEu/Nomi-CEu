#packmode normal
#modloaded deepmoblearning
import mods.gregtech.recipe.RecipeMap;

import crafttweaker.data.IData;
import crafttweaker.world.IFacing;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IItemCondition;

import scripts.common.makeShaped as makeShaped;


// from DML's config
val mobs as int[string] = {
//  mob                 RF/t
    "zombie":           64,
    "skeleton":         64,
    "creeper":          64,
    "spider":           64,
    "slime":            64,
    "witch":            512,
    "blaze":            1024,
    "ghast":            1024,
    "wither_skeleton":  1024,
    "enderman":         2048,
    "wither":           6666,
    "dragon":           6666,
    "shulker":          512,
    "guardian":         1024,
    "thermal_elemental": 1024
};

val pristine_types as IItemStack[string] = {
//  mob                 pristine type
    "zombie":           <deepmoblearning:living_matter_overworldian>,
    "skeleton":         <deepmoblearning:living_matter_overworldian>,
    "creeper":          <deepmoblearning:living_matter_overworldian>,
    "spider":           <deepmoblearning:living_matter_overworldian>,
    "slime":            <deepmoblearning:living_matter_overworldian>,
    "witch":            <deepmoblearning:living_matter_overworldian>,
    "blaze":            <deepmoblearning:living_matter_hellish>,
    "ghast":            <deepmoblearning:living_matter_hellish>,
    "wither_skeleton":  <deepmoblearning:living_matter_hellish>,
    "enderman":         <deepmoblearning:living_matter_extraterrestrial>,
    "wither":           <deepmoblearning:living_matter_extraterrestrial>,
    "dragon":           <deepmoblearning:living_matter_extraterrestrial>,
    "shulker":          <deepmoblearning:living_matter_extraterrestrial>,
    "guardian":         <deepmoblearning:living_matter_overworldian>,
    "thermal_elemental": <deepmoblearning:living_matter_overworldian>
};

val model_prefix = "deepmoblearning:data_model_";
val pristine_prefix = "deepmoblearning:pristine_matter_";

//// from DML's config
//val pristine_chances as int[] = [
//    5,
//    10,
//    20,
//    30
//];
//
//// from DML's config
//val maxExperience as int[] = [
//    0,
//    50,
//    250,
//    500
//];

//Recipe for Controller
// Moved to Groovy

val DATA_MODEL_MAXIMUM_TIER = 4;
val PRISTINE_CHANCE_FIXED = 30; // in %

for mob, cost in mobs {
    dme_sim_chamber.recipeBuilder()
        .duration(301)
        .EUt(cost / 4 as int)
        .inputs(<deepmoblearning:polymer_clay>)
        .notConsumable(itemUtils.getItem(model_prefix + mob).withEmptyTag())
        .outputs(pristine_types[mob])
        .chancedOutput(itemUtils.getItem(pristine_prefix + mob), PRISTINE_CHANCE_FIXED * 100, 0)
        .buildAndRegister();
}


