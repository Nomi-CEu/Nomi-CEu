package post.main.general.misc

import static post.classes.Common.*

import com.nomiceu.nomilabs.util.LabsModeHelper

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

for (var tier : ['lv', 'mv', 'hv']) {
    ore('questbookSingleMiner').add(metaitem("miner.${tier}"))
}

// Rock Breaker (Used in HM Only)
for (var type : ['bronze', 'steel']) {
    ore('questbookRockBreaker').add(metaitem("steam_rock_breaker_${type}"))
}

for (var tier : ['lv', 'mv']) {
    ore('questbookRockBreaker').add(metaitem("rock_breaker.${tier}"))
}

// Early Conveyors (for Manual Automation)
ore('questbookConveyor').add(metaitem('ulv_covers:conveyor.module.ulv'))
ore('questbookConveyor').add(metaitem('conveyor.module.lv'))

// Chemical Dyes
for (var color : colorInfo) {
    ore('questbookChemicalDye').add(metaitem("dye.${color.unlocalizedName}"))
}

// Fishers
for (var tier : ['lv', 'mv', 'hv', 'ev']) {
    ore('questbookFisher').add(metaitem("fisher.${tier}"))
}

// Spikes
ore('questbookSpike').add(item('extrautils2:spike_gold'))
ore('questbookSpike').add(item('extrautils2:spike_diamond'))

// Fission Casings
ore('questbookFissionCasings').add(item('nuclearcraft:fission_block'))
ore('questbookFissionCasings').add(item('nuclearcraft:reactor_casing_transparent'))
