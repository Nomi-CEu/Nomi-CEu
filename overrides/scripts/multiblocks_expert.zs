#packmode expert

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;

import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeShaped as makeShaped;
import scripts.common.absolute_int as absolute_int;

//val ROCKET_ARROW as ITextureArea = ITextureArea.fullImage("multiblocktweaker:textures/gui/progress_bar/rocket.png");

// multiblock stuctures
// Basic Microverse Projector

val microverse_projector_basic = Builder.start("mbt:microverse_projector_basic") // automatic allocation ID
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
                          .aisle("CCC", "CVC", "CCC")
                          .aisle("CCC", "GDG", "CCC")
                          .aisle("CSC", "CGC", "CCC")
                          .where('S', controller.self())
                          .where('G', <blockstate:gregtech:transparent_casing>)
                          .where('V', <metastate:gregtech:multiblock_casing:2>)
                          .where('D', <metastate:chisel:diamond:3>)
                          .where("C", CTPredicate.states(<blockstate:contenttweaker:microverse_casing>) | controller.autoAbilities(true, true, true, true, true, false, true))
                          .build();
                 } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("microverse_projector_basic") // create a RecipeMap.
            .minInputs(2)
            .maxInputs(4)
            .minOutputs(1)
            .maxOutputs(16)
            .maxFluidInputs(1)
            //.setProgressBar(ROCKET_ARROW, MoveType.HORIZONTAL)
            .build())
    .withBaseTexture(<blockstate:contenttweaker:microverse_casing>) // Looking for existing renderers in CEu. but yeah, you can also use <metastate:gregtech:metal_casing:3> here
    .buildAndRegister();

microverse_projector_basic.hasMufflerMechanics = true;
microverse_projector_basic.hasMaintenanceMechanics = true;
//microverse_projector_basic.frontOverlay = <cube_renderer:COMPRESSOR_OVERLAY>;

// Advanced Microverse Projector
val microverse_projector_advanced = Builder.start("mbt:microverse_projector_advanced")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                    "CCCCC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    "CCCCC")
            .aisle(
                    "CVCVC",
                    "GDDDG",
                    "GDDDG",
                    "GDDDG",
                    "CVCVC")
            .aisle(
                    "CCCCC",
                    "GDDDG",
                    "GD DG",
                    "GDDDG",
                    "CCCCC")
            .aisle(
                    "CVCVC",
                    "GDDDG",
                    "GDDDG",
                    "GDDDG",
                    "CVCVC")
            .aisle(
                    "CCSCC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    "CCCCC")
            .where('S', controller.self())
            .where('G', <blockstate:gregtech:transparent_casing>)
            .where('D', <metastate:chisel:diamond:3>)
            .where('V', <metastate:gregtech:multiblock_casing:2>)
            .where(' ', CTPredicate.getAny())
            .where("C", CTPredicate.states(<blockstate:contenttweaker:microverse_casing>) | controller.autoAbilities(true, true, true, true, false, false, true))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("microverse_projector_advanced") // create a RecipeMap.
            .minInputs(2)
            .maxInputs(4)
            .minOutputs(1)
            .maxOutputs(16)
            //.setProgressBar(ROCKET_ARROW, MoveType.HORIZONTAL)
            .build())
    .withBaseTexture(<blockstate:contenttweaker:microverse_casing>) // Looking for existing renderers in CEu. but yeah, you can also use <metastate:gregtech:metal_casing:3> here
    .buildAndRegister();

microverse_projector_advanced.hasMufflerMechanics = true;
microverse_projector_advanced.hasMaintenanceMechanics = true;
//microverse_projector_advanced.frontOverlay = <cube_renderer:COMPRESSOR_OVERLAY>;

// Advanced Microverse Projector II
val microverse_projector_advanced_ii = Builder.start("mbt:microverse_projector_advanced_ii")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "         ",
                "         ",
                "  CCCCC  ",
                "  CVCVC  ",
                "  CCCCC  ",
                "  CVCVC  ",
                "  CCCCC  ",
                "         ",
                "         ")
            .aisle(
                "         ",
                "  CGGGC  ",
                " CDDDDDC ",
                " GDDDDDG ",
                " GDDDDDG ",
                " GDDDDDG ",
                " CDDDDDC ",
                "  CGGGC  ",
                "         ")
            .aisle(
                "  CCCCC  ",
                " CDDDDDC ",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                " CDDDDDC ",
                "  CCCCC  ")
            .aisle(
                "  CGGGC  ",
                " GDDDDDG ",
                "CDDDDDDDC",
                "GDD   DDG",
                "GDD   DDG",
                "GDD   DDG",
                "CDDDDDDDC",
                " GDDDDDG ",
                "  CGGGC  ").setRepeatable(3)
            .aisle(
                "  CCCCC  ",
                " CDDDDDC ",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                " CDDDDDC ",
                "  CCCCC  ")
            .aisle(
                "         ",
                "  CGGGC  ",
                " CDDDDDC ",
                " GDDDDDG ",
                " GDDDDDG ",
                " GDDDDDG ",
                " CDDDDDC ",
                "  CGGGC  ",
                "         ")
            .aisle(
                "         ",
                "         ",
                "  CCSCC  ",
                "  CGGGC  ",
                "  CGGGC  ",
                "  CGGGC  ",
                "  CCCCC  ",
                "         ",
                "         ")
            
            .where('S', controller.self())
            .where('G', <blockstate:gregtech:transparent_casing>)
            .where('V', <blockstate:gregtech:multiblock_casing>)
            .where(' ', CTPredicate.getAny())
            .where('D', <metastate:chisel:diamond:3>)
            .where("C", CTPredicate.states(<blockstate:contenttweaker:microverse_casing>) | controller.autoAbilities(true, true, true, true, false, false, true))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("microverse_projector_advanced_ii") // create a RecipeMap.
            .minInputs(2)
            .maxInputs(8)
            .minOutputs(1)
            .maxOutputs(16)
            //.setProgressBar(ROCKET_ARROW, MoveType.HORIZONTAL)
            .build())
    .withBaseTexture(<blockstate:contenttweaker:microverse_casing>) // Looking for existing renderers in CEu. but yeah, you can also use <metastate:gregtech:metal_casing:3> here
    .buildAndRegister();

microverse_projector_advanced_ii.hasMufflerMechanics = true;
microverse_projector_advanced_ii.hasMaintenanceMechanics = true;
//microverse_projector_advanced_ii.frontOverlay = <cube_renderer:COMPRESSOR_OVERLAY>;


// Naquadah Reactor 1
<gcym:large_multiblock_casing:9>.displayName = "Reaction-Safe Casing";
val naquadah_reactor_1 = Builder.start("naquadah_reactor_1")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GNG",
                "GNG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('G', <metastate:gregtech:transparent_casing:1>)
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('O', <metastate:extendedcrafting:trimmed:5>)
            .where('N', <metastate:gregtech:meta_block_compressed_8:1>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_1")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();
naquadah_reactor_1.hasMufflerMechanics = false;
naquadah_reactor_1.hasMaintenanceMechanics = false;
//naquadah_reactor_1.frontOverlay = <cube_renderer:CANNER_OVERLAY>;

naquadah_reactor_1.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return IRecipeLogic.standardOverclockingLogic(recipe.getEUt() * (negativeEU ? -1 : 1), recipelogic.maxVoltage, recipe.getDuration(), 1, 1, 0); // 1x duration, 1x voltage, 0 overclocks
} as IRunOverclockingLogicFunction;

<metaitem:multiblocktweaker:naquadah_reactor_1>.addTooltip(format.yellow("Produces exactly 3A ZPM, does not overclock"));

// Naquadah Reactor 2
val naquadah_reactor_2 = Builder.start("naquadah_reactor_2")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GNG",
                "GNG",
                "GNG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('G', <metastate:gregtech:transparent_casing:1>)
            .where('O', <metastate:extendedcrafting:storage:4>)
            .where('N', <metastate:gregtech:meta_block_compressed_2006:13>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_2")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();

naquadah_reactor_2.hasMufflerMechanics = false;
naquadah_reactor_2.hasMaintenanceMechanics = false;
//naquadah_reactor_2.frontOverlay = <cube_renderer:CANNER_OVERLAY>;

naquadah_reactor_2.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return IRecipeLogic.standardOverclockingLogic(recipe.getEUt() * (negativeEU ? -1 : 1), recipelogic.maxVoltage, recipe.getDuration(), 1, 1, 0); // 1x duration, 1x voltage, 0 overclocks
} as IRunOverclockingLogicFunction;

<metaitem:multiblocktweaker:naquadah_reactor_2>.addTooltip(format.yellow("Produces exactly 3A UV, does not overclock"));

// Actualization Chamber
val actualization_chamber = Builder.start("actualization_chamber")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC","GGG","CCC")
            .aisle("CCC","GOG","CCC")
            .aisle("CSC","GGG","CCC")
            .where('S', controller.self())
            .where('O', <metastate:gregtech:fusion_casing:1>)
            .where('G', <metastate:gregtech:transparent_casing:1>)
            .where('C', CTPredicate.states(<metastate:gregtech:fusion_casing:4>)
            | controller.autoAbilities(true, false, true, true, false, false, false)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("actualization_chamber")
            .minInputs(1)
            .maxInputs(2)
            .minOutputs(1)
            .maxOutputs(16)
            .build())
//    .withBaseTexture(<cube_renderer:FUSION_TEXTURE>)
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();

actualization_chamber.hasMufflerMechanics = false;
actualization_chamber.hasMaintenanceMechanics = false;
//actualization_chamber.frontOverlay = <cube_renderer:ENDER_FLUID_LINK>;

// Universal Crystallizer
val universal_crystallizer = Builder.start("universal_crystallizer")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start(RelativeDirection.FRONT, RelativeDirection.UP, RelativeDirection.LEFT)
            .aisle("AAAAAAA",
        "ABBCBBA",
        "ABCCCBA",
        "ACCCCCA",
        "ABCCCBA",
        "ABBCBBA",
        "AAAAAAA")
            .aisle("AAAAAAA",
        "B     B",
        "B  D  B",
        "B DDD B",
        "B  D  B",
        "B     B",
        "ABBBBBA")
            .aisle("AAAAAAA",
        "B EEE B",
        "B E E B",
        "B EFE B",
        "B E E B",
        "B EEE B",
        "ABBBBBA")
            .aisle("SAAAAAA",
        "B EEE B",
        "B     B",
        "B  G  B",
        "B     B",
        "B EEE B",
        "ABBBBBA")
            .aisle("AAAAAAA",
        "B EEE B",
        "B E E B",
        "B EFE B",
        "B E E B",
        "B EEE B",
        "ABBBBBA")
            .aisle("AAAAAAA",
        "B     B",
        "B  D  B",
        "B DDD B",
        "B  D  B",
        "B     B",
        "ABBBBBA")
            .aisle("AAAAAAA",
        "ABBCBBA",
        "ABCCCBA",
        "ACCCCCA",
        "ABCCCBA",
        "ABBCBBA",
        "AAAAAAA")
            .where('S', controller.self())
            .where(' ', CTPredicate.getAir())
            .where('C', <metastate:gregtech:meta_block_frame_0:9>)
            .where('B', <metastate:gregtech:transparent_casing:1>)
            .where('D', <metastate:gregtech:meta_block_compressed_2006:13>)
            .where('E', <metastate:gregtech:fusion_casing:1>)
            .where('F', <blockstate:draconicevolution:reactor_component>)
            .where('G', <blockstate:draconicevolution:reactor_core>)
            .where('A', CTPredicate.states(<metastate:gcym:large_multiblock_casing:10>).setMinGlobalLimited(80)
            | controller.autoAbilities(true, true, true, true, true, false, false)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("universal_crystallizer")
            .minInputs(1)
            .maxInputs(9)
            .minOutputs(1)
            .maxOutputs(1)
            .maxFluidInputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:10>)
    .buildAndRegister();

universal_crystallizer.hasMufflerMechanics = false;
universal_crystallizer.hasMaintenanceMechanics = true;
//universal_crystallizer.frontOverlay = <cube_renderer:CREATIVE_CONTAINER_OVERLAY>;

// multiblock controller recipes
recipes.addShaped("microverse_projector_basic", <metaitem:mbt:microverse_projector_basic>, [
    [<ore:circuitHv>, <contenttweaker:microverse_casing>, <ore:circuitHv>],
    [<contenttweaker:microverse_casing>, <metaitem:cover.screen>, <contenttweaker:microverse_casing>],
    [<ore:circuitHv>, <contenttweaker:microverse_casing>, <ore:circuitHv>]
]);

recipes.addShaped("microverse_projector_advanced", <metaitem:mbt:microverse_projector_advanced>, [
    [<ore:circuitEv>, <contenttweaker:microverse_casing>, <ore:circuitEv>],
    [<contenttweaker:microverse_casing>, <metaitem:cover.screen>, <contenttweaker:microverse_casing>],
    [<ore:circuitEv>, <contenttweaker:microverse_casing>, <ore:circuitEv>]
]);

recipes.addShaped("microverse_projector_advanced_ii", <metaitem:mbt:microverse_projector_advanced_ii>, [
    [<ore:circuitIv>, <contenttweaker:microverse_casing>, <ore:circuitIv>],
    [<contenttweaker:microverse_casing>, <metaitem:cover.screen>, <contenttweaker:microverse_casing>],
    [<ore:circuitIv>, <contenttweaker:microverse_casing>, <ore:circuitIv>]
]);


makeShaped("naquadah_reactor_1", <metaitem:multiblocktweaker:naquadah_reactor_1>,
    ["NCN",
     "GSG",
     "PPP"],
    { C : <ore:circuitIv>, //T5
      G : <gregtech:transparent_casing:1>,
      S : <metaitem:cover.screen>,
      P : <appliedenergistics2:spatial_pylon>,
      N : <extendedcrafting:material:33>}); //Omnium Nugget

makeShaped("naquadah_reactor_2", <metaitem:multiblocktweaker:naquadah_reactor_2>,
    ["NCN",
     "GSG",
     "PPP"],
    { C : <ore:circuitLuv>, //T6
      G : <gregtech:transparent_casing:1>,
      S : <metaitem:cover.screen>,
      P : <appliedenergistics2:spatial_pylon>,
      N : <extendedcrafting:material:32>}); //Omnium Ingot


makeExtremeRecipe5(<metaitem:multiblocktweaker:actualization_chamber>,
    ["PPPPP",
     "PEFSP",
     "PWGWP",
     "PSFEP",
     "PPPPP"],
    { G : <metaitem:field.generator.uv>,
      W : <ore:circuitUv>,
      P : <ore:plateAmericium>,
      E : <metaitem:emitter.uv>,
      S : <metaitem:sensor.uv>,
      F : <gregtech:fusion_casing:1> });

assembly_line.recipeBuilder()
    .inputs(<metaitem:gcym:large_autoclave> * 24, <packagedexcrafting:combination_crafter> * 24, <metaitem:emitter.uv> * 24, <metaitem:field.generator.uv> * 24, <ore:circuitUhv> * 64, <gregtech:wire_coil:7> * 64, <draconicevolution:reactor_component> * 24, <draconicevolution:crafting_injector:3> * 8, <moreplates:infinity_plate> * 3, <moreplates:infinity_plate> * 3, <moreplates:infinity_plate> * 3, <moreplates:infinity_plate> * 3)
    .fluidInputs(<liquid:cryotheum> * 36864, <liquid:moltenempowereddiamatine> * 18432, <liquid:naquadria> * 63216, <liquid:taranium> * 4608)
    .outputs(<metaitem:multiblocktweaker:universal_crystallizer>)
    .duration(900).EUt(7864320).buildAndRegister();

// multiblock recipemap recipes
// basic projector
// t1 ores
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(500)
    .EUt(500)
    .inputs(<contenttweaker:tieroneship>,
            <contenttweaker:quantumflux>,
            <minecraft:chest>)
    .fluidInputs(<liquid:rocket_fuel> * 8000)
    .outputs(<densemetals:dense_iron_ore> * 64,
             <gregtech:ore_cassiterite_0> * 64,
             <gregtech:ore_redstone_0> * 64,
             <gregtech:ore_nickel_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_molybdenum_0> * 64,
             <advancedrocketry:moonturf> * 64,
             <libvulpes:ore0> * 64,
             <gregtech:ore_salt_0> * 64)
    .buildAndRegister();


// t1 gems
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(500)
    .EUt(500)
    .inputs(<contenttweaker:tieroneship>,
            <contenttweaker:quantumflux>,
            <contenttweaker:gemsensor>)
    .fluidInputs(<liquid:rocket_fuel> * 8000)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <gregtech:ore_apatite_0> * 64,
             <gregtech:ore_tricalcium_phosphate_0> * 64,
             <gregtech:ore_quartzite_0> * 64)
    .buildAndRegister();


// t1 stellar creation data 1
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(100)
    .EUt(500)
    .inputs(<contenttweaker:tieroneship>,
            <contenttweaker:ultradensehydrogen>)
    .fluidInputs(<liquid:rocket_fuel> * 2000)
    .outputs(<contenttweaker:stellarcreationdata>)
    .buildAndRegister();


// st1 matter
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .notConsumable(<contenttweaker:tieroneship_stabilized>)
    .inputs(<minecraft:cobblestone>)
    .outputs(
        <contenttweaker:tieroneship_stabilized_matter>
    ).buildAndRegister();

// t2 radium + ores
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(600)
    .EUt(1000)
    .inputs(<contenttweaker:tiertwoship>,
            <contenttweaker:quantumflux> * 2)
    .fluidInputs(<liquid:rocket_fuel> * 12000)
    .outputs(<gregtech:ore_bauxite_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_tantalite_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
             <contenttweaker:radiumsalt> * 64,
             <contenttweaker:radiumsalt> * 64)
    .buildAndRegister();


// t2 stellar creation data
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(120)
    .EUt(1000)
    .inputs(<contenttweaker:tiertwoship>,
            <contenttweaker:ultradensehydrogen> * 4)
    .fluidInputs(<liquid:rocket_fuel> * 3000)
    .outputs(<contenttweaker:stellarcreationdata> * 4)
    .buildAndRegister();

// st2 matter
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tiertwoship_stabilized>)
    .outputs(
        <contenttweaker:tiertwoship_stabilized_matter>
    ).buildAndRegister();

// t3 gems
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<contenttweaker:tierthreeship>,
            <contenttweaker:quantumflux> * 4,
            <contenttweaker:gemsensor>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <metaitem:gemPerfectDiamond> * 32,
             <metaitem:gemPerfectRuby> * 64,
             <metaitem:gemPerfectTopaz> * 48,
             <metaitem:gemPerfectEmerald> * 32,
             <gregtech:ore_sapphire_0:1> * 64,
             <gregtech:ore_gold_0:1> * 64,
             <gregtech:ore_silver_0:1> * 64)
    .buildAndRegister();


// t3 ores
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<contenttweaker:tierthreeship>,
            <contenttweaker:quantumflux> * 4,
            <meta_tile_entity:super_chest.mv>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_ilmenite_0:1> * 64,
             <gregtech:ore_vanadium_magnetite_0:1> * 64,
             <gregtech:ore_tetrahedrite_0:1> * 64,
             <gregtech:ore_cassiterite_0:1> * 64,
             <gregtech:ore_tin_0:1> * 64,
             <gregtech:ore_redstone_0:1> * 64,
             <gregtech:ore_certus_quartz_0:1> * 64,
             <gregtech:ore_almandine_0:1> * 64,
             <gregtech:ore_lepidolite_0:1> * 64)
    .buildAndRegister();


// t3 magma
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<contenttweaker:tierthreeship>,
            <contenttweaker:quantumflux> * 4,
            <metaitem:super_chest.lv>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<contenttweaker:densemagma> * 64, <contenttweaker:densemagma> * 64)
    .buildAndRegister();

// st3 matter
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tierthreeship_stabilized>)
    .outputs(
        <contenttweaker:tierthreeship_stabilized_matter>
    ).buildAndRegister();

// advanced projector
// t4 oil and infinity
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourship>,
            <contenttweaker:quantumflux> * 8,
            <advancedrocketry:satelliteprimaryfunction:1>,
            <ore:dustPetrotheum> * 64)
    .outputs(<contenttweaker:denseoilshale> * 64,
             <contenttweaker:denseoilshale> * 64,
             <ore:compressed2xDustBedrock>.firstItem * 32)
    .buildAndRegister();


// t4 dense gem ores
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourship>,
            <contenttweaker:quantumflux> * 8,
            <contenttweaker:gemsensor>,
            <ore:dustPetrotheum> * 64) 
    .outputs(<densemetals:dense_lapis_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_coal_ore>  * 64,
             <densemetals:dense_emerald_ore> * 32,
             <densemetals:dense_redstone_ore> * 16)
    .buildAndRegister();



// t4 pgs ores
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourship>,
            <contenttweaker:quantumflux> * 8,
            <contenttweaker:witherrealmdata> * 4,
            <ore:dustPetrotheum> * 64) 
    .outputs(<gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_cooperite_0:1> * 64)
    .buildAndRegister();


// st4 matter
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tierfourship_stabilized>)
    .outputs(
        <contenttweaker:tierfourship_stabilized_matter>
    ).buildAndRegister();

// t4.5 ow mobs
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourandhalfship>,
            <contenttweaker:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <ore:treeSapling>)
    .outputs(<minecraft:skull> * 48,
             <minecraft:bone> * 64,
             <minecraft:bone> * 64,
             <minecraft:bone> * 64,
             <minecraft:skull:2> * 48,
             <minecraft:rotten_flesh> * 64,
             <minecraft:rotten_flesh> * 64,
             <minecraft:rotten_flesh> * 64,
             <minecraft:skull:4> * 48,
             <minecraft:gunpowder> * 64,
             <minecraft:slime> * 64,
             <armorplus:material:1> * 64)
    .buildAndRegister();


// t4.5 nether mobs
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1000)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourandhalfship>,
            <contenttweaker:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <minecraft:netherrack>)
    .outputs(<minecraft:blaze_rod> * 50,
             <minecraft:blaze_rod> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2052> * 50,
             <thermalfoundation:material:2052> * 50,
             <minecraft:ghast_tear> * 64,
             <minecraft:skull:1>* 48,
             <armorplus:material:2> * 64,
             <armorplus:material:2> * 64,
             <minecraft:magma_cream> * 64,
             <extrautils2:ingredients:10> * 4)
    .buildAndRegister();


// t4.5 end mobs
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1200)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourandhalfship>,
            <contenttweaker:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <minecraft:end_stone>)
    .outputs(<enderio:block_enderman_skull> * 48,
             <metaitem:blockEnderPearl> * 16,
             <minecraft:shulker_shell> * 64,
             <minecraft:shulker_shell> * 64,
             <darkutils:shulker_pearl> * 64)
    .buildAndRegister();



// t4.5 dragon
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(2000)
    .EUt(10000)
    .inputs(<contenttweaker:tierfourandhalfship>,
            <contenttweaker:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <minecraft:ender_eye> * 16)
    .outputs(<contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <minecraft:skull:5>)
    .buildAndRegister();


// t4.5 wither
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(2000)
    .EUt(10000)
    .inputs(<contenttweaker:tierfourandhalfship>,
            <contenttweaker:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <armorplus:material:2> * 64)
    .outputs(<contenttweaker:witherrealmdata> * 64,
             <contenttweaker:witherrealmdata> * 64,
             <metaitem:blockNetherStar> * 48)
    .buildAndRegister();


// st4.5 matter
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tierfourandhalfship_stabilized>)
    .outputs(
        <contenttweaker:tierfourandhalfship_stabilized_matter>
    ).buildAndRegister();

// t5 ores
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<contenttweaker:tierfiveship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizeduranium> * 32)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_palladium_0> * 64,
             <gregtech:ore_realgar_0> * 64,
             <gregtech:ore_bastnasite_0> * 64,
             <gregtech:ore_sphalerite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 6,
             <gregtech:ore_iridosmine_8020_0> * 6,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_fluorite_0> * 64)
    .buildAndRegister();


// t5 naquadah trinium
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<contenttweaker:tierfiveship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizedplutonium> * 32)
    .outputs(<gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_kaemanite_0> * 24)
    .buildAndRegister();


// st5 matter
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tierfiveship_stabilized>)
    .outputs(
        <contenttweaker:tierfiveship_stabilized_matter>
    ).buildAndRegister();

// t6 u/os/ir
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<contenttweaker:tiersixship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizeduranium> * 32,
            <contenttweaker:witherrealmdata> * 16)
    .outputs(<gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_iridosmine_8020_0> * 24)
    .buildAndRegister();


// t6 einsteinium
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<contenttweaker:tiersixship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizedplutonium> * 32,
            <contenttweaker:witherrealmdata> * 64)
    .outputs(<contenttweaker:stabilizedeinsteinium> * 32)
    .buildAndRegister();

// t6 eggs
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<contenttweaker:tiersixship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizedplutonium> * 32,
            <contenttweaker:dragonlairdata> * 16)
    .outputs(<minecraft:dragon_egg> * 32)
    .buildAndRegister();


// st6 matter
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tiersixship_stabilized>)
    .outputs(
        <contenttweaker:tiersixship_stabilized_matter>
    ).buildAndRegister();

// advanced projector 2
// t7 hearts
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(1500)
    .EUt(31250)
    .inputs(<contenttweaker:tiersevenship>,
            <contenttweaker:quantumflux> * 32,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:dragonlairdata> * 32)
    .outputs(<draconicevolution:dragon_heart> * 32,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_breath> * 64,
             <armorplus:material:3> * 64, 
             <armorplus:material:3> * 64,
             <armorplus:material:3> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <metaitem:blockSilver> * 64, //Silver block
             <metaitem:blockSilver> * 64, //Silver Block
             <minecraft:diamond_block> * 64,
             <minecraft:diamond_block> * 64,
             <metaitem:blockPlatinum> * 64, //Platinum Block
             <metaitem:blockRuthenium> * 16) 
    .buildAndRegister();


// t7 chaos lair data
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(1500)
    .EUt(31250)
    .inputs(<contenttweaker:tiersevenship>,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:gemsensor>,
            <contenttweaker:dragonlairdata> * 64,
            <contenttweaker:dragonlairdata> * 64,
            <contenttweaker:dragonlairdata> * 64,
            <contenttweaker:dragonlairdata> * 64)
    .outputs(<contenttweaker:lairofthechaosguardiandata>)
    .buildAndRegister();


// st7 matter
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tiersevenship_stabilized>)
    .outputs(
        <contenttweaker:tiersevenship_stabilized_matter>
    ).buildAndRegister();

// t8 gravistar nt
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(2000)
    .EUt(62500)
    .inputs(<contenttweaker:tiereightship>,
            <contenttweaker:quantumflux> * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:witherrealmdata> * 64,
            <contenttweaker:witherrealmdata> * 64)
    .outputs(<metaitem:quantumstar> * 32,
             <metaitem:quantumeye> * 64,
             <avaritia:resource:2> * 64,
             <avaritia:resource:2> * 64,
             <metaitem:gravistar>)
    .buildAndRegister();


// t8 shards eggs
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(1500)
    .EUt(62500)
    .inputs(<contenttweaker:tiereightship>,
            <contenttweaker:quantumflux> * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:lairofthechaosguardiandata>)
    .outputs(<draconicevolution:chaos_shard> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64)
    .buildAndRegister();


// st8 matter
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<contenttweaker:tiereightship_stabilized>)
    .outputs(
        <contenttweaker:tiereightship_stabilized_matter>
    ).buildAndRegister();

// t8.5 darmstadtite
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(9000)
    .EUt(250000)
    .inputs(<contenttweaker:tiereightandhalfship>,
            <metaitem:neutron_reflector> * 8,
            <metaitem:blockNaquadah> * 24,
            <draconicevolution:chaos_shard>)
    .outputs(
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64)
    .buildAndRegister();

// t8.5 dulysite
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(9000)
    .EUt(250000)
    .inputs(<contenttweaker:tiereightandhalfship>,
            <contenttweaker:gemsensor> * 8,
            <metaitem:blockNaquadah> * 24,
            <draconicevolution:chaos_shard>)
    .outputs(
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64)
    .buildAndRegister();

// t9 nt
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(3000)
    .EUt(250000)
    .inputs(<contenttweaker:tiernineship>,
            <metaitem:neutron_reflector> * 8,
            <metaitem:blockAwakenedDraconium> * 4,
            <contenttweaker:stellarcreationdata>)
    .outputs(<ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64)
    .buildAndRegister();

// t9 universe creation data
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(3000)
    .EUt(250000)
    .inputs(<contenttweaker:tiernineship>,
            <metaitem:blockAwakenedDraconium> * 4,
            <contenttweaker:stellarcreationdata> * 64,
            <contenttweaker:stellarcreationdata> * 64,
            <contenttweaker:stellarcreationdata> * 64,
            <contenttweaker:stellarcreationdata> * 64)
    .outputs(<contenttweaker:universecreationdata>)
    .buildAndRegister();

// t10 hotu
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(6000)
    .EUt(1000000)
    .inputs(<contenttweaker:tiertenship>,
            <contenttweaker:universecreationdata>,
            <ore:blockAwakenedDraconium> * 8)
    .outputs(<contenttweaker:heartofauniverse>)
    .buildAndRegister();


// actualization
// t1 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tieroneship_stabilized_matter>)
    .circuit(1)
    .outputs(<densemetals:dense_iron_ore> * 64,
             <gregtech:ore_cassiterite_0> * 64,
             <gregtech:ore_redstone_0> * 64,
             <gregtech:ore_nickel_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_molybdenum_0> * 64,
             <advancedrocketry:moonturf> * 64,
             <libvulpes:ore0> * 64,
             <gregtech:ore_salt_0> * 64)
    .buildAndRegister();

// t1 gems
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tieroneship_stabilized_matter>)
    .circuit(2)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <gregtech:ore_apatite_0> * 64,
             <gregtech:ore_tricalcium_phosphate_0> * 64,
             <gregtech:ore_quartzite_0> * 64)
    .buildAndRegister();

// t1 stellar data
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tieroneship_stabilized_matter>)
    .circuit(3)
    .outputs(<contenttweaker:stellarcreationdata>)
    .buildAndRegister();


// t2 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiertwoship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_bauxite_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_tantalite_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
             <contenttweaker:radiumsalt> * 64,
             <contenttweaker:radiumsalt> * 64)
    .buildAndRegister();


// t2 stellar creation data
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiertwoship_stabilized_matter>)
    .circuit(2)
    .outputs(<contenttweaker:stellarcreationdata> * 4)
    .buildAndRegister();


// t3 gems
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierthreeship_stabilized_matter>)
    .circuit(1)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <metaitem:gemPerfectDiamond> * 32,
             <metaitem:gemPerfectRuby> * 64,
             <metaitem:gemPerfectTopaz> * 48,
             <metaitem:gemPerfectEmerald> * 32,
             <gregtech:ore_sapphire_0:1> * 64,
             <gregtech:ore_gold_0:1> * 64,
             <gregtech:ore_silver_0:1> * 64)
    .buildAndRegister();

// t3 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierthreeship_stabilized_matter>)
    .circuit(2)
    .outputs(<gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_ilmenite_0:1> * 64,
             <gregtech:ore_vanadium_magnetite_0:1> * 64,
             <gregtech:ore_tetrahedrite_0:1> * 64,
             <gregtech:ore_cassiterite_0:1> * 64,
             <gregtech:ore_tin_0:1> * 64,
             <gregtech:ore_redstone_0:1> * 64,
             <gregtech:ore_certus_quartz_0:1> * 64,
             <gregtech:ore_almandine_0:1> * 64,
             <gregtech:ore_lepidolite_0:1> * 64)
    .buildAndRegister();

// t3 magma
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierthreeship_stabilized_matter>)
    .circuit(3)
    .outputs(<contenttweaker:densemagma> * 64, <contenttweaker:densemagma> * 64)
    .buildAndRegister();



// t4 oil and infinity
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourship_stabilized_matter>)
    .circuit(1)
    .outputs(<contenttweaker:denseoilshale> * 64,
             <contenttweaker:denseoilshale> * 64,
             <ore:compressed2xDustBedrock>.firstItem * 32)
    .buildAndRegister();

// t4 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourship_stabilized_matter>)
    .circuit(2)
    .outputs(<densemetals:dense_lapis_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_coal_ore>  * 64,
             <densemetals:dense_emerald_ore> * 32,
             <densemetals:dense_redstone_ore> * 16)
    .buildAndRegister();

// t4 pgs ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourship_stabilized_matter>)
    .circuit(3)
    .outputs(<gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_cooperite_0:1> * 64)
    .buildAndRegister();


// t4.5 ow mobs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(1)
    .outputs(<minecraft:skull> * 48,
             <minecraft:bone> * 64,
             <minecraft:bone> * 64,
             <minecraft:bone> * 64,
             <minecraft:skull:2> * 48,
             <minecraft:rotten_flesh> * 64,
             <minecraft:rotten_flesh> * 64,
             <minecraft:rotten_flesh> * 64,
             <minecraft:skull:4> * 48,
             <minecraft:gunpowder> * 64,
             <minecraft:slime> * 64,
             <armorplus:material:1> * 64)
    .buildAndRegister();

// t4.5 nether mobs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(2)
    .outputs(<minecraft:blaze_rod> * 50,
             <minecraft:blaze_rod> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2052> * 50,
             <thermalfoundation:material:2052> * 50,
             <minecraft:ghast_tear> * 64,
             <minecraft:skull:1>* 48,
             <armorplus:material:2> * 64,
             <armorplus:material:2> * 64,
             <minecraft:magma_cream> * 64,
             <extrautils2:ingredients:10> * 4)
    .buildAndRegister();

// t4.5 end mobs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(3)
    .outputs(<enderio:block_enderman_skull> * 48,
             <metaitem:blockEnderPearl> * 16,
             <minecraft:shulker_shell> * 64,
             <minecraft:shulker_shell> * 64,
             <darkutils:shulker_pearl> * 64)
    .buildAndRegister();

// t4.5 dragon
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(4)
    .outputs(<contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <minecraft:skull:5>)
    .buildAndRegister();

// t4.5 wither
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(5)
    .outputs(<contenttweaker:witherrealmdata> * 64,
             <contenttweaker:witherrealmdata> * 64,
             <metaitem:blockNetherStar> * 48)
    .buildAndRegister();


// t5 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfiveship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_palladium_0> * 64,
             <gregtech:ore_realgar_0> * 64,
             <gregtech:ore_bastnasite_0> * 64,
             <gregtech:ore_sphalerite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 6,
             <gregtech:ore_iridosmine_8020_0> * 6,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_fluorite_0> * 64)
    .buildAndRegister();

// t5 nq ke
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfiveship_stabilized_matter>)
    .circuit(2)
    .outputs(<gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_kaemanite_0> * 24)
    .buildAndRegister();


// t6 u/pgs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersixship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_iridosmine_8020_0> * 24)
    .buildAndRegister();

// t6 es
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersixship_stabilized_matter>)
    .circuit(2)
    .outputs(<contenttweaker:stabilizedeinsteinium> * 32)
    .buildAndRegister();

// t6 eggs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersixship_stabilized_matter>)
    .circuit(3)
    .outputs(<minecraft:dragon_egg> * 32)
    .buildAndRegister();


// t7 hearts
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersevenship_stabilized_matter>)
    .circuit(1)
    .outputs(<draconicevolution:dragon_heart> * 32,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_breath> * 64,
             <armorplus:material:3> * 64, 
             <armorplus:material:3> * 64,
             <armorplus:material:3> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <metaitem:blockSilver> * 64, //Silver block
             <metaitem:blockSilver> * 64, //Silver Block
             <minecraft:diamond_block> * 64,
             <minecraft:diamond_block> * 64,
             <metaitem:blockPlatinum> * 64, //Platinum Block
             <metaitem:blockRuthenium> * 16) 
    .buildAndRegister();

// t7 chaos
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersevenship_stabilized_matter>)
    .circuit(2)
    .outputs(<contenttweaker:lairofthechaosguardiandata>)
    .buildAndRegister();



// t8 nt
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiereightship_stabilized_matter>)
    .circuit(1)
    .outputs(<metaitem:quantumstar> * 32,
             <metaitem:quantumeye> * 64,
             <avaritia:resource:2> * 64,
             <avaritia:resource:2> * 64,
             <metaitem:gravistar>)
    .buildAndRegister();

// t8 eggs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiereightship_stabilized_matter>)
    .circuit(2)
    .outputs(<draconicevolution:chaos_shard> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64)
    .buildAndRegister();


// Naquadah Reactor Mk1 Recipes
naquadah_reactor_1.recipeMap
    .recipeBuilder()
    .duration(938)
    .EUt(-393216)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_1.recipeMap
    .recipeBuilder()
    .duration(3750)
    .EUt(-393216)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

// Naquadah Reactor Mk2 Recipes
naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(1875)
    .EUt(-1572864)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(7500)
    .EUt(-1572864)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

// Universal Crystallizer Recipes
universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustCarbon> * 64, <ore:dustCarbon> * 64, <ore:dustCarbon> * 64, <ore:dustCarbon> * 64, <ore:dustCarbon> * 64, <ore:dustCarbon> * 64, <ore:dustCarbon> * 64, <ore:dustCarbon> * 64)
    .outputs(<minecraft:diamond> * 32)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustIron> * 63)
    .outputs(<actuallyadditions:block_crystal_empowered:5> * 7)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustRedstone> * 63)
    .outputs(<actuallyadditions:block_crystal_empowered> * 7)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustLapis> * 63)
    .outputs(<actuallyadditions:block_crystal_empowered:1> * 7)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustCoal> * 63)
    .outputs(<actuallyadditions:block_crystal_empowered:3> * 7)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustDiamond> * 63)
    .outputs(<actuallyadditions:block_crystal_empowered:2> * 7)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:dustEmerald> * 63)
    .outputs(<actuallyadditions:block_crystal_empowered:4> * 7)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:gemPerfectDiamond> * 3, <minecraft:nether_star> * 9, <ore:plateDiamond> * 27, <ore:gemDiamond> * 27)
    .outputs(<metaitem:ingotCrystalMatrix>)
    .fluidInputs(<liquid:naquadah_enriched> * 3)
    .duration(3).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<actuallyadditions:block_crystal_empowered:4>, <metaitem:blockNetherStar> * 2, <draconicevolution:draconic_core> * 4, <armorplus:block_compressed_infused_lava_crystal> * 2)
    .outputs(<draconicevolution:wyvern_core>)
    .fluidInputs(<liquid:naquadah_enriched> * 30)
    .duration(30).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<minecraft:nether_star>, <draconicevolution:wyvern_core> * 4, <metaitem:blockAwakenedDraconium> * 2)
    .outputs(<draconicevolution:awakened_core>)
    .fluidInputs(<liquid:naquadah_enriched> * 30)
    .duration(30).EUt(23592960).buildAndRegister();

universal_crystallizer.recipeMap.recipeBuilder()
    .inputs(<ore:blockDraconium> * 5, <draconicevolution:wyvern_core> * 4, <draconicevolution:dragon_heart> * 2)
    .outputs(<metaitem:blockAwakenedDraconium> * 5)
    .fluidInputs(<liquid:naquadah_enriched> * 30)
    .duration(30).EUt(23592960).buildAndRegister();
