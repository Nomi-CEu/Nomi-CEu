import net.minecraft.item.EnumDyeColor

// Chemical Dyes
for (def color : EnumDyeColor.values()) {
	ore('questbookChemicalDye').add(metaitem('dye.' + color.getName()))
}

// Steam Boilers
ore('questbookSteamSolidBoiler').add(item('gregtech:machine', 1));
ore('questbookSteamSolidBoiler').add(item('gregtech:machine', 2));

ore('questbookSteamSolarBoiler').add(item('gregtech:machine', 3));
ore('questbookSteamSolarBoiler').add(item('gregtech:machine', 4));

ore('questbookSteamLiquidBoiler').add(item('gregtech:machine', 5));
ore('questbookSteamLiquidBoiler').add(item('gregtech:machine', 6));
