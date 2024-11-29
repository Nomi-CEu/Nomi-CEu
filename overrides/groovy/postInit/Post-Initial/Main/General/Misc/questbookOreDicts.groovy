import net.minecraft.item.EnumDyeColor

// Chemical Dyes
for (def color : EnumDyeColor.values()) {
	ore('questbookChemicalDye').add(metaitem('dye.' + color.getName()))
}
