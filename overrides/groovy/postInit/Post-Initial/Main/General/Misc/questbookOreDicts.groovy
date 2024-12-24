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

// Rock Breaker (Used in HM Only)
for (def type : ['bronze', 'steel'])
	ore('questbookRockBreaker').add(metaitem("steam_rock_breaker_${type}"))

for (def tier : ['lv', 'mv'])
	ore('questbookRockBreaker').add(metaitem("rock_breaker.${tier}"))


// Early Conveyors (for Manual Automation)
ore('questbookConveyor').add(metaitem('ulv_covers:conveyor.module.ulv'))
ore('questbookConveyor').add(metaitem('conveyor.module.lv'))

// Chemical Dyes
for (def color : EnumDyeColor.values()) {
	ore('questbookChemicalDye').add(metaitem("dye.${color.getName()}"))
}
