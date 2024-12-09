import net.minecraft.item.EnumDyeColor
import net.minecraft.item.ItemStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.NBTClearingRecipeHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TooltipHelpers.*
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.*
import static com.nomiceu.nomilabs.groovy.NBTClearingRecipe.CAN_CLEAR_TOOLTIP
import static com.nomiceu.nomilabs.groovy.NBTClearingRecipe.WARNING_TOOLTIP
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
    nbtClearingRecipe(item('nuclearcraft:cooler', meta), item('nuclearcraft:cooler'),
            translatable('nomiceu.tooltip.nc.nbt_clearing.cooler.can_clear'),
            translatable('nomiceu.tooltip.nc.nbt_clearing.cooler.warning'))
}

// Bronze Cell
nbtClearingRecipe(metaitem('nomilabs:bronze_cell'))

/* Drawers */
// Add empty can clear tooltip, as we want to add multiple lines
var empty = translatableEmpty()
List<ItemStack> canClearDrawers = []

// Wooden Type Drawers
for (def meta : 0..4) {
    nbtClearingRecipe(item('storagedrawers:basicdrawers', meta), {
        var tag = transferSubTags(it, 'material')
        it.tagCompound = transferDrawerUpgradeData(it, tag)
    }, empty, WARNING_TOOLTIP)

    canClearDrawers.add(item('storagedrawers:basicdrawers', meta))
}

var normalClearer = { ItemStack it ->
    it.tagCompound = transferDrawerUpgradeData(it, null)
}

// GregTech Drawers
for (def meta : 0..4) {
    nbtClearingRecipe(item('gregtechdrawers:basicdrawers_gregtech_rubber_wood', meta), normalClearer,
            empty, WARNING_TOOLTIP)
    nbtClearingRecipe(item('gregtechdrawers:basicdrawers_gregtech_treated_wood', meta), normalClearer,
            empty, WARNING_TOOLTIP)

    canClearDrawers.add(item('gregtechdrawers:basicdrawers_gregtech_rubber_wood', meta))
    canClearDrawers.add(item('gregtechdrawers:basicdrawers_gregtech_treated_wood', meta))
}

// Compacting Drawers
nbtClearingRecipe(item('storagedrawers:compdrawers'), normalClearer, empty, WARNING_TOOLTIP)
canClearDrawers.add(item('storagedrawers:compdrawers'))

/* Framed Drawer Like */
def framedClearer = { ItemStack it ->
    var tag = transferSubTags(it, 'MatS', 'MatT', 'MatF')
    it.tagCompound = transferDrawerUpgradeData(it, tag)
}

// Framed Drawers
for (def meta : 0..4) {
    nbtClearingRecipe(item('storagedrawers:customdrawers', meta), framedClearer, empty, WARNING_TOOLTIP)
    canClearDrawers.add(item('storagedrawers:customdrawers', meta))
}

// Framed Compacting Drawers
nbtClearingRecipe(item('framedcompactdrawers:framed_compact_drawer'), framedClearer, empty, WARNING_TOOLTIP)
canClearDrawers.add(item('framedcompactdrawers:framed_compact_drawer'))

for (var canClear : canClearDrawers) {
    addTooltip(canClear, [translatable('nomiceu.tooltip.drawers.nbt_clearing.drawers.can_clear.1'),
                          translatable('nomiceu.tooltip.drawers.nbt_clearing.drawers.can_clear.2')])
}

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

// Cells

// Bronze Cell does not need tooltip added, its recipe is added above

// Special Cells
clearableContainers.add(metaitem('fluid_cell'))
clearableContainers.add(metaitem('fluid_cell.universal'))

// Material Cells
for (def material : ["steel", "aluminium", "stainless_steel", "titanium", "tungstensteel"]) {
	clearableContainers.add(metaitem("large_fluid_cell.${material}"))
}

// EIO Tanks
// Technically Machines Too... but Not As Useful
clearableContainers.add(item('enderio:block_tank'))
clearableContainers.add(item('enderio:block_tank', 1))

for (def container : clearableContainers) {
    addTooltip(container, CAN_CLEAR_TOOLTIP)
}
