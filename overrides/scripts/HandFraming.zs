import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.item.ITooltipFunction;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.data.IData;
import crafttweaker.formatting.IFormattedText;
import mods.jei.JEI;

val framingMaterial as IIngredient = <*>.only(function(stack as IItemStack) as bool {
    if(!stack.isItemBlock) {
        return false;
    }
    return stack.asBlock().definition.getStateFromMeta(stack.metadata).opaqueCube;
});

val sideIngredient = (<xtones:zane> | framingMaterial).marked("MatS");
val trimIngredient = (<extendedcrafting:storage:4> | framingMaterial).marked("MatT");
val frontIngredient = (<xtones:zane:15> | framingMaterial).marked("MatF");

<ore:handFramedThree>.add(<storagedrawers:customdrawers:*>,
                          <framedcompactdrawers:framed_drawer_controller>,
                          <framedcompactdrawers:framed_compact_drawer>,
                          <framedcompactdrawers:framed_slave>,
                          <contenttweaker:hand_framing_tool>);

<ore:handFramed>.addAll(<ore:handFramedThree>);
<ore:handFramed>.add(<storagedrawers:customtrim>);

function addInfo(stack as IItemStack) as IItemStack {
    return stack.withDisplayName("Frame your drawers by hand!")
        .withLore([
            "Top left: sides",
            "Top right: trim",
            "Middle left: front"
        ]);
}

function asData(stack as IItemStack) as IData {
    return {
        id: stack.definition.id,
        Count: 1 as byte,
        Damage: stack.metadata
    } as IData;
}

static matKeys as string[] = [
    "MatS",
    "MatF",
    "MatT",
] as string[];

function getRecipeOutput(out as IItemStack,
                         ins as IItemStack[string],
                         cInfo as ICraftingInfo) as IItemStack
{
    val fromTag as IData[string] =
        isNull(ins.drawer.tag) ?
        {} as IData[string] :
        ins.drawer.tag.asMap();

    val tag = {} as IData[string];
    for key, value in fromTag {
        if !(matKeys has key) {
            // it's not enough to just transfer the data as-is:
            // taped drawers preserve the block's framing rather
            // than taking on the new frame, so replace that too.
            if (key == "tile") {
                val tileTag = {} as IData[string];
                for tileKey, tileVal in value.asMap() {
                    if !(matKeys has tileKey) {
                        tileTag[tileKey] = tileVal;
                    }
                }
                for matKey in matKeys {
                    if (ins has matKey) {
                        tileTag[matKey] = asData(ins[matKey]);
                    }
                }
                val tileData as any[any] = tileTag;
                tag[key] = tileData as IData;
            } else {
                tag[key] = value;
            }
        }
    }
    for key in matKeys {
        if (ins has key) {
            tag[key] = asData(ins[key]);
        }
    }

    val ret as any[any] = tag;
    return ins.drawer.withTag(ret as IData) * 1;
}

val recipeFunction = function(out, ins, cinfo) { return getRecipeOutput(out, ins, cinfo); } as IRecipeFunction;

for front in [true, false] as bool[] {
    for trim in [true, false] as bool[] {
        val ingredients as IIngredient[][] = [
            [
                sideIngredient,
                trim ? trimIngredient : null
            ],
            [
                front ? frontIngredient : null,
                (front ? <ore:handFramedThree> : <ore:handFramed>).marked("drawer")
            ]
        ];

        val ins as IItemStack[string] = {
            MatS: sideIngredient.items[0],
            drawer: <framedcompactdrawers:framed_compact_drawer>
        };

        if (front) {
            ins["MatF"] = frontIngredient.items[0];
        }

        if (trim) {
            ins["MatT"] = trimIngredient.items[0];
        }

        recipes.addShaped(
            "hand_framing_" + (trim ? "trim_" : "") + (front ? "front_" : "") + "side",
            addInfo(getRecipeOutput(null, ins, null)),
            ingredients,
            recipeFunction
        );
    }
}

function getNested(inTag as IData, keys as string[], alt as IData) as IData {
    var tag = inTag;
    for key in keys {
        if isNull(tag) return alt;
        tag = tag.memberGet(key);
    }
    return isNull(tag) ? alt : tag;
}

function makeTagFunc(name as string) as ITooltipFunction {
    val matTag = "Mat" + name[0];
    return function(stack as IItemStack) as string {
        val item as IItemStack =
            isNull(stack) ?
            null :
            itemUtils.getItem(getNested(stack.tag, [matTag, "id"], "-"),
                              getNested(stack.tag, [matTag, "Damage"], 0));
        return name + ": " + (isNull(item) ? "-" : item.displayName);
    } as ITooltipFunction;
}

<contenttweaker:hand_framing_tool>.addAdvancedTooltip(makeTagFunc("Side"));
<contenttweaker:hand_framing_tool>.addAdvancedTooltip(makeTagFunc("Front"));
<contenttweaker:hand_framing_tool>.addAdvancedTooltip(makeTagFunc("Trim"));

recipes.addShaped(
    "hand_framing_tool",
    <contenttweaker:hand_framing_tool>,
    [[null, null, <storagedrawers:framingtable>],
     [null, <ore:stickWood>, null],
     [<ore:stickWood>, null, null]]
);

JEI.addDescription(
    <contenttweaker:hand_framing_tool>,
    "item.contenttweaker.hand_framing_tool.desc1",
    "item.contenttweaker.hand_framing_tool.desc2",
    "item.contenttweaker.hand_framing_tool.desc3",
    "item.contenttweaker.hand_framing_tool.desc4",
    "item.contenttweaker.hand_framing_tool.desc5",
    "item.contenttweaker.hand_framing_tool.desc6"
);
