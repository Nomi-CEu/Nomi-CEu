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