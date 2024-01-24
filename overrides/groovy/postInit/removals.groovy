import io.sommers.packmode.PMConfig

if (PMConfig.getPackMode() == "normal") {
// Input Buses
// ULV Input Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('glue') * 250])
// ULV Input Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 72])
// ULV Input Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 36])
// ULV Input Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 4])
// LV Input Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('glue') * 500])
// LV Input Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 144])
// LV Input Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 72])
// LV Input Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 9])
// MV Input Bus * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('crate.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 288])
// MV Input Bus * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('crate.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 144])
// MV Input Bus * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('crate.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 18])
// HV Input Bus * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('crate.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 432])
// HV Input Bus * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('crate.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 288])
// HV Input Bus * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('crate.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 36])
// EV Input Bus * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('crate.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 432])
// EV Input Bus * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('crate.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 72])
// IV Input Bus * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('crate.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 576])
// IV Input Bus * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('crate.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 144])
// Bronze Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.import.mv')], [fluid('oxygen') * 882])
// Bronze Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('item_bus.import.mv')], null)
// Stainless Steel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.import.hv')], [fluid('oxygen') * 1087])
// Stainless Steel Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('item_bus.import.hv')], null)
// Block of Aluminium * 1
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.import.ev')], [fluid('oxygen') * 621])
// Aluminium Dust * 9
mods.gregtech.macerator.removeByInput(8, [metaitem('item_bus.import.ev')], null)
// Stainless Steel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.import.iv')], [fluid('oxygen') * 1590])
// Stainless Steel Dust * 8
mods.gregtech.macerator.removeByInput(32, [metaitem('item_bus.import.iv')], null)

// Output Buses
// ULV Output Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('glue') * 250])
// ULV Output Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 72])
// ULV Output Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 36])
// ULV Output Bus * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 4])
// LV Output Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('glue') * 500])
// LV Output Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 144])
// LV Output Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 72])
// LV Output Bus * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:chest'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 9])
// MV Output Bus * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('crate.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 288])
// MV Output Bus * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('crate.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 144])
// MV Output Bus * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('crate.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 18])
// HV Output Bus * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('crate.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 432])
// HV Output Bus * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('crate.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 288])
// HV Output Bus * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('crate.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 36])
// EV Output Bus * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('crate.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 432])
// EV Output Bus * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('crate.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 72])
// IV Output Bus * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('crate.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 576])
// IV Output Bus * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('crate.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 144])
// Aluminium Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.export.mv')], [fluid('oxygen') * 882])
// Aluminium Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('item_bus.export.mv')], null)
// Stainless Steel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.export.hv')], [fluid('oxygen') * 1087])
// Stainless Steel Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('item_bus.export.hv')], null)
// Block of Aluminium * 1
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.export.ev')], [fluid('oxygen') * 621])
// Aluminium Dust * 9
mods.gregtech.macerator.removeByInput(8, [metaitem('item_bus.export.ev')], null)
// Stainless Steel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('item_bus.export.iv')], [fluid('oxygen') * 1590])
// Stainless Steel Dust * 8
mods.gregtech.macerator.removeByInput(32, [metaitem('item_bus.export.iv')], null)

// Input Hatches
// ULV Input Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('glue') * 250])
// ULV Input Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 72])
// ULV Input Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 36])
// ULV Input Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 4])
// LV Input Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('glue') * 500])
// LV Input Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 144])
// LV Input Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 72])
// LV Input Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 9])
// MV Input Hatch * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('drum.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 288])
// MV Input Hatch * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('drum.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 144])
// MV Input Hatch * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('drum.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 18])
// HV Input Hatch * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('drum.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('plastic') * 432])
// HV Input Hatch * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('drum.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 288])
// HV Input Hatch * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('drum.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 36])
// EV Input Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('drum.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 432])
// EV Input Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('drum.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 72])
// IV Input Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('drum.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polytetrafluoroethylene') * 576])
// IV Input Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('drum.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], [fluid('polybenzimidazole') * 144])
// Aluminium Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.import.mv')], [fluid('oxygen') * 730])
// Aluminium Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('fluid_hatch.import.mv')], null)
// Stainless Steel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.import.hv')], [fluid('oxygen') * 975])
// Stainless Steel Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('fluid_hatch.import.hv')], null)
// Titanium Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.import.ev')], [fluid('oxygen') * 569])
// Titanium Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('fluid_hatch.import.ev')], null)
// Tungstensteel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.import.iv')], [fluid('oxygen') * 1480])
// Tungstensteel Dust * 8
mods.gregtech.macerator.removeByInput(32, [metaitem('fluid_hatch.import.iv')], null)

// Output Hatches
// ULV Output Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('glue') * 250])
// ULV Output Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 72])
// ULV Output Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 36])
// ULV Output Hatch * 1
mods.gregtech.assembler.removeByInput(7, [metaitem('hull.ulv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 4])
// LV Output Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('glue') * 500])
// LV Output Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 144])
// LV Output Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 72])
// LV Output Hatch * 1
mods.gregtech.assembler.removeByInput(30, [metaitem('hull.lv'), item('minecraft:glass'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 9])
// MV Output Hatch * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('drum.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 288])
// MV Output Hatch * 1
mods.gregtech.assembler.removeByInput(120, [metaitem('hull.mv'), metaitem('drum.bronze'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 144])
// HV Output Hatch * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('drum.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('plastic') * 432])
// HV Output Hatch * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('drum.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 288])
// HV Output Hatch * 1
mods.gregtech.assembler.removeByInput(480, [metaitem('hull.hv'), metaitem('drum.steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 36])
// EV Output Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('drum.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 432])
// EV Output Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('hull.ev'), metaitem('drum.aluminium'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 72])
// IV Output Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('drum.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polytetrafluoroethylene') * 576])
// IV Output Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('hull.iv'), metaitem('drum.stainless_steel'), metaitem('circuit.integrated').withNbt(["Configuration": 2])], [fluid('polybenzimidazole') * 144])
// Aluminium Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.export.mv')], [fluid('oxygen') * 730])
// Aluminium Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('fluid_hatch.export.mv')], null)
// Stainless Steel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.export.hv')], [fluid('oxygen') * 975])
// Stainless Steel Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('fluid_hatch.export.hv')], null)
// Titanium Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.export.ev')], [fluid('oxygen') * 569])
// Titanium Dust * 8
mods.gregtech.macerator.removeByInput(8, [metaitem('fluid_hatch.export.ev')], null)
// Tungstensteel Ingot * 8
mods.gregtech.arc_furnace.removeByInput(30, [metaitem('fluid_hatch.export.iv')], [fluid('oxygen') * 1480])
// Tungstensteel Dust * 8
mods.gregtech.macerator.removeByInput(32, [metaitem('fluid_hatch.export.iv')], null)

// 4x/9x Hatches
// EV Quadruple Input Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('fluid_hatch.import.ev'), metaitem('pipeQuadrupleFluidTitanium'), metaitem('circuit.integrated').withNbt(["Configuration": 4])], [fluid('polytetrafluoroethylene') * 576])
// EV Quadruple Output Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('fluid_hatch.export.ev'), metaitem('pipeQuadrupleFluidTitanium'), metaitem('circuit.integrated').withNbt(["Configuration": 4])], [fluid('polytetrafluoroethylene') * 576])
// IV Quadruple Input Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('fluid_hatch.import.iv'), metaitem('pipeQuadrupleFluidTungstenSteel'), metaitem('circuit.integrated').withNbt(["Configuration": 4])], [fluid('polytetrafluoroethylene') * 576])
// IV Quadruple Output Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('fluid_hatch.export.iv'), metaitem('pipeQuadrupleFluidTungstenSteel'), metaitem('circuit.integrated').withNbt(["Configuration": 4])], [fluid('polytetrafluoroethylene') * 576])
// EV Nonuple Input Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('fluid_hatch.import.ev'), metaitem('pipeNonupleFluidTitanium'), metaitem('circuit.integrated').withNbt(["Configuration": 9])], [fluid('polytetrafluoroethylene') * 1296])
// EV Nonuple Output Hatch * 1
mods.gregtech.assembler.removeByInput(1920, [metaitem('fluid_hatch.export.ev'), metaitem('pipeNonupleFluidTitanium'), metaitem('circuit.integrated').withNbt(["Configuration": 9])], [fluid('polytetrafluoroethylene') * 1296])
// IV Nonuple Input Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('fluid_hatch.import.iv'), metaitem('pipeNonupleFluidTungstenSteel'), metaitem('circuit.integrated').withNbt(["Configuration": 9])], [fluid('polytetrafluoroethylene') * 1296])
// IV Nonuple Output Hatch * 1
mods.gregtech.assembler.removeByInput(7680, [metaitem('fluid_hatch.export.iv'), metaitem('pipeNonupleFluidTungstenSteel'), metaitem('circuit.integrated').withNbt(["Configuration": 9])], [fluid('polytetrafluoroethylene') * 1296])
} 