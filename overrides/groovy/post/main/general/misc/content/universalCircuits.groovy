package post.main.general.misc.content

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
    OreDictIngredient oreIng = ore(Common.combineCamelCase('circuit', voltage.value))

    // Create a new oredict, not including universal
    OreDictIngredient nonUniversalIng = ore(Common.combineCamelCase('circuitExclUniversal', voltage.value))
    nonUniversalIng.add(oreIng)

    // Add universal to main circuit oredict
    ItemStack universal = metaitem("nomilabs:universal_circuit.${voltage.value}")
    oreIng.add(universal)

    // Create recipe
    mods.gregtech.forming_press.recipeBuilder()
        .inputs(nonUniversalIng)
        .circuitMeta(1)
        .outputs(universal)
        .duration(10).EUt(VHA[ULV])
        .buildAndRegister()
}
