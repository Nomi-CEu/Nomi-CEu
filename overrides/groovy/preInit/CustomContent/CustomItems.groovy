import net.minecraft.item.EnumRarity
import net.minecraft.item.ItemStack
import net.minecraft.init.MobEffects
import net.minecraft.potion.PotionEffect
import net.minecraft.potion.Potion
import net.minecraft.item.Item

import CommonFunctions as cf

println("[CustomItems.groovy] Start Creative Tab Init.")

/* Define HOAU first for use in creative tab logo */
def HOAU = content.createItem("heartofauniverse").setRarity(EnumRarity.EPIC).setMaxStackSize(1)

/* Define a Default Creative Tab */
def creativeTab = content.createCreativeTab("nomifactory.creative_tab", new ItemStack(HOAU))
content.setDefaultCreativeTab(creativeTab)

println("[CustomItems.groovy] End Creative Tab Init.")

println("[CustomItems.groovy] Start Custom Items Registration.")

/* --------------------------------- Custom Items ----------------------------------------- */

/* Register HOAU, in new creative tab */
HOAU.setCreativeTab(creativeTab).register()


/* Temporary Items (To be removed) */
cf.createItem("blazepowder")
cf.createItem("dark_red_coal")


/* Coins */
cf.createItem("omnicoin")
cf.createItem("omnicoin5", EnumRarity.UNCOMMON)
cf.createItem("omnicoin25", EnumRarity.RARE)
cf.createItem("omnicoin100", EnumRarity.EPIC)


/* Widgets */
cf.createItem("woodenwidget")
cf.createItem("woodwidgetleft")
cf.createItem("woodwidgetright")
cf.createItem("stonewidget")
cf.createItem("stonewidgetup")
cf.createItem("stonewidgetdown")
cf.createItem("alloywidget")
cf.createItem("enderwidget")


/* Space Items */
cf.createItem("radiationlayer")
cf.createItem("pressurelayer")
cf.createItem("cloth")
cf.createItem("thermalcloth")
cf.createItem("unpreparedspacehelmet")
cf.createItem("unpreparedspacechestpiece")
cf.createItem("unpreparedspaceleggings")
cf.createItem("unpreparedspaceboots")


/* Micro Miner Items */
cf.createItem("quantumflux", EnumRarity.EPIC)
cf.createItem("gemsensor", EnumRarity.EPIC)
cf.createItem("warpengine", EnumRarity.EPIC)
cf.createItem("universalnavigator", EnumRarity.EPIC)
cf.createItem("quantumfluxedeterniumplating", EnumRarity.EPIC)
cf.createItem("t1guidance", EnumRarity.UNCOMMON)
cf.createItem("t2guidance", EnumRarity.RARE)
cf.createItem("t1laser", EnumRarity.UNCOMMON)
cf.createItem("t2laser", EnumRarity.RARE)
cf.createItem("t3laser", EnumRarity.EPIC)


/* Micro Miners, Stabilized Micro Miners & Matter */
cf.createItem("tieroneship", EnumRarity.UNCOMMON, 16)
cf.createItem("tiertwoship", EnumRarity.UNCOMMON, 16)
cf.createItem("tierthreeship", EnumRarity.UNCOMMON, 16)
cf.createItem("tierfourship", EnumRarity.UNCOMMON, 16)
cf.createItem("tierfourandhalfship", EnumRarity.UNCOMMON, 16)
cf.createItem("tierfiveship", EnumRarity.RARE, 16)
cf.createItem("tiersixship", EnumRarity.RARE, 16)
cf.createItem("tiersevenship", EnumRarity.RARE, 16)
cf.createItem("tiereightship", EnumRarity.EPIC, 16)
cf.createItem("tiereightandhalfship", EnumRarity.EPIC, 16)
cf.createItem("tiernineship", EnumRarity.EPIC, 16)
cf.createItem("tiertenship", EnumRarity.EPIC, 16)

cf.createItem("tieroneship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tiertwoship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tierthreeship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tierfourship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tierfourandhalfship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tierfiveship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tiersixship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tiersevenship_stabilized", EnumRarity.EPIC, 1)
cf.createItem("tiereightship_stabilized", EnumRarity.EPIC, 1)

cf.createItem("tieroneship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tiertwoship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tierthreeship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tierfourship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tierfourandhalfship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tierfiveship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tiersixship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tiersevenship_stabilized_matter", EnumRarity.EPIC)
cf.createItem("tiereightship_stabilized_matter", EnumRarity.EPIC)


/* Data */
cf.createItem("dragonlairdata", EnumRarity.EPIC)
cf.createItem("witherrealmdata", EnumRarity.EPIC)
cf.createItem("impossiblerealmdata", EnumRarity.RARE)
cf.createItem("universecreationdata", EnumRarity.EPIC, 1)
cf.createItem("stellarcreationdata", EnumRarity.RARE)
cf.createItem("lairofthechaosguardiandata", EnumRarity.EPIC, 1)


/* Solidified Items */
cf.createItem("solidifiedargon")
cf.createItem("solidifiedchlorine")
cf.createItem("solidifiedfluorine")
cf.createItem("solidifiedhelium")
cf.createItem("solidifiedhydrogen")
cf.createItem("solidifiedkrypton")
cf.createItem("solidifiedmercury")
cf.createItem("solidifiedneon")
cf.createItem("solidifiednitrogen")
cf.createItem("solidifiedoxygen")
cf.createItem("solidifiedradon")
cf.createItem("solidifiedxenon")


/* Stabilized Items */
cf.createItem("stabilizedeinsteinium")
cf.createItem("stabilizedberkelium")
cf.createItem("stabilizedneptunium")
cf.createItem("stabilizedplutonium")
cf.createItem("stabilizeduranium")
cf.createItem("stabilizedcurium")
cf.createItem("stabilizedcalifornium")
cf.createItem("stabilizedamericium")


/* Endgame Items */
cf.createItem("creativeportabletankmold", EnumRarity.EPIC)
cf.createItem("exoticmaterialscatalyst", EnumRarity.RARE)
cf.createItem("eternalcatalyst", EnumRarity.EPIC)
cf.createItem("ultimate_gem", EnumRarity.EPIC, 1)


/* Misc Items */
cf.createItem("grainsofinnocence")

cf.createItem("radiumsalt")
cf.createItem("moondust")

cf.createItem("redstonearmorplate")
cf.createItem("carbonarmorplate")
cf.createItem("lapisarmorplate")

cf.createItem("compressedoctadiccapacitor")
cf.createItem("doublecompressedoctadiccapacitor")

// Core and North are part of the Crafting Nether Star mod.
cf.createItem("netherstarsouth")
cf.createItem("netherstareast")
cf.createItem("netherstarwest")

// Hydrogen is part of Solidified Items section.
cf.createItem("densehydrogen")
cf.createItem("ultradensehydrogen")

cf.createItem("magnetron")

/* Smores */
String [] smores = [
    "eightsmore",
    "sixteensmore",
    "thirtytwosmore",
    "sixtyfoursmore"
]

Potion [] potions = [
    MobEffects.ABSORPTION,
    MobEffects.SPEED,
    MobEffects.HASTE,
    MobEffects.SATURATION,
    MobEffects.HEALTH_BOOST,
    MobEffects.REGENERATION
]

EnumRarity [] rarities = [
    EnumRarity.COMMON,
    EnumRarity.UNCOMMON,
    EnumRarity.RARE,
    EnumRarity.EPIC
]

int heal = 44
float saturation = 8.6F
int potionDuration = 1200
int potionAmplifier = 0
int index = 0

for (String smoreName : smores) {
    heal *= 2
    heal += 4

    saturation *= 2
    saturation++

    potionDuration *= 2

    Item smore = new Smore(heal, saturation, content.getDefaultTab()).setRarity(rarities[index])

    for (Potion potion : potions)
        smore.addPotionEffect(potion, potionDuration, potionAmplifier)

    content.registerItem(smoreName, smore)

    potionAmplifier++
    index++
}

println("[CustomItems.groovy] End Custom Items Registration.")