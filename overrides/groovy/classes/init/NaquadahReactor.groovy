import gregtech.api.metatileentity.multiblock.FuelMultiblockController
import gregtech.api.metatileentity.MetaTileEntity
import gregtech.api.metatileentity.interfaces.IGregTechTileEntity
import gregtech.api.metatileentity.multiblock.IMultiblockPart
import gregtech.api.pattern.BlockPattern
import gregtech.api.pattern.FactoryBlockPattern
import gregtech.client.renderer.ICubeRenderer
import gregtech.common.blocks.BlockMetalCasing.MetalCasingType
import gregtech.common.blocks.MetaBlocks
import gregtech.api.recipes.RecipeMap
import net.minecraft.block.state.IBlockState
import gregicality.multiblocks.api.render.GCYMTextures
import gregtech.client.renderer.texture.Textures
import gregtech.api.metatileentity.multiblock.MultiblockAbility
import gregicality.multiblocks.common.block.GCYMMetaBlocks
import gregicality.multiblocks.common.block.blocks.BlockLargeMultiblockCasing
import gregtech.common.blocks.MetaBlocks
import gregtech.common.blocks.BlockGlassCasing
import net.minecraft.util.text.ITextComponent
import net.minecraft.util.text.Style
import net.minecraft.util.text.TextComponentTranslation
import net.minecraft.util.text.TextFormatting
import net.minecraft.util.text.event.HoverEvent
import gregtech.api.util.TextFormattingUtil
import gregtech.api.util.GTUtility
import gregtech.api.GTValues
import net.minecraft.item.ItemStack
import net.minecraft.world.World
import net.minecraft.client.resources.I18n
import gregtech.client.utils.TooltipHelper

public class NaquadahReactor extends FuelMultiblockController {
    public final int numSpatial
    public final IBlockState bottomFiller
    public final IBlockState topFiller
    public final int tier
    
    public static final int AMP = 3

    NaquadahReactor(ResourceLocation metaTileEntityId, RecipeMap recipeMap, int tier, int numSpatial, IBlockState bottomFiller, IBlockState topFiller) {
        super(metaTileEntityId, recipeMap, tier)
        this.tier = tier
        this.numSpatial = numSpatial
        this.bottomFiller = bottomFiller
        this.topFiller = topFiller
        this.recipeMapWorkable = new NaqRecipeLogic(this)
    }
    
    @Override
    MetaTileEntity createMetaTileEntity(IGregTechTileEntity tileEntity) {
        return new NaquadahReactor(metaTileEntityId, recipeMap, tier, numSpatial, bottomFiller, topFiller)
    }
    
    @Override
    protected BlockPattern createStructurePattern() {
    	String[] aisle1 = new String[this.numSpatial + 2]
    	String[] aisle2 = new String[this.numSpatial + 2]
    	String[] aisle3 = new String[this.numSpatial + 2]

    	aisle1[0] = "CCC"
    	aisle2[0] = "CCC"
    	aisle3[0] = "CSC"

        // Loop for numSpatial times, starting from index 1, adding spatials to outside aisles
    	for (int i = 1; i <= numSpatial; i++) {
    	    aisle1[i] = "PGP"
    	    aisle3[i] = "PGP"
    	}
    	// Loop for numSpatial - 1 times, starting from index 1, adding bottomFillers to inside aisle
    	for (int i = 1; i < numSpatial; i++) {
    	    aisle2[i] = "GBG"
    	}
    	// Add top filler
    	aisle2[numSpatial] = "GTG"

        aisle1[numSpatial + 1] = "CCC"
    	aisle2[numSpatial + 1] = "CCC"
    	aisle3[numSpatial + 1] = "CCC"

        return FactoryBlockPattern.start()
            .aisle(aisle1)
            .aisle(aisle2)
            .aisle(aisle3)
            .where('S' as char, selfPredicate())
            .where('G' as char, states(getGlassState()))
            .where('P' as char, states(blockstate('appliedenergistics2:spatial_pylon'))) // Blockstate works here with no variants
            .where('T' as char, states(this.topFiller))
            .where('B' as char, states(this.bottomFiller))
            .where('C' as char, states(getCasingState()).setMinGlobalLimited(10)
                .or(abilities(MultiblockAbility.OUTPUT_ENERGY).setExactLimit(1))
                .or(autoAbilities(false, true, true, true, false, false, false)))
            .build()
    }
    
    @Override
    ICubeRenderer getBaseTexture(IMultiblockPart sourcePart) {
        return GCYMTextures.MIXER_CASING
    }
    
    @Override
    protected ICubeRenderer getFrontOverlay() {
        return Textures.FUSION_REACTOR_OVERLAY
    }
    
    /* Would use blockstate handler, but does not work with special variants and types here? */
    public IBlockState getCasingState() {
        return GCYMMetaBlocks.LARGE_MULTIBLOCK_CASING.getState(BlockLargeMultiblockCasing.CasingType.MIXER_CASING)
    }
    
    public IBlockState getGlassState() {
        return MetaBlocks.TRANSPARENT_CASING.getState(BlockGlassCasing.CasingType.FUSION_GLASS)
    }
    
    @Override
    protected void addDisplayText(List<ITextComponent> textList) {
        if (!isStructureFormed()) {
            ITextComponent tooltip = new TextComponentTranslation("gregtech.multiblock.invalid_structure.tooltip")
            tooltip.setStyle(new Style().setColor(TextFormatting.GRAY))
            textList.add(new TextComponentTranslation("gregtech.multiblock.invalid_structure")
                    .setStyle(new Style().setColor(TextFormatting.RED)
                            .setHoverEvent(new HoverEvent(HoverEvent.Action.SHOW_TEXT, tooltip))))
        }
        else {
            long produces = GTValues.V[tier] * AMP
            String voltageName = GTValues.VNF[GTUtility.getFloorTierByVoltage(produces)] + TextFormatting.RESET
            textList.add(new TextComponentTranslation("gregtech.multiblock.max_energy_per_tick", TextFormattingUtil.formatNumbers(produces), voltageName))

            if (!recipeMapWorkable.isWorkingEnabled()) {
                textList.add(new TextComponentTranslation("gregtech.multiblock.work_paused"))
            } else if (recipeMapWorkable.isActive()) {
                textList.add(new TextComponentTranslation("gregtech.multiblock.running"))
                int currentProgress = (int) (recipeMapWorkable.getProgressPercent() * 100)
                textList.add(new TextComponentTranslation("gregtech.multiblock.progress", currentProgress))
            } else {
                textList.add(new TextComponentTranslation("gregtech.multiblock.idling"))
            }
        }
    }
    
    @Override
    public void addInformation(ItemStack stack, World player, List<String> tooltip, boolean advanced) {
        super.addInformation(stack, player, tooltip, advanced)
        tooltip.add(I18n.format("tooltip.contenttweaker.naquadah_reactor.produces", AMP, GTValues.VNF[tier] + TextFormatting.RESET))
        tooltip.add(TooltipHelper.RAINBOW_SLOW.toString() + I18n.format("gui.contenttweaker.naquadah_reactor.overclock"))
    }
}
