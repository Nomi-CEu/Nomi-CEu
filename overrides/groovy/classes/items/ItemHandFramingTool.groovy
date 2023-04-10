import com.jaquadro.minecraft.storagedrawers.api.storage.INetworked
import com.jaquadro.minecraft.storagedrawers.block.*
import com.jaquadro.minecraft.storagedrawers.block.tile.TileEntityDrawers
import com.jaquadro.minecraft.storagedrawers.block.tile.tiledata.MaterialData
import eutros.framedcompactdrawers.block.BlockControllerCustom
import eutros.framedcompactdrawers.block.BlockSlaveCustom
import eutros.framedcompactdrawers.block.tile.TileControllerCustom
import eutros.framedcompactdrawers.block.tile.TileSlaveCustom
import eutros.framedcompactdrawers.registry.ModBlocks as FCDModBlocks
import com.jaquadro.minecraft.storagedrawers.core.ModBlocks as SDModBlocks
import net.minecraft.block.Block
import net.minecraft.block.state.IBlockState
import net.minecraft.creativetab.CreativeTabs
import net.minecraft.entity.player.EntityPlayer
import net.minecraft.init.Blocks
import net.minecraft.item.Item
import net.minecraft.item.ItemStack
import net.minecraft.nbt.NBTTagCompound
import net.minecraft.util.EnumActionResult
import net.minecraft.util.EnumFacing
import net.minecraft.util.EnumHand
import net.minecraft.util.ResourceLocation
import net.minecraft.util.math.BlockPos
import net.minecraft.world.World

public class ItemHandFramingTool extends Item {
    private int stickAmount

    public ItemHandFramingTool(CreativeTabs creativeTab) {
        setMaxStackSize(1)
        setCreativeTab(creativeTab)
    }

    @Override
    public EnumActionResult onItemUse(EntityPlayer player, World worldIn, BlockPos pos, EnumHand hand, EnumFacing facing, float hitX, float hitY, float hitZ) {
        // This is to return success if we framed it, but not decorated it
        EnumActionResult actionResult = EnumActionResult.PASS

        if (worldIn.isAirBlock(pos))
            return actionResult

        IBlockState state = worldIn.getBlockState(pos)
        Block block = state.getBlock()

        if (!(block instanceof INetworked))
            return actionResult

        // At this point, further returns should be fail
        actionResult = EnumActionResult.FAIL

        ItemStack tool = player.getHeldItem(hand)

        if (!tool.hasTagCompound() || tool.getTagCompound() == null)
            return actionResult

        NBTTagCompound tagCompound = tool.getTagCompound()

        // Check if we should make this block a framed one
        if (!isDecorating(Objects.requireNonNull(block.getRegistryName()))){
            if (!tagCompound.hasKey("sticks"))
                return actionResult

            int stickCount = tagCompound.getInteger("sticks")

            if (stickCount < 8)
                return actionResult

            tagCompound.setInteger("sticks", stickCount - 8)

            // Make it framed
            makeFramedState(worldIn, pos)

            // This should be success, if we framed but not decorated
            actionResult = EnumActionResult.SUCCESS
        }
        
        // Get Decorate Info
        ItemStack matS, matF, matT

        matS = getItemStackFromKey(tagCompound, "MatS")
        if (matS.isEmpty())
            return actionResult

        matF = getItemStackFromKey(tagCompound, "MatT")
        matT = getItemStackFromKey(tagCompound, "MatF")

        // Decorate
        var tile = worldIn.getTileEntity(pos)
        var materialData = tile.material()
        materialData.setSide(matS.copy())
        materialData.setTrim(matT.copy())
        materialData.setFront(matF.copy())

        // Change Hand Framing Tool's nbt
        ItemStack handFramingTool = player.getHeldItem(hand)
        handFramingTool.setTagCompound(tagCompound)

        player.setHeldItem(hand, handFramingTool)

        return EnumActionResult.SUCCESS
    }

    private boolean isDecorating(ResourceLocation registryName) {
        String registryString = registryName.toString()

        return registryName.getNamespace().equals("framedcompactdrawers")
               || registryString.equals("storagedrawers:customdrawers")
               || registryString.equals("storagedrawers:customtrim")
    }

    private Block makeFramedState(World world, BlockPos pos) {
        IBlockState state = world.getBlockState(pos)
        Block block = state.getBlock()
        NBTTagCompound tag = new NBTTagCompound()

        // Other stuff extend drawers, but not in this case, apart from compacting drawers
        if (block instanceof BlockDrawers){
            TileEntityDrawers tile = Objects.requireNonNull((TileEntityDrawers) world.getTileEntity(pos))
            tile.writeToPortableNBT(tag)

            if (block instanceof BlockCompDrawers){
                world.setBlockState(pos, FCDModBlocks.framedCompactDrawer.getDefaultState())
                tile = Objects.requireNonNull((TileEntityDrawers) world.getTileEntity(pos))
                tile.readFromPortableNBT(tag)
            }

            world.setBlockState(pos, SDModBlocks.customDrawers.getStateFromMeta(block.getMetaFromState(state)))
            tile = Objects.requireNonNull((TileEntityDrawers) world.getTileEntity(pos))
            tile.readFromPortableNBT(tag)
        }

        if (block instanceof BlockController){
            world.setBlockState(pos, FCDModBlocks.framedDrawerController.getDefaultState)
        }

        if (block instanceof BlockSlave){
            world.setBlockState(pos, FCDModBlocks.framedSlave.getDefaultState)
        }

        // Only thing that and extends INetworked at this point is trims
        world.setBlockState(pos, SDModBlocks.customTrim.getDefaultState)
    }

    private ItemStack getItemStackFromKey(NBTTagCompound tagCompound, String key) {
        if (!tagCompound.hasKey(key))
            return ItemStack.EMPTY

        else {
            return new ItemStack(tagCompound.getCompoundTag(key))
        }
    }
}