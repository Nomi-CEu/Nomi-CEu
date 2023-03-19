import net.minecraft.block.Block
import net.minecraft.block.material.Material
import net.minecraft.block.SoundType
import net.minecraft.util.math.AxisAlignedBB
import net.minecraft.creativetab.CreativeTabs
import net.minecraft.util.math.BlockPos
import net.minecraft.block.state.IBlockState
import net.minecraft.world.IBlockAccess
import net.minecraft.util.EnumFacing
import net.minecraft.block.state.BlockFaceShape

class ExcitationCoil extends Block {
    private static final AxisAlignedBB AABB = new AxisAlignedBB(0.25D, 0.0D, 0.25D, 0.75D, 0.5625D, 0.75D)

	ExcitationCoil(CreativeTabs tab) {
		super(Material.IRON)
        fullBlock = false
		setSoundType(SoundType.METAL)
		if (tab != null) {
            setCreativeTab(tab)
        }
        setHardness(5.0F)
        setResistance(5.0F)
        setLightLevel(1.0F)
        setHarvestLevel("pickaxe", 2)
	}

    @Override
    public AxisAlignedBB getBoundingBox(IBlockState state, IBlockAccess source, BlockPos pos) {
        return AABB
    }

    @Override
    public boolean isSideSolid(IBlockState baseState, IBlockAccess world, BlockPos pos, EnumFacing side) {
        return false
    }

    @Override
    public boolean isTopSolid(IBlockState state){
        return false
    }

    @Override
    public boolean isOpaqueCube(IBlockState state) {
        return false
    }

    @Override
    public boolean isFullCube(IBlockState state) {
        return false
    }

    @Override
    public boolean isNormalCube(IBlockState state, IBlockAccess world, BlockPos pos) {
        return false
    }

    @Override
    public BlockFaceShape getBlockFaceShape(IBlockAccess worldIn, IBlockState state, BlockPos pos, EnumFacing face) {
        return BlockFaceShape.UNDEFINED
    }

    @Override
    public boolean doesSideBlockRendering(IBlockState state, IBlockAccess world, BlockPos pos, EnumFacing face){
        return false
    }
}