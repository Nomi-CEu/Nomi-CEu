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

