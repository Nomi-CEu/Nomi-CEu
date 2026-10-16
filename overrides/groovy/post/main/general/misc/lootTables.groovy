package post.main.general.misc

import com.cleanroommc.groovyscript.event.LootTablesLoadedEvent
import net.minecraft.util.ResourceLocation
import net.minecraft.world.storage.loot.LootEntryTable
import net.minecraft.world.storage.loot.conditions.LootCondition

var noConditions = new LootCondition[0]

var tweakEntryTable = { LootTablesLoadedEvent event, String tableName, String poolName, String entryName ->
    event.loot.getTable(tableName).getPool(poolName).removeEntry(entryName)
    event.loot.getTable(tableName).getPool(poolName).addEntry(
        new LootEntryTable(new ResourceLocation(entryName + '_tweaked'), 1, 1, noConditions, entryName + '_tweaked')
    )
}

event_manager.listen { LootTablesLoadedEvent event ->
    // Replace EIO ingots with GregTech / Nomi Labs ones
    tweakEntryTable(event, 'minecraft:chests/simple_dungeon', 'Ender IO', 'enderio:chests/simple_dungeon')
    tweakEntryTable(event, 'minecraft:chests/abandoned_mineshaft', 'Ender IO', 'enderio:chests/abandoned_mineshaft')
    tweakEntryTable(event, 'minecraft:chests/village_blacksmith', 'Ender IO', 'enderio:chests/village_blacksmith')
}
