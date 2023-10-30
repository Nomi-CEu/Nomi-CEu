import gregtech.common.metatileentities.MetaTileEntities
import gregtech.api.recipes.RecipeMap
import io.sommers.packmode.PMConfig

int naqFirstID

if (PMConfig.getPackMode() == "normal") {
    naqFirstID = 32004
} else {
    naqFirstID = 32003
}

/* Blockstate handler with variants works here */
MetaTileEntities.registerMetaTileEntity(naqFirstID, new NaquadahReactor(new ResourceLocation("multiblocktweaker", "naquadah_reactor_1"), RecipeMap.getByName("naquadah_reactor_1"), 7, 3, blockstate('gregtech:meta_block_compressed_8', 'variant=gregtech__duranium'), blockstate('extendedcrafting:trimmed', 'variant=ultimate')))

if (PMConfig.getPackMode() == "normal") {
    MetaTileEntities.registerMetaTileEntity(++naqFirstID, new NaquadahReactor(new ResourceLocation("multiblocktweaker", "naquadah_reactor_2"), RecipeMap.getByName("naquadah_reactor_2"), 8, 4, blockstate('gregtech:meta_block_compressed_27', 'variant=gregtech__ruthenium_trinium_americium_neutronate'), blockstate('extendedcrafting:storage', 'variant=ultimate')))
} else {
    MetaTileEntities.registerMetaTileEntity(++naqFirstID, new NaquadahReactor(new ResourceLocation("multiblocktweaker", "naquadah_reactor_2"), RecipeMap.getByName("naquadah_reactor_2"), 8, 4, blockstate('gregtech:meta_block_compressed_2006', 'variant=gregtech__taranium'), blockstate('extendedcrafting:storage', 'variant=ultimate')))
}
