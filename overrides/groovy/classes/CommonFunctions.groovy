import net.minecraft.item.EnumRarity
import net.minecraftforge.common.IRarity

class CommonFunctions {
    // Items
    def static createItem(String name){
        content.createItem(name)
            .register()
    }

    def static createItem(String name, IRarity rarity){
        content.createItem(name)
            .setRarity(rarity)
            .register()
    }
}