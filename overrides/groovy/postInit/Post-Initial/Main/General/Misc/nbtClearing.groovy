import net.minecraft.item.EnumDyeColor
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.NBTClearingRecipeHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TooltipHelpers.*
import static com.nomiceu.nomilabs.groovy.NBTClearingRecipe.CAN_CLEAR_TOOLTIP
import static gregtech.common.metatileentities.MetaTileEntities.*

// NBT Clearing Recipes
nbtClearingRecipe(item('minecraft:water_bucket'), item('minecraft:bucket'))
nbtClearingRecipe(item('minecraft:lava_bucket'), item('minecraft:bucket'))
nbtClearingRecipe(item('forge:bucketfilled'), item('minecraft:bucket'))

// Shulker Boxes
for (def color : EnumDyeColor.values()) {
    nbtClearingRecipe(item("minecraft:${color.name}_shulker_box"))
}

// GT Crates
for (def material : ["wood", "bronze", "steel", "aluminium", "stainless_steel", "titanium", "tungstensteel"]) {
    nbtClearingRecipe(metaitem("crate.${material}"))
}

// NC Coolers
for (def meta : 1..15) {
    nbtClearingRecipe(item('nuclearcraft:cooler', meta), item('nuclearcraft:cooler'))
}

/* Drawers */
/* Also voids upgrades, but if we didn't, it would look as if not nmpty */
// Wooden Type Drawers
for (def meta : 0..4) {
    nbtClearingRecipe(item('storagedrawers:basicdrawers', meta), {
        it.tagCompound = transferSubTags(it, 'material')
    })
}

// Compacting Drawers
nbtClearingRecipe(item('storagedrawers:compdrawers'))

/* Framed Drawer Like */
def framedClearer = { ItemStack it ->
    it.tagCompound = transferSubTags(it, 'MatS', 'MatT', 'MatF')
}

// Framed Drawers
for (def meta : 0..4) {
    nbtClearingRecipe(item('storagedrawers:customdrawers', meta), framedClearer)
}

// Framed Compacting Drawers
nbtClearingRecipe(item('framedcompactdrawers:framed_compact_drawer'), framedClearer)

// Thermal Portable Tanks
nbtClearingRecipe(item('thermalexpansion:tank'), {
    it.tagCompound = transferSubTags(it, 'Creative', 'Level', 'RSControl')
})

// Tooltips for Other Clearable Containers
List<ItemStack> clearableContainers = []

// Super/Quantum Chests & Tanks
clearableContainers.addAll(QUANTUM_CHEST.collect {it.getStackForm() })
clearableContainers.addAll(QUANTUM_TANK.collect {it.getStackForm() })

// Drums
for (def material : ["wood", "bronze", "steel", "aluminium", "stainless_steel", "titanium", "tungstensteel", "gold"]) {
    clearableContainers.add(metaitem("drum.${material}"))
}

// EIO Tanks
// Technically Machines Too... but Not As Useful
clearableContainers.add(item('enderio:block_tank'))
clearableContainers.add(item('enderio:block_tank', 1))

for (def container : clearableContainers) {
    addTooltip(container, CAN_CLEAR_TOOLTIP)
}
