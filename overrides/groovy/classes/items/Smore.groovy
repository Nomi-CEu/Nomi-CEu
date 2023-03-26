import net.minecraft.creativetab.CreativeTabs
import net.minecraft.entity.player.EntityPlayer
import net.minecraft.item.ItemFood
import net.minecraft.item.ItemStack
import net.minecraft.potion.Potion
import net.minecraft.potion.PotionEffect
import net.minecraft.world.World
import net.minecraftforge.common.IRarity

public class Smore extends ItemFood {
    List<PotionEffect> potionEffects
        private IRarity rarity = null

    public Smore(int healAmount, float saturation, CreativeTabs creativeTab) {
        super(healAmount, saturation, true)
        setAlwaysEdible()
        setCreativeTab(creativeTab)
        potionEffects = new ArrayList<>()
    }

    public Smore addPotionEffect(Potion potion, int potionDuration, int amplifier) {
        if (potion == null)
            return this

        potionEffects.add(new PotionEffect(potion, potionDuration, amplifier))
        return this
    }

    public Smore setRarity(IRarity rarity) {
        this.rarity = rarity
        return this
    }

    @Override
    protected void onFoodEaten(ItemStack stack, World worldIn, EntityPlayer player)
    {
        if (!worldIn.isRemote && this.potionEffects != null)
        {
            for (PotionEffect potionAdd : potionEffects) {
                if (potionAdd != null)
                    player.addPotionEffect(new PotionEffect(potionAdd))
            }
        }
    }

    @Override
    public IRarity getForgeRarity(ItemStack stack) {
        return this.rarity == null ? super.getForgeRarity(stack) : this.rarity;
    }
}