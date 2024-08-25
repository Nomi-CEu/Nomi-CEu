import com.nomiceu.nomilabs.util.LabsModeHelper
if (LabsModeHelper.normal) {
	crafting.addShaped(item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 12, 'lvl': (short) 1]]]), [
		[item('advancedrocketry:pressuretank'), item('gregtech:machine', 216), item('advancedrocketry:pressuretank')],
		[item('gregtech:meta_item_1', 144), item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 5, 'lvl': (short) 3]]]), item('gregtech:meta_item_1', 144)],
		[item('gregtech:fluid_pipe_small', 1012), item('gregtech:machine', 276), item('gregtech:fluid_pipe_small', 1012)]
	])
}
if (LabsModeHelper.normal) {
	mods.extendedcrafting.table_crafting.addShaped(2, item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 12, 'lvl': (short) 1]]]), [
		[item('gregtech:meta_ring', 1068), item('gregtech:meta_item_1', 500), item('gregtech:machine', 217), item('gregtech:meta_item_1', 500), item('gregtech:meta_ring', 1068)],	
		[item('gregtech:meta_foil', 113), item('advancedrocketry:pressuretank', 1), item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 36, 'lvl': (short) 4]]]), item('advancedrocketry:pressuretank', 1), item('gregtech:meta_foil', 113)],
		[item('gregtech:meta_item_1', 145), item('gregtech:fluid_pipe_small', 1016), item('gregtech:meta_dust', 360), item('gregtech:fluid_pipe_small', 1016), item('gregtech:meta_item_1', 145)],
		[item('gregtech:meta_foil', 113), item('advancedrocketry:pressuretank', 1), item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 5, 'lvl': (short) 3]]]), item('advancedrocketry:pressuretank', 1), item('gregtech:meta_foil', 113)],
		[item('gregtech:meta_ring', 1068), item('gregtech:meta_item_1', 500), item('gregtech:machine', 277), item('gregtech:meta_item_1', 500), item('gregtech:meta_ring', 1068)]
	])
}
