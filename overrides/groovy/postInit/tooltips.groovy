import net.minecraftforge.event.entity.player.ItemTooltipEvent
import net.minecraftforge.common.util.Constants
import net.minecraft.util.text.TextFormatting

event_manager.listen { ItemTooltipEvent event ->
    def stack = event.getItemStack()
    // Check for Hand Framing Description
    if (stack.hasTagCompound() && stack.getTagCompound().hasKey("labs-needs-hand-framing-description", Constants.NBT.TAG_BYTE) && stack.getTagCompound().getBoolean("labs-needs-hand-framing-description")) { // Boolean is stored in byte
        event.getToolTip().add(TextFormatting.DARK_PURPLE.toString() + net.minecraft.client.resources.I18n.format("tooltip.hand_framing.top_left"))
        event.getToolTip().add(TextFormatting.DARK_PURPLE.toString() + net.minecraft.client.resources.I18n.format("tooltip.hand_framing.top_right"))
        event.getToolTip().add(TextFormatting.DARK_PURPLE.toString() + net.minecraft.client.resources.I18n.format("tooltip.hand_framing.bottom_left"))
        return;
    }
}