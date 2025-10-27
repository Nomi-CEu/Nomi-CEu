// SIDE: CLIENT
// ^, JEI Category Removals affects Client Only

package post.main.mod.jei

import com.nomiceu.nomilabs.util.LabsModeHelper

/* Category Removals (Some appear randomly after /gs reload) */
mods.jei.category.with {
    // Avatitia
    hideCategory('Avatitia.Extreme')

    // DME
    if (LabsModeHelper.expert) {
        hideCategory('deepmoblearning.simulation_chamber')
        hideCategory('deepmoblearning.extraction_chamber')
        hideCategory('deepmoblearning.trial_keystone')
    }

    // EIO
    hideCategory('CombustionGenerator')
    hideCategory('GrindingBall')
    hideCategory('SagMill')
    hideCategory('SolarPanel')
    hideCategory('StirlingGenerator')
    hideCategory('LavaGenerator')

    // AR
    hideCategory('zmaster587.AR.rollingMachine')
    hideCategory('zmaster587.AR.lathe')
    hideCategory('zmaster587.AR.precisionAssembler')
    hideCategory('zmaster587.AR.sawMill')
    hideCategory('zmaster587.AR.chemicalReactor')
    hideCategory('zmaster587.AR.crystallizer')
    hideCategory('zmaster587.AR.electrolyzer')
    hideCategory('zmaster587.AR.arcFurnace')
    hideCategory('zmaster587.AR.platePresser')
    hideCategory('zmaster587.AR.centrifuge')

    // Armor Plus
    hideCategory('armorplus:lava_infuser_infusing')
    hideCategory('armorplus:high_tech_bench')
    hideCategory('armorplus:ulti_tech_bench')
    hideCategory('armorplus:workbench')

    // Vanilla
    if (LabsModeHelper.expert) {
        hideCategory('jeresources.mob')
    }
}
