package post.main.mod

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable
import static gregtech.api.GTValues.*

import com.cleanroommc.groovyscript.compat.vanilla.CraftingInfo
import com.cleanroommc.groovyscript.compat.vanilla.CraftingRecipe.InputList
import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.ItemStack
import net.minecraft.nbt.NBTTagCompound
import net.minecraftforge.common.util.Constants

/* Space Station ID Chip Copy Recipe */
var spaceStationChip = item('advancedrocketry:spacestationchip')
var exampleNbt = [ UUID : 1 ]

var sourceChip = spaceStationChip.copy()
    .withNbt(exampleNbt) // Example only
    .withNbtFilter { NBTTagCompound nbt ->
        // NBT handling: not empty, contains UUID
        !nbt.empty && nbt.hasKey('UUID', Constants.NBT.TAG_ANY_NUMERIC)
    }.mark('source')
    .reuse()

crafting.shapelessBuilder()
    .output(spaceStationChip.copy().withNbt(exampleNbt)) // Example only
    .input(sourceChip, spaceStationChip.copy().whenNoNbt())
    .recipeFunction { ItemStack output, InputList inputs, CraftingInfo info ->
        output.tagCompound = inputs.findMarkedOrEmpty('source').tagCompound.copy()
        return output
    }.setOutputTooltip(translatable('nomiceu.tooltip.advancedrocketry.copy_station_id_chips'))
    .register()

/* Airtight Seal Recipes */
// Industrial Rebreather Kit -> Airtight Seal
mods.enderio.enchanter.recipeBuilder()
    .enchantment(enchantment('advancedrocketry:spacebreathing'))
    .input(item('nomilabs:industrial_rebreather_kit'))
    .amountPerLevel(1)
    .xpCostMultiplier(3) // 27 Levels, 15 Lapis
    .register()

// Recipes for Industrial Rebreather Kit
if (LabsModeHelper.normal) {
    mods.gregtech.assembler.recipeBuilder()
        .inputs(
            ore('foilAluminium') * 32,
            metaitem('duct_tape') * 16,
            item('nomilabs:cloth') * 8,
            metaitem('carbon.mesh') * 4,
            metaitem('fluid.regulator.hv'),
            metaitem('gas_collector.mv'),
            item('advancedrocketry:pressuretank', 1), // Normal Pressure Tank
        ).fluidInputs(fluid('rubber') * 1296)
        .outputs(item('nomilabs:industrial_rebreather_kit'))
        .duration(500).EUt(VA[HV])
        .buildAndRegister()
} else {
    mods.extendedcrafting.table_crafting.shapedBuilder()
        .tierAdvanced()
        .output(item('nomilabs:industrial_rebreather_kit'))
        .matrix(
            'RMCMR',
            'TAZAT',
            'FDPDF',
            'TAYAT',
            'RXBXR',
        )
        .key('R', ore('ringStyreneButadieneRubber'))
        .key('M', metaitem('carbon.mesh'))
        .key('C', metaitem('gas_collector.mv'))
        .key('T', ore('plateDoubleTitanium'))
        .key('P', item('advancedrocketry:pressuretank', 1)) // Normal Pressure Tank
        .key('Z', metaitem('buffer.mv'))
        .key('F', metaitem('fluid.regulator.ev'))
        .key('A', metaitem('pipeSmallFluidPolytetrafluoroethylene'))
        .key('D', ore('dustQuicklime'))
        .key('Y', metaitem('super_tank.mv'))
        .key('B', metaitem('chemical_reactor.mv'))
        .key('X', metaitem('duct_tape'))
        .register()
}
