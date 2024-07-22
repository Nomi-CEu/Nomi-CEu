package classes.postInit

import net.minecraft.item.ItemStack

class EioPrefixes {
	public static List<String> prefixes = [null, 'holy', 'unholy', 'pasture', 'not_holy', 'not_unholy', 'not_pasture']
	public static List<ItemStack> allItems

	static List<ItemStack> getAllItems() {
		if (allItems) return allItems

		allItems = []
		for (var prefix in prefixes) {
			if (prefix == null) {
				prefix = ''
			} else {
				prefix = "_$prefix"
			}
			allItems.add(item("enderio:block${prefix}_fused_quartz"))
			allItems.add(item("enderio:block${prefix}_fused_glass"))
			allItems.add(item("enderio:block${prefix}_enlightened_fused_quartz"))
			allItems.add(item("enderio:block${prefix}_enlightened_fused_glass"))
			allItems.add(item("enderio:block${prefix}_dark_fused_quartz"))
			allItems.add(item("enderio:block${prefix}_dark_fused_glass"))
		}
		return allItems
	}
}
