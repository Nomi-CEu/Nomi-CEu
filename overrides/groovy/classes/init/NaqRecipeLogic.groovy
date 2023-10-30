import gregtech.api.capability.impl.MultiblockFuelRecipeLogic
import gregtech.api.metatileentity.multiblock.RecipeMapMultiblockController
import gregtech.api.GTValues

public class NaqRecipeLogic extends MultiblockFuelRecipeLogic {

    public NaqRecipeLogic(RecipeMapMultiblockController tileEntity) {
        super(tileEntity)
    }

    @Override
    public int getParallelLimit() {
        // No Parallel for Naq Reactors
        return 1
    }
    
    @Override
    public long getMaxVoltage() {
        return this.EU_OUTPUT
    }
    
    @Override
    public boolean isAllowOverclocking() {
        return false;
    }
}
