package postInit.main.general.misc

import com.cleanroommc.groovyscript.api.IIngredient
import gregtech.api.items.metaitem.MetaItem
import gregtech.api.unification.OreDictUnifier
import gregtech.api.unification.ore.OrePrefix
import gregtech.api.unification.stack.UnificationEntry
import gregtech.common.metatileentities.MetaTileEntities
import net.minecraft.item.ItemStack

import static gregtech.loaders.recipe.CraftingComponent.*
import static gregtech.api.GTValues.*

ore('allDiodes').add(metaitem('component.diode'))
ore('allDiodes').add(metaitem('component.smd.diode'))
ore('allDiodes').add(metaitem('component.advanced_smd.diode'))

ore('smdDiodes').add(metaitem('component.smd.diode'))
ore('smdDiodes').add(metaitem('component.advanced_smd.diode'))

replaceRecipe(ULV, MV, ore('allDiodes'))
replaceRecipe(HV, IV, ore('smdDiodes'))

// Both Min Tier and Max Tier are inclusive
void replaceRecipe(int minTier, int maxTier, IIngredient oreDict) {
	for (int tier = minTier; tier <= maxTier; tier++) {
		def hull = getIngredientFromGTComponent(HULL, tier)
		def plate = getIngredientFromGTComponent(PLATE, tier)
		def cable = getIngredientFromGTComponent(CABLE_QUAD, tier)
		def diode = MetaTileEntities.DIODES[tier].getStackForm()

		crafting.shapedBuilder()
			.output(diode)
			.matrix("CDC", "DHD", "PDP")
			.key('H', hull)
			.key('D', oreDict)
			.key('P', plate)
			.key('C', cable)
			.replace().register()
	}
}

IIngredient getIngredientFromGTComponent(Component comp, int tier) {
	Object ing = comp.getIngredient(tier)
	if (ing instanceof MetaItem.MetaValueItem) {
		def meta = (MetaItem.MetaValueItem) ing
		return meta.getStackForm() as IIngredient
	}
	if (ing instanceof OrePrefix) {
		def prefix = (OrePrefix) ing
		return ore(prefix)
	}
	if (ing instanceof Enum) {
		def enumIng = (Enum) ing
		return item(enumIng.name())
	}
	if (ing instanceof UnificationEntry) {
		def entry = (UnificationEntry) ing
		return OreDictUnifier.get(entry) as IIngredient
	}
	if (ing instanceof ItemStack) return ing as IIngredient
}
