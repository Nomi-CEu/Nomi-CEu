import crafttweaker.item.IItemStack;

val toRemove = [
	<projectred-core:resource_item:100>,		//Copper Ingot
	<projectred-core:resource_item:101>,		//Tin Ingot
	<projectred-core:resource_item:102>,		//Silver Ingot
	<projectred-core:resource_item:103>,		//Red Alloy Ingot
	<projectred-core:resource_item:104>,		//Electrotine Alloy Ingot
	<projectred-core:resource_item:105>,		//Electrotine
	<projectred-core:resource_item:200>,		//Ruby
	<projectred-core:resource_item:201>,		//Sapphire
	<projectred-core:resource_item:202>,		//Peridot
	<projectred-core:resource_item:251>,		//Red Iron Compound
	<projectred-core:resource_item:252>,		//Electrotine Iron Compound
	<projectred-core:resource_item:312>,		//Electrotine Silicon Compound
	<projectred-core:resource_item:342>,		//Electro Silicon
	<projectred-core:resource_item:400>,		//Copper Coil
	<projectred-core:resource_item:401>,		//Iron Coil
	<projectred-core:resource_item:402>,		//Gold Coil
	<projectred-core:resource_item:410>,		//Motor
	<projectred-core:resource_item:420>,		//Woven Cloth
	<projectred-core:resource_item:421>,		//Sail
	<projectred-core:resource_item:600>,		//Null-Logic Routing Chip
	<projectred-core:drawplate>,				//Draw Plate
	<projectred-core:multimeter>,				//Multimeter
	<projectred-integration:gate:34>,			//IC Gate
	<projectred-transmission:wire:34>,			//Low Load Power Line
	<projectred-transmission:framed_wire:34>,	//Framed Low Load Power Line
	<projectred-core:resource_item:250>,		//Sandy Coal Compound
	<projectred-core:resource_item:300>,		//Silicon Boule
	<projectred-core:resource_item:301>			//Silicon
] as IItemStack[];

//Removing the preceding items and their recipes
for item in toRemove {
	mods.jei.JEI.removeAndHide(item);
}

//Replacing silicon compound recipes with GT silicon wafers
recipes.remove(<projectred-core:resource_item:310>);
recipes.addShaped(<projectred-core:resource_item:310>, [
	[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>], 
	[<minecraft:redstone>,<metaitem:wafer.silicon>,<minecraft:redstone>], 
	[<minecraft:redstone>,<minecraft:redstone>,<minecraft:redstone>]]);
	
recipes.remove(<projectred-core:resource_item:311>);
recipes.addShaped(<projectred-core:resource_item:311>, [
	[<minecraft:glowstone_dust>,<minecraft:glowstone_dust>,<minecraft:glowstone_dust>], 
	[<minecraft:glowstone_dust>,<metaitem:wafer.silicon>,<minecraft:glowstone_dust>], 
	[<minecraft:glowstone_dust>,<minecraft:glowstone_dust>,<minecraft:glowstone_dust>]]
	);