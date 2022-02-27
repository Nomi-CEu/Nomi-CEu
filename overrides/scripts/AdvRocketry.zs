import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.common.makeShaped as makeShaped;
import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;

// Machine Structure
recipes.remove(<libvulpes:structuremachine>);
makeShaped("libvulpes_structure_machine",
	<libvulpes:structuremachine>, [
		" P ",
		"PMP",
		" P ",
	], {
		P: <ore:plateStainlessSteel>, // Stainless Steel Plate
		M: <extrautils2:machine>,     // Extra Utils 2 Machine Block
	});

recipes.remove(<libvulpes:hatch>);
recipes.remove(<libvulpes:hatch:1>);
recipes.remove(<libvulpes:hatch:2>);
recipes.remove(<libvulpes:hatch:3>);
recipes.remove(<libvulpes:forgepowerinput>);
recipes.remove(<advancedrocketry:loader:2>);
recipes.remove(<advancedrocketry:loader:3>);
recipes.remove(<advancedrocketry:loader:4>);
recipes.remove(<advancedrocketry:loader:5>);
recipes.addShapeless(<libvulpes:hatch>, [<libvulpes:structuremachine>,<meta_tile_entity:item_bus.import.mv>]);
recipes.addShapeless(<libvulpes:hatch:1>, [<libvulpes:structuremachine>,<meta_tile_entity:item_bus.export.mv>]);
recipes.addShapeless(<libvulpes:hatch:2>, [<libvulpes:structuremachine>,<meta_tile_entity:fluid_hatch.import.mv>]);
recipes.addShapeless(<libvulpes:hatch:3>, [<libvulpes:structuremachine>,<meta_tile_entity:fluid_hatch.export.mv>]);
recipes.addShapeless(<libvulpes:forgepowerinput>, [<libvulpes:structuremachine>,<meta_tile_entity:energy_hatch.input.mv>]);
recipes.addShapeless(<advancedrocketry:loader:2>, [<libvulpes:hatch:1>,<metaitem:electric.piston.hv>]);
recipes.addShapeless(<advancedrocketry:loader:3>, [<libvulpes:hatch:0>,<metaitem:electric.piston.hv>]);
recipes.addShapeless(<advancedrocketry:loader:4>, [<libvulpes:hatch:3>,<metaitem:electric.pump.hv>]);
recipes.addShapeless(<advancedrocketry:loader:5>, [<libvulpes:hatch:2>,<metaitem:electric.pump.hv>]);

// Liquid Fueled Engine
recipes.remove(<advancedrocketry:rocketmotor>);
makeShaped("ar_liquid_engine",
	<advancedrocketry:rocketmotor>, [
		" P ",
		"PPP",
		"TTT",
	], {
		P: <ore:plateDoubleSteel>,   // Heavy Steel Plating
		T: <simplyjetpacks:metaitemmods:7>, // Electrical Steel Thruster
	});

// Seat
recipes.remove(<advancedrocketry:seat>);
recipes.addShaped(<advancedrocketry:seat>, [
	[<minecraft:wool>         , <minecraft:wool>          , <minecraft:wool>         ],
	[<ore:plateStainlessSteel>, <ore:plateStainlessSteel> , <ore:plateStainlessSteel>]
]);

// Structure Tower
recipes.remove(<advancedrocketry:structuretower>);
recipes.addShaped(<advancedrocketry:structuretower> * 3, [
	[<ore:frameGtStainlessSteel>],
	[<ore:frameGtStainlessSteel>],
	[<ore:frameGtStainlessSteel>]
]);

/**
 *	Pressure Tanks
 */

val arTanks as IIngredient[IItemStack]  = {
	<advancedrocketry:pressuretank>:   hardenedtankIng,
	<advancedrocketry:pressuretank:1>: reinforcedtankIng,
	<advancedrocketry:pressuretank:2>: signalumtankIng,
	<advancedrocketry:pressuretank:3>: resonanttankIng,
};

var counter = -1;
for pressureTank, thermalTank in arTanks {
	counter = counter + 1;

	recipes.remove(pressureTank);
	makeShaped("ar_pressure_tank_" + (counter as string),
		pressureTank, [
			" M ",
			"PTP",
			" P ",
		], {
			M: <ore:pipeNormalFluidStainlessSteel>, // Medium Stainless Steel Pipe
			P: <ore:plateStainlessSteel>,  // Stainless Steel Plate
			T: thermalTank,                // Portable Tank
		});
}

/**
 *	Heavy Platings
 */

// Steel
//compressor.recipeBuilder()
//	.inputs([<ore:plateSteel> * 2])
//	.outputs(<ore:plateDoubleSteel>)
//	.EUt(100)
//	.duration(200)
//	.buildAndRegister();
//
//// Titanium
//compressor.recipeBuilder()
//	.inputs([<ore:plateTitanium> * 2])
//	.outputs(<contenttweaker:titaniumplating>)
//	.EUt(500)
//	.duration(200)
//	.buildAndRegister();
//
//// TungstenCarbide
//compressor.recipeBuilder()
//	.inputs([<ore:plateTungstenCarbide> * 2])
//	.outputs(<contenttweaker:tungstencarbideplating>)
//	.EUt(2000)
//	.duration(200)
//	.buildAndRegister();
//
//// Signalum
//compressor.recipeBuilder()
//	.inputs([<thermalfoundation:material:357> * 2])
//	.outputs(<contenttweaker:signalumplating>)
//	.duration(200)
//	.EUt(8000)
//	.buildAndRegister();
//
//// Iridium
//compressor.recipeBuilder()
//	.inputs([<ore:plateIridium> * 2])
//	.outputs(<contenttweaker:iridiumalloyplating>)
//	.EUt(15000)
//	.duration(200)
//	.buildAndRegister();
//
//// Enderium
//compressor.recipeBuilder()
//	.inputs([<thermalfoundation:material:359> * 2])
//	.outputs(<contenttweaker:enderiumplating>)
//	.duration(200)
//	.EUt(30000)
//	.buildAndRegister();
//
//// Draconium
//compressor.recipeBuilder()
//	.inputs([<moreplates:draconium_plate> * 2])
//	.outputs(<contenttweaker:draconiumplating>)
//	.duration(200)
//	.EUt(60000)
//	.buildAndRegister();
//
//// Crystal Matrix
//compressor.recipeBuilder()
//	.inputs([<moreplates:crystal_matrix_plate> * 2])
//	.outputs(<contenttweaker:crystalmatrixplating>)
//	.duration(200)
//	.EUt(125000)
//	.buildAndRegister();
//
//compressor.recipeBuilder()
//	.inputs([<ore:blockSteel>])
//	.outputs(<ore:plateDenseSteel>.firstItem)
//	.duration(200)
//	.EUt(30)
//	.buildAndRegister();
//
//compressor.recipeBuilder()
//	.inputs([<ore:blockTitanium>])
//	.outputs(<ore:plateDenseTitanium>.firstItem)
//	.duration(200)
//	.EUt(300)
//	.buildAndRegister();
//
//compressor.recipeBuilder()
//	.inputs([<ore:blockTungstenSteel>])
//	.outputs(<ore:plateDenseTungstenSteel>.firstItem)
//	.duration(200)
//	.EUt(300)
//	.buildAndRegister();
//
//// Quantum Fluxed Eternium Heavy Plating
//blast_furnace.recipeBuilder()
//	.inputs([
//		<redstonearsenal:material:224> * 10,
//		<moreplates:awakened_draconium_plate>,
//		<contenttweaker:quantumflux> * 16
//	])
//	.fluidInputs([<liquid:krypton> * 1000])
//	.outputs(<contenttweaker:quantumfluxedeterniumplating>)
//	.property("temperature", 9000)
//	.duration(200)
//	.EUt(250000)
//	.buildAndRegister();
//
//blast_furnace.recipeBuilder()
//	.inputs([<moreplates:neutronium_plate> * 2])
//	.fluidInputs([<liquid:einsteinium> * 144])
//	.outputs(<contenttweaker:neutroniumplating>)
//	.property("temperature", 9600)
//	.duration(200)
//	.EUt(500000)
//	.buildAndRegister();

// Field Generators
//var fieldGeneratorPattern as string[] = [
//	"WCW",
//	"CXC",
//	"WCW",
//];
//
//recipes.remove(<metaitem:field.generator.lv>);
//recipes.remove(<metaitem:field.generator.mv>);
//recipes.remove(<metaitem:field.generator.hv>);
//recipes.remove(<metaitem:field.generator.ev>);
//recipes.remove(<metaitem:field.generator.iv>);
//recipes.remove(<metaitem:field.generator.luv>);
//
//makeShaped("gt_field_generator_lv",
//	<metaitem:field.generator.lv>, fieldGeneratorPattern, {
//		W: <ore:wireGtSingleConductiveIron>, // 1x Conductive Iron Wire
//		C: <ore:circuitBasic>,               // T1 Circuit
//		X: <minecraft:ender_pearl>,          // Ender Pearl
//	});
//
//makeShaped("gt_field_generator_mv",
//	<metaitem:field.generator.mv>, fieldGeneratorPattern, {
//		W: <ore:wireGtSingleEnergeticAlloy>, // 1x Energetic Alloy Wire
//		C: <ore:circuitGood>,                // T2 Circuit
//		X: <minecraft:ender_eye>,            // Ender Eye
//	});
//
//makeShaped("gt_field_generator_hv",
//	<metaitem:field.generator.hv>, fieldGeneratorPattern, {
//		W: <ore:wireGtSingleVibrantAlloy>, // 1x Vibrant Alloy Wire
//		C: <ore:circuitAdvanced>,          // T3 Circuit
//		X: <metaitem:quantumeye>,          // Quantum Eye
//	});
//
//makeShaped("gt_field_generator_ev",
//	<metaitem:field.generator.ev>, fieldGeneratorPattern, {
//		W: <ore:wireGtSingleEndSteel>, // 1x End Steel Wire
//		C: <ore:circuitExtreme>,       // T4 Circuit
//		X: <minecraft:nether_star>,    // Nether Star
//	});
//
//makeShaped("gt_field_generator_iv",
//	<metaitem:field.generator.iv>, fieldGeneratorPattern, {
//		W: <ore:wireGtSingleLumium>, // 1x Lumium Wire
//		C: <ore:circuitElite>,       // T5 Circuit
//		X: <metaitem:quantumstar>,   // Quantum Star
//	});

/**
 * PackagedAuto!
 */

// Package Component
recipes.remove(<packagedauto:package_component>);
makeShaped("pauto_package_component",
	<packagedauto:package_component>, [
		"VTV",
		"TXT",
		"VTV",
	], {
		V: <ore:plateVibrantAlloy>, // Vibrant Alloy Plate
		T: <ore:plateTitanium>,     // Titanium Plate
		X: <minecraft:ender_eye>    // Ender Eye
	});

recipes.remove(<packagedauto:recipe_holder>);
makeShaped("pauto_recipe_holder",
	<packagedauto:recipe_holder> * 3, [
		"GPG",
		"PBP",
		"TMT",
	], {
		G: <appliedenergistics2:quartz_glass>,  // Quartz Glass
		P: <appliedenergistics2:material:52>,   // Blank Pattern
		M: <packagedauto:me_package_component>, // ME Packaging Component
		B: <ore:blockCrystaltine>, // Block of Crystaltine
		T: <ore:plateTitanium>,    // Titanium Plate
	});

recipes.remove(<packagedauto:packager>);
makeShaped("pauto_packager",
	<packagedauto:packager>, [
		"TMT",
		"CXC",
		"TIT",
	], {
		M: <packagedauto:me_package_component>, // ME Packaging Component
		I: <appliedenergistics2:part:240>,      // ME Import Bus
		T: <ore:plateTitanium>,   // Titanium Plate
		C: <ore:circuitExtreme>,  // T4 Circuit
		X: <extrautils2:crafter>, // ExU2 Crafter
	});

recipes.remove(<packagedauto:unpackager>);
makeShaped("pauto_unpackager",
	<packagedauto:unpackager>, [
		"TMT",
		"CXC",
		"TET",
	], {
		M: <packagedauto:me_package_component>, // ME Packaging Component
		E: <appliedenergistics2:part:260>,      // ME Export Bus
		T: <ore:plateTitanium>,   // Titanium Plate
		C: <ore:circuitExtreme>,  // T4 Circuit
		X: <extrautils2:crafter>, // ExU2 Crafter
	});

recipes.remove(<packagedauto:encoder>);
makeShaped("pauto_encoder",
	<packagedauto:encoder>, [
		"TMT",
		"HXH",
		"TCT",
	], {
		M: <packagedauto:me_package_component>, // ME Packaging Component
		H: <packagedauto:recipe_holder>,        // Recipe Holder
		T: <ore:plateTitanium>,   // Titanium Plate
		C: <ore:circuitExtreme>,  // T4 Circuit
		X: <ae2stuff:encoder>,    // AE2STuff Pattern Encoder
	});

recipes.remove(<ae2stuff:encoder>);
makeShaped("ae2stuff_encoder",
	<ae2stuff:encoder>, [
		"STS",
		"AXF",
		"SCS",
	], {
		S: <ore:plateStainlessSteel>,         // Stainless Steel Plate
		T: <appliedenergistics2:part:340>,    // ME Pattern Terminal
		F: <appliedenergistics2:material:43>, // Formation Core
		A: <appliedenergistics2:material:44>, // Annihilation Core
		M: <packagedauto:me_package_component>, // ME Packaging Component
		C: <ore:circuitAdvanced>,               // T4 Circuit
		X: <meta_tile_entity:hull.hv>,              // HV Machine Hull
	});


recipes.remove(<packagedauto:me_package_component>);
makeShaped("pauto_me_package_component",
	<packagedauto:me_package_component>, [
		"PGP",
		"AXF",
		"PGP",
	], {
		F: <appliedenergistics2:material:43>,  // Formation Core
		A: <appliedenergistics2:material:44>,  // Annihilation Core
		G: <appliedenergistics2:quartz_glass>, // Quartz Glass
		X: <packagedauto:package_component>,   // Package Component
		P: <ore:plateTitanium>,  // Titanium Plate
	});

/**
 * PackagedExCrafting
 */
val extremeCrafterPattern as string[] = [
	"CIC",
	"BTB",
	"CMC",
];

// Advanced Crafter
recipes.remove(<packagedexcrafting:advanced_crafter>);
makeShaped("pexc_advanced_crafter",
	<packagedexcrafting:advanced_crafter>, extremeCrafterPattern, {
		C: <extendedcrafting:material:15>,      // Advanced Catalyst
		I: <extendedcrafting:interface>,        // Automation Interface
		M: <packagedauto:me_package_component>, // ME Packaging Component
		B: <ore:plateBlackSteel>,               // Black Steel Plate
		T: <extendedcrafting:table_advanced>    // Advanced Crafting Table
			.transformDamage(0),
	});

// Elite Crafter
recipes.remove(<packagedexcrafting:elite_crafter>);
makeShaped("pexc_elite_crafter",
	<packagedexcrafting:elite_crafter>, extremeCrafterPattern, {
		C: <extendedcrafting:material:16>,      // Elite Catalyst
		I: <extendedcrafting:interface>,        // Automation Interface
		M: <packagedauto:me_package_component>, // ME Packaging Component
		B: <ore:plateBlackSteel>,               // Black Steel Plate
		T: <extendedcrafting:table_elite>       // Elite Crafting Table
			.transformDamage(0),
	});

// Ultimate
recipes.remove(<packagedexcrafting:ultimate_crafter>);
makeShaped("pexc_ultimate_crafter",
	<packagedexcrafting:ultimate_crafter>, extremeCrafterPattern, {
		C: <extendedcrafting:material:17>,      // Ultimate Catalyst
		I: <extendedcrafting:interface>,        // Automation Interface
		M: <packagedauto:me_package_component>, // ME Packaging Component
		B: <ore:plateBlackSteel>,               // Black Steel Plate
		T: <extendedcrafting:table_ultimate>    // Ultimate Crafting Table
			.transformDamage(0),
	});

// Hardened Glass
alloy_smelter.recipeBuilder()
	.inputs([
		<ore:dustLead>,
		<ore:dustObsidian> * 4
	])
	.outputs([<thermalfoundation:glass:3>])
	.duration(100)
	.EUt(30)
	.buildAndRegister();

// Suit Workstation
recipes.remove(<advancedrocketry:suitworkstation>);
makeShaped("ar_suit_workstation",
	<advancedrocketry:suitworkstation>, [
		"RTR",
		"CXC",
		"WWW",
	], {
		T: <metaitem:workbench>, // Workstation
		R: <metaitem:robot.arm.mv>, // MV Robot Arm
		C: <ore:circuitGood>,       // T2 Circuit
		X: <meta_tile_entity:hull.mv>,  // MV Machine Hull
		W: <meta_tile_entity:workbench>,  // GTCE Crafting Station
	});

// Gas Charger
recipes.remove(<advancedrocketry:oxygencharger>);
makeShaped("ar_oxygen_charger",
	<advancedrocketry:oxygencharger>, [
		"   ",
		"SPS",
		"ETE",
	], {
		S: <ore:plateDoubleSteel>, // Heavy Steel Plating
		P: <ore:pipeNormalFluidStainlessSteel>,    // Medium Stainless Steel Pipe
		E: <metaitem:electric.pump.hv>,   // HV Pump
		T: hardenedtank,                  // Hardened Portable Tank
	});

// Cloth
makeShaped("ctt_cloth",
	<contenttweaker:cloth> * 4, [
		"SSS",
		"SSS",
		"SSS",
	], {
		S: <minecraft:string> // Ssssssssstring 🐍
	});

makeShaped("ctt_thermal_cloth",
	<contenttweaker:thermalcloth> * 3, [
		"RRR",
		"CCC",
		"RRR",
	], {
		R: <minecraft:redstone>,   // Redstone
		C: <contenttweaker:cloth>, // Cloth
	});

/**
 * Unprepared Space Suit
 */

var thermalCloth as IIngredient[string] = {
	T: <contenttweaker:thermalcloth>,
};

makeShaped("ctt_unprepared_space_helmet",
	<contenttweaker:unpreparedspacehelmet>, [
		"TTT",
		"T T",
		"   ",
	], thermalCloth);

makeShaped("ctt_unprepared_space_chestpiece",
	<contenttweaker:unpreparedspacechestpiece>, [
		"T T",
		"TTT",
		"TTT",
	], thermalCloth);

makeShaped("ctt_unprepared_space_leggins",
	<contenttweaker:unpreparedspaceleggings>, [
		"TTT",
		"T T",
		"T T",
	], thermalCloth);

makeShaped("ctt_unprepared_space_boots",
	<contenttweaker:unpreparedspaceboots>, [
		"   ",
		"T T",
		"T T",
	], thermalCloth);

/**
 * Space Suit
 */

recipes.remove(<advancedrocketry:spacehelmet>);
recipes.remove(<advancedrocketry:spacechestplate>);
recipes.remove(<advancedrocketry:spaceboots>);
recipes.remove(<advancedrocketry:spaceleggings>);

val spaceSuitLayerPattern as string[] = [
	"CPC",
	"CPC",
	"CPC",
];

makeShaped("ctt_pressure_layer",
	<contenttweaker:pressurelayer>, spaceSuitLayerPattern, {
		C: <contenttweaker:cloth>, // Cloth
		P: <ore:plateBlackSteel>,  // Black Steel Plate
	});

makeShaped("ctt_radiation_layer",
	<contenttweaker:radiationlayer>, spaceSuitLayerPattern, {
		C: <contenttweaker:cloth>, // Cloth
		P: <ore:plateLead>,        // Lead Plate
	});

// Space Helmet
assembler.recipeBuilder()
	.inputs([
		<contenttweaker:unpreparedspacehelmet>,
		<contenttweaker:pressurelayer> * 2,
		<contenttweaker:radiationlayer> * 2,
		<minecraft:glass_pane>,
		<ore:circuitAdvanced>
	])
	.outputs([<advancedrocketry:spacehelmet>])
	.duration(500)
	.EUt(30)
	.buildAndRegister();

// Space Chestplate
assembler.recipeBuilder()
	.inputs([
		<contenttweaker:unpreparedspacechestpiece>,
		<contenttweaker:pressurelayer> * 4,
		<contenttweaker:radiationlayer> * 4
	])
	.outputs([<advancedrocketry:spacechestplate>])
	.duration(800)
	.EUt(30)
	.buildAndRegister();

// Space Leggins
assembler.recipeBuilder()
	.inputs([
		<contenttweaker:unpreparedspaceleggings>,
		<contenttweaker:pressurelayer> * 3,
		<contenttweaker:radiationlayer> * 3
	])
	.outputs([<advancedrocketry:spaceleggings>])
	.duration(600)
	.EUt(30)
	.buildAndRegister();

// Space boots
assembler.recipeBuilder()
	.inputs([
		<contenttweaker:unpreparedspaceboots>,
		<contenttweaker:pressurelayer>,
		<contenttweaker:radiationlayer>
	])
	.outputs([<advancedrocketry:spaceboots>])
	.duration(400)
	.EUt(30)
	.buildAndRegister();

/* ---- */

// Liquid Fuel Tank
recipes.remove(<advancedrocketry:fueltank>);
makeShaped("ar_fuel_tank",
	<advancedrocketry:fueltank>, [
		"PTP",
		"PTP",
		"PTP",
	], {
		P: <ore:plateStainlessSteel>,
		T: <thermalexpansion:tank>,
	});

// Concrete
//mixer.recipeBuilder()
//	.inputs([
//		<minecraft:gravel> * 3,
//		<ore:dustClay>
//	])
//	.fluidInputs([<liquid:water> * 500])
//	.fluidOutputs(<liquid:concrete> * 1000)
//	.EUt(16)
//	.duration(200)
//	.buildAndRegister();

// Guidance Computer
recipes.remove(<advancedrocketry:guidancecomputer>);
makeExtremeRecipe5(<advancedrocketry:guidancecomputer>,
	[
		"GPPPG",
		"PSMEP",
		"PCXCP",
		"PECSP",
		"GPPPG",
	], {
		G: <appliedenergistics2:quartz_vibrant_glass>, // Vibrant Quartz Glass
		P: <ore:plateDoubleSteel>, // Steel Heavy Plating
		X: <libvulpes:structuremachine>,  // Machine Structure
		S: <metaitem:sensor.hv>,  // HV Sensor
		E: <metaitem:emitter.hv>, // HV Emitter
		C: <ore:circuitAdvanced>, // T3 Circuit
		M: <metaitem:cover.screen>,  // GT Computer Screen
	});

// Rocket Assembling Machine
recipes.remove(<advancedrocketry:rocketbuilder>);
makeExtremeRecipe5(<advancedrocketry:rocketbuilder>,
	[
		"RPEPR",
		"PXMXP",
		"PCACP",
		"PXCXP",
		"RPEPR",
	], {
		P: <ore:plateDoubleSteel>, // Steel Heavy Plating
		R: <metaitem:robot.arm.mv>,       // MV Robot Arm
		X: <libvulpes:structuremachine>,  // Machine Structure
		A: <meta_tile_entity:assembler.mv>, // MV Assembling Machine
		E: <metaitem:emitter.mv>,  // MV Emitter
		M: <metaitem:cover.screen>,   //  GT Computer Screen
		C: <ore:circuitGood>,      // T2 Circuit
	});

// Planet ID Chip
recipes.remove(<advancedrocketry:planetidchip>);
makeShaped("ar_planet_id_chip", 
	<advancedrocketry:planetidchip>, [
		"WPW",
		"WCW",
		"WPW",
	], {
		W: <ore:wireFineStainlessSteel>, // Fine Stainless Steel Wire
		P: <ore:plateVibrantAlloy>, // Vibrant Alloy Plate
		C: <ore:circuitGood>, // T2 Circuit
	});

//// Soul Powder
//macerator.recipeBuilder()
//	.inputs([<enderio:item_alloy_ingot:7>])
//	.outputs([<enderio:item_material:74>])
//	.duration(200).EUt(30)
//	.buildAndRegister();

// Saltpeter
macerator.recipeBuilder()
	.inputs([<ore:sandstone> * 4])
	.outputs([<ore:dustSaltpeter>.firstItem])
	.duration(300)
	.EUt(30)
	.buildAndRegister();

// Certus Quartz Dust
macerator.recipeBuilder()
	.inputs([<appliedenergistics2:material>])
	.outputs([<ore:dustCertusQuartz>.firstItem])
	.duration(20)
	.EUt(16)
	.buildAndRegister();

// Draconium 🐉
macerator.recipeBuilder()
	.inputs([<draconicevolution:draconium_ore:2>])
	.outputs([<draconicevolution:draconium_dust> * 3])
	.duration(40)
	.EUt(500)
	.buildAndRegister();

// Launch Pad
recipes.remove(<advancedrocketry:launchpad>);
makeShaped("ar_launchpad",
	<advancedrocketry:launchpad> * 9, [
		"CCC",
		"CCC",
		"CCC",
	], {
		C: <ore:stoneConcrete>
	});

//Linker
recipes.remove(<libvulpes:linker>);
makeShaped("ar_linker",
	<libvulpes:linker>, [
		" E ",
		"SCS",
		"SSS",
	], {
		S: <ore:plateStainlessSteel>, // Stainless Steel Plate
		E: <metaitem:emitter.hv>,     // HV Emitter
		C: <ore:circuitAdvanced>,     // T3 Circuit
	});

// Plant Fibers
recipes.addShapeless(<minecraft:string> * 3, [<hooked:microcrafting>,<hooked:microcrafting>]);

// Fueling Station
recipes.remove(<advancedrocketry:fuelingstation>);
makeShaped("ar_fueling_station",
	<advancedrocketry:fuelingstation>, [
		"PMP",
		"PXP",
		"SSS",
	], {
		S: <ore:plateDoubleSteel>, // Heavy Steel Plating
		X: <libvulpes:structuremachine>,  // Machine Structure
		P: <metaitem:electric.pump.hv>,   // HV Pump
		M: <ore:pipeNormalFluidStainlessSteel>,    // Medium Stainless Steel Pipe
	});

<advancedrocketry:fuelingstation>.displayName = "Fueling Station";

// Dilithium Dust
macerator.recipeBuilder()
	.inputs([<libvulpes:ore0>])
	.outputs([<ore:dustDilithium>.firstItem * 2])
	.duration(200)
	.EUt(420)
	.buildAndRegister();

// Dilithium Crystal
autoclave.recipeBuilder()
	.inputs([<ore:dustDilithium> * 4])
	.fluidInputs(<liquid:deuterium> * 1000)
	.outputs([<ore:gemDilithium>.firstItem * 4])
	.duration(400)
	.EUt(110)
	.buildAndRegister();

// Space Station Builder
recipes.remove(<advancedrocketry:stationbuilder>);
makeExtremeRecipe5(<advancedrocketry:stationbuilder>,
	[
		"RTETR",
		"TXMXT",
		"TCACT",
		"TXCXT",
		"RTETR",
	], {
		T: <metaitem:plateDoubleTitanium>, // Heavy Titanium Plating
		X: <libvulpes:structuremachine>,     // Machine Structure
		R: <metaitem:robot.arm.ev>, // EV Robot Arm
		E: <metaitem:emitter.ev>,   // EV Emitter
		A: <meta_tile_entity:assembler.ev>,  // EV Assembling Machine
		C: <ore:circuitExtreme>, // T4 Circuit
		M: <metaitem:cover.screen>, // Screen
	});

// Station ID Chip
recipes.remove(<advancedrocketry:spacestationchip>);
makeShaped("ar_station_id_chip", 
	<advancedrocketry:spacestationchip>, [
		"WPW",
		"WCW",
		"WPW",
	], {
		W: <ore:wireFineTitanium>, // Fine Titanium Wire
		P: <ore:plateBlackSteel>,  // Black Steel Plate
		C: <ore:circuitExtreme>,   // T4 Circuit
	});

// Warp Monitor
recipes.remove(<advancedrocketry:warpmonitor>);
makeShaped("ar_warp_monitor",
	<advancedrocketry:warpmonitor>, [
		"SMS",
		"CXC",
		"SCS",
	], {
		X: <libvulpes:structuremachine>, // Machine Structure
		S: <metaitem:sensor.ev>, // EV Sensor
		M: <metaitem:cover.screen>, // Screen
		C: <ore:circuitExtreme>, // T4 Circuit
	});

// Holo Projector
recipes.remove(<libvulpes:holoprojector>);
makeShaped("ar_holo_projector", 
	<libvulpes:holoprojector>, [
		"   ",
		"TOT",
		"TTT",
	], {
		O: <advancedrocketry:satelliteprimaryfunction>, // Optical Sensor
		T: <ore:plateTitanium>, // Titanium Plate
	});

// Optical Sensor
recipes.remove(<advancedrocketry:satelliteprimaryfunction>);
makeShaped("ar_optical_sensor",
	<advancedrocketry:satelliteprimaryfunction>, [
		"GGG",
		"ISI",
		" I ",
	], {
		G: <minecraft:glass_pane>,   // Glass Pane
		I: <ore:platePulsatingIron>, // Pulsating Iron
		S: <metaitem:sensor.ev>,     // EV Sensor
	});

// Warp Core
recipes.remove(<advancedrocketry:warpcore>);
makeShaped("ar_warp_core",
	<advancedrocketry:warpcore>, [
		"LTL",
		"TNT",
		"LTL",
	], {
		L: <ore:blockLumium>,     // Block of Lumium
		T: <ore:blockTitanium>,   // Block of Titanium
		N: <ore:blockNetherStar>, // Block of Nether Stars
	});

// Rocket Monitoring Station
recipes.remove(<advancedrocketry:monitoringstation>);
makeShaped("ar_rocket_monitoring_station", 
	<advancedrocketry:monitoringstation>, [
		"ROR",
		"RXR",
		"RCR",
	], {
		O: <advancedrocketry:satelliteprimaryfunction>, // Optical Sensor
		X: <libvulpes:structuremachine>, // Machine Structure
		R: <ore:stickCopper>, // Copper Rod
		C: <ore:circuitGood>, // T2 Circuit
	});

// Guidance Computer Access Hatch
recipes.remove(<advancedrocketry:loader:6>);
makeShaped("ar_guidance_computer_access_hatch",
	<advancedrocketry:loader:6>, [
		" C ",
		"RXR",
		" C ",
	], {
		X: <libvulpes:structuremachine>, // Machine Structure
		R: <ore:stickCopper>, // Copper Rod
		C: <ore:circuitGood>, // T2 Circuit
	});

// Station Docking Port
recipes.remove(<advancedrocketry:stationmarker>);
recipes.addShapeless(<advancedrocketry:stationmarker>, [
	<actuallyadditions:item_battery>, <ore:circuitGood>, <libvulpes:structuremachine>
]);

// Station Gravity Controller
recipes.remove(<advancedrocketry:gravitycontroller>);
recipes.addShapeless(<advancedrocketry:gravitycontroller>, [
	<libvulpes:structuremachine>, <minecraft:piston>, <metaitem:cover.screen>
]);

// Altitude Controller
recipes.remove(<advancedrocketry:altitudecontroller>);
recipes.addShapeless(<advancedrocketry:altitudecontroller>, [
	<libvulpes:structuremachine>, <metaitem:cover.screen>, <ore:circuitGood>
]);

// Orientation Controller
recipes.remove(<advancedrocketry:orientationcontroller>);
recipes.addShapeless(<advancedrocketry:orientationcontroller>, [
	<libvulpes:structuremachine>, <metaitem:cover.screen>, <minecraft:compass>
]);

// Docking Pad
recipes.remove(<advancedrocketry:landingpad>);
recipes.addShapeless(<advancedrocketry:landingpad>, [
	<advancedrocketry:launchpad>, <ore:circuitGood>
]);

// Station Light
recipes.remove(<advancedrocketry:circlelight>);
makeShaped("ar_circlelight",
	<advancedrocketry:circlelight> * 4, [
		" P ",
		"PGP",
		" P ",
	], {
		P: <ore:plateIron>,  // Iron Plate
		G: <minecraft:glowstone>, // Glowstone
	});

// Atmosphere Detector
recipes.remove(<advancedrocketry:oxygendetection>);
makeShaped("ar_atmosphere_detector", 
	<advancedrocketry:oxygendetection>, [
		"PMP",
		"BXR",
		"PCP",
	], {
		X: <libvulpes:structuremachine>,
		B: <minecraft:iron_bars>, // Vanilla Iron Bars
		M: <metaitem:cover.screen>,  // Screen
		P: <ore:plateSteel>,  // Steel Plate
		C: <ore:circuitGood>, // T2 Circuit
		R: <ore:rotorSteel>,  // Steel Rotor
	});

// Area Gravity Controller
recipes.remove(<advancedrocketry:gravitymachine>);
makeShaped("ar_gravity_machine",
	<advancedrocketry:gravitymachine>, [
		" M ",
		"TWT",
		"TCT",
	], {
		W: <advancedrocketry:warpcore>, // Warp Core
		T: <ore:plateTitanium>,  // Titanium Plate
		C: <ore:circuitExtreme>, // T4 Circuit
		M: <metaitem:cover.screen>, // Screen
	});

// Seal Detector
recipes.remove(<advancedrocketry:sealdetector>);
recipes.addShaped(<advancedrocketry:sealdetector>, [
	[<metaitem:sensor.mv>  ],
	[<metaitem:cover.screen>  ],
	[<minecraft:comparator>]
]);

// HoverCraft
recipes.remove(<advancedrocketry:hovercraft>);
makeShaped("ar_hovercraft",
	<advancedrocketry:hovercraft>, [
		"CMC",
		"DTD",
		"E E",
	], {
		T: <advancedrocketry:structuretower>, // Structure Tower
		E: <advancedrocketry:rocketmotor>,    // Liquid Engine
		C: <ore:circuitGood>,    // T2 Circuit
		M: <metaitem:cover.screen>, // Screen
		D: <ore:crystalDilithium>,   // Dilithium Crystal
	});

// Planet Selector
recipes.remove(<advancedrocketry:planetselector>);
recipes.addShaped(<advancedrocketry:planetselector>, [
	[<ore:circuitGood>            , <advancedrocketry:planetidchip> , <ore:circuitGood>           ],
	[<libvulpes:structuremachine> , <libvulpes:structuremachine>    , <libvulpes:structuremachine>]
]);

// Holographic Planet Selector
recipes.remove(<advancedrocketry:planetholoselector>);
makeShaped("ar_planetselector_holo",
	<advancedrocketry:planetholoselector>, [
		"CGC",
		"XPX",
		"CHC",
	], {
		P: <advancedrocketry:planetselector>,
		X: <libvulpes:structuremachine>,
		C: <ore:circuitGood>,
		G: <minecraft:glowstone>,
		H: <libvulpes:holoprojector>,
	});

// Advanced Machine Structure
recipes.remove(<libvulpes:advstructuremachine>);
makeShaped("ar_advanced_structure", 
	<libvulpes:advstructuremachine>, [
		"RPR",
		"PSP",
		"RPR",
	], {
		P: <metaitem:plateTitanium>,
		R: <metaitem:stickTitanium>,
		S: <libvulpes:structuremachine>,
	});

// Space Suit Upgrades
// Hover Upgrade
assembler.recipeBuilder()
	.inputs([
		<enderio:item_dark_steel_upgrade:1>
			.withTag({"enderio:dsu": "enderio:glide", "enderio:enabled": 1 as byte}),
		<contenttweaker:radiationlayer>,
		<contenttweaker:pressurelayer>
	])
	.outputs(<advancedrocketry:itemupgrade:0>)
	.duration(400)
	.EUt(100)
	.buildAndRegister();

// Bionic Leg upgrade
assembler.recipeBuilder()
	.inputs([
		<enderio:item_dark_steel_upgrade:1>
			.withTag({"enderio:dsu": "enderio:speedboost3", "enderio:enabled": 1 as byte}),
		<contenttweaker:radiationlayer>,
		<contenttweaker:pressurelayer>
	])
	.outputs(<advancedrocketry:itemupgrade:2>)
	.duration(400)
	.EUt(100)
	.buildAndRegister();

// Flight Speed Control Upgrade
assembler.recipeBuilder()
	.inputs([
		<enderio:item_dark_steel_upgrade:1>
			.withTag({"enderio:dsu": "enderio:travel", "enderio:enabled": 1 as byte}),
		<contenttweaker:radiationlayer>,
		<contenttweaker:pressurelayer>
	])
	.outputs(<advancedrocketry:itemupgrade:1>)
	.duration(400)
	.EUt(100)
	.buildAndRegister();

// Anti Fog visor
assembler.recipeBuilder()
	.inputs([
		<enderio:item_dark_steel_upgrade:1>
			.withTag({"enderio:dsu": "enderio:nightvision", "enderio:enabled": 1 as byte}),
		<contenttweaker:radiationlayer>,
		<contenttweaker:pressurelayer>
	])
	.outputs(<advancedrocketry:itemupgrade:4>)
	.duration(400)
	.EUt(100)
	.buildAndRegister();

// Padded Landing Boots
assembler.recipeBuilder()
	.inputs([
		<enderio:item_dark_steel_upgrade:1>
			.withTag({"enderio:dsu": "enderio:energyupgrade4", "enderio:enabled": 1 as byte}),
		<contenttweaker:radiationlayer>,
		<contenttweaker:pressurelayer>
	])
	.outputs(<advancedrocketry:itemupgrade:3>)
	.duration(400)
	.EUt(100)
	.buildAndRegister();

// Atmospheric sensor
assembler.recipeBuilder()
	.inputs([
		<enderio:item_dark_steel_upgrade>,
		<metaitem:sensor.mv>
	])
	.outputs(<advancedrocketry:atmanalyser>)
	.duration(200)
	.EUt(100)
	.buildAndRegister();

//Bipropellant engine
//recipes.remove(<advancedrocketry:bipropellantrocketmotor>);
//makeShaped("ar_biprop_engine",
//	<advancedrocketry:bipropellantrocketmotor>, [
//		" S ",
//		"STS",
//		"RRR",
//	], {
//		S: <ore:plateDoubleSteel>,
//		R: <simplyjetpacks:metaitemmods:7>,
//		T: hardenedtankIng
//	});

//Advanced Bipropellant engine
//recipes.remove(<advancedrocketry:advbipropellantrocketmotor>);
//makeShaped("ar_advanced_biprop_engine",
//	<advancedrocketry:advbipropellantrocketmotor>, [
//		" S ",
//		"STS",
//		"RRR",
//	], {
//		S: <ore:plateDoubleTungstenCarbide>,
//		R: <simplyjetpacks:metaitemmods:8>,
//		T: reinforcedtankIng
//	});
//
////Bipropellant Fuel Tank
//recipes.remove(<advancedrocketry:bipropellantfueltank>);
//makeShaped("ar_biprop_fuel_tank",
//	<advancedrocketry:bipropellantfueltank>, [
//		"PNP",
//		"PTP",
//		"P P",
//	], {
//		P: <metaitem:plateStainlessSteel>,
//		N: <ore:pipeLargeFluidStainlessSteel>,
//		T: reinforcedtankIng
//	});

//Oxidizer Tank
//recipes.remove(<advancedrocketry:oxidizerfueltank>);
//makeShaped("ar_oxidizer_tank",
//	<advancedrocketry:oxidizerfueltank>, [
//		"P P",
//		"PTP",
//		"PNP",
//	], {
//		P: <metaitem:plateStainlessSteel>,
//		N: <ore:pipeLargeFluidStainlessSteel>,
//		T: reinforcedtankIng
//	});
//
/*

  Removals

*/

mods.jei.JEI.removeAndHide(<advancedrocketry:blockpump>);    // Fluid Pump
mods.jei.JEI.removeAndHide(<advancedrocketry:centrifuge>);   // Centrifuge
mods.jei.JEI.removeAndHide(<advancedrocketry:basalt>);       // Basalt
mods.jei.JEI.removeAndHide(<advancedrocketry:landingfloat>); // Landing Float
mods.jei.JEI.removeAndHide(<advancedrocketry:airlock_door>); // Airlock Door (Technical Block)
mods.jei.JEI.removeAndHide(<advancedrocketry:lightsource>);  // Light source (Technical Block)
mods.jei.JEI.removeAndHide(<advancedrocketry:astrobed>);     // Astrobed     (Technical Block)

//AR Rocket fuel, unusable
mods.jei.JEI.removeAndHide(<forge:bucketfilled>.withTag({FluidName: "rocketfuel", Amount: 1000}));

// Various unused satellite sensors
mods.jei.JEI.removeAndHide(<advancedrocketry:satelliteprimaryfunction:2>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satelliteprimaryfunction:3>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satelliteprimaryfunction:4>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satelliteprimaryfunction:5>);

// Unused Chips
mods.jei.JEI.removeAndHide(<advancedrocketry:ic:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satelliteidchip>);

// Oxygen vent recipe using EV motor and titanium rotor
recipes.remove(<advancedrocketry:oxygenvent>);
recipes.addShaped(<advancedrocketry:oxygenvent>, [
	[<minecraft:iron_bars>, <metaitem:rotorTitanium>, <minecraft:iron_bars>],
	[<minecraft:iron_bars>, <metaitem:electric.motor.ev>, <minecraft:iron_bars>],
	[<minecraft:iron_bars>, <advancedrocketry:fueltank>, <minecraft:iron_bars>]]);

// CO2 Scrubber Recipe - same material replacements as above
recipes.remove(<advancedrocketry:oxygenscrubber>);
recipes.addShaped(<advancedrocketry:oxygenscrubber>, [
	[<minecraft:iron_bars>, <metaitem:rotorTitanium>, <minecraft:iron_bars>],
	[<minecraft:iron_bars>, <metaitem:electric.motor.ev>, <minecraft:iron_bars>],
	[<minecraft:iron_bars>, <metaitem:carbon.mesh>, <minecraft:iron_bars>]]);

// Carbon Collection Cartridge - steel plating since these last a while
recipes.remove(<advancedrocketry:carbonscrubbercartridge>);
recipes.addShaped(<advancedrocketry:carbonscrubbercartridge>, [
	[<ore:plateDoubleSteel>, <minecraft:iron_bars>, <ore:plateDoubleSteel>],
    [<ore:plateDoubleSteel>, <minecraft:iron_bars>, <ore:plateDoubleSteel>],
    [<ore:plateDoubleSteel>, <minecraft:iron_bars>, <ore:plateDoubleSteel>]]);