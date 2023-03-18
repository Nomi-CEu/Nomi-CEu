import net.minecraft.item.EnumRarity
import net.minecraft.item.ItemStack

println("[CustomItems.groovy] Start Creative Tab Init.")

/* Define HOAU first for use in creative tab logo */
def HOAU = content.createItem("heartofauniverse").setRarity(EnumRarity.EPIC)

/* Define a Default Creative Tab */
def creativeTab = content.createCreativeTab("nomifactory.creative_tab", new ItemStack(HOAU))
content.setDefaultCreativeTab(creativeTab)

println("[CustomItems.groovy] End Creative Tab Init.")

println("[CustomItems.groovy] Start Custom Items Registration.")

/* --------------------------------- Custom Items ----------------------------------------- */

/* Register HOAU, in new creative tab
HOAU.setCreativeTab(creativeTab).register()

/* Coins */
content.createItem("omnicoin").register()
content.createItem("omnicoin5").setRarity(EnumRarity.UNCOMMON).register()
content.createItem("omnicoin25").setRarity(EnumRarity.RARE).register()
content.createItem("omnicoin100").setRarity(EnumRarity.EPIC).register()

/* Widgets */
content.createItem("woodenwidget").register()
content.createItem("stonewidget").register()
content.createItem("alloywidget").register()
content.createItem("enderwidget").register()

/* Endgame Items */

println("[CustomItems.groovy] End Custom Items Registration.")