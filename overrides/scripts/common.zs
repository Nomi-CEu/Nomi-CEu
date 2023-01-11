#priority 997
import mods.gregtech.material.Material;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemCondition;
import crafttweaker.data.IData;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.recipes.IRecipeAction;
global isBasic      as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 0 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isHardened   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 1 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isReinforced as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 2 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isSignalum   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 3 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isResonant   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Level: 4 as byte} as IData && !(stack.tag has {Creative: 1 as byte} as IData); };
global isCreative   as IItemCondition = function(stack as IItemStack) { return stack.tag has {Creative: 1 as byte, Level: 4 as byte} as IData; };

/* CofH Core Items - recipe ingredient defs */

// Portable tanks
global basictank      as IItemStack = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Level: 0 as byte}, false);
global hardenedtank   as IItemStack = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Level: 1 as byte}, false);
global reinforcedtank as IItemStack = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Level: 2 as byte}, false);
global signalumtank   as IItemStack = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Level: 3 as byte}, false);
global resonanttank   as IItemStack = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Level: 4 as byte}, false);

global basictankIng      as IIngredient = basictank.only(isBasic);
global hardenedtankIng   as IIngredient = hardenedtank.only(isHardened);
global reinforcedtankIng as IIngredient = reinforcedtank.only(isReinforced);
global signalumtankIng   as IIngredient = signalumtank.only(isSignalum);
global resonanttankIng   as IIngredient = resonanttank.only(isResonant);

// Energy Cells
global basiccell      as IItemStack = <thermalexpansion:cell>.withTag({Creative: 0 as byte, Level: 0 as byte}, false);
global hardenedcell   as IItemStack = <thermalexpansion:cell>.withTag({Creative: 0 as byte, Level: 1 as byte}, false);
global reinforcedcell as IItemStack = <thermalexpansion:cell>.withTag({Creative: 0 as byte, Level: 2 as byte}, false);
global signalumcell   as IItemStack = <thermalexpansion:cell>.withTag({Creative: 0 as byte, Level: 3 as byte}, false);
global resonantcell   as IItemStack = <thermalexpansion:cell>.withTag({Creative: 0 as byte, Level: 4 as byte}, false);

global basiccellIng      as IIngredient = basiccell.only(isBasic);
global hardenedcellIng   as IIngredient = hardenedcell.only(isHardened);
global reinforcedcellIng as IIngredient = reinforcedcell.only(isReinforced);
global signalumcellIng   as IIngredient = signalumcell.only(isSignalum);
global resonantcellIng   as IIngredient = resonantcell.only(isResonant);

// Compressed capacitors
global compressedoctadiccap       as IItemStack = <contenttweaker:compressedoctadiccapacitor>.withTag({display: {Name: "Compressed Octadic RF Capacitor", Lore: ["This is what is known as a Compressed Octadic Capacitor.", "Or, you could just call this an Octadic Capacitor Two.", "Can be inserted into EnderIO machines.", "Level: 4"]}, eiocap: {level: 4 as float}}, false);
global doublecompressedoctadiccap as IItemStack = <contenttweaker:doublecompressedoctadiccapacitor>.withTag({display: {Name: "Double Compressed Octadic RF Capacitor", Lore: ["AND THIS IS TO GO EVEN FURTHER BEYOND!", "Can be inserted into EnderIO machines.", "Level: 9.001", "Just kidding, it's only 5."]}, eiocap: {level: 5 as float}}, false);

// EIO Jetpacks
global conductiveironjetpack         as IItemStack = <simplyjetpacks:itemjetpack:1>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global electricalsteeljetpack        as IItemStack = <simplyjetpacks:itemjetpack:2>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global energeticjetpack              as IItemStack = <simplyjetpacks:itemjetpack:3>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global vibrantjetpack                as IItemStack = <simplyjetpacks:itemjetpack:4>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredconductiveironjetpack  as IItemStack = <simplyjetpacks:itemjetpack:5>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredelectricalsteeljetpack as IItemStack = <simplyjetpacks:itemjetpack:6>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredenergeticjetpack       as IItemStack = <simplyjetpacks:itemjetpack:7>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredvibrantjetpack         as IItemStack = <simplyjetpacks:itemjetpack:8>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global darksoulariumjetplate         as IItemStack = <simplyjetpacks:itemjetpack:9>.withTag({Energy: 0, JetpackParticleType: 0}, false);

// TE Jetpacks
global leadstonejetpack         as IItemStack  = <simplyjetpacks:itemjetpack:10>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global hardenedjetpack          as IItemStack  = <simplyjetpacks:itemjetpack:11>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global reinforcedjetpack        as IItemStack  = <simplyjetpacks:itemjetpack:12>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global resonantjetpack          as IItemStack  = <simplyjetpacks:itemjetpack:13>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredleadstonejetpack  as IItemStack  = <simplyjetpacks:itemjetpack:14>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredhardenedjetpack   as IItemStack  = <simplyjetpacks:itemjetpack:15>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredreinforcedjetpack as IItemStack  = <simplyjetpacks:itemjetpack:16>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global armoredresonantjetpack   as IItemStack  = <simplyjetpacks:itemjetpack:17>.withTag({Energy: 0, JetpackParticleType: 0}, false);
global fluxinfusedjetplate      as IItemStack  = <simplyjetpacks:itemjetpack:18>.withTag({Energy: 0, JetpackParticleType: 0}, false);



/*
 Converts a text representation of a crafting grid recipe into an array of
 ingredients.

 Example:
(3, [[null,null,null],
     [null,null,null],
     [null,null,null]], <minecraft:furnace>, ["AAA",
                                              "A A",
                                              "AAA"], { A : <minecraft:stone> })
 =>

[[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
 [<minecraft:stone>,        null,       <minecraft:stone>],
 [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]
*/
function textToIngredients(ingredients as IIngredient[][],
                           output as IItemStack,
                           recipe as string[],
                           replacements as IIngredient[string]) as IIngredient[][] {

    for i, str in recipe {
        for j in 0 .. str.length {
            var item = str[j];
            if " " != item { // blanks are nulls, ignore them
                ingredients[i][j] = replacements[item];
            }
        }
    }

    return ingredients;
}

/* Same as above, but for standard 3x3 shapeless recipes. */
function makeShapeless3FA(name as string,
                          output as IItemStack,
                          recipe as string[],
                          replacements as IIngredient[string],
                          recipeFunction as IRecipeFunction,
                          recipeAction as IRecipeAction) {

    var ingredients = [null,null,null,
                       null,null,null,
                       null,null,null] as IIngredient[];

    for i, str in recipe {
        for j in 0 .. str.length {
            var item = str[j];
            if " " != item { // blanks are nulls, ignore them
                ingredients[str.length*i+j] = replacements[item];
            }
        }
    }

    recipes.addShapeless(name, output, ingredients, recipeFunction, recipeAction);
}

// Support varying arities so RecipeFunction/Action may be optionally used
function makeShapeless3F(name as string,
                         output as IItemStack,
                         recipe as string[],
                         replacements as IIngredient[string],
                         recipeFunction as IRecipeFunction) {
    makeShapeless3FA(name, output, recipe, replacements, recipeFunction, null);
}

function makeShapeless3(name as string,
                        output as IItemStack,
                        recipe as string[],
                        replacements as IIngredient[string]) {
    makeShapeless3F(name, output, recipe, replacements, null);
}

/* 3x3 shapeless compacting recipe. */
function makeCompacting3(name as string,
                         output as IItemStack,
                         input as IIngredient) {
    recipes.addShapeless(name, output,
        [input,input,input,
         input,input,input,
         input,input,input] as IIngredient[]);
}

function makeShapedFA(name as string,
                      output as IItemStack,
                      recipe as string[],
                      replacements as IIngredient[string],
                      recipeFunction as IRecipeFunction,
                      recipeAction as IRecipeAction) {

    var ingredients =
        [[null,null,null],
         [null,null,null],
         [null,null,null]] as IIngredient[][];

    recipes.addShaped(name, output,
        textToIngredients(ingredients, output, recipe, replacements),
        recipeFunction, recipeAction);
}

// Support varying arities so RecipeFunction/Action may be optionally used
function makeShapedF(name as string,
                     output as IItemStack,
                     recipe as string[],
                     replacements as IIngredient[string],
                     recipeFunction as IRecipeFunction) {
    makeShapedFA(name, output, recipe, replacements, recipeFunction, null);
}

function makeShaped(name as string,
                    output as IItemStack,
                    recipe as string[],
                    replacements as IIngredient[string]) {
    makeShapedF(name, output, recipe, replacements, null);
}

function makeExtremeRecipe5(output as IItemStack,
                            recipe as string[],
                            replacements as IIngredient[string]) {

    var ingredients =
        [[null,null,null,null,null],
         [null,null,null,null,null],
         [null,null,null,null,null],
         [null,null,null,null,null],
         [null,null,null,null,null]] as IIngredient[][];

    mods.extendedcrafting.TableCrafting.addShaped(output,
        textToIngredients(ingredients, output, recipe, replacements));
}

function makeExtremeRecipe7(output as IItemStack,
                            recipe as string[],
                            replacements as IIngredient[string]) {

    var ingredients =
        [[null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null]] as IIngredient[][];

    mods.extendedcrafting.TableCrafting.addShaped(output,
        textToIngredients(ingredients, output, recipe, replacements));
}

function makeExtremeRecipe9(output as IItemStack,
                            recipe as string[],
                            replacements as IIngredient[string]) {

    var ingredients =
        [[null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null],
         [null,null,null,null,null,null,null,null,null]] as IIngredient[][];

    mods.extendedcrafting.TableCrafting.addShaped(output,
        textToIngredients(ingredients, output, recipe, replacements));
}

function removeMaterialSolid(materialId as int) {
    val materialParts as string[] = [
        "meta_dust",
        "meta_dust_small",
        "meta_dust_tiny",
        "meta_dust_impure",
        "meta_dust_pure",
        "meta_crushed",
        "meta_crushed_purified",
        "meta_crushed_centrifuged",
        "meta_gem",
        "meta_gem_flawless",
        "meta_gem_exquisite",
        "meta_ingot",
        "meta_ingot_hot",
        "meta_plate",
        "meta_plate_double",
        "meta_plate_dense",
        "meta_foil",
        "meta_stick",
        "meta_stick_long",
        "meta_bolt",
        "meta_screw",
        "meta_ring",
        "meta_nugget",
        "meta_spring",
        "meta_spring_small",
        "meta_gear",
        "meta_gear_small",
        "meta_wire_fine",
        "meta_rotor",
        "meta_lens",
        "meta_turbine_blade"
    ];
    val materialWireCableParts as string[] = [
        "wire_single",
        "wire_double",
        "wire_quadruple",
        "wire_octal",
        "wire_hex",
        "cable_single",
        "cable_double",
        "cable_quadruple",
        "cable_octal",
        "cable_hex",
    ];
    val materialFluidPipeParts as string[] = [
        "fluid_pipe_tiny",
        "fluid_pipe_small",
        "fluid_pipe_normal",
        "fluid_pipe_large",
        "fluid_pipe_huge",
        "fluid_pipe_quadruple",
        "fluid_pipe_nonuple",
    ];
    val materialItemPipeParts as string[] = [
        "item_pipe_tiny",
        "item_pipe_small",
        "item_pipe_normal",
        "item_pipe_large",
        "item_pipe_huge",
        "item_pipe_tiny_restrictive",
        "item_pipe_small_restrictive",
        "item_pipe_normal_restrictive",
        "item_pipe_large_restrictive",
        "item_pipe_huge_restrictive",
    ];
    for materialPart in materialParts {
        mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:" + materialPart, materialId));  
    }
//    mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:meta_block_compressed_" + (materialId / 16), (materialId % 16)));
}

function removeMaterialFluid(materialId as int, materialFluids as ILiquidStack[]) {
    val materialParts as string[] = [
        "meta_dust",
        "meta_dust_small",
        "meta_dust_tiny",
        "meta_dust_impure",
        "meta_dust_pure",
        "meta_crushed",
        "meta_crushed_purified",
        "meta_crushed_centrifuged",
        "meta_gem",
        "meta_gem_flawless",
        "meta_gem_exquisite",
        "meta_ingot",
        "meta_ingot_hot",
        "meta_plate",
        "meta_plate_double",
        "meta_plate_dense",
        "meta_foil",
        "meta_stick",
        "meta_stick_long",
        "meta_bolt",
        "meta_screw",
        "meta_ring",
        "meta_nugget",
        "meta_spring",
        "meta_spring_small",
        "meta_gear",
        "meta_gear_small",
        "meta_wire_fine",
        "meta_rotor",
        "meta_lens",
        "meta_turbine_blade"
    ];
    val materialWireCableParts as string[] = [
        "wire_single",
        "wire_double",
        "wire_quadruple",
        "wire_octal",
        "wire_hex",
        "cable_single",
        "cable_double",
        "cable_quadruple",
        "cable_octal",
        "cable_hex",
    ];
    val materialFluidPipeParts as string[] = [
        "fluid_pipe_tiny",
        "fluid_pipe_small",
        "fluid_pipe_normal",
        "fluid_pipe_large",
        "fluid_pipe_huge",
        "fluid_pipe_quadruple",
        "fluid_pipe_nonuple",
    ];
    val materialItemPipeParts as string[] = [
        "item_pipe_tiny",
        "item_pipe_small",
        "item_pipe_normal",
        "item_pipe_large",
        "item_pipe_huge",
        "item_pipe_tiny_restrictive",
        "item_pipe_small_restrictive",
        "item_pipe_normal_restrictive",
        "item_pipe_large_restrictive",
        "item_pipe_huge_restrictive",
    ];
    for materialPart in materialParts {
        mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:" + materialPart, materialId));  
    }
//    mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:meta_block_compressed_" + (materialId / 16), (materialId % 16)));
    for materialFluid in materialFluids {
        mods.jei.JEI.hide(materialFluid);
    }
}

function removeMaterial(material as Material, materialId as int, materialFluids as ILiquidStack[]) {
    val materialParts as string[] = [
        "meta_dust",
        "meta_dust_small",
        "meta_dust_tiny",
        "meta_dust_impure",
        "meta_dust_pure",
        "meta_crushed",
        "meta_crushed_purified",
        "meta_crushed_centrifuged",
        "meta_gem",
        "meta_gem_flawless",
        "meta_gem_exquisite",
        "meta_ingot",
        "meta_ingot_hot",
        "meta_plate",
        "meta_plate_double",
        "meta_plate_dense",
        "meta_foil",
        "meta_stick",
        "meta_stick_long",
        "meta_bolt",
        "meta_screw",
        "meta_ring",
        "meta_nugget",
        "meta_spring",
        "meta_spring_small",
        "meta_gear",
        "meta_gear_small",
        "meta_wire_fine",
        "meta_rotor",
        "meta_lens",
        "meta_turbine_blade"
    ];
    val materialWireCableParts as string[] = [
        "wire_single",
        "wire_double",
        "wire_quadruple",
        "wire_octal",
        "wire_hex",
        "cable_single",
        "cable_double",
        "cable_quadruple",
        "cable_octal",
        "cable_hex",
    ];
    val materialFluidPipeParts as string[] = [
        "fluid_pipe_tiny",
        "fluid_pipe_small",
        "fluid_pipe_normal",
        "fluid_pipe_large",
        "fluid_pipe_huge",
        "fluid_pipe_quadruple",
        "fluid_pipe_nonuple",
    ];
    val materialItemPipeParts as string[] = [
        "item_pipe_tiny",
        "item_pipe_small",
        "item_pipe_normal",
        "item_pipe_large",
        "item_pipe_huge",
        "item_pipe_tiny_restrictive",
        "item_pipe_small_restrictive",
        "item_pipe_normal_restrictive",
        "item_pipe_large_restrictive",
        "item_pipe_huge_restrictive",
    ];
    for materialPart in materialParts {
        mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:" + materialPart, materialId));  
    }
    if material.hasWires() {
        for materialWireCablePart in materialWireCableParts {
            mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:" + materialWireCablePart, materialId));  
        }
    }
    if material.hasFluidPipes() {
        for materialFluidPipePart in materialFluidPipeParts {
            mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:" + materialFluidPipePart, materialId));  
        }
    }
    if material.hasItemPipes() {
        for materialItemPipePart in materialItemPipeParts {
            mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:" + materialItemPipePart, materialId));  
        }
    }
    mods.jei.JEI.removeAndHide(itemUtils.getItem("gregtech:meta_block_compressed_" + (materialId / 16), (materialId % 16)));
    for materialFluid in materialFluids {
        mods.jei.JEI.hide(materialFluid);
        mods.jei.JEI.removeAndHide(<forge:bucketfilled>.withTag({FluidName: materialFluid.name, Amount: 1000}));
    }
}

function absolute_int(n as int) as int {
    var MINUS_ONE = -1 as int;
    if (n < 0) {
        return n * MINUS_ONE;
    } else {
        return n;
    } 
}

