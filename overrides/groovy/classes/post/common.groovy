package classes.post

import gregtech.api.GTValues
import net.minecraft.item.ItemStack
import org.apache.commons.lang3.tuple.Pair

class Common {

    /* Cached Values */
    private static ItemStack meP2p = null
    private static List<Pair<String, ItemStack>> p2pVariants = null
    private static List<ItemStack> eioGlasses = null
    private static List<Pair<Integer, String>> voltageNames = null

    /**
     * Gets a continuous sublist of GregTech tier to voltage names, in lowercase.<br>
     * <b>Do not modify the returned list!</b>
     * @param from The start index of the sublist. Inclusive.
     * @param to The end index of the sublist. Inclusive.
     */
    static List<Pair<Integer, String>> getVoltageNames(int from, int to) {
        if (voltageNames == null) {
            voltageNames = []
            for (int i = 0; i < GTValues.VN.length; i++) {
                voltageNames.add(Pair.of(i, GTValues.VN[i].toLowerCase()))
            }
        }

        return voltageNames.subList(from, to + 1)
    }

    static ItemStack getMeP2p() {
        if (meP2p != null) return meP2p

        meP2p = item('appliedenergistics2:part', 460)
        return meP2p
    }
    // All P2P Variants, Excluding ME P2P
    static List<Pair<String, ItemStack>> getP2pVariants() {
        if (p2pVariants != null) return p2pVariants

        p2pVariants = [
            Pair.of('Redstone', item('appliedenergistics2:part', 461)),
            Pair.of('Item', item('appliedenergistics2:part', 462)),
            Pair.of('Fluid', item('appliedenergistics2:part', 463)),
            Pair.of('Light', item('appliedenergistics2:part', 467)),
            Pair.of('RF', item('appliedenergistics2:part', 469)),
            Pair.of('EU', item('appliedenergistics2:part', 470)),
            Pair.of('Interface', item('nae2:part', 1)),
        ]
        return p2pVariants
    }

    static List<ItemStack> getEioGlasses() {
        if (eioGlasses != null) return eioGlasses

        eioGlasses = []

        var prefixes = ['holy', 'unholy', 'pasture', 'not_holy', 'not_unholy', 'not_pasture']
            .collect { prefix -> "block_${prefix}".toString() }
        prefixes.add('block')

        var suffixes = ['fused', 'enlightened_fused', 'dark_fused']
            .collectMany { suffix -> ["${suffix}_quartz", "${suffix}_glass"] }

        for (var prefix : prefixes) {
            for (var suffix : suffixes) {
                eioGlasses.add(item("enderio:${prefix}_${suffix}"))
            }
        }

        return eioGlasses
    }

}
