import net.minecraft.item.EnumRarity
import net.minecraft.item.ItemStack
import net.minecraftforge.client.event.TextureStitchEvent

import static NomiUtil.createFluid

println("[CustomFluids.groovy] Start Custom Fluids Registration.")

/* --------------------------------- Custom Fluids ----------------------------------------- */
event_manager.listen {TextureStitchEvent event ->
    createFluid("elementalreduction", 0x588c5aff, 2000, 7)

    createFluid("plutonium2", 0xf73663ff, 1024, 0)
    createFluid("uranium233", 0x187a30ff, 1024, 0)
    createFluid("tough_alloy", 0x10041cff, 1024, 0)

    createFluid("moltenempoweredrestonia", 0xff0000ff, 10000, 15)
    createFluid("moltenempoweredpalis", 0x0026ffff, 10000, 15)
    createFluid("moltenempoweredenori", 0xe6e6e6ff, 10000, 15)
    createFluid("moltenempowereddiamatine", 0x00fbffff, 10000, 15)
    createFluid("moltenempoweredemeradic", 0x00ff00ff, 10000, 15)
    createFluid("moltenempoweredvoid", 0x0e0e0eff, 10000, 15)
}

println("[CustomFluids.groovy] End Custom Fluids Registration.")