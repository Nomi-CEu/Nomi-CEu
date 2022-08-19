#packmode normal
#modloaded deepmoblearning
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
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

val name as string = "dml_sim_chamber";

val dml_sim_chamber = Builder.start("dml_sim_chamber", 3100)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCCCC", 
                "DEEED", 
                "DEEED", 
                "DEEED", 
                "CCCCC"
            )
            .aisle(
                "CCCCC", 
                "GOOOG", 
                "DOOOD", 
                "GOOOG", 
                "CGGGC"
            )
            .aisle(
                "CCCCC", 
                "GOOOG", 
                "DO-OD", 
                "GOOOG", 
                "CGGGC"
            )
            .aisle(
                "CCCCC", 
                "GOOOG", 
                "DOOOD", 
                "GOOOG", 
                "CGGGC"
            )
            .aisle(
                "CCSCC", 
                "DEGED", 
                "DGGGD", 
                "DEGED", 
                "CCCCC"
            )
            .where('S', controller.self())
            .where('D', <metastate:gcym:large_multiblock_casing:5>)
            .where('E', <metastate:gregtech:meta_block_compressed_2001:2>) // enderium
            .where('G', <metastate:appliedenergistics2:quartz_vibrant_glass:0>)
            .where('O', <metastate:extendedcrafting:storage:4> /* omnium */)
            .where('-', CTPredicate.getAny())
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:11>)
            | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("dml_sim_chamber")
            .minInputs(2)
            .maxInputs(2)
            .minOutputs(2)
            .maxOutputs(2)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:11>)
    .buildAndRegister();
dml_sim_chamber.hasMaintenanceMechanics = false;
dml_sim_chamber.hasMufflerMechanics = false;
//dml_sim_chamber.frontOverlay = <cube_renderer:CREATIVE_CONTAINER_OVERLAY>;

//Recipe for Controller
makeShaped("simulation_controller", <metaitem:multiblocktweaker:dml_sim_chamber>,
    ["MHM",
     "RCR",
     "MEM"],
    { M : <metaitem:circuit.wetware_mainframe>,
      R : <metaitem:robot.arm.uv>,
      C : <gcym:large_multiblock_casing:11>,
      E : <draconicevolution:draconic_energy_core>,
      H : <contenttweaker:heartofauniverse>
      });

val DATA_MODEL_MAXIMUM_TIER = 4;
val PRISTINE_CHANCE_FIXED = 30; // in %

for mob, cost in mobs {
    dml_sim_chamber.recipeMap.recipeBuilder()
        .duration(301)
        .EUt(cost / 4 as int)
        .inputs(<deepmoblearning:polymer_clay>)
        .notConsumable(itemUtils.getItem(model_prefix + mob))
        .outputs(pristine_types[mob])
        .chancedOutput(itemUtils.getItem(pristine_prefix + mob), PRISTINE_CHANCE_FIXED * 100, 0)
        .buildAndRegister();
}


