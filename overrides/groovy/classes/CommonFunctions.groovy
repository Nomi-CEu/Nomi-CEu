import net.minecraft.item.EnumRarity
net.minecraftforge.common.IRarity

class CommonFunctions {
    static createItem(String name){
        content.createItem(name)
            .register()
    }

    static createItem(String name, IRarity rarity){
        content.createItem(name)
            .setRarity(rarity)
            .register()
    }
}