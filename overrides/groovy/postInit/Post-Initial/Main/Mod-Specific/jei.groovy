import com.nomiceu.nomilabs.util.LabsModeHelper

/* Item Removals */

// AR
mods.hei.removeAndHide(item('advancedrocketry:crystal:*')) // Random Crystal Blocks
mods.hei.removeAndHide(item('densemetals:dense_platinum_ore')) //Dense Platinum ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged:81')) // Centrifuged Ore
mods.hei.removeAndHide(item('gregtech:ore_trona_0')) //trona ore
mods.hei.removeAndHide(item('gregtech:meta_dust_small:2031')) // small dust
mods.hei.removeAndHide(item('densemetals:dense_diamond_ore')) //Dense Diamond ore
mods.hei.removeAndHide(item('densemetals:dense_quartz_ore')) // dense quartz ore
mods.hei.removeAndHide(item('densemetals:dense_copper_ore')) // dense copper ore
mods.hei.removeAndHide(item('nomilabs:meta_crushed_purified')) // purified crushed ore
mods.hei.removeAndHide(item('nomilabs:meta_dust_pure:110;')) // pure dust
mods.hei.removeAndHide(item('densemetals:dense_thorium_ore')) // dense thorium ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:2031')) // purified crushed ore
mods.hei.removeAndHide(item('nomilabs:meta_dust_small:110')) // small dust
mods.hei.removeAndHide(item('gregtech:meta_crushed:2031;')) // crushed ore
mods.hei.removeAndHide(item('densemetals:dense_emerald_ore')) // dense emerald ore
mods.hei.removeAndHide(item('densemetals:dense_plutonium_ore')) // dense plutonium ore
mods.hei.removeAndHide(item('gregtech:meta_dust_tiny:2031')) // tiny dust
mods.hei.removeAndHide(item('nomilabs:meta_dust_impure:110')) // impure dust
mods.hei.removeAndHide(item('densemetals:dense_lapis_ore')) // dense lapis ore
mods.hei.removeAndHide(item('densemetals:dense_lead_ore')) // dense lead ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged:2031')) // centrifuged ore
mods.hei.removeAndHide(item('densemetals:dense_silver_ore')) // dense silver ore
mods.hei.removeAndHide(item('densemetals:dense_iridium_ore')) // dense iridium ore
mods.hei.removeAndHide(item('nomilabs:meta_dust_tiny:110')) // tiny dust
mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0')) // darmstadite ore
mods.hei.removeAndHide(item('gregtech:meta_crushed:81')) // crushed ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:81')) // crushed purified ore
mods.hei.removeAndHide(item('densemetals:dense_aluminum_ore')) // dense aluminum ore 
mods.hei.removeAndHide(item('gregtech:meta_dust_impure:81')) // impure dust
mods.hei.removeAndHide(item('gregtech:ore_plutonium_0')) // plutonium ore
mods.hei.removeAndHide(item('densemetals:dense_redstone_ore')) // dense redstone ore
mods.hei.removeAndHide(item('gregtech:meta_crushed:23')) // crushed ore
mods.hei.removeAndHide(item('gregtech:meta_dust_impure:2031')) // impure dust
mods.hei.removeAndHide(item('densemetals:dense_mithril_ore')) // dense mithrill ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:23')) // crushed purified ore
mods.hei.removeAndHide(item('gregtech:meta_dust_pure:2031')) // pure dust
mods.hei.removeAndHide(item('densemetals:dense_nickel_ore')) // dense nickel ore
mods.hei.removeAndHide(item('densemetals:dense_tin_ore')) // dense tin ore
mods.hei.removeAndHide(item('gregtech:meta_dust_pure:81')) // pure dust
mods.hei.removeAndHide(item('densemetals:dense_beryllium_ore')) // dense beryllium ore
mods.hei.removeAndHide(item('densemetals:dense_gold_ore')) // 
mods.hei.removeAndHide(item('nomilabs:meta_crushed')) // crushed ore
mods.hei.removeAndHide(item('nomilabs:meta_crushed_centrifuged')) // crushed centrifuged ore
mods.hei.removeAndHide(item('nomilabs:meta_dust:110')) // dust
mods.hei.removeAndHide(item('densemetals:dense_rutile_ore')) // dense rutile ore
mods.hei.removeAndHide(item('gregtech:meta_dust:2031')) // dust




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
