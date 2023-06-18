#loader contenttweaker
import mods.contenttweaker.VanillaFactory.createItem;
import mods.contenttweaker.IItemUse;
import mods.contenttweaker.MutableItemStack;
import mods.contenttweaker.World;
import mods.contenttweaker.Player;
import mods.contenttweaker.BlockPos;
import mods.contenttweaker.Hand;
import mods.contenttweaker.Facing;
import mods.contenttweaker.ActionResult;

import crafttweaker.util.Position3f;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.block.IBlockState;
import crafttweaker.block.IBlock;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;

function isFrameable(block as IBlockDefinition) as bool {
    if (isNull(block) || isNull(block.id)) return false; // how
    return block.id.startsWith("framedcompactdrawers")

        || block.id == "storagedrawers:customdrawers"
        || block.id == "storagedrawers:customtrim"

        || block.id == "storagedrawers:basicdrawers"
        || block.id == "storagedrawers:trim"

        || block.id == "storagedrawers:compdrawers"
        || block.id == "storagedrawers:controller"
        || block.id == "storagedrawers:controllerslave"

        || block.id.startsWith("gregtechdrawers");
}

function isReframing(block as IBlockDefinition) as bool {
    if (isNull(block) || isNull(block.id)) return false; // how
    return block.id.startsWith("framedcompactdrawers")
        || block.id == "storagedrawers:customdrawers"
        || block.id == "storagedrawers:customtrim";
}

function orElse(tag as IData, other as IData) as IData {
    return isNull(tag) ? other : tag;
}

function makeFramedState(state as IBlockState) as IBlockState {
    val id as string = state.block.definition.id;
    if id == "storagedrawers:trim" || id.startsWith("gregtechdrawers:trim") {
        return <block:storagedrawers:customtrim>.block.definition.defaultState;
    }
    // GT drawers only adds trims and drawers, so if it isn't a trim (checked above), its a drawer
    return (id == "storagedrawers:basicdrawers" || id.startsWith("gregtechdrawers") ? <block:storagedrawers:customdrawers> :
            id == "storagedrawers:compdrawers" ? <block:framedcompactdrawers:framed_compact_drawer> :
            id == "storagedrawers:controllerslave" ? <block:framedcompactdrawers:framed_slave> :
            <block:framedcompactdrawers:framed_drawer_controller>)
        .block.definition.getStateFromMeta(id == "storagedrawers:controller" ?
                                           state.meta - 2 :
                                           state.meta);
}

function overrideData(data as IData) as IData {
    if isNull(data) return data;

    if !isNull(data as IData[string]) {
        val dataMap = data as IData[string];
        val built as IData[string] = {};
        // because for some reason strings as maps convert to
        // a singleton map mapping themselves to themselves.
        val dataString = data as string;
        if (dataMap has dataString && dataMap[dataString] as string == dataString) {
            return 0 as IData;
        }
        for k, v in dataMap {
            built[k] = overrideData(v);
        }
        val ret as any[any] = built;
        return ret as IData;
    }

    if !isNull(data as [IData]) {
        var built = [] as IData;
        for v in data as [IData] {
            built += [overrideData(v)];
        }
        return built;
    }

    return "" as IData;
}

val hft = createItem("hand_framing_tool");
hft.maxStackSize = 1;
hft.onItemUse = function(player as Player,
                         world as World,
                         pos as BlockPos,
                         hand as Hand,
                         facing as Facing,
                         blockHit as Position3f) {
    val ctstate = world.getBlockState(pos);
    val definition as IBlockDefinition = ctstate.block.definition;
    if isFrameable(definition) {
        var state as IBlockState = definition.getStateFromMeta(ctstate.meta);
        var tag as IData = player.currentItem.tag;
        if (isNull(tag) || isNull(tag.MatS)) return ActionResult.fail();

        if !isReframing(definition) {
            state = makeFramedState(state);
        }

        val block as IBlock = world.getBlock(pos);
        var blockTag as IData = orElse(block.data, {}) + {
            "MatS": tag.MatS,
            "MatF": orElse(tag.MatF, ""),
            "MatT": orElse(tag.MatT, "")
        };

        world.setBlockState(definition.getStateFromMeta(ctstate.meta), overrideData(block.data), pos); // clear storage
        world.setBlockState(<block:minecraft:air>, pos); // ensure re-render
        world.setBlockState(state, blockTag, pos);
        player.setItemToSlot(hand == Hand.main() ?
                             IEntityEquipmentSlot.mainHand() :
                             IEntityEquipmentSlot.offhand(),
                             player.currentItem.withTag(tag));
        return ActionResult.success();
    }
    return ActionResult.pass();
} as IItemUse;
hft.register();
