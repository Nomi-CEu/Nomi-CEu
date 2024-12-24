import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.EnumDyeColor

// Steam Boilers
ore('questbookSteamSolidBoiler').add(item('gregtech:machine', 1))
ore('questbookSteamSolidBoiler').add(item('gregtech:machine', 2))

ore('questbookSteamSolarBoiler').add(item('gregtech:machine', 3))
ore('questbookSteamSolarBoiler').add(item('gregtech:machine', 4))

ore('questbookSteamLiquidBoiler').add(item('gregtech:machine', 5))
ore('questbookSteamLiquidBoiler').add(item('gregtech:machine', 6))

// Singleblock Miners
if (LabsModeHelper.expert)
	ore('questbookSingleMiner').add(metaitem('steam_miner'))

for (def tier : ['lv', 'mv', 'hv']) {
	ore('questbookSingleMiner').add(metaitem("miner.${tier}"))
}

// Chemical Dyes
for (def color : EnumDyeColor.values()) {
	ore('questbookChemicalDye').add(metaitem("dye.${color.getName()}"))
}
