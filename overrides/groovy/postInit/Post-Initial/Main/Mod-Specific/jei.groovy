import com.nomiceu.nomilabs.util.LabsModeHelper

/* Item Removals */
//Unobtainable Ores
void Remove_Trona(){
mods.hei.removeAndHide(item('gregtech:ore_trona_0', 0)) //Trona Ore
mods.hei.removeAndHide(item('gregtech:ore_trona_0', 1)) //Trona Ore
mods.hei.removeAndHide(item('gregtech:ore_trona_0', 2)) //Trona Ore
mods.hei.removeAndHide(item('gregtech:meta_dust_small:2031')) // Small Dust
mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:2031')) // Purified Crushed Ore
mods.hei.removeAndHide(item('gregtech:meta_crushed:2031;')) // Crushed Ore
mods.hei.removeAndHide(item('gregtech:meta_dust_tiny:2031')) // Tiny Dust
mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged:2031')) // Centrifuged Ore
mods.hei.removeAndHide(item('gregtech:meta_dust_impure:2031')) // Impure Dust
mods.hei.removeAndHide(item('gregtech:meta_dust_pure:2031')) // Pure Dust
mods.hei.removeAndHide(item('gregtech:meta_dust:2031')) // Dust
mods.hei.removeAndHide(item('gregtech:meta_crushed:2031')) // Crushed Ore
}

void Remove_Darmstadite(){
if (LabsModeHelper.normal) {
mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0', 0)) // Darmstadite Ore
mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0', 1)) // Darmstadite Ore
mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0', 2)) // Darmstadite Ore
mods.hei.removeAndHide(item('nomilabs:meta_crushed_purified', 110)) // Purified Crushed Ore
mods.hei.removeAndHide(item('nomilabs:meta_dust_pure:110')) // Pure Dust
mods.hei.removeAndHide(item('nomilabs:meta_dust_small:110')) // Small Dust
mods.hei.removeAndHide(item('nomilabs:meta_dust_tiny:110')) // Tiny Dust
mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged:110')) // Centrifuged Ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:110')) // Crushed Purified Ore
mods.hei.removeAndHide(item('nomilabs:meta_dust_impure:110')) // Impure Dust
mods.hei.removeAndHide(item('gregtech:meta_crushed:110')) // Crushed Ore
mods.hei.removeAndHide(item('nomilabs:meta_crushed', 110)) // Crushed Ore
mods.hei.removeAndHide(item('nomilabs:meta_crushed_centrifuged', 110)) // Crushed Centrifuged Ore
mods.hei.removeAndHide(item('nomilabs:meta_dust:110')) // Dust
        }
}
	

void Remove_Plutonium_239(){
mods.hei.removeAndHide(item('gregtech:ore_plutonium_0', 0)) // Plutonium Ore
mods.hei.removeAndHide(item('gregtech:ore_plutonium_0', 1)) // Plutonium Ore
mods.hei.removeAndHide(item('gregtech:ore_plutonium_0', 2)) // Plutonium Ore
mods.hei.removeAndHide(item('gregtech:meta_crushed:81')) // Crushed Ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged:81')) // Centrifuged Ore
mods.hei.removeAndHide(item('gregtech:meta_dust_impure:81')) // Impure Dust
mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:81')) // Crushed Purified Ore
mods.hei.removeAndHide(item('gregtech:meta_dust_pure:81')) // Pure Dust
}

void Remove_Cobalt(){

mods.hei.removeAndHide(item('gregtech:meta_crushed_purified:23')) // Crushed Purified Ore
mods.hei.removeAndHide(item('gregtech:meta_crushed:23')) // Crushed Ore
mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged:23')) // Centrifuged Ore
mods.hei.removeAndHide(item('gregtech:ore_cobalt_0', 0)) // Cobalt Ore
mods.hei.removeAndHide(item('gregtech:ore_cobalt_0', 1)) // Cobalt Ore
mods.hei.removeAndHide(item('gregtech:ore_cobalt_0', 2)) // Cobalt Ore
	
}
void Remove_Dense_Ores(){
mods.hei.removeAndHide(item('densemetals:dense_platinum_ore')) // Dense Platinum Ore
mods.hei.removeAndHide(item('densemetals:dense_quartz_ore')) // Dense Quartz Ore
mods.hei.removeAndHide(item('densemetals:dense_copper_ore')) // Dense Copper Ore
mods.hei.removeAndHide(item('densemetals:dense_thorium_ore')) // Dense Thorium Ore
mods.hei.removeAndHide(item('densemetals:dense_plutonium_ore')) // Dense Plutonium Ore
mods.hei.removeAndHide(item('densemetals:dense_lead_ore')) // Dense Lead Ore
mods.hei.removeAndHide(item('densemetals:dense_silver_ore')) // Dense Silver Ore
mods.hei.removeAndHide(item('densemetals:dense_iridium_ore')) // Dense Iridium Ore
mods.hei.removeAndHide(item('densemetals:dense_aluminum_ore')) // Dense Aluminum Ore
mods.hei.removeAndHide(item('densemetals:dense_mithril_ore')) // Dense Mithrill Ore
mods.hei.removeAndHide(item('densemetals:dense_nickel_ore')) // Dense Nickel Ore
mods.hei.removeAndHide(item('densemetals:dense_tin_ore')) // Dense Tin Ore
mods.hei.removeAndHide(item('densemetals:dense_beryllium_ore')) // Dense Beryllium Ore
mods.hei.removeAndHide(item('densemetals:dense_gold_ore')) // Dense Gold Ore
mods.hei.removeAndHide(item('densemetals:dense_rutile_ore')) // Dense Rutile Ore	
}
Remove_Trona()
Remove_Darmstadite()
Remove_Plutonium_239()
Remove_Cobalt()
Remove_Dense_Ores()
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
