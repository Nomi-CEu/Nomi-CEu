package post.main.general.misc

import static gregtech.api.GTValues.*

import post.classes.Common

import org.apache.commons.lang3.tuple.Pair
import com.google.common.base.Ascii
import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import net.minecraft.item.ItemStack

/**
 * Adds universal circuits to appropriate circuit oredicts; and adds recipes for universal circuits.
 */
List<Pair<Integer, String>> voltages = Common.getVoltageNames(ULV, UHV)
for (Pair<Integer, String> voltage : voltages) {
    String oreDictSuffix = "${Ascii.toUpperCase(voltage.value.charAt(0))}${voltage.value.substring(1)}"
    OreDictIngredient oreIng = ore("circuit${oreDictSuffix}")

    // Create a new oredict, not including universal
    OreDictIngredient nonUniversalIng = ore("circuitExclUniversal${oreDictSuffix}")
    nonUniversalIng.add(oreIng)

    // Add universal to main circuit oredict
    ItemStack universal = metaitem("nomilabs:universal_circuit.${voltage.value}")
    oreIng.add(universal)

    // Create recipe
    mods.gregtech.forming_press.recipeBuilder()
        .inputs(nonUniversalIng)
        .circuitMeta(1)
        .outputs(universal)
        .duration(10).EUt(VHA[Math.max(0, voltage.key - 1)])
        .buildAndRegister()
}
