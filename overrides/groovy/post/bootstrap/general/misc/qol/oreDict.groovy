package post.bootstrap.general.misc.qol

import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import com.cleanroommc.groovyscript.api.IIngredient


import static gregtech.api.GTValues.*

void disableOreDicts(Map<OreDictIngredient, List<ItemStack>> toDisable) {
    toDisable.forEach { OreDictIngredient oredict, List<ItemStack> items ->
        for (var item : items) {
            mods.jei.ingredient.removeAndHide(item)
            oredict.remove(item)
        }
    }
}

//FIXME: Should we really be doing JEI removals here???

log.info('-------------- Ore Dictionary Start --------------')

ore_dict.add('ingotRedstoneAlloy', metaitem('ingotRedAlloy'))
ore_dict.add('nuggetRedstoneAlloy', metaitem('nuggetRedAlloy'))
ore_dict.add('blockRedstoneAlloy', metaitem('blockRedAlloy'))

//////////////////////////////
//            Blocks          //
//////////////////////////////

def blocksDisabled = [
    (ore('blockAluminum')) : [
        item('thermalfoundation:storage', 4),
        item('libvulpes:metal0', 9),
        item('nuclearcraft:ingot_block', 12)
    ],

    (ore('blockDraconiumAwakened')) : [
        item('draconicevolution:draconic_block')
    ],

    (ore('blockBeryllium')) : [
        item('nuclearcraft:ingot_block', 9)
    ],

    (ore('blockBronze')) : [
        item('thermalfoundation:storage_alloy', 3)
    ],

    (ore('blockCopper')) : [
        item('thermalfoundation:storage'),
        item('libvulpes:metal0', 4)
    ],

    (ore('blockCharcoal')) : [
        item('actuallyadditions:block_misc', 5)
    ],

    (ore('blockConductiveIron')) : [
        item('enderio:block_alloy', 4)
    ],

    (ore('blockCrystalMatrix')) : [
        item('avaritia:block_resource', 2)
    ],

    (ore('blockDarkSteel')) : [
        item('enderio:block_alloy', 6)
    ],

    (ore('blockDraconium')) : [
        item('draconicevolution:draconium_block')
    ],

    (ore('blockElectrum')) : [
        item('thermalfoundation:storage_alloy', 1)
    ],

    (ore('blockElectrumFlux')) : [
        item('redstonearsenal:storage')
    ],

    (ore('blockElectricalSteel')) : [
        item('enderio:block_alloy')
    ],

    (ore('blockEndSteel')) : [
        item('enderio:block_alloy', 8)
    ],

    (ore('blockEnderium')) : [
        item('thermalfoundation:storage_alloy', 7)
    ],

    (ore('blockEnergeticAlloy')) : [
        item('enderio:block_alloy', 1)
    ],

    (ore('blockGraphite')) : [
        item('nuclearcraft:ingot_block', 8)
    ],

    (ore('blockInvar')) : [
        item('thermalfoundation:storage_alloy', 2)
    ],

    (ore('blockIridium')) : [
        item('thermalfoundation:storage', 7),
        item('libvulpes:metal0', 10)
    ],

    (ore('blockLead')) : [
        item('thermalfoundation:storage', 3)
    ],

    (ore('blockLumium')) : [
        item('thermalfoundation:storage_alloy', 6)
    ],

    (ore('blockManganese')) : [
        item('nuclearcraft:ingot_block', 11)
    ],

    (ore('blockNickel')) : [
        item('thermalfoundation:storage', 5)
    ],

    (ore('blockNeutronium')) : [
        item('avaritia:block_resource')
    ],

    (ore('blockNetherstar')) : [
        item('extendedcrafting:storage', 2)
    ],

    (ore('blockPlatinum')) : [
        item('thermalfoundation:storage', 6)
    ],

    (ore('blockSignalum')) : [
        item('thermalfoundation:storage_alloy', 5)
    ],

    (ore('blockSilver')) : [
        item('thermalfoundation:storage', 2),
        item('nuclearcraft:ingot_block', 13)
    ],

    (ore('blockSteel')) : [
        item('thermalfoundation:storage_alloy'),
        item('libvulpes:metal0', 6)
    ],

    (ore('blockPulsatingIron')) : [
        item('enderio:block_alloy', 5)
    ],

    (ore('blockTin')) : [
        item('thermalfoundation:storage', 1),
        item('libvulpes:metal0', 5)
    ],
    (ore('blockTin')) : [
        item('thermalfoundation:storage', 1),
        item('libvulpes:metal0', 5)
    ],

    (ore('blockVibrantAlloy')) : [
        item('enderio:block_alloy', 2)
    ],

    (ore('blockTitanium')) : [
        item('libvulpes:metal0', 7)
    ],

    (ore('blockFuelCoke')) : [
        item('thermalfoundation:storage_resource', 1)
    ],

    (ore('blockSoularium')) : [
        item('enderio:block_alloy', 7)
    ],
]

disableOreDicts(blocksDisabled)

mods.jei.ingredient.removeAndHide(item('enderio:block_alloy_endergy', 5))

ore('blockWarpCoreRim').add(item('gregtech:meta_block_compressed_7', 1))
ore('fusedGlass').add(item('gregtech:transparent_casing'))
ore('blockSkystone').add(item('appliedenergistics2:sky_stone_block'))

ore('cropFlax').remove(item('minecraft:string'))

//////////////////////////////
//            Dusts           //
//////////////////////////////

def dustsDisabled = [

    (ore('dustAluminium')) : [
        item('thermalfoundation:material', 68),
        item('nuclearcraft:dust', 12)
    ],

    (ore('dustAluminum')) : [
        item('libvulpes:productdust', 9),
        item('thermalfoundation:material', 68)
    ],

    (ore('dustBeryllium')) : [
        item('nuclearcraft:dust', 9)
    ],

    (ore('dustBronze')) : [
        item('thermalfoundation:material', 99)
    ],

    (ore('dustCertusQuartz')) : [
        item('appliedenergistics2:material', 2)
    ],
    (ore('dustCharcoal')) : [
        item('thermalfoundation:material', 769)
    ],

    (ore('dustCoal')) : [
        item('enderio:item_material', 23),
        item('actuallyadditions:item_dust', 6),
        item('thermalfoundation:material', 768),
        item('nuclearcraft:gem_dust', 7)
    ],

    (ore('dustCobalt')) : [
        item('enderio:item_material', 31)
    ],

    (ore('dustConstantan')) : [
        item('thermalfoundation:material', 100)
    ],

    (ore('dustCopper')) : [
        item('enderio:item_material', 26),
        item('libvulpes:productdust', 4),
        item('thermalfoundation:material', 64)
    ],

    (ore('dustDiamond')) : [
        item('actuallyadditions:item_dust', 2),
        item('nuclearcraft:gem_dust')
    ],

    (ore('dustDraconium')) : [
        item('draconicevolution:draconium_dust')
    ],

    (ore('dustElectrum')) : [
        item('thermalfoundation:material', 97)
    ],

    (ore('dustElectrumFlux')) : [
        item('redstonearsenal:material')
    ],

    (ore('dustEnderium')) : [
        item('thermalfoundation:material', 103)
    ],

    (ore('dustEnderPearl')) : [
        item('appliedenergistics2:material', 46),
        item('appliedenergistics2:material', 46)
    ],

    (ore('dustEmerald')) : [
        item('actuallyadditions:item_dust', 3)
    ],

    (ore('dustFluix')) : [
    ],

    (ore('dustGraphite')) : [
        item('nuclearcraft:dust', 8)
    ],

    (ore('dustGold')) : [
        item('actuallyadditions:item_dust', 1),
        item('appliedenergistics2:material', 51),
        item('enderio:item_material', 25),
        item('libvulpes:productdust', 2),
        item('thermalfoundation:material', 1),
    ],

    (ore('dustIron')) : [
        item('libvulpes:productdust', 1),
        item('enderio:item_material', 24),
        item('actuallyadditions:item_dust'),
        item('appliedenergistics2:material', 49),
        item('thermalfoundation:material')
    ],

    (ore('dustLapis')) : [
        item('actuallyadditions:item_dust', 4),
        item('enderio:item_material', 32)
    ],

    (ore('dustLead')) : [
        item('thermalfoundation:material', 67)
    ],

    (ore('dustLumium')) : [
        item('thermalfoundation:material', 102)
    ],

    (ore('dustInvar')) : [
        item('thermalfoundation:material', 98)
    ],

    (ore('dustIridium')) : [
        item('libvulpes:productdust', 10),
        item('thermalfoundation:material', 71)
    ],

    (ore('dustManganese')) : [
        item('nuclearcraft:dust', 11)
    ],

    (ore('dustNetherQuartz')) : [
        item('enderio:item_material', 33),
        item('actuallyadditions:item_dust', 5),
        item('appliedenergistics2:material', 3),
        item('nuclearcraft:gem_dust', 2)
    ],

    (ore('dustNickel')) : [
        item('thermalfoundation:material', 69)
    ],

    (ore('dustObsidian')) : [
        item('enderio:item_material', 29),
        item('thermalfoundation:material', 770),
        item('nuclearcraft:gem_dust', 3)
    ],

    (ore('dustPlatinum')) : [
        item('thermalfoundation:material', 70)
    ],

    (ore('dustQuartz')) : [
        item('appliedenergistics2:material', 3),
        item('actuallyadditions:item_dust', 5)
    ],

    (ore('dustPlutonium')) : [
    ],

    (ore('dustSaltpeter')) : [
        item('thermalfoundation:material', 772)
    ],

    (ore('dustSignalum')) : [
        item('thermalfoundation:material', 101)
    ],

    (ore('dustSilver')) : [
        item('thermalfoundation:material', 66),
        item('nuclearcraft:dust', 13)
    ],

    (ore('dustSilicon')) : [
        item('libvulpes:productdust', 3)
    ],

    (ore('dustSodiumHydroxide')) : [
        item('nuclearcraft:compound', 5)
    ],

    (ore('dustSteel')) : [
        item('libvulpes:productdust', 6),
        item('thermalfoundation:material', 96)
    ],

    (ore('dustSulfur')) : [
        item('thermalfoundation:material', 771),
        item('nuclearcraft:gem_dust', 6)
    ],

    (ore('dustTin')) : [
        item('enderio:item_material', 27),
        item('libvulpes:productdust', 5),
        item('thermalfoundation:material', 65)
    ],

    (ore('dustTitanium')) : [
        item('libvulpes:productdust', 7)
    ],

    (ore('dustWood')) : [
        item('thermalfoundation:material', 800)
    ],

    (ore('itemSawdust')) : [
        item('thermalfoundation:material', 800)
    ],

    (ore('dustEndstone')) : [
        item('nuclearcraft:gem_dust', 11)
    ],

    (ore('dustSoularium')) : [
        item('enderio:item_material', 74)
    ],
]

disableOreDicts(dustsDisabled)

ore("dustMoon").add(item("nomilabs:moondust"))

//////////////////////////////
//            Gems            //
//////////////////////////////

def gemsDisabled = [
    (ore('gemSapphire')) : [
    ]
]

disableOreDicts(gemsDisabled)

//////////////////////////////
//            Ingots          //
//////////////////////////////

def ingotsDisabled = [

    (ore('ingotAluminium')) : [
        item('thermalfoundation:material', 132),
        item('nuclearcraft:ingot', 12)
    ],

    (ore('ingotAluminum')) : [
        item('libvulpes:productingot', 9),
        item('thermalfoundation:material', 132)
    ],

    (ore('ingotDraconiumAwakened')) : [
        item('draconicevolution:draconic_ingot')
    ],

    (ore('ingotBeryllium')) : [
        item('nuclearcraft:ingot', 9)
    ],

    (ore('ingotBronze')) : [
        item('thermalfoundation:material', 163),
        item('nuclearcraft:alloy')
    ],

    (ore('ingotCobalt')) : [
    ],

    (ore('ingotConductiveIron')) : [
        item('enderio:item_alloy_ingot', 4)
    ],

    (ore('ingotCopper')) : [
        item('libvulpes:productingot', 4),
        item('thermalfoundation:material', 128),
        item('projectred-core:resource_item', 100)
    ],

    (ore('ingotCrystalMatrix')) : [
        item('avaritia:resource', 1)
    ],

    (ore('ingotDarkSteel')) : [
        item('enderio:item_alloy_ingot', 6)
    ],

    (ore('ingotDraconium')) : [
        item('draconicevolution:draconium_ingot')
    ],

    (ore('ingotElectricalSteel')) : [
        item('enderio:item_alloy_ingot')
    ],

    (ore('ingotElectrum')) : [
        item('thermalfoundation:material', 161)
    ],

    (ore('ingotElectrumFlux')) : [
        item('redstonearsenal:material', 32)
    ],

    (ore('ingotEnderium')) : [
        item('thermalfoundation:material', 167)
    ],

    (ore('ingotEndSteel')) : [
        item('enderio:item_alloy_ingot', 8)
    ],

    (ore('ingotEnergeticAlloy')) : [
        item('enderio:item_alloy_ingot', 1)
    ],

    (ore('ingotGraphite')) : [
        item('nuclearcraft:ingot', 8)
    ],

    (ore('ingotLead')) : [
        item('thermalfoundation:material', 131)
    ],

    (ore('ingotLumium')) : [
        item('thermalfoundation:material', 166)
    ],

    (ore('ingotOsmiridium')) : [
    ],

    (ore('ingotIridium')) : [
        item('libvulpes:productingot', 10),
        item('thermalfoundation:material', 135)
    ],

    (ore('ingotInfinity')) : [
    ],

    (ore('ingotInvar')) : [
        item('thermalfoundation:material', 162)
    ],

    (ore('ingotManganese')) : [
        item('nuclearcraft:ingot', 11)
    ],

    (ore('ingotNeutronium')) : [
        item('avaritia:resource', 4)
    ],

    (ore('ingotNickel')) : [
        item('thermalfoundation:material', 133)
    ],

    (ore('ingotPlatinum')) : [
        item('thermalfoundation:material', 134)
    ],

    (ore('ingotPlutonium')) : [
    ],

    (ore('ingotPulsatingIron')) : [
        item('enderio:item_alloy_ingot', 5)
    ],

    (ore('ingotRedstoneAlloy')) : [
        item('enderio:item_alloy_ingot', 3),
        item('projectred-core:resource_item', 103)
    ],

    (ore('ingotRedAlloy')) : [
        item('projectred-core:resource_item', 103)
    ],

    (ore('ingotSignalum')) : [
        item('thermalfoundation:material', 165)
    ],

    (ore('ingotSoularium')) : [
        item('enderio:item_alloy_ingot', 7)
    ],

    (ore('ingotTin')) : [
        item('libvulpes:productingot', 5),
        item('thermalfoundation:material', 129),
        item('projectred-core:resource_item', 101)
    ],

    (ore('ingotTitanium')) : [
        item('libvulpes:productingot', 7)
    ],

    (ore('ingotThorium')) : [
        item('nuclearcraft:ingot', 3)
    ],

    (ore('ingotSilver')) : [
        item('thermalfoundation:material', 130),
        item('nuclearcraft:ingot', 13),
        item('projectred-core:resource_item', 102)
    ],

    (ore('ingotSilicon')) : [
        item('libvulpes:productingot', 3)
    ],

    (ore('ingotSignalum')) : [
        item('thermalfoundation:material', 165)
    ],

    (ore('ingotSteel')) : [
        item('libvulpes:productingot', 6),
        item('thermalfoundation:material', 160),
        item('nuclearcraft:alloy', 5)
    ],

    (ore('ingotVibrantAlloy')) : [
        item('enderio:item_alloy_ingot', 2)
    ],
]

disableOreDicts(ingotsDisabled)

////////////////////////
//         Sticks       //
////////////////////////

def sticksDisabled = [

    (ore('stickIron')) : [
        item('libvulpes:productrod', 1)
    ],

    (ore('stickCopper')) : [
        item('libvulpes:productrod', 4)
    ],

    (ore('stickPlutonium')) : [
    ],

    (ore('stickSteel')) : [
        item('libvulpes:productrod', 6)
    ],

    (ore('stickTitanium')) : [
        item('libvulpes:productrod', 7)
    ],

    (ore('stickIridium')) : [
        item('libvulpes:productrod', 10)
    ],
]

disableOreDicts(sticksDisabled)

////////////////////////////
//         Nuggets          //
////////////////////////////

def nuggetsDisabled = [
    (ore('nuggetAluminium')) :[
        item('thermalfoundation:material', 196),
        item('libvulpes:productnugget', 9),

    ],

    (ore('nuggetAluminum')) : [
        item('thermalfoundation:material', 196),
        item('libvulpes:productnugget', 9)
    ],

    (ore('nuggetBronze')) : [
        item('thermalfoundation:material', 227)
    ],

    (ore('nuggetCopper')) : [
        item('thermalfoundation:material', 192),
        item('libvulpes:productnugget', 4)
    ],

    (ore('nuggetDraconium')) : [
        item('draconicevolution:nugget')
    ],

    (ore('nuggetDraconiumAwakened')) : [
        item('draconicevolution:nugget', 1)
    ],

    (ore('nuggetElectrum')) : [
        item('thermalfoundation:material', 225)
    ],

    (ore('nuggetElectrumFlux')) : [
        item('redstonearsenal:material', 64)
    ],

    (ore('nuggetEnderium')) : [
        item('thermalfoundation:material', 231)
    ],

    (ore('nuggetInvar')) : [
        item('thermalfoundation:material', 226),
    ],

    (ore('nuggetIridium')) : [
        item('thermalfoundation:material', 199),
        item('libvulpes:productnugget', 10)
    ],

    (ore('nuggetLumium')) : [
        item('thermalfoundation:material', 230)
    ],

    (ore('nuggetPlutonium')) : [
    ],

    (ore('nuggetSignalum')) : [
        item('thermalfoundation:material', 229)
    ],

    (ore('nuggetTin')) : [
        item('libvulpes:productnugget', 5)
    ],

    (ore('nuggetTitanium')) : [
        item('libvulpes:productnugget', 7)
    ],

    (ore('nuggetNeutronium')) : [
        item('avaritia:resource', 3),
    ],

    (ore('nuggetNickel')) : [
        item('thermalfoundation:material', 197),
    ],

    (ore('nuggetPlatinum')) : [
        item('thermalfoundation:material', 198)
    ],

    (ore('nuggetSteel')) : [
        item('thermalfoundation:material', 224),
        item('libvulpes:productnugget', 9),
        item('libvulpes:productnugget', 6)
    ],

    (ore('nuggetEnergeticAlloy')) : [
        item('enderio:item_alloy_nugget', 1)
    ],

    (ore('nuggetConductiveIron')) : [
        item('enderio:item_alloy_nugget', 4)
    ],

    (ore('nuggetEndSteel')) : [
        item('enderio:item_alloy_nugget', 8)
    ],

    (ore('nuggetSoularium')) : [
        item('enderio:item_alloy_nugget', 7)
    ],
]

disableOreDicts(nuggetsDisabled)

////////////////////////////
//            Ores          //
////////////////////////////

def oresDisabled = [

    (ore('oreAluminium')) : [
        item('libvulpes:ore0', 9)
        ],

    (ore('oreAluminum')) : [
        item('libvulpes:ore0', 9)
    ],

    (ore('oreCopper')) : [
        item('libvulpes:ore0', 4)
    ],

    (ore('oreIridium')) : [
        item('libvulpes:ore0', 10)
    ],

    (ore('oreLead')) : [
        item('thermalfoundation:ore', 3)
    ],

    (ore('orePlatinum')) : [
        item('thermalfoundation:ore', 6)
    ],

    (ore('oreRutile')) : [
        item('libvulpes:ore0', 8)
    ],
    (ore('oreTin')) : [
        item('libvulpes:ore0', 5)
    ],

    (ore('oreTitanium')) : [
        item('libvulpes:ore0', 8)
    ],

    (ore('oreSilver')) : [
        item('thermalfoundation:ore', 2)
    ],

]

disableOreDicts(oresDisabled)

//////////////////////////////
//            Plates          //
//////////////////////////////

def platesDisabled = [

    (ore('plateAluminum')) : [
        item('libvulpes:productplate', 9),
        item('thermalfoundation:material', 324)
    ],

    (ore('plateBronze')) : [
        item('thermalfoundation:material', 355)
    ],

    (ore('plateConstantan')) : [
        item('thermalfoundation:material', 356)
    ],

    (ore('plateCopper')) : [
        item('libvulpes:productplate', 4),
        item('thermalfoundation:material', 320)
    ],

    (ore('plateElectrum')) : [
        item('thermalfoundation:material', 353)
    ],

    (ore('plateElectrumFlux')) : [
        item('redstonearsenal:material', 128)
    ],

    (ore('plateEnderium')) : [
        item('thermalfoundation:material', 359)
    ],

    (ore('plateGold')) : [
        item('libvulpes:productplate', 2),
        item('thermalfoundation:material', 33)
    ],

    (ore('plateInvar')) : [
        item('thermalfoundation:material', 354)
    ],

    (ore('plateIridium')) : [
        item('libvulpes:productplate', 10),
        item('thermalfoundation:material', 327)
    ],

    (ore('plateIron')) : [
        item('thermalfoundation:material', 32),
        item('libvulpes:productplate', 1)
    ],

    (ore('plateLead')) : [
        item('thermalfoundation:material', 323)
    ],

    (ore('plateLumium')) : [
        item('thermalfoundation:material', 358)
    ],

    (ore('plateNickel')) : [
        item('thermalfoundation:material', 325)
    ],

    (ore('platePlatinum')) : [
        item('thermalfoundation:material', 326)
    ],

    (ore('platePlutonium')) : [
    ],

    (ore('plateSignalum')) : [
        item('thermalfoundation:material', 357)
    ],

    (ore('plateSilicon')) : [
        item('libvulpes:productplate', 3)
    ],

    (ore('plateSilver')) : [
        item('thermalfoundation:material', 322)
    ],

    (ore('plateSteel')) : [
        item('thermalfoundation:material', 352),
        item('libvulpes:productplate', 6)
    ],

    (ore('plateTin')) : [
        item('thermalfoundation:material', 321),
        item('libvulpes:productplate', 5)
    ],

    (ore('plateTitanium')) : [
        item('libvulpes:productplate', 7)
    ],

    (ore('plateNeutronium')) : [
    ],
]

disableOreDicts(platesDisabled)

//////////////////////////////
//            Gears           //
//////////////////////////////

def gearsDisabled = [

    (ore('gearAluminum')) : [
        item('thermalfoundation:material', 260)
    ],

    (ore('gearBronze')) : [
        item('thermalfoundation:material', 291)
    ],

    (ore('gearConstantan')) : [
        item('thermalfoundation:material', 292)
    ],

    (ore('gearCopper')) : [
        item('thermalfoundation:material', 256)
    ],

    (ore('gearDiamond')) : [
        item('thermalfoundation:material', 26)
    ],

    (ore('gearElectrum')) : [
        item('thermalfoundation:material', 289)
    ],

    (ore('gearElectrumFlux')) : [
        item('redstonearsenal:material', 96)
    ],

    (ore('gearEnderium')) : [
        item('thermalfoundation:material', 295)
    ],

    (ore('gearGold')) : [
        item('thermalfoundation:material', 25)
    ],

    (ore('gearInvar')) : [
        item('thermalfoundation:material', 290)
    ],

    (ore('gearIron')) : [
        item('thermalfoundation:material', 24)
    ],

    (ore('gearIridium')) : [
        item('thermalfoundation:material', 263)
    ],

    (ore('gearLead')) : [
        item('thermalfoundation:material', 259)
    ],

    (ore('gearLumium')) : [
        item('thermalfoundation:material', 294)
    ],

    (ore('gearNickel')) : [
        item('thermalfoundation:material', 261)
    ],

    (ore('gearPlatinum')) : [
        item('thermalfoundation:material', 262)
    ],

    (ore('gearSignalum')) : [
        item('thermalfoundation:material', 293)
    ],

    (ore('gearSilver')) : [
        item('thermalfoundation:material', 258)
    ],

    (ore('gearSteel')) : [
        item('thermalfoundation:material', 288),
        item('libvulpes:productgear', 6)
    ],

    (ore('gearTin')) : [
        item('thermalfoundation:material', 257),
    ],

    (ore('gearTitanium')) : [
        item('libvulpes:productgear', 7)
    ],

    (ore('gearWood')) : [
        item('thermalfoundation:material', 22)
    ],
]

disableOreDicts(gearsDisabled)

//////////////////////////////
//            Misc            //
//////////////////////////////

def miscDisabled = [

    (ore('gemApatite')) : [
    ],

    (ore('itemSilicon')) : [
        item('enderio:item_material', 5),
        item('nuclearcraft:gem', 6),
        item('appliedenergistics2:material', 5),
        item('libvulpes:productingot', 3),
        item('projectred-core:resource_item', 301)
    ],

    (ore('dustArsenic')) : [
        item('nuclearcraft:gem_dust', 10)
    ],

    (ore('boltPlutonium')) : [
    ],

    (ore('dustSmallPlutonium')) : [
    ],

    (ore('dustTinyPlutonium')) : [
    ],

    (ore('screwPlutonium')) : [
    ],

    (ore('stickLongPlutonium')) : [
    ],

    (ore('gemRuby')) : [
        item('projectred-core:resource_item', 200)
    ],

    (ore('gemSapphire')) : [
        item('projectred-core:resource_item', 201)
    ],
]

disableOreDicts(miscDisabled)

////////////////////////////////
//            Removals          //
////////////////////////////////

//Hide Categories
mods.jei.category.hideCategory('minecraft.anvil')
mods.jei.category.hideCategory('Painter')
mods.jei.category.hideCategory('extrautils2.blockPatterns')
mods.jei.category.hideCategory('Avatitia.Compressor')
mods.jei.category.hideCategory('EIOTank')
mods.jei.category.hideCategory('jeresources.enchantment')

mods.jei.category.hideCategory('actuallyadditions.compost')
mods.jei.category.hideCategory('actuallyadditions.crushing')
mods.jei.category.hideCategory('actuallyadditions.booklet')
mods.jei.category.hideCategory('extendedcrafting:compressor')
mods.jei.category.hideCategory('extendedcrafting:ender_crafting')
mods.jei.category.hideCategory('thermalexpansion.compression')
mods.jei.category.hideCategory('thermalexpansion.enervation')
mods.jei.category.hideCategory('thermalexpansion.transposer_fill')
mods.jei.category.hideCategory('thermalexpansion.transposer_extract')
mods.jei.category.hideCategory('xu2_machine_extrautils2:furnace')
mods.jei.category.hideCategory('xu2_machine_extrautils2:crusher')
mods.jei.category.hideCategory('xu2_machine_extrautils2:generator_survival')
mods.jei.category.hideCategory('xu2_machine_extrautils2:generator')
mods.jei.ingredient.removeAndHide(item('appliedenergistics2:material', 5))

//Actually Additions Removals
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_battery_box'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_bio_reactor'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_tiny_torch'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_firework_box'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_smiley_cloud'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_grinder_double'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_grinder'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_furnace_double'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_fishing_net'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_oil_generator'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_fermenting_barrel'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_compost'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_energizer'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_enervator'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_treasure_chest'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_heat_collector'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_item_repairer'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:block_greenhouse_glass'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_misc', 18))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_mining_lens'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_disenchanting_lens'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_more_damage_lens'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_damage_lens'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_explosion_lens'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_color_lens'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_booklet'))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_misc', 21))
mods.jei.ingredient.removeAndHide(item('actuallyadditions:item_misc', 22))

//Advanced Rocketry Removals
mods.jei.ingredient.removeAndHide(item('advancedrocketry:charcoallog'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:satellitebuilder'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:loader'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:precisionassemblingmachine'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:platepress'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:blastbrick'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:crystallizer'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:cuttingmachine'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:observatory'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:blackholegenerator'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:concrete'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:satellitecontrolcenter'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:planetanalyser'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:arcfurnace'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:sawblade'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:lathe'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:rollingmachine'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:electrolyser'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:chemicalreactor'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:microwavereciever'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:drill'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:solarpanel'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:biomescanner'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:terraformer'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:deployablerocketbuilder'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:liquidtank'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:intake'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:solargenerator'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:railgun'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:blocklens'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:spaceelevatorcontroller'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:beacon'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:thermitetorch'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:wirelesstransciever'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productdust'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productdust', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productingot'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productingot', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productnugget'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productnugget', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productplate'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productplate', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productrod', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productrod'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productsheet'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productsheet', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productgear'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:productgear', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:metal0'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:metal0', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:orescanner'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:satellitepowersource'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:satellitepowersource', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:itemcircuitplate'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:itemcircuitplate', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:ic'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:ic', 2))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:ic', 3))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:ic', 5))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:ic', 4))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:wafer'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:dataunit'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:satellite'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:misc'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:misc', 1))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:sawbladeiron'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:jackhammer'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:asteroidchip'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:elevatorchip'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:basiclasergun'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:beaconfinder'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:thermite'))
mods.jei.ingredient.removeAndHide(item('advancedrocketry:unlittorch'))
mods.jei.ingredient.removeAndHide(item('libvulpes:productboule', 3))

//Armor Plus Removals
mods.jei.ingredient.removeAndHide(item('armorplus:workbench'))
mods.jei.ingredient.removeAndHide(item('armorplus:high_tech_bench'))
mods.jei.ingredient.removeAndHide(item('armorplus:ulti_tech_bench'))
mods.jei.ingredient.removeAndHide(item('armorplus:champion_bench'))
mods.jei.ingredient.removeAndHide(item('armorplus:ore_lava_crystal'))
mods.jei.ingredient.removeAndHide(item('armorplus:steel_block'))
mods.jei.ingredient.removeAndHide(item('armorplus:electrical_block'))
mods.jei.ingredient.removeAndHide(item('armorplus:lava_nether_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:lava_cactus'))
mods.jei.ingredient.removeAndHide(item('armorplus:lava_infuser'))
mods.jei.ingredient.removeAndHide(item('armorplus:lava_infuser_infusing'))
mods.jei.ingredient.removeAndHide(item('armorplus:lava_crystal'))
mods.jei.ingredient.removeAndHide(item('armorplus:the_gift_of_the_gods'))
mods.jei.ingredient.removeAndHide(item('armorplus:block_lava_crystal'))
mods.jei.ingredient.removeAndHide(item('armorplus:block_compressed_lava_crystal'))
mods.jei.ingredient.removeAndHide(item('armorplus:book'))
mods.jei.ingredient.removeAndHide(item('armorplus:steel_ingot'))
mods.jei.ingredient.removeAndHide(item('armorplus:electrical_ingot'))
mods.jei.ingredient.removeAndHide(item('armorplus:redstone_apple'))
mods.jei.ingredient.removeAndHide(item('armorplus:redstone_apple', 1))
mods.jei.ingredient.removeAndHide(item('armorplus:dev_tool'))
mods.jei.ingredient.removeAndHide(item('armorplus:material'))
mods.jei.ingredient.removeAndHide(item('armorplus:tower_spawn_item'))
mods.jei.ingredient.removeAndHide(item('armorplus:ender_dungeon_floor_1_spawn_item'))
mods.jei.ingredient.removeAndHide(item('armorplus:chicken_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:chicken_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:chicken_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:chicken_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:slime_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:slime_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:slime_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:slime_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:pig_iron_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:pig_iron_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:pig_iron_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:pig_iron_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:coal_sword'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_bow'))
mods.jei.ingredient.removeAndHide(item('armorplus:infused_lava_bow'))
mods.jei.ingredient.removeAndHide(item('armorplus:obsidian_bow'))
mods.jei.ingredient.removeAndHide(item('armorplus:emerald_bow'))
mods.jei.ingredient.removeAndHide(item('armorplus:redstone_bow'))
mods.jei.ingredient.removeAndHide(item('armorplus:coal_bow'))
mods.jei.ingredient.removeAndHide(item('armorplus:book_lore'))
mods.jei.ingredient.removeAndHide(item('armorplus:dusk'))
mods.jei.ingredient.removeAndHide(item('armorplus:noon'))
mods.jei.ingredient.removeAndHide(item('armorplus:midnight'))
mods.jei.ingredient.removeAndHide(item('armorplus:dawn'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_overworld'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_the_nether'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_the_end'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_sacrifice'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_the_realm'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_arena'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_the_shaper'))
mods.jei.ingredient.removeAndHide(item('armorplus:map_of_the_elder'))
mods.jei.ingredient.removeAndHide(item('minecraft:spawn_egg').withNbt([EntityTag : [id : 'armorplus:ender_dragon_zombie']]))
mods.jei.ingredient.removeAndHide(item('minecraft:spawn_egg').withNbt([EntityTag : [id : 'armorplus:ice_golem']]))
mods.jei.ingredient.removeAndHide(item('minecraft:spawn_egg').withNbt([EntityTag : [id : 'armorplus:overlord_of_the_guardians']]))
mods.jei.ingredient.removeAndHide(item('minecraft:spawn_egg').withNbt([EntityTag : [id : 'armorplus:skeletal_king']]))
mods.jei.ingredient.removeAndHide(item('minecraft:spawn_egg').withNbt([EntityTag : [id : 'armorplus:witherling']]))
mods.jei.ingredient.removeAndHide(item('minecraft:spawn_egg').withNbt([EntityTag : [id : 'armorplus:demonic_dragon']]))
mods.jei.ingredient.removeAndHide(item('armorplus:white_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:red_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:black_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:blue_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:green_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:purple_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:yellow_stone_brick'))
mods.jei.ingredient.removeAndHide(item('armorplus:white_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:red_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:black_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:blue_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:green_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:yellow_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:purple_stone_brick_tower'))
mods.jei.ingredient.removeAndHide(item('armorplus:white_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:red_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:black_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:blue_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:green_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:yellow_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:purple_stone_brick_corner'))
mods.jei.ingredient.removeAndHide(item('armorplus:white_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:red_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:black_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:blue_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:green_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:yellow_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:purple_stone_brick_wall'))
mods.jei.ingredient.removeAndHide(item('armorplus:chainmail_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:chainmail_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:chainmail_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:chainmail_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:iron_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:iron_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:iron_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:iron_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:gold_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:gold_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:gold_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:gold_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:diamond_helmet'))
mods.jei.ingredient.removeAndHide(item('armorplus:diamond_chestplate'))
mods.jei.ingredient.removeAndHide(item('armorplus:diamond_leggings'))
mods.jei.ingredient.removeAndHide(item('armorplus:diamond_boots'))
mods.jei.ingredient.removeAndHide(item('armorplus:trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:pig_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:sheep_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:cow_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:chicken_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:horse_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:rabbit_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:bat_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:ocelot_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:parrot_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:polar_bear_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:wolf_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:creeper_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:blaze_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:spider_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:cave_spider_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:zombie_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:enderman_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:endermite_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:stray_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:evoker_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:vex_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:vindicator_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:ghast_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:husk_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:shulker_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:magma_cube_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:silverfish_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:skeleton_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:witch_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:zombie_villager_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:zombie_pigman_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:wither_skeleton_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:slime_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:elder_guardian_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:wither_boss_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:ender_dragon_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:skeletal_king_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_overlord_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:demonic_dragon_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:the_lord_of_everything_trophy'))
mods.jei.ingredient.removeAndHide(item('armorplus:coal_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:lapis_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:redstone_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:emerald_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:obsidian_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:infused_lava_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:super_star_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:ender_dragon_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:empty_sword_display'))
mods.jei.ingredient.removeAndHide(item('armorplus:emerald_arrow'))
mods.jei.ingredient.removeAndHide(item('armorplus:obsidian_arrow'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_arrow'))
mods.jei.ingredient.removeAndHide(item('armorplus:super_star_arrow'))
mods.jei.ingredient.removeAndHide(item('armorplus:coal_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:lapis_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:redstone_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:emerald_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:obsidian_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:infused_lava_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:super_star_battle_axe'))
mods.jei.ingredient.removeAndHide(item('armorplus:coal_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:lapis_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:redstone_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:emerald_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:obsidian_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:infused_lava_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:guardian_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:super_star_pickaxe'))
mods.jei.ingredient.removeAndHide(item('armorplus:ender_dragon_pickaxe'))

//Avaritia Removals
mods.jei.ingredient.removeAndHide(item('avaritia:resource', 7))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity'))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 1))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 2))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 3))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 4))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 5))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 6))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 7))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 8))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 9))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 10))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 11))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 12))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 13))
mods.jei.ingredient.removeAndHide(item('avaritia:singularity', 14))
mods.jei.ingredient.removeAndHide(item('avaritia:infinity_bow'))
mods.jei.ingredient.removeAndHide(item('avaritia:infinity_pickaxe'))
mods.jei.ingredient.removeAndHide(item('avaritia:infinity_shovel'))
mods.jei.ingredient.removeAndHide(item('avaritia:infinity_axe'))
mods.jei.ingredient.removeAndHide(item('avaritia:infinity_hoe'))
mods.jei.ingredient.removeAndHide(item('avaritia:endest_pearl'))
mods.jei.ingredient.removeAndHide(item('avaritia:ultimate_stew'))
mods.jei.ingredient.removeAndHide(item('avaritia:cosmic_meatballs'))
mods.jei.ingredient.removeAndHide(item('avaritia:double_compressed_crafting_table'))
mods.jei.ingredient.removeAndHide(item('avaritia:extreme_crafting_table'))
mods.jei.ingredient.removeAndHide(item('avaritia:neutron_collector'))
mods.jei.ingredient.removeAndHide(item('avaritia:neutronium_compressor'))
mods.jei.ingredient.removeAndHide(item('avaritia:matter_cluster'))

//Deep Mob Evolution Removals
mods.jei.ingredient.removeAndHide(item('deepmoblearning:soot_covered_plate'))
mods.jei.ingredient.removeAndHide(item('deepmoblearning:soot_covered_redstone'))

// Draconic Evolution Removals
mods.jei.ingredient.removeAndHide(item('draconicevolution:draconium_ore:*'))

//EnderIO Removals
mods.jei.ingredient.removeAndHide(item('enderio:item_material', 28))
mods.jei.ingredient.removeAndHide(item('enderio:item_material', 39))
mods.jei.ingredient.removeAndHide(item('enderio:item_material', 72))
mods.jei.ingredient.removeAndHide(item('enderio:block_simple_furnace'))
mods.jei.ingredient.removeAndHide(item('enderio:block_simple_alloy_smelter'))
mods.jei.ingredient.removeAndHide(item('enderio:block_alloy_smelter'))
mods.jei.ingredient.removeAndHide(item('enderio:block_enhanced_alloy_smelter'))
mods.jei.ingredient.removeAndHide(item('enderio:block_buffer', 3))
mods.jei.ingredient.removeAndHide(item('enderio:block_combustion_generator'))
mods.jei.ingredient.removeAndHide(item('enderio:block_enhanced_combustion_generator'))
mods.jei.ingredient.removeAndHide(item('enderio:block_simple_stirling_generator'))
mods.jei.ingredient.removeAndHide(item('enderio:block_stirling_generator'))
mods.jei.ingredient.removeAndHide(item('enderio:block_lava_generator'))
mods.jei.ingredient.removeAndHide(item('enderio:block_simple_sag_mill'))
mods.jei.ingredient.removeAndHide(item('enderio:item_ender_food'))
mods.jei.ingredient.removeAndHide(item('enderio:block_sag_mill'))
mods.jei.ingredient.removeAndHide(item('enderio:block_enhanced_sag_mill'))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel'))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel', 1))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel', 2))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel', 3))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel', 4))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel', 5))
mods.jei.ingredient.removeAndHide(item('enderio:block_solar_panel', 6))
mods.jei.ingredient.removeAndHide(item('extrautils2:user'))
mods.jei.ingredient.removeAndHide(item('extrautils2:contract'))
mods.jei.ingredient.removeAndHide(item('enderio:block_cap_bank'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_grainy'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_stellar'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_melodic'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_crystalline'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_silver'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_energetic_silver'))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_vivid'))
mods.jei.ingredient.removeAndHide(item('enderio:block_creative_spawner'))
mods.jei.ingredient.removeAndHide(item('enderio:block_simple_crafter'))
mods.jei.ingredient.removeAndHide(item('enderio:block_simple_wired_charger'))
mods.jei.ingredient.removeAndHide(item('enderio:block_infinity_fog'))
mods.jei.ingredient.removeAndHide(item('enderio:item_dark_steel_upgrade', 1).withNbt(['enderio:dsu' : 'enderio:top']))
mods.jei.ingredient.removeAndHide(item('enderio:item_dark_steel_upgrade', 1).withNbt(['enderio:dsu' : 'enderio:top', 'enderio:enabled' : 1 as byte]))
mods.jei.ingredient.removeAndHide(item('enderio:item_capacitor_totemic'))
mods.jei.ingredient.removeAndHide(item('enderio:item_material', 40))
mods.jei.ingredient.removeAndHide(item('enderio:item_material', 81))
mods.jei.ingredient.removeAndHide(item('enderio:block_death_pouch'))

//Extended Crafting Removals
mods.jei.ingredient.removeAndHide(item('extendedcrafting:storage', 7))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:ender_alternator'))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:ender_crafter'))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 36))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 37))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 41))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 48))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 128))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 2))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity'))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 1))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 2))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 3))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 4))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 5))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 6))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 7))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 16))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 17))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 18))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 19))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 20))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 21))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 22))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 23))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 24))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 25))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 26))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 66))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 65))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 64))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 50))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 49))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 48))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 35))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 34))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 33))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 32))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 31))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 30))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 29))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 28))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:singularity', 27))

//Extra Utils 2 Removals
mods.jei.ingredient.removeAndHide(item('extrautils2:itemcreativedestructionwand'))
mods.jei.ingredient.removeAndHide(item('extrautils2:itemcreativebuilderswand'))
mods.jei.ingredient.removeAndHide(item('extrautils2:machine').withNbt([Type : 'extrautils2:furnace']))
mods.jei.ingredient.removeAndHide(item('extrautils2:machine').withNbt([Type : 'extrautils2:crusher']))
mods.jei.ingredient.removeAndHide(item('extrautils2:creativeharvest'))
mods.jei.ingredient.removeAndHide(item('extrautils2:book'))
mods.jei.ingredient.removeAndHide(item('extrautils2:minichest'))
mods.jei.ingredient.removeAndHide(item('extrautils2:analogcrafter'))

//Gregtech Removals
mods.jei.ingredient.removeAndHide(metaitem('world_accelerator.lv'))
mods.jei.ingredient.removeAndHide(metaitem('world_accelerator.mv'))
mods.jei.ingredient.removeAndHide(metaitem('world_accelerator.luv'))
mods.jei.ingredient.removeAndHide(metaitem('world_accelerator.zpm'))
mods.jei.ingredient.removeAndHide(metaitem('world_accelerator.uv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.ulv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.lv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.mv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.hv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.ev'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.iv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.luv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.zpm'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.uv'))
mods.jei.ingredient.removeAndHide(metaitem('gcym:tiered_hatch.uhv'))
mods.jei.ingredient.removeAndHide(metaitem('gearWood'))

//More Furnaces Removals
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade'))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 1))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 2))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 3))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 4))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 5))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 6))
mods.jei.ingredient.removeAndHide(item('morefurnaces:upgrade', 7))
mods.jei.ingredient.removeAndHide(item('morefurnaces:furnaceblock', 4))

//More Plates Removals
mods.jei.ingredient.removeAndHide(item('moreplates:hammer'))

//The One Probe Removals
mods.jei.ingredient.removeAndHide(item('theoneprobe:creativeprobe'))

// Extended Crafting Removals
mods.jei.ingredient.removeAndHide(item('extendedcrafting:crafting_table'))

//Thermal Removals
mods.jei.ingredient.removeAndHide(item('thermalexpansion:satchel', 32000))
mods.jei.ingredient.removeAndHide(item('thermalexpansion:frame', 129))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:upgrade', 256))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 23))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 27))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 802))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 801))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 657))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_silver'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_lead'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_aluminum'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_nickel'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_electrum'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_invar'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_copper'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_tin'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_platinum'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_steel'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_bronze'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_stone'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_iron'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:tool.hammer_diamond'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:rockwool:*'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 864))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 865))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:ore:*'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:ore_fluid:*'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:glass:*'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:glass_alloy:*'))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:dye:*'))

//Lib Vulpes Removals
mods.jei.ingredient.removeAndHide(item('libvulpes:gtplug'))
mods.jei.ingredient.removeAndHide(item('libvulpes:blockphantom'))
mods.jei.ingredient.removeAndHide(item('libvulpes:placeholder'))
mods.jei.ingredient.removeAndHide(item('libvulpes:coalgenerator'))
mods.jei.ingredient.removeAndHide(item('libvulpes:motor'))
mods.jei.ingredient.removeAndHide(item('libvulpes:advancedmotor'))
mods.jei.ingredient.removeAndHide(item('libvulpes:enhancedmotor'))
mods.jei.ingredient.removeAndHide(item('libvulpes:elitemotor'))
mods.jei.ingredient.removeAndHide(item('libvulpes:coil0', 2))
mods.jei.ingredient.removeAndHide(item('libvulpes:coil0', 4))
mods.jei.ingredient.removeAndHide(item('libvulpes:coil0', 7))
mods.jei.ingredient.removeAndHide(item('libvulpes:coil0', 9))
mods.jei.ingredient.removeAndHide(item('libvulpes:coil0', 10))
mods.jei.ingredient.removeAndHide(item('libvulpes:battery'))
mods.jei.ingredient.removeAndHide(item('libvulpes:battery', 1))
mods.jei.ingredient.removeAndHide(item('libvulpes:productfan', 6))
mods.jei.ingredient.removeAndHide(item('libvulpes:productsheet', 9))
mods.jei.ingredient.removeAndHide(item('libvulpes:productsheet', 7))
mods.jei.ingredient.removeAndHide(item('libvulpes:productsheet', 6))
mods.jei.ingredient.removeAndHide(item('libvulpes:productsheet', 4))
mods.jei.ingredient.removeAndHide(item('libvulpes:productsheet', 1))

// Better Questing Removals
mods.jei.ingredient.removeAndHide(item('betterquesting:extra_life'))
mods.jei.ingredient.removeAndHide(item('betterquesting:extra_life', 1))
mods.jei.ingredient.removeAndHide(item('betterquesting:extra_life', 2))
mods.jei.ingredient.removeAndHide(item('betterquesting:guide_book'))

//Omnium
mods.jei.ingredient.removeAndHide(metaitem('nomilabs:ingotOmnium'))
mods.jei.ingredient.removeAndHide(metaitem('nomilabs:nuggetOmnium'))
mods.jei.ingredient.removeAndHide(metaitem('nomilabs:blockOmnium'))
ore('ingotOmnium').add(item('extendedcrafting:material', 32))
ore('nuggetOmnium').add(item('extendedcrafting:material', 33))
ore('blockOmnium').add(item('extendedcrafting:storage', 4))
crafting.remove('gregtech:block_compress_omnium')
// FIXME: Genuinely, why is this here??
mods.gregtech.extractor.recipeBuilder()
    .inputs(item('extendedcrafting:material', 33))
    .fluidOutputs([fluid('omnium') * 16])
    .duration(25).EUt(VA[LV])
    .buildAndRegister()

mods.gregtech.extractor.recipeBuilder()
    .inputs(item('extendedcrafting:material', 32))
    .fluidOutputs([fluid('omnium') * 144])
    .duration(200).EUt(VA[LV])
    .buildAndRegister()

mods.gregtech.extractor.recipeBuilder()
    .inputs(item('extendedcrafting:storage', 4))
    .fluidOutputs([fluid('omnium') * 1296])
    .duration(1800).EUt(VA[LV])
    .buildAndRegister()

// TODO: Prolly act on the material properties themselves here?
mods.gregtech.fluid_solidifier.removeByInput(7, [metaitem('shape.mold.nugget')], [fluid('omnium') * 144])
mods.gregtech.fluid_solidifier.removeByInput(7, [metaitem('shape.mold.ingot')], [fluid('omnium') * 144])
mods.gregtech.fluid_solidifier.removeByInput(7, [metaitem('shape.mold.block')], [fluid('omnium') * 1296])

mods.gregtech.fluid_solidifier.recipeBuilder()
    .fluidInputs(fluid('omnium') * 144)
    .notConsumable(metaitem('shape.mold.nugget'))
    .outputs([item('extendedcrafting:material', 33) * 9])
    .duration(200).EUt(VA[LV])
    .buildAndRegister()

mods.gregtech.fluid_solidifier.recipeBuilder()
    .fluidInputs(fluid('omnium') * 144)
    .notConsumable(metaitem('shape.mold.ingot'))
    .outputs([item('extendedcrafting:material', 32)])
    .duration(200).EUt(VA[LV])
    .buildAndRegister()

mods.gregtech.fluid_solidifier.recipeBuilder()
    .fluidInputs(fluid('omnium') * 1296)
    .notConsumable(metaitem('shape.mold.block'))
    .outputs([item('extendedcrafting:storage', 4)])
    .duration(200).EUt(VA[LV])
    .buildAndRegister()

mods.gregtech.fluid_solidifier.recipeBuilder()
    .fluidInputs(fluid('omnium') * 16)
    .notConsumable(metaitem('shape.mold.ball'))
    .outputs([item('extendedcrafting:singularity_ultimate')])
    .duration(200).EUt(VA[LV])
    .buildAndRegister()

furnace.removeByOutput(metaitem('nomilabs:ingotOmnium'))
furnace.add(item('extendedcrafting:material', 32), metaitem('nomilabs:dustOmnium'), 0.0)
crafting.addShapeless(item('extendedcrafting:material', 32), [metaitem('nomilabs:ingotOmnium')])

//Neutronium
ore('ingotNeutronium').add(item('avaritia:resource', 4))
ore('nuggetNeutronium').add(item('avaritia:resource', 3))
ore('blockNeutronium').add(item('avaritia:block_resource'))

//Redstone Alloy
mods.jei.ingredient.removeAndHide(item('enderio:block_alloy', 3))
mods.jei.ingredient.removeAndHide(item('enderio:item_alloy_nugget', 3))

crafting.addShapeless(metaitem('ingotRedAlloy'), [item('enderio:item_alloy_ingot', 3)])

//Questbook things
// TODO: Figure out meta_tile_entities
/* ore('questbookBrewery').add('<TODO: Figure this out>meta_tile_entity:brewery.lv>')
ore('questbookBrewery').add('<TODO: Figure this out>meta_tile_entity:brewery.mv>')
ore('questbookBrewery').add('<TODO: Figure this out>meta_tile_entity:brewery.hv>')
ore('questbookBrewery').add('<TODO: Figure this out>meta_tile_entity:brewery.ev>')
ore('questbookBrewery').add('<TODO: Figure this out>meta_tile_entity:brewery.iv>')
ore('questbookDistillery').add('<TODO: Figure this out>meta_tile_entity:distillery.lv>')
ore('questbookDistillery').add('<TODO: Figure this out>meta_tile_entity:distillery.mv>')
ore('questbookPolarizer').add('<TODO: Figure this out>meta_tile_entity:polarizer.lv>') // LV Polarizer
ore('questbookPolarizer').add('<TODO: Figure this out>meta_tile_entity:polarizer.mv>') // MV Polarizer (why)
ore('questbookAirCollector').add('<TODO: Figure this out>meta_tile_entity:gas_collector.lv>') // LV Air Succ
ore('questbookAirCollector').add('<TODO: Figure this out>meta_tile_entity:gas_collector.mv>') // MV Air Succ
ore('questbookAirCollector').add('<TODO: Figure this out>meta_tile_entity:gas_collector.hv>') // HV Air Succ
ore('questbookAirCollector').add('<TODO: Figure this out>meta_tile_entity:gas_collector.ev>') // EV Air Succ
ore('questbookCanning').add('<TODO: Figure this out>meta_tile_entity:canner.lv>') // LV Canning
ore('questbookCanning').add('<TODO: Figure this out>meta_tile_entity:canner.mv>') // MV Canning */

ore('questbookSifter').add(metaitem('sifter.lv'))
ore('questbookSifter').add(metaitem('sifter.mv'))

ore('questbookLvCef').add(metaitem('energy_converter.lv.1'))
ore('questbookLvCef').add(metaitem('energy_converter.lv.4'))
ore('questbookLvCef').add(metaitem('energy_converter.lv.8'))
ore('questbookLvCef').add(metaitem('energy_converter.lv.16'))

ore('questbookLvBatteryBuffer').add(metaitem('battery_buffer.lv.4'))
ore('questbookLvBatteryBuffer').add(metaitem('battery_buffer.lv.8'))
ore('questbookLvBatteryBuffer').add(metaitem('battery_buffer.lv.16'))

ore('questbookMvCef').add(metaitem('energy_converter.mv.1'))
ore('questbookMvCef').add(metaitem('energy_converter.mv.4'))
ore('questbookMvCef').add(metaitem('energy_converter.mv.8'))
ore('questbookMvCef').add(metaitem('energy_converter.mv.16'))

ore('questbookParallelControlHatch').add(metaitem('gcym:parallel_hatch.iv'))
ore('questbookParallelControlHatch').add(metaitem('gcym:parallel_hatch.luv'))
ore('questbookParallelControlHatch').add(metaitem('gcym:parallel_hatch.zpm'))
ore('questbookParallelControlHatch').add(metaitem('gcym:parallel_hatch.uv'))

ore('questbookPowerUnit').add(metaitem('power_unit.lv')) // LV Power Unit
ore('questbookPowerUnit').add(metaitem('power_unit.mv')) // MV Power Unit
ore('questbookPowerUnit').add(metaitem('power_unit.hv')) // HV Power Unit
ore('questbookPowerUnit').add(metaitem('power_unit.ev')) // EV Power Unit
ore('questbookPowerUnit').add(metaitem('power_unit.iv')) // IV Power Unit

ore('questbookMacerator').add(metaitem('macerator.lv')) // LV Macerator
ore('questbookMacerator').add(metaitem('macerator.mv')) // MV Macerator
ore('questbookMacerator').add(metaitem('macerator.hv')) // HV Macerator

ore('questbookWirelessTerminals').add(item('appliedenergistics2:wireless_terminal')) // Normal Wireless
ore('questbookWirelessTerminals').add(item('appliedenergistics2:wireless_crafting_terminal')) // Crafting Wireless
ore('questbookWirelessTerminals').add(item('appliedenergistics2:wireless_pattern_terminal')) // Pattern Wireless
ore('questbookWirelessTerminals').add(item('appliedenergistics2:wireless_fluid_terminal')) // Fluid Wireless

ore('questbookChisels').add(item('chisel:chisel_iron'))
ore('questbookChisels').add(item('chisel:chisel_diamond'))
ore('questbookChisels').add(item('chisel:chisel_hitech'))

ore('questbookScanner').add(metaitem('scanner.hv'))
ore('questbookScanner').add(metaitem('scanner.ev'))
ore('questbookScanner').add(metaitem('scanner.iv'))

ore('questbookWA').add(metaitem('world_accelerator.hv'))
ore('questbookWA').add(metaitem('world_accelerator.ev'))
ore('questbookWA').add(metaitem('world_accelerator.iv'))

ore('questbookLathe').add(metaitem('lathe.lv'))
ore('questbookLathe').add(metaitem('lathe.mv'))

ore('questbookAutoclave').add(metaitem('autoclave.lv'))
ore('questbookAutoclave').add(metaitem('autoclave.mv'))
ore('questbookAutoclave').add(metaitem('autoclave.hv'))
ore('questbookAutoclave').add(metaitem('autoclave.ev'))
ore('questbookAutoclave').add(metaitem('autoclave.iv'))

// Add All GT Super and Quantum Tanks (apart from creative)
// Super Tanks
ore('questbookTanks').add(metaitem('super_tank.lv'))
ore('questbookTanks').add(metaitem('super_tank.mv'))
ore('questbookTanks').add(metaitem('super_tank.hv'))
ore('questbookTanks').add(metaitem('super_tank.ev'))
ore('questbookTanks').add(metaitem('super_tank.iv'))

// Quantum Tanks
ore('questbookTanks').add(metaitem('quantum_tank.iv'))
ore('questbookTanks').add(metaitem('quantum_tank.luv'))
ore('questbookTanks').add(metaitem('quantum_tank.zpm'))
ore('questbookTanks').add(metaitem('quantum_tank.uv'))
ore('questbookTanks').add(metaitem('quantum_tank.uhv'))

/* Nuclearcraft Quests: */
// Neptunium
ore('questbookNeptunium').add(item('nuclearcraft:neptunium'))
ore('questbookNeptunium').add(item('nuclearcraft:neptunium', 4))

// Plutonium
ore('questbookPlutonium').add(item('nuclearcraft:plutonium'))
ore('questbookPlutonium').add(item('nuclearcraft:plutonium', 12))
ore('questbookPlutonium').add(metaitem('ingotPlutonium'))
ore('questbookPlutonium').add(metaitem('ingotPlutonium241'))

// Americium
ore('questbookAmericium').add(item('nuclearcraft:americium'))
ore('questbookAmericium').add(item('nuclearcraft:americium', 4))
ore('questbookAmericium').add(item('nuclearcraft:americium', 8))

// Curium
ore('questbookCurium').add(item('nuclearcraft:curium'))
ore('questbookCurium').add(item('nuclearcraft:curium', 4))
ore('questbookCurium').add(item('nuclearcraft:curium', 8))
ore('questbookCurium').add(item('nuclearcraft:curium', 12))

// Berkelium
ore('questbookBerkelium').add(item('nuclearcraft:berkelium'))
ore('questbookBerkelium').add(item('nuclearcraft:berkelium', 4))

// Californium
ore('questbookCalifornium').add(item('nuclearcraft:californium'))
ore('questbookCalifornium').add(item('nuclearcraft:californium', 4))
ore('questbookCalifornium').add(item('nuclearcraft:californium', 8))
ore('questbookCalifornium').add(item('nuclearcraft:californium', 12))

/* End NC quests */

// Add all GT Item Pipes
ore('questbookItemPipes').add(ore_dict.getOres('pipe*Item*').getMatchingStacks())
ore('questbookItemPipes').add(ore_dict.getOres('Restrictive*').getMatchingStacks())

//Nuggets
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 193))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 194))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 195))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 228))
mods.jei.ingredient.removeAndHide(item('extendedcrafting:material', 1))
mods.jei.ingredient.removeAndHide(item('libvulpes:productnugget', 3))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:material', 164))
mods.jei.ingredient.removeAndHide(item('thermalfoundation:storage_alloy', 4))

mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack'))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 6))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 7))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 8))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 9))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 10))

mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 1))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 2))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 3))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 4))
mods.jei.ingredient.removeAndHide(item('simplyjetpacks:itemfluxpack', 5))

mods.jei.ingredient.removeAndHide(item('draconicevolution:draconium_block', 1))

//sulfur from thermal to gt sulfur
crafting.addShapeless(metaitem('dustSulfur'), [item('thermalfoundation:material', 771)])

//Thermal Coal Coke Decomposition
crafting.addShapeless(metaitem('gemCoke') * 9, [item('thermalfoundation:storage_resource', 1)])

// OreDict stuff for new Pulsating Mesh/Dust
def pulsatingDustOre = ore('dustPulsating')
def pulsatingMeshOre = ore('meshPulsating')

pulsatingDustOre.add(item('nomilabs:pulsatingdust'))

pulsatingMeshOre.add(item('nomilabs:pulsatingmesh'))

// GT Fluix
ore('gemFluix').add(item('appliedenergistics2:material', 7))
