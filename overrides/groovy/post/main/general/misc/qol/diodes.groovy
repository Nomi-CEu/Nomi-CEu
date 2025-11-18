package post.main.general.misc.qol

import static gregtech.api.GTValues.*
import static gregtech.loaders.recipe.CraftingComponent.*

import com.cleanroommc.groovyscript.api.IIngredient
import gregtech.api.items.metaitem.MetaItem
import gregtech.api.unification.stack.UnificationEntry
import gregtech.common.metatileentities.MetaTileEntities
import net.minecraft.item.ItemStack

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
        var hull = getIngredientFromGTComponent(HULL, tier)
        var plate = getIngredientFromGTComponent(PLATE, tier)
        var cable = getIngredientFromGTComponent(CABLE_QUAD, tier)
        var diode = MetaTileEntities.DIODES[tier].stackForm

        crafting.shapedBuilder()
            .output(diode)
            .matrix('CDC', 'DHD', 'PDP')
            .key('H', hull)
            .key('D', oreDict)
            .key('P', plate)
            .key('C', cable)
            .replace().register()
    }
}

IIngredient getIngredientFromGTComponent(Component comp, int tier) {
    Object ing = comp.getIngredient(tier)

    return switch (ing) {
        case MetaItem.MetaValueItem -> ((MetaItem.MetaValueItem) ing).stackForm as IIngredient
        case UnificationEntry -> ore(((UnificationEntry) ing).toString())
        case ItemStack -> ing as IIngredient
        default -> {
            log.error "[Diodes] Failed to cast class ${ing.class.name} to an IIngredient!"
        }
    }
}
