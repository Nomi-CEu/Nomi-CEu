import net.minecraft.block.material.Material
import net.minecraft.block.SoundType
import net.minecraft.block.Block
import net.minecraft.item.ItemStack
import net.minecraftforge.common.IRarity
import net.minecraft.util.ResourceLocation
import net.minecraftforge.fluids.Fluid
import net.minecraftforge.fluids.FluidRegistry
import net.minecraftforge.fluids.BlockFluidClassic

/*
import appeng.api.AEApi
import appeng.api.features.IInscriberRecipe
import appeng.api.features.IInscriberRecipeBuilder
import appeng.api.features.IInscriberRegistry
import appeng.api.features.InscriberProcessType
*/

class NomiUtil {
    public final static String packID = "contenttweaker"
    private static Map<String, Fluid> fluidRegistry = new HashMap<>()

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

    /* Blocks */
    static Block createBaseBlock(Material material, SoundType soundType){
        return new Block(material)
            .setSoundType(soundType)
            .setHardness(2.0F)
            .setResistance(10.0F)
            .setCreativeTab(content.getDefaultTab())
    }

    /* Fluids */
    // Creating the blocks and the fluid must be split up. Blocks should be created in PreInit, whilst fluids are created in TextureStitchEvent.Pre
    static void createFluid(String name, int color, int viscosity, int luminosity) {
        ResourceLocation stillTexture = new ResourceLocation(packID, name)
        ResourceLocation flowingTexture = new ResourceLocation(packID, name)

        Fluid fluid = new Fluid(name, stillTexture, flowingTexture, color)

        fluid.setViscosity(viscosity)
        fluid.setLuminosity(luminosity)

        fluidRegistry.put(name, fluid)
    }

    static void createFluidBlocks() {
        if (fluidRegistry.isEmpty()){
            println("[NomiUtil] Error occurred creating Fluid Blocks: No fluids created!")
            return
        }

        for (var name : fluidRegistry.keySet()) {
            content.registerBlock(name, new BlockFluidClassic(fluidRegistry.get(name), Material.WATER))
        }
    }

    static void registerFluids() {
        if (fluidRegistry.isEmpty()){
            println("[NomiUtil] Error occurred registering Fluids: No fluids created!")
            return
        }

        for (var name : fluidRegistry.keySet()){
            Fluid fluid = fluidRegistry.get(name)

            FluidRegistry.registerFluid(fluid)
            FluidRegistry.addBucketForFluid(fluid)
        }
    }

	/* AE Compat
	static IInscriberRecipeBuilder getInscriberBuilder(boolean inscribe) {
		return AEApi.instance().registries().inscriber().builder().withProcessType(inscribe ? InscriberProcessType.INSCRIBE : InscriberProcessType.PRESS)
	}

	static void registerInscriberRecipe(IInscriberRecipe therecipie) {
		AEApi.instance().registries().inscriber().addRecipe(therecipie)
	}

	static void removeInscriberRecipe(ItemStack thething) {
        def inscriberReg = AEApi.instance().registries().inscriber()
		inscriberReg.getRecipes()
            .toList() // this make a new list, cant mutate the list foreach is iterating
			.forEach(r -> {
				if (!r.getOutput().isItemEqual(thething)) return
				inscriberReg.removeRecipe(r)
			})
	}
    */
}