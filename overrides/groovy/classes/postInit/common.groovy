package classes.postInit

import net.minecraft.item.ItemStack

class Common {
	/* Cached Values */
	private static ItemStack meP2p = null
	private static List<ItemStack> p2pVariants = null
	private static List<ItemStack> eioGlasses = null

	static ItemStack getMeP2p() {
		if (meP2p != null) return meP2p

		meP2p = item('appliedenergistics2:part', 460)
		return meP2p
	}
	// All P2P Variants, Excluding ME P2P
	static List<ItemStack> getP2pVariants() {
		if (p2pVariants != null) return p2pVariants

		p2pVariants = [
			item('appliedenergistics2:part', 461), // Redstone
			item('appliedenergistics2:part', 462), // Item
			item('appliedenergistics2:part', 463), // Fluid
			item('appliedenergistics2:part', 467), // Light
			item('appliedenergistics2:part', 469), // RF
			item('appliedenergistics2:part', 470), // EU
			item('nae2:part', 1), // Interface
		]
		return p2pVariants
	}
	static List<ItemStack> getEioGlasses() {
		if (eioGlasses != null) return eioGlasses

		eioGlasses = []
		for (var prefix in [null, 'holy', 'unholy', 'pasture', 'not_holy', 'not_unholy', 'not_pasture']) {
			if (prefix == null) {
				prefix = ''
			} else {
				prefix = "_$prefix"
			}
			eioGlasses.add(item("enderio:block${prefix}_fused_quartz"))
			eioGlasses.add(item("enderio:block${prefix}_fused_glass"))
			eioGlasses.add(item("enderio:block${prefix}_enlightened_fused_quartz"))
			eioGlasses.add(item("enderio:block${prefix}_enlightened_fused_glass"))
			eioGlasses.add(item("enderio:block${prefix}_dark_fused_quartz"))
			eioGlasses.add(item("enderio:block${prefix}_dark_fused_glass"))
		}
		return eioGlasses
	}
}
