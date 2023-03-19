import net.minecraft.block.Block
import net.minecraft.block.material.Material
import net.minecraft.block.SoundType
import net.minecraft.util.math.AxisAlignedBB
import net.minecraft.creativetab.CreativeTabs
import net.minecraft.util.math.BlockPos
import net.minecraft.block.state.IBlockState
import net.minecraft.world.IBlockAccess

class ExcitationCoil extends Block {
    private AxisAlignedBB AABB

	ExcitationCoil(CreativeTabs tab) {
		super(Material.IRON)
        fullBlock = false
		setSoundType(SoundType.METAL)
		if (tab != null) {
            setCreativeTab(tab)
        }
        AABB = new AxisAlignedBB(0.25, 0.0, 0.25, 0.75, 0.5625, 0.75)
        setHardness(5.0 as float)
        setResistance(5.0 as float)
        setLightLevel(1.0 as float)
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

}