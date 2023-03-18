import net.minecraft.item.EnumRarity
import net.minecraft.item.ItemStack

import CommonFunctions as cf

println("[CustomItems.groovy] Start Creative Tab Init.")

/* Define HOAU first for use in creative tab logo */
def HOAU = content.createItem("heartofauniverse").setRarity(EnumRarity.EPIC)

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
cf.createItem("tieroneship", EnumRarity.UNCOMMON)
cf.createItem("tiertwoship", EnumRarity.UNCOMMON)
cf.createItem("tierthreeship", EnumRarity.UNCOMMON)
cf.createItem("tierfourship", EnumRarity.UNCOMMON)
cf.createItem("tierfourandhalfship", EnumRarity.UNCOMMON)
cf.createItem("tierfiveship", EnumRarity.RARE)
cf.createItem("tiersixship", EnumRarity.RARE)
cf.createItem("tiersevenship", EnumRarity.RARE)
cf.createItem("tiereightship", EnumRarity.EPIC)
cf.createItem("tiereightandhalfship", EnumRarity.EPIC)
cf.createItem("tiernineship", EnumRarity.EPIC)
cf.createItem("tiertenship", EnumRarity.EPIC)

cf.createItem("tieroneship_stabilized", EnumRarity.EPIC)
cf.createItem("tiertwoship_stabilized", EnumRarity.EPIC)
cf.createItem("tierthreeship_stabilized", EnumRarity.EPIC)
cf.createItem("tierfourship_stabilized", EnumRarity.EPIC)
cf.createItem("tierfourandhalfship_stabilized", EnumRarity.EPIC)
cf.createItem("tierfiveship_stabilized", EnumRarity.EPIC)
cf.createItem("tiersixship_stabilized", EnumRarity.EPIC)
cf.createItem("tiersevenship_stabilized", EnumRarity.EPIC)
cf.createItem("tiereightship_stabilized", EnumRarity.EPIC)

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
cf.createItem("universecreationdata", EnumRarity.EPIC)
cf.createItem("stellarcreationdata", EnumRarity.RARE)
cf.createItem("lairofthechaosguardiandata", EnumRarity.EPIC)


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
cf.createItem("ultimate_gem", EnumRarity.EPIC)
cf.createItem("ultimate_power_storage", EnumRarity.EPIC)
cf.createItem("ultimate_generator", EnumRarity.EPIC)


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

println("[CustomItems.groovy] End Custom Items Registration.")