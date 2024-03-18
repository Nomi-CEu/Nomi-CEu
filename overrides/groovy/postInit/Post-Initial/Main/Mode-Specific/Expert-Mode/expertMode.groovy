import com.nomiceu.nomilabs.util.LabsModeHelper

import static gregtech.api.GTValues.*

if (!LabsModeHelper.expert) return

// Drill Core Assembler Recipe
mods.gregtech.assembler.recipeBuilder()
        .inputWildNBT(metaitem('power_unit.lv'))
        .inputs(metaitem('electric.motor.lv') * 4, metaitem('cableGtSingleTin') * 4, metaitem('gearSmallSteel') * 4)
        .circuitMeta(2)
        .outputs(item('actuallyadditions:item_misc', 16))
        .duration(100).EUt(VA[ULV])
        .buildAndRegister()
