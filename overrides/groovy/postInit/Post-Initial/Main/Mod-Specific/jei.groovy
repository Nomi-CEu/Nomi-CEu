import com.nomiceu.nomilabs.util.LabsModeHelper

/* Item Removals */

// AR
mods.hei.removeAndHide(item('advancedrocketry:crystal:*')) // Random Crystal Blocks

/* Remove Categories (Appear Randomly after /gs reload) */

// EIO
mods.hei.hideCategory("CombustionGenerator")
mods.hei.hideCategory("Enchanter")
mods.hei.hideCategory("GrindingBall")
mods.hei.hideCategory("SagMill")
mods.hei.hideCategory("SolarPanel")
mods.hei.hideCategory("StirlingGenerator")

// AR
mods.hei.hideCategory("zmaster587.AR.rollingMachine")
mods.hei.hideCategory("zmaster587.AR.lathe")
mods.hei.hideCategory("zmaster587.AR.precisionAssembler")
mods.hei.hideCategory("zmaster587.AR.sawMill")
mods.hei.hideCategory("zmaster587.AR.chemicalReactor")
mods.hei.hideCategory("zmaster587.AR.crystallizer")
mods.hei.hideCategory("zmaster587.AR.electrolyzer")
mods.hei.hideCategory("zmaster587.AR.arcFurnace")
mods.hei.hideCategory("zmaster587.AR.platePresser")
mods.hei.hideCategory("zmaster587.AR.centrifuge")

// Hide Mob Category for HM (Its Peaceful Locked)
if (LabsModeHelper.expert) {
    mods.jei.hideCategory("jeresources.mob")
}
