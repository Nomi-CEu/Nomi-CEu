import net.minecraft.item.EnumRarity
import net.minecraft.item.ItemStack
import net.minecraftforge.client.event.TextureStitchEvent

import static NomiUtil.createFluid

println("[CustomFluids.groovy] Start Custom Fluids Registration.")

/* --------------------------------- Custom Fluids ----------------------------------------- */

// This is done because the color values were automatically defaulting to long
int [] colors = [0x588c5aff, 0xf73663ff, 0x187a30ff, 0x10041cff, 0xff0000ff, 0x0026ffff, 0xe6e6e6ff, 0x00fbffff, 0x00ff00ff, 0x0e0e0eff]

// Must be done inside this event
event_manager.listen { TextureStitchEvent.Pre event ->
    createFluid("elementalreduction", colors[0], 2000, 7)

    createFluid("plutonium2", colors[1], 1024, 0)
    createFluid("uranium233", colors[2], 1024, 0)
    createFluid("tough_alloy", colors[3], 1024, 0)

    createFluid("moltenempoweredrestonia", colors[4], 10000, 15)
    createFluid("moltenempoweredpalis", colors[5], 10000, 15)
    createFluid("moltenempoweredenori", colors[6], 10000, 15)
    createFluid("moltenempowereddiamatine", colors[7], 10000, 15)
    createFluid("moltenempoweredemeradic", colors[8], 10000, 15)
    createFluid("moltenempoweredvoid", colors[9], 10000, 15)
}

println("[CustomFluids.groovy] End Custom Fluids Registration.")