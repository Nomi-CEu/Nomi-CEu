package post.classes

import com.cleanroommc.groovyscript.api.GroovyLog
import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import com.google.common.base.Ascii
import gregtech.api.GTValues
import gregtech.api.unification.material.MarkerMaterial
import gregtech.api.unification.material.MarkerMaterials
import net.minecraft.item.EnumDyeColor
import net.minecraft.item.ItemStack
import net.minecraft.item.crafting.Ingredient
import net.minecraft.nbt.NBTTagCompound
import net.minecraftforge.fml.common.registry.ForgeRegistries
import org.apache.commons.lang3.tuple.Pair

/**
 * Class containing various util functions used across scripts.
 */
class Common {

    /* Cached Values */
    private static List<Pair<String, ItemStack>> p2pVariantsCache = null
    private static List<ItemStack> eioGlassesCache = null
    private static List<Pair<Integer, String>> voltageNamesCache = null
    private static List<ColorInfo> colorInfoCache = null
    private static final Map<Ingredient, ItemStack[]> INGREDIENT_MATCHING_STACKS_CACHE = new IdentityHashMap<>()

    /**
     * The GroovyScript logger.
     * Use this instead of the global variable `log`, as that may be overrided by another import
     * e.g. OrePrefix log
     */
    public static final GroovyLog GRS_LOG = GroovyLog.get()

    /**
     * Takes an array of strings, and concatenates them by camel case.
     */
    static String combineCamelCase(String... strings) {
        StringBuilder builder = new StringBuilder()

        if (strings.length <= 0) return ''
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

    static List<ColorInfo> getColorInfo() {
        if (colorInfoCache != null) return colorInfoCache

        // We can't use marker materials' COLORS map, as it is broken for dark gray
        colorInfoCache = []
        var dyes = EnumDyeColor.values()

        for (int i = 0; i < dyes.length; i++) {
            var dye = dyes[i]
            var marker = MarkerMaterials.Color.VALUES[i]

            colorInfoCache.add(new ColorInfo(dye, i, marker))
        }

        return colorInfoCache
    }

    // groovylint-disable-next-line UnnecessaryGetter
    static ItemStack[] ingredientMatchingStacks(Ingredient ingredient) {
        var cachedStacks = INGREDIENT_MATCHING_STACKS_CACHE.get(ingredient)
        if (cachedStacks != null) return cachedStacks

        for (var item : ForgeRegistries.ITEMS) {
            for (int meta = 0; meta < 128; meta++) {
                var candidate = new ItemStack(item, 1, meta)
                if (candidate.empty) continue
                if (!ingredient.apply(candidate)) continue

                ItemStack[] resolvedStacks = [candidate.copy()] as ItemStack[]
                INGREDIENT_MATCHING_STACKS_CACHE.put(ingredient, resolvedStacks)
                return resolvedStacks
            }
        }

        ItemStack[] resolvedStacks = [] as ItemStack[]
        INGREDIENT_MATCHING_STACKS_CACHE.put(ingredient, resolvedStacks)
        return resolvedStacks
    }

    static boolean isNbtEmpty(NBTTagCompound nbt) {
        if (nbt == null) return true
        // groovylint-disable-next-line UnnecessaryGetter
        return nbt.isEmpty() as boolean
    }

    static boolean nbtHasNumericKey(NBTTagCompound nbt, String key) {
        if (nbt == null || isNbtEmpty(nbt)) return false

        return nbt.hasKey(key, net.minecraftforge.common.util.Constants.NBT.TAG_ANY_NUMERIC) as boolean
    }

    static void nbtSetInt(NBTTagCompound nbt, String key, int value) {
        nbt.setInteger(key, value)
    }

    static void nbtSetByte(NBTTagCompound nbt, String key, byte value) {
        nbt.setByte(key, value)
    }

    static byte nbtGetByte(NBTTagCompound nbt, String key) {
        return (nbt.getByte(key) ?: ((byte) 0)) as byte
    }

    static NBTTagCompound getTag(ItemStack stack) {
        // groovylint-disable-next-line UnnecessaryGetter
        return stack.getTagCompound() as NBTTagCompound
    }

    static NBTTagCompound getOrCreateTag(ItemStack stack) {
        var tag = getTag(stack)
        if (tag != null) return tag

        tag = new NBTTagCompound()
        setStackTag(stack, tag)
        return tag
    }

    static void setStackTag(ItemStack stack, NBTTagCompound tag) {
        // groovylint-disable-next-line UnnecessarySetter
        stack.setTagCompound(tag)
    }

    static NBTTagCompound copyTag(NBTTagCompound tag) {
        if (tag == null) return null
        return tag.copy() as NBTTagCompound
    }

}

class ColorInfo {

    // CAREFUL: this may not be what you expect
    // It matches (most) unlocalised items, but not ore dicts.
    // Light blue = light_blue NOT lightBlue
    // Light gray = silver NOT lightGray
    private final String unlocalizedName

    // Metadata of the relevant dye
    private final int metadata

    // Ore dict name of the dye
    private final String oreDictName

    ColorInfo(EnumDyeColor color, int metadata, MarkerMaterial marker) {
        unlocalizedName = color.name().toLowerCase(Locale.ENGLISH)
        this.metadata = metadata
        oreDictName = "dye${marker.toCamelCaseString()}".toString()
    }

    String getUnlocalizedName() {
        return unlocalizedName
    }

    int getMetadata() {
        return metadata
    }

    OreDictIngredient getOreDict() {
        return ore(oreDictName)
    }

}
