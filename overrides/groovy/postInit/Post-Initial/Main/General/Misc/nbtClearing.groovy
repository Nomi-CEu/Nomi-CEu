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
// Wooden Type Drawers


// Thermal Portable Tanks
nbtClearingRecipe(item('thermalexpansion:tank'), {
    transferSubTags(it, 'Creative', 'Level', 'RSControl')
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
