package post.classes

import com.google.common.base.Ascii
import gregtech.api.GTValues
import net.minecraft.item.ItemStack
import org.apache.commons.lang3.tuple.Pair

/**
 * Class containing various util functions used across scripts.
 */
class Common {

    /* Cached Values */
    private static List<Pair<String, ItemStack>> p2pVariantsCache = null
    private static List<ItemStack> eioGlassesCache = null
    private static List<Pair<Integer, String>> voltageNamesCache = null

    /**
     * Takes an array of strings, and concatenates them by camel case.
     */
    static String combineCamelCase(String... strings) {
        StringBuilder builder = new StringBuilder()

        if (strings.length <= 0) return ""
        if (strings.length == 1) return strings[0]

        builder.append(strings[0])
        for (int i = 1; i < strings.length; i++) {
            builder.append(Ascii.toUpperCase(strings[i].charAt(0)))
            builder.append(strings[i].substring(1))
        }

        return builder.toString()
    }

    /**
     * Gets a continuous sublist of GregTech tier to voltage names, in lowercase.<br>
     * <b>Do not modify the returned list!</b>
     * @param from The start index of the sublist. Inclusive.
     * @param to The end index of the sublist. Inclusive.
     */
    static List<Pair<Integer, String>> getVoltageNames(int from, int to) {
        if (voltageNamesCache == null) {
            voltageNamesCache = []
            for (int i = 0; i < GTValues.VN.length; i++) {
                voltageNamesCache.add(Pair.of(i, GTValues.VN[i].toLowerCase(Locale.ENGLISH)))
            }
        }

        return voltageNamesCache.subList(from, to + 1)
    }

    // All P2P Variants, Excluding ME P2P
    static List<Pair<String, ItemStack>> getP2pVariants() {
        if (p2pVariantsCache != null) return p2pVariantsCache

        p2pVariantsCache = [
            Pair.of('Redstone', item('appliedenergistics2:part', 461)),
            Pair.of('Item', item('appliedenergistics2:part', 462)),
            Pair.of('Fluid', item('appliedenergistics2:part', 463)),
            Pair.of('Light', item('appliedenergistics2:part', 467)),
            Pair.of('RF', item('appliedenergistics2:part', 469)),
            Pair.of('EU', item('appliedenergistics2:part', 470)),
            Pair.of('Interface', item('nae2:part', 1)),
        ]
        return p2pVariantsCache
    }

    static List<ItemStack> getEioGlasses() {
        if (eioGlassesCache != null) return eioGlassesCache

        eioGlassesCache = []

        var prefixes = ['holy', 'unholy', 'pasture', 'not_holy', 'not_unholy', 'not_pasture']
            .collect { prefix -> "block_${prefix}".toString() }
        prefixes.add('block')

        var suffixes = ['fused', 'enlightened_fused', 'dark_fused']
            .collectMany { suffix -> ["${suffix}_quartz", "${suffix}_glass"] }

        for (var prefix : prefixes) {
            for (var suffix : suffixes) {
                eioGlassesCache.add(item("enderio:${prefix}_${suffix}"))
            }
        }

        return eioGlassesCache
    }

}
