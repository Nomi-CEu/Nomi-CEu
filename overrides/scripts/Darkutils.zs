import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
print("--- loading Darkutils.zs ---");

	#Remove and Hide items that has no use
	rh(<darkutils:monolith>);
	rh(<darkutils:monolith:1>);
	rh(<darkutils:lore_tag>);
	rh(<darkutils:lore_tag:1>);
	rh(<darkutils:lore_tag:2>);
	rh(<darkutils:lore_tag:3>);
	rh(<darkutils:lore_tag:4>);
	rh(<darkutils:lore_tag:5>);
	rh(<darkutils:lore_tag:6>);
	rh(<darkutils:lore_tag:7>);
	rh(<darkutils:lore_tag:8>);
	rh(<darkutils:lore_tag:9>);
	rh(<darkutils:lore_tag:10>);
	rh(<darkutils:lore_tag:11>);
	rh(<darkutils:lore_tag:12>);
	rh(<darkutils:lore_tag:13>);
	rh(<darkutils:lore_tag:14>);
	rh(<darkutils:lore_tag:15>);
	rh(<darkutils:charm_agression>);
	rh(<darkutils:focus_sash>);
	rh(<darkutils:charm_gluttony>);
	rh(<darkutils:charm_null>);
	rh(<darkutils:charm_portal>);
	rh(<darkutils:charm_sleep>);
	rh(<darkutils:trap_tile>);
	rh(<darkutils:trap_tile:1>);
	rh(<darkutils:trap_tile:2>);
	rh(<darkutils:trap_tile:3>);
	rh(<darkutils:trap_tile:4>);
	rh(<darkutils:trap_tile:5>);
	rh(<darkutils:trap_tile:6>);
	rh(<darkutils:trap_anchor>);
	rh(<darkutils:trap_move_fast>);
	rh(<darkutils:trap_move_hyper>);

	# Tweaks
	<darkutils:ender_tether>.addTooltip("Blocks Endermen from teleporting");
	recipes.remove(<darkutils:ender_tether>);
	recipes.addShapedMirrored("Ender Tether", 
	<darkutils:ender_tether>, 
	[[null, <darkutils:material:1>, null],
	[null, <minecraft:ender_pearl>, null], 
	[<metaitem:ingotEndSteel>, <metaitem:ingotEndSteel>, <metaitem:ingotEndSteel>]]);

	recipes.remove(<darkutils:trap_tile:7>);
	recipes.addShapedMirrored("Player Trap", 
	<darkutils:trap_tile:7>, 
	[[null, <extrautils2:ingredients:5>, null],
	[<darkutils:material>, <extrautils2:spike_diamond>, <darkutils:material>], 
	[null, <ore:itemSkull>, null]]);

	recipes.remove(<darkutils:ender_hopper>);
	recipes.addShapedMirrored("Ender Hopper", 
	<darkutils:ender_hopper>, 
	[[null, <darkutils:material:1>, null],
	[null, <enderio:block_vacuum_chest>, null], 
	[null, <minecraft:hopper>, null]]);

	recipes.remove(<darkutils:trap_move>);
	recipes.addShapedMirrored("Vector Plate", 
	<darkutils:trap_move> *16, 
	[[null, <ore:slimeball>, null],
	[null, <metaitem:conveyor.module.lv>, null], 
	[<metaitem:conveyor.module.lv>, <enderio:item_material:11>, <metaitem:conveyor.module.lv>]]);

	recipes.remove(<darkutils:sneaky>);
	recipes.addShapedMirrored("Sneaky Block", 
	<darkutils:sneaky> *8, 
	[[<enderio:item_conduit_facade>, <enderio:item_conduit_facade>, <enderio:item_conduit_facade>],
	[<enderio:item_conduit_facade>, <darkutils:material:2>, <enderio:item_conduit_facade>], 
	[<enderio:item_conduit_facade>, <enderio:item_conduit_facade>, <enderio:item_conduit_facade>]]);

print("--- Darkutils.zs initialized ---");
