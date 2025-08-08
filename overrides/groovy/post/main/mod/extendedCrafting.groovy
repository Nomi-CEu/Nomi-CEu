// Make Crystalline Recipe 'Strict', e.g. only allowed in tier 3 table
mods.extendedcrafting.table_crafting.removeByOutput(item('extendedcrafting:material', 24)) // Crystalline
mods.extendedcrafting.table_crafting.shapedBuilder()
    .tierElite()
    .output(item('extendedcrafting:material', 24)) // Crystalline
    .matrix(
        'DLLLLLD',
        'DNIGIND',
        'DNIGIND',
        'DLLLLLD')
    .key('D', item('minecraft:diamond'))
    .key('L', item('minecraft:dye', 4)) // Lapis
    .key('N', item('extendedcrafting:material', 140)) // Nether Star Nugget
    .key('I', item('minecraft:iron_ingot'))
    .key('G', item('minecraft:gold_ingot'))
    .register()
