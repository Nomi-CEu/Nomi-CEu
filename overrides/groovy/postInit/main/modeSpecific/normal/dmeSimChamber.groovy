package postInit.main.modeSpecific.normal

import com.nomiceu.nomilabs.util.LabsModeHelper
import mustapelto.deepmoblearning.common.metadata.MetadataDataModel
import mustapelto.deepmoblearning.common.metadata.MetadataManager
import net.minecraftforge.fml.common.Loader

// Only Load if Mode is Normal
// Adds Recipes for the DME Simulation Chamber
if (!LabsModeHelper.normal) return

def models = MetadataManager.dataModelMetadataList
for (var model : models) {
    if (!Loader.isModLoaded(model.modID)) continue // Edge Case

    int tier = MetadataManager.minDataModelTier
    while (!MetadataManager.isMaxDataModelTier(tier)){
        addDMERecipe(model, tier)
        tier = MetadataManager.getNextDataModelTier(tier)
    }
    // Since this does not include maximum tier...
    addDMERecipe(model, MetadataManager.getNextDataModelTier(tier))
}

void addDMERecipe(MetadataDataModel model, int tier) {
    def tierData = MetadataManager.getDataModelTierData(tier)
    if (!tierData.present || !tierData.get().canSimulate) return

    def modelPath = model.dataModelRegistryID
    def living = model.livingMatter
    def pristine = model.pristineMatter
    def eut = model.simulationRFCost / 4

    int chance = tierData.get().pristineChance

    mods.gregtech.dme_sim_chamber.recipeBuilder()
            .dataItem(item("deepmoblearning:${modelPath}"), tier)
            .input(item('deepmoblearning:polymer_clay').item)
            .output(living.item)
            .chancedOutput(pristine, chance * 100, 0) // Chanced Outputs are In Per 100 (100 = 1%)
            .EUt(eut as int)
            .duration(300)
            .buildAndRegister()
}
