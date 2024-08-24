import com.nomiceu.nomilabs.util.LabsModeHelper
if (LabsModeHelper.normal) {
	crafting.addShaped(item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 12, 'lvl': (short) 1]]]), [
		[item('advancedrocketry:pressuretank'), item('gregtech:machine', 216), item('advancedrocketry:pressuretank')],
		[item('gregtech:meta_item_1', 144), item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 5, 'lvl': (short) 3]]]), item('gregtech:meta_item_1', 144)],
		[item('gregtech:fluid_pipe_small', 1012), item('gregtech:machine', 276), item('gregtech:fluid_pipe_small', 1012)]
	])
}

