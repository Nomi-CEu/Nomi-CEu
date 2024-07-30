import nc.enumm.MetaEnums

import static com.nomiceu.nomilabs.groovy.NCActiveCoolerHelper.changeCoolerRecipe

// Change Active Cooler Recipe from NC Helium -> GT Liquid Helium
changeCoolerRecipe(fluid('liquid_helium'), MetaEnums.CoolerType.HELIUM)
