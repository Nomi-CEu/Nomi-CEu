import net.minecraftforge.event.entity.player.ItemTooltipEvent

// Hand Framing Tool
crafting.addShaped('hand_framing_tool', item('contenttweaker:hand_framing_tool'), [
        [null, null, item('storagedrawers:framingtable')],
        [null, item('minecraft:stick'), null],
        [item('minecraft:stick'), null, null]
]);


// Dummy Recipes for Hand Framing Tool
crafting.addShaped('hand_framing_trim_front_side', item('framedcompactdrawers:framed_compact_drawer').withNbt(["MatT": ["id": "extendedcrafting:storage", "Count": (byte) 1, "Damage": (short) 4], "MatF": ["id": "xtones:zane", "Count": (byte) 1, "Damage": (short) 15], "MatS": ["id": "xtones:zane", "Count": (byte) 1, "Damage": (short) 0]]), [
        [item('xtones:zane', 0), item('extendedcrafting:storage', 4), null],
        [item('xtones:zane', 15), item('contenttweaker:hand_framing_tool'), null],
        [null, null, null]
]);

crafting.addShaped('hand_framing_trim_side', item('framedcompactdrawers:framed_compact_drawer').withNbt(["MatT": ["id": "extendedcrafting:storage", "Count": (byte) 1, "Damage": (short) 4], "MatS": ["id": "xtones:zane", "Count": (byte) 1, "Damage": (short) 0]]), [
        [item('xtones:zane', 0), item('extendedcrafting:storage', 4), null],
        [null, item('contenttweaker:hand_framing_tool'), null],
        [null, null, null]
]);

crafting.addShaped('hand_framing_front_side', item('framedcompactdrawers:framed_compact_drawer').withNbt(["MatF": ["id": "xtones:zane", "Count": (byte) 1, "Damage": (short) 15], "MatS": ["id": "xtones:zane", "Count": (byte) 1, "Damage": (short) 0]]), [
        [item('xtones:zane', 0), null, null],
        [item('xtones:zane', 15), item('contenttweaker:hand_framing_tool'), null],
        [null, null, null]
]);

crafting.addShaped('hand_framing_side', item('framedcompactdrawers:framed_compact_drawer').withNbt(["MatS": ["id": "xtones:zane", "Count": (byte) 1, "Damage": (short) 0]]), [
        [item('xtones:zane', 0), null, null],
        [null, item('contenttweaker:hand_framing_tool'), null],
        [null, null, null]
]);

def loreItems = [
        item('storagedrawers:customdrawers'),
        item('storagedrawers:customdrawers', 1),
        item('storagedrawers:customdrawers', 2),
        item('storagedrawers:customdrawers', 3),
        item('storagedrawers:customdrawers', 4),
        item('storagedrawers:customtrim'),
        item('framedcompactdrawers:framed_compact_drawer'),
        item('framedcompactdrawers:framed_slave'),
        item('framedcompactdrawers:framed_drawer_controller')
]

def addLore(ItemTooltipEvent event) {
    event.getToolTip().add('\u00a75\u00a7oTop left: sides')
    event.getToolTip().add('\u00a75\u00a7oTop right: trim')
    event.getToolTip().add('\u00a75\u00a7oMiddle left: front')
}

event_manager.listen { ItemTooltipEvent event ->
    for (item in loreItems) {
        if (ItemStack.areItemsEqual(event.getItemStack(), item)) {
            addLore(event)
        }
    }
}
