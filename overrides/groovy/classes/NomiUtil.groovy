import net.minecraft.block.material.Material
import net.minecraft.block.SoundType
import net.minecraft.block.Block
import net.minecraftforge.common.IRarity

class NomiUtil {
    /* Items */
    static void createItem(String name){
        content.createItem(name)
            .register()
    }

    static void createItem(String name, IRarity rarity){
        content.createItem(name)
            .setRarity(rarity)
            .register()
    }

    static void createItem(String name, int maxStackSize){
        content.createItem(name)
            .setMaxStackSize(maxStackSize)
            .register()
    }

    static void createItem(String name, IRarity rarity, int maxStackSize){
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