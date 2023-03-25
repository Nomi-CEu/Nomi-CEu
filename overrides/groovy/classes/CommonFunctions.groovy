import net.minecraft.block.material.Material
import net.minecraft.block.SoundType
import net.minecraft.block.Block
import net.minecraftforge.common.IRarity

class CommonFunctions {
    /* Items */
    def static createItem(String name){
        content.createItem(name)
            .register()
    }

    def static createItem(String name, IRarity rarity){
        content.createItem(name)
            .setRarity(rarity)
            .register()
    }

    def static createItem(String name, int maxStackSize){
        content.createItem(name)
            .setMaxStackSize(maxStackSize)
            .register()
    }

    def static createItem(String name, IRarity rarity, int maxStackSize){
        content.createItem(name)
            .setRarity(rarity)
            .setMaxStackSize(maxStackSize)
            .register()
    }
    /* ---------------------------------------------------------------- */

    /* Blocks */
    static Block createBaseBlock(Material material, SoundType soundType){
        return new Block(material)
            .setSoundType(soundType)
            .setHardness(2.0F)
            .setResistance(10.0F)
            .setCreativeTab(content.getDefaultTab())
    }
    /* ---------------------------------------------------------------- */
}