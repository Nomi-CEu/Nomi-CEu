import net.minecraftforge.event.entity.player.ItemTooltipEvent
import net.minecraftforge.common.util.Constants
import net.minecraft.util.text.TextFormatting

event_manager.listen { ItemTooltipEvent event ->
    def stack = event.getItemStack()
}