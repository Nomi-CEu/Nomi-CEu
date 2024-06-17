import com.nomiceu.nomilabs.util.LabsModeHelper

/* Item Removals */
// Unobtainable Ores
void removeTrona(){
	mods.hei.removeAndHide(item('gregtech:ore_trona_0', 0)) // Trona Ore
	mods.hei.removeAndHide(item('gregtech:ore_trona_0', 1)) // Trona Ore
	mods.hei.removeAndHide(item('gregtech:ore_trona_0', 2)) // Trona Ore
	mods.hei.removeAndHide(item('gregtech:meta_dust_small', 2031)) // Small Dust
	mods.hei.removeAndHide(item('gregtech:meta_crushed_purified', 2031) // Purified Crushed Ore
	mods.hei.removeAndHide(item('gregtech:meta_crushed', 2031)) // Crushed Ore
	mods.hei.removeAndHide(item('gregtech:meta_dust_tiny', 2031)) // Tiny Dust
	mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged', 2031)) // Centrifuged Ore
	mods.hei.removeAndHide(item('gregtech:meta_dust_impure', 2031)) // Impure Dust
	mods.hei.removeAndHide(item('gregtech:meta_dust_pure', 2031 )) // Pure Dust
	mods.hei.removeAndHide(item('gregtech:meta_dust', 2031)) // Dust
	mods.hei.removeAndHide(item('gregtech:meta_crushed', 2031)) // Crushed Ore
}

void removeDarmstadite(){
	if (LabsModeHelper.normal) {
		mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0', 0)) // Darmstadite Ore
		mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0', 1)) // Darmstadite Ore
		mods.hei.removeAndHide(item('gregtech:ore_darmstadtite_0', 2)) // Darmstadite Ore
		mods.hei.removeAndHide(item('nomilabs:meta_crushed_purified', 110)) // Purified Crushed Ore
		mods.hei.removeAndHide(item('nomilabs:meta_dust_pure', 110)) // Pure Dust
		mods.hei.removeAndHide(item('nomilabs:meta_dust_small', 110)) // Small Dust
		mods.hei.removeAndHide(item('nomilabs:meta_dust_tiny', 110)) // Tiny Dust
		mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged', 110)) // Centrifuged Ore
		mods.hei.removeAndHide(item('gregtech:meta_crushed_purifie', 110)) // Crushed Purified Ore
		mods.hei.removeAndHide(item('nomilabs:meta_dust_impure', 110)) // Impure Dust
		mods.hei.removeAndHide(item('gregtech:meta_crushed', 110)) // Crushed Ore
		mods.hei.removeAndHide(item('nomilabs:meta_crushed', 110)) // Crushed Ore
		mods.hei.removeAndHide(item('nomilabs:meta_crushed_centrifuged', 110)) // Crushed Centrifuged Ore
		mods.hei.removeAndHide(item('nomilabs:meta_dust', 110)) // Dust
	}
}
	

void removePlutonium_239(){
	mods.hei.removeAndHide(item('gregtech:ore_plutonium_0', 0)) // Plutonium Ore
	mods.hei.removeAndHide(item('gregtech:ore_plutonium_0', 1)) // Plutonium Ore
	mods.hei.removeAndHide(item('gregtech:ore_plutonium_0', 2)) // Plutonium Ore
	mods.hei.removeAndHide(item('gregtech:meta_crushed', 81)) // Crushed Ore
	mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged', 81)) // Centrifuged Ore
	mods.hei.removeAndHide(item('gregtech:meta_dust_impure', 81)) // Impure Dust
	mods.hei.removeAndHide(item('gregtech:meta_crushed_purified', 81)) // Crushed Purified Ore
	mods.hei.removeAndHide(item('gregtech:meta_dust_pure', 81)) // Pure Dust
}

void removeCobalt(){
	mods.hei.removeAndHide(item('gregtech:ore_cobalt_0', 0)) // Cobalt Ore
	mods.hei.removeAndHide(item('gregtech:ore_cobalt_0', 1)) // Cobalt Ore
	mods.hei.removeAndHide(item('gregtech:ore_cobalt_0', 2)) // Cobalt Ore
	mods.hei.removeAndHide(item('gregtech:meta_crushed_purified', 23)) // Crushed Purified Ore
	mods.hei.removeAndHide(item('gregtech:meta_crushed', 23)) // Crushed Ore
	mods.hei.removeAndHide(item('gregtech:meta_crushed_centrifuged', 23)) // Centrifuged Ore	
}
void removeDenseOres(){
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

void removeUnobtainableVersions(){
	mods.hei.removeAndHide(item('gregtech:ore_aluminium_0', 1)) // Nether Aluminum Ore
	mods.hei.removeAndHide(item('gregtech:ore_beryllium_0', 2)) // End Beryllium Ore
	mods.hei.removeAndHide(item('gregtech:ore_iron_0', 1)) // Nether Iron Ore
	mods.hei.removeAndHide(item('gregtech:ore_iron_0', 2) // End Iron Ore
	mods.hei.removeAndHide(item('gregtech:ore_lead_0', 1)) // Nether Lead Ore
	mods.hei.removeAndHide(item('gregtech:ore_lead_0', 2) // End Lead Ore
	mods.hei.removeAndHide(item('gregtech:ore_lithium_0', 1) // Nether Lithium Ore
	mods.hei.removeAndHide(item('gregtech:ore_molybdenum_0', 2) // End Molybdenum Ore
	mods.hei.removeAndHide(item('gregtech:ore_neodymium_0', 2) // End Neodymium Ore		 
	mods.hei.removeAndHide(item('gregtech:ore_nickel_0', 1) // Nether Nickel Ore
	mods.hei.removeAndHide(item('gregtech:ore_nickel_0', 2) // End Nickel Ore
	mods.hei.removeAndHide(item('gregtech:ore_palladium_0', 1) // Nether Palladium Ore
	mods.hei.removeAndHide(item('gregtech:ore_platinum_0', 1) // Nether Platinum Ore
	mods.hei.removeAndHide(item('gregtech:ore_silver_0', 2) // End Silver Ore
	mods.hei.removeAndHide(item('gregtech:ore_sulfur_0', 2) // End Sulfur Ore
	mods.hei.removeAndHide(item('gregtech:ore_thorium_0', 2) // End Thorium Ore
	mods.hei.removeAndHide(item('gregtech:ore_tin_0', 2) // End Tin Ore
	mods.hei.removeAndHide(item('gregtech:ore_naquadah_0', 1) // Nether Naquadah Ore
	mods.hei.removeAndHide(item('gregtech:ore_naquadah_0', 2) // End Naquadah Ore
	mods.hei.removeAndHide(item('gregtech:ore_certus_quartz_0', 2) // End Certus Quartz Ore
	mods.hei.removeAndHide(item('gregtech:ore_almandine_0', 2) // End Almandine Ore
	mods.hei.removeAndHide(item('gregtech:ore_asbestos_0', 2) // End Asbestos Ore
	mods.hei.removeAndHide(item('gregtech:ore_asbestos_0', 1) // Nether Asbestos Ore
	mods.hei.removeAndHide(item('gregtech:ore_banded_iron_0', 2) // End Banded Iron Ore
	mods.hei.removeAndHide(item('gregtech:ore_blue_topaz_0', 0) // Overworld Blue Topaz Ore
	mods.hei.removeAndHide(item('gregtech:ore_blue_topaz_0', 2) // End Blue Topaz Ore
	mods.hei.removeAndHide(item('gregtech:ore_brown_limonite_0', 2) // End Brown Limonite Ore
	mods.hei.removeAndHide(item('gregtech:ore_calcite_0', 2) // End Calcite Ore
	mods.hei.removeAndHide(item('gregtech:ore_calcite_0', 1) // Nether Calcite Ore
	mods.hei.removeAndHide(item('gregtech:ore_cassiterite_sand_0', 1) // Nether Cassiterite Sand Ore
	mods.hei.removeAndHide(item('gregtech:ore_cassiterite_sand_0', 2) // End Cassiterite Sand Ore
	mods.hei.removeAndHide(item('gregtech:ore_chalcopyrite_0', 2) // End Chalcopyrite Ore
	mods.hei.removeAndHide(item('gregtech:ore_chalcopyrite_0', 1) // Nether Chalcopyrite Ore
	mods.hei.removeAndHide(item('gregtech:ore_chromite_0', 1) // Nether Chromite Ore
	mods.hei.removeAndHide(item('gregtech:ore_chromite_0', 0) // Overworld Chromite Ore
	mods.hei.removeAndHide(item('gregtech:ore_cinnabar_0', 2) // End Cinnabar Ore
	mods.hei.removeAndHide(item('gregtech:ore_coal_0', 2) // End Coal Ore
	mods.hei.removeAndHide(item('gregtech:ore_coal_0', 1) // Nether Coal Ore
	mods.hei.removeAndHide(item('gregtech:ore_cobaltite_0', 2) // End Cobaltite Ore
	mods.hei.removeAndHide(item('gregtech:ore_diamond_0', 2) // End Diamond Ore
	mods.hei.removeAndHide(item('gregtech:ore_diamond_0', 1) // Nether Diamond Ore
	mods.hei.removeAndHide(item('gregtech:ore_emerald_0', 2) // Nether Emerald Ore
	mods.hei.removeAndHide(item('gregtech:ore_galena_0', 1) // Nether Galena Ore
	mods.hei.removeAndHide(item('gregtech:ore_galena_0', 2) // End Galena Ore
	mods.hei.removeAndHide(item('gregtech:ore_garnierite_0', 2) // End Garnierite Ore
	mods.hei.removeAndHide(item('gregtech:ore_garnierite_0', 1) // Nether Garnierite Ore
	mods.hei.removeAndHide(item('gregtech:ore_green_sapphire_0', 1) // Nether Green Saphire Ore
	mods.hei.removeAndHide(item('gregtech:ore_green_sapphire_0', 2) // End Green Saphire Ore
	mods.hei.removeAndHide(item('gregtech:ore_grossular_0', 2) // End Grossular Ore
	mods.hei.removeAndHide(item('gregtech:ore_bauxite_0', 1) // Nether Bauxite Ore
	mods.hei.removeAndHide(item('gregtech:ore_lazurite_0', 1) // Nether Lazurite Ore
	mods.hei.removeAndHide(item('gregtech:ore_lazurite_0', 2) // End Lazurite Ore
	mods.hei.removeAndHide(item('gregtech:ore_magnesite_0', 1) // Nether Magnesite Ore
	mods.hei.removeAndHide(item('gregtech:ore_magnesite_0', 2) // End Magnesite Ore
	mods.hei.removeAndHide(item('gregtech:ore_magnetite_0', 1) // Nether Magnesite Ore
	mods.hei.removeAndHide(item('gregtech:ore_molybdenite_0', 2) // End Molybdenite Ore
	mods.hei.removeAndHide(item('gregtech:ore_powellite_0', 2) // End Powellite Ore
	mods.hei.removeAndHide(item('gregtech:ore_pyrite_0', 2) // End Pyrite Ore
	mods.hei.removeAndHide(item('gregtech:ore_pyrolusite_0', 2) // End Pyrolusite Ore
	mods.hei.removeAndHide(item('gregtech:ore_pyrope_0', 2) // End Pyrope Ore
	mods.hei.removeAndHide(item('gregtech:ore_pyrope_0', 1) // Nether Pyrope Ore
	mods.hei.removeAndHide(item('gregtech:ore_rock_salt_0', 2) // End Rock Salt Ore
	mods.hei.removeAndHide(item('gregtech:ore_rock_salt_0', 1) // Nether Rock Salt Ore
	mods.hei.removeAndHide(item('gregtech:ore_ruby_0', 2) // End Ruby Ore
	mods.hei.removeAndHide(item('gregtech:ore_salt_0', 2) // End Salt Ore
	mods.hei.removeAndHide(item('gregtech:ore_salt_0', 1) // Nether Salt Ore
	mods.hei.removeAndHide(item('gregtech:ore_saltpeter_0', 2) // End Saltpeter Ore
	mods.hei.removeAndHide(item('gregtech:ore_sapphire_0', 2) // End Sapphire Ore
	mods.hei.removeAndHide(item('gregtech:ore_sodalite_0', 2) // End Sodalite Ore
	mods.hei.removeAndHide(item('gregtech:ore_sodalite_0', 1) // Nether Sodalite Ore
	
	
	
	
	
if (LabsModeHelper.expert) {
	mods.hei.removeAndHide(item('gregtech:ore_lithium_0', 0) // Overworld Lithium Ore
	mods.hei.removeAndHide(item('gregtech:ore_neodymium_0', 0) // Overworld Neodyminum Ore
	mods.hei.removeAndHide(item('gregtech:ore_platinum_0', 0) // Overworld Platinum Ore
	mods.hei.removeAndHide(item('gregtech:ore_sulfur_0', 0) // Overworld Sulfur Ore
	mods.hei.removeAndHide(item('gregtech:ore_thorium_0', 0) // Overworld Thorium Ore
	mods.hei.removeAndHide(item('gregtech:ore_naquadah_0', 0) // Overworld Naquadah Ore
	mods.hei.removeAndHide(item('gregtech:ore_cobaltite_0', 1) // Nether Cobaltite Ore
	mods.hei.removeAndHide(item('gregtech:ore_sheldonite_0', 0) // Overworld Sheldonite Ore
	mods.hei.removeAndHide(item('gregtech:ore_powellite_0', 0) // Overworld Powellite Ore
	mods.hei.removeAndHide(item('gregtech:ore_saltpeter_0', 0) // Overworld Saltpeter Ore
	
	}	
if (LabsModeHelper.normal){
	mods.hei.removeAndHide(item('gregtech:ore_sheldonite_0', 1) // Nether Sheldonite Ore
	


	
}		       
}			       
			       
removeTrona()
removeDarmstadite()
removePlutonium_239()
removeCobalt()
removeDenseOres()
removeUnobtainableVersions()			       

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
