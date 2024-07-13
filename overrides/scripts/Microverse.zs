import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;

import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeExtremeRecipe7 as makeExtremeRecipe7;
import scripts.common.makeExtremeRecipe9 as makeExtremeRecipe9;
import scripts.common.makeShaped as makeShaped;
import scripts.common.makeShapeless3 as makeShapeless3;


/////////////	 Tier One Space Ship   	  //////////////////	200 ingots

makeShaped("of_tieroneship", <nomilabs:tieroneship>,
	[" G ",
	 "LAL",
	 "TMT"],
	{ G : <nomilabs:t1guidance>,
	  L : <nomilabs:t1laser>,
	  A : <metaitem:field.generator.lv>,
	  T : <simplyjetpacks:metaitemmods:7>,
	  M : <meta_tile_entity:combustion_generator.lv> }
);

// Tier 1 Guidance
makeShaped("of_t1guidance", <nomilabs:t1guidance>,
	["GPG",
	 "PCP",
	 "CCC"],
	{ C : <ore:circuitMv>,
	  G : <metaitem:sensor.lv>,
	  P : <ore:plateDoubleSteel> }
);

// Tier 1 Laser
makeShaped("of_t1laser", <nomilabs:t1laser>,
	[" R ",
	 "QGQ",
	 "QGQ"],
	{ G : <minecraft:glass>,
	  Q : <minecraft:quartz>,
	  R : <minecraft:redstone_block>}
);



/////////////	 Tier Two Space Ship  	  //////////////////

makeExtremeRecipe5(<nomilabs:tiertwoship>,
	["  G  ",
	 " PAP ",
	 "LBFBL",
	 "PPCPP",
	 " TTT "],
	{ A : <metaitem:crate.stainless_steel>,
	  B : <metaitem:field.generator.lv>,
	  C : <meta_tile_entity:combustion_generator.mv>,
	  F : <thermalexpansion:frame:146>,
	  G : <nomilabs:t1guidance>,
	  L : <nomilabs:t1laser>,
	  P : <metaitem:plateDoubleTitanium>,
	  T : <simplyjetpacks:metaitemmods:8> }
);


/////////////	 Tier Three Space Ship  	  //////////////////

makeExtremeRecipe7(<nomilabs:tierthreeship>,
	["  G G  ",
	 "  PPP  ",
	 "  ABA  ",
	 " LPBPL ",
	 "PPFBFPP",
	 "PPPCPPP",
	 "  TTT  "],
	{ A : <metaitem:field.generator.mv>,
	  B : <metaitem:crate.titanium>,
	  C : <meta_tile_entity:combustion_generator.hv>,
	  F : <thermalexpansion:frame:146>,
	  G : <nomilabs:t1guidance>,
	  L : <nomilabs:t2laser>,
	  P : <ore:plateDoubleTungstenCarbide>,
	  T : <simplyjetpacks:metaitemmods:28> }
);

// Tier 2 Laser
makeExtremeRecipe5(<nomilabs:t2laser>,
	[" R R ",
	 "GAGAG",
	 "GAGAG",
	 "GBGBG",
	 "QCECQ"],
	{ A : <nomilabs:solidifiedargon>,
	  B : <minecraft:quartz_block>,
	  C : <ore:circuitHv>,
	  E : <enderio:block_cap_bank:1>,
	  G : <minecraft:glass>,
	  Q : <minecraft:quartz>,
	  R : <minecraft:redstone_block> }
);

// Rocket Engine
recipes.remove(<advancedrocketry:advrocketmotor>);
makeShaped("of_ar_advrocketmotor", <advancedrocketry:advrocketmotor>,
	[" P ",
	 "PPP",
	 "TTT"],
	{ P : <ore:plateDoubleTungstenCarbide>,
	  T : <simplyjetpacks:metaitemmods:8> }
);

/////////////	 Tier Four Space Ship  	  //////////////////
makeExtremeRecipe7(<nomilabs:tierfourship>,
	["   G   ",
	 "  LWL  ",
	 " SAWAS ",
	 " SBWBS ",
	 " SFWFS ",
	 " TDWDT ",
	 "  T T  "],
	{ A : <metaitem:crate.tungstensteel>,
	  B : <metaitem:field.generator.hv>,
	  D : <thermalexpansion:dynamo:3>,
	  F : <thermalexpansion:frame:147>,
	  G : <nomilabs:t1guidance>,
	  L : <nomilabs:t2laser>,
	  S : <ore:plateDoubleSignalum>,
	  T : <simplyjetpacks:metaitemmods:9>,
	  W : <ore:plateDoubleTungstenCarbide> }
);


// Tier 2 Guidance
makeShaped("of_t2guidance", <nomilabs:t2guidance>,
	["AWA",
	 "WCW",
	 "CCC"],
	{ A : <metaitem:sensor.ev>,
	  C : <ore:circuitEv>,
	  W : <ore:plateDoubleTungstenCarbide> }
);

/////////////	 Tier Five Space Ship  	  //////////////////

makeExtremeRecipe7(<nomilabs:tierfiveship>,
	["  G G  ",
	 "  I I  ",
	 " SILIS ",
	 "SSABASS",
	 " IFCFI ",
	 "IIIPIII",
	 "  TTT  "],
	{ A : <metaitem:field.generator.ev>,
	  B : <meta_tile_entity:super_chest.mv>,
	  C : <nuclearcraft:fission_controller_new_fixed>,
	  F : <thermalexpansion:frame:147>,
	  G : <nomilabs:t2guidance>,
	  I : <ore:plateDoubleIridium>,
	  L : <nomilabs:t3laser>,
	  P : <nuclearcraft:fission_port>,
	  S : <ore:plateDoubleSignalum>,
	  T : <simplyjetpacks:metaitemmods:10> }
);


/////////////	 Tier Six Space Ship  	  //////////////////
makeExtremeRecipe7(<nomilabs:tiersixship>,
	[" LG GL ",
	 "LEE EEL",
	 "EEEEEEE",
	 " EAFAE ",
	 "EBFCFBE",
	 " EPPPE ",
	 " ETTTE "],
	{ A : <meta_tile_entity:super_chest.mv>,
	  B : <metaitem:field.generator.iv>,
	  C : <nuclearcraft:fission_controller_new_fixed>,
	  E : <ore:plateDoubleEnderium>,
	  F : <thermalexpansion:frame:148>,
	  G : <nomilabs:t2guidance>,
	  L : <nomilabs:t3laser>,
	  P : <nuclearcraft:fission_port>,
	  T : <simplyjetpacks:metaitemmods:29> }
);

/////////////	 Tier Seven Space Ship  	  //////////////////

makeExtremeRecipe9(<nomilabs:tiersevenship>,
	[" L  D  L ",
	 " DDDGDDD ",
	 "LDDDDDDDL",
	 "DDDDPDDDD",
	 "DDDAEADDD",
	 "DDDDPDDDD",
	 "DDDDDDDDD",
	 "D DDDDD D",
	 "D WW WW D"],
	{ A : <metaitem:field.generator.luv>,
	  D : <ore:plateDoubleDraconium>,
	  E : <draconicevolution:ender_energy_manipulator>,
	  G : <nomilabs:t2guidance>,
	  L : <nomilabs:t3laser>,
	  P : <draconicevolution:particle_generator:2>,
	  W : <nomilabs:warpengine> }
);

// TODO Research?
assembly_line.recipeBuilder()
	.inputs([<metaitem:nomilabs:frameMicroversium>, <ore:plateEnderium> * 6, <draconicevolution:item_dislocation_inhibitor>, <draconicevolution:magnet:1>, <ore:plateCrystalMatrix> * 2, <metaitem:field.generator.iv> * 2, <simplyjetpacks:metaitemmods:30> * 2, <simplyjetpacks:metaitemmods:11>])
	.fluidInputs(<liquid:soldering_alloy> * 1152)
	.outputs(<nomilabs:warpengine>)
	.property("research", <draconicevolution:item_dislocation_inhibitor>)
	.duration(1800).EUt(30720).buildAndRegister();

recipes.remove(<draconicevolution:magnet:1>);

recipes.addShaped(<draconicevolution:magnet:1>, [
	[<ore:ingotDraconium>, null, <ore:ingotDraconium>],
	[<ore:dustRedstone>, <draconicevolution:magnet>, <ore:dustRedstone>],
	[<ore:ingotEuropium>, <draconicevolution:dislocator_advanced>, <ore:ingotEuropium>]
]);

/////////////	 Tier Eight Space Ship  	  //////////////////

makeExtremeRecipe9(<nomilabs:tiereightship>,
	[" G C C G ",
	 " WCCLCCW ",
	 " WCIIICW ",
	 "LCIIIIICL",
	 "WCAABAACW",
	 "WCWWIWWCW",
	 "WDCCICCDW",
	 "WMWWIWWMW",
	 " E     E "],
	{ A : <meta_tile_entity:super_chest.hv>,
	  B : <metaitem:field.generator.zpm>,
	  C : <ore:plateDoubleCrystalMatrix>,
	  D : <advancedrocketry:warpcore>,
	  E : <nomilabs:warpengine>,
	  G : <nomilabs:t2guidance>,
	  I : <ore:plateDoubleIridium>,
	  L : <nomilabs:t3laser>,
	  M : <advancedrocketry:warpmonitor>,
	  W : <ore:plateDoubleTungstenCarbide> }
);



/////////////	 Tier Nine Space Ship  	  //////////////////

makeExtremeRecipe9(<nomilabs:tiernineship>,
	["    Q    ",
	 "   QQQ   ",
	 "   QUQ   ",
	 "  QQAQQ  ",
	 " QQQQQQQ ",
	 "QQBQRQBQQ",
	 " QQQCQQQ ",
	 " QQQQQQQ ",
	 "QQ W W QQ"],
	{ A : <metaitem:field.generator.uv>,
	  B : <meta_tile_entity:super_chest.ev>,
	  C : <draconicevolution:reactor_core>,
	  Q : <nomilabs:quantumfluxedeterniumplating>,
	  R : <draconicevolution:reactor_component>,
	  U : <nomilabs:universalnavigator>,
	  W : <nomilabs:warpengine> }
);

// Recipe moved to Groovy

/////////////	 Tier Ten Space Ship  	  //////////////////

makeExtremeRecipe9(<nomilabs:tiertenship>,
	["  N   N  ",
	 " NUN NUN ",
	 " NNN NNN ",
	 " NNN NNN ",
	 " NCNNNCN ",
	 "PNRN NRNP",
	 "NNNNANNNN",
	 " N NNN N ",
	 "N  W W  N"],
	{ A : <meta_tile_entity:super_chest.iv>,
	  C : <draconicevolution:reactor_core>,
	  N : <ore:plateDoubleNeutronium>,
	  P : <solarflux:solar_panel_neutronium>,
	  R : <draconicevolution:reactor_component>,
	  U : <nomilabs:universalnavigator>,
	  W : <nomilabs:warpengine> }
);

recipes.removeByRecipeName("avaritia:items/resource/neutron_nugget");


// Quantum Flux

makeShaped("of_quantumflux_b", <nomilabs:quantumflux>,
	[" M ",
	 "MDM",
	 " M "],
	{ M : <nomilabs:moondust>,
	  D : <minecraft:diamond> }
);


// AA Experience Solidifier
recipes.remove(<actuallyadditions:block_xp_solidifier>);
makeShaped("of_aa_block_xp_solidifier", <actuallyadditions:block_xp_solidifier>,
	["AAA",
	 "ABA",
	 "AAA"],
	{ A : <metaitem:nomilabs:plateVibrantAlloy>,
	  B : <meta_tile_entity:fluid_solidifier.hv> }
);

// Solidified Experience
solidifier.recipeBuilder()
    .fluidInputs([<liquid:xpjuice> * 160])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<actuallyadditions:item_solidified_experience>)
    .duration(500).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
	.inputs(<actuallyadditions:item_solidified_experience>)
	.fluidOutputs(<liquid:xpjuice> * 160)
	.duration(80).EUt(32).buildAndRegister();

// Dense Hydrogen
makeShaped("of_densehydrogen", <nomilabs:densehydrogen>,
	["HHH",
	 "HHH",
	 "HHH"],
	{ H : <nomilabs:solidifiedhydrogen> }
);

compressor.recipeBuilder()
	.inputs(<nomilabs:solidifiedhydrogen> * 9)
	.outputs(<nomilabs:densehydrogen>)
	.duration(300).EUt(2).buildAndRegister();

// Dense -> Solidified decomposition
recipes.addShapeless(<nomilabs:solidifiedhydrogen> * 9, [<nomilabs:densehydrogen>]);

// Ultra Dense Hydrogen
makeShaped("of_ultradensehydrogen", <nomilabs:ultradensehydrogen>,
	["DDD",
	 "DDD",
	 "DDD"],
	{ D : <nomilabs:densehydrogen> }
);

compressor.recipeBuilder()
	.inputs(<nomilabs:densehydrogen> * 9)
	.outputs(<nomilabs:ultradensehydrogen>)
	.duration(300).EUt(2).buildAndRegister();

// Ultra Dense -> Dense decomposition
recipes.addShapeless(<nomilabs:densehydrogen> * 9, [<nomilabs:ultradensehydrogen>]);




