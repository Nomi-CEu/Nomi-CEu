#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;

import mods.contenttweaker.AxisAlignedBB;

import mods.contenttweaker.IItemFoodEaten;
import crafttweaker.potions.IPotion;


//var smallgearextrudershape = VanillaFactory.createItem("smallgearextrudershape");
//smallgearextrudershape.maxStackSize = 64;
//smallgearextrudershape.register();
//
//var deuteriumrover = VanillaFactory.createItem("deuteriumrover");
//deuteriumrover.maxStackSize = 64;
//deuteriumrover.register();
//
//var helium3rover = VanillaFactory.createItem("helium3rover");
//helium3rover.maxStackSize = 64;
//helium3rover.register();

var creativeportabletankmold = VanillaFactory.createItem("creativeportabletankmold");
creativeportabletankmold.maxStackSize = 64;
creativeportabletankmold.register();

var woodenwidget = VanillaFactory.createItem("woodenwidget");
woodenwidget.maxStackSize = 64;
woodenwidget.register();

var alloywidget = VanillaFactory.createItem("alloywidget");
alloywidget.maxStackSize = 64;
alloywidget.register();

var enderwidget = VanillaFactory.createItem("enderwidget");
enderwidget.maxStackSize = 64;
enderwidget.register();

var stonewidget = VanillaFactory.createItem("stonewidget");
stonewidget.maxStackSize = 64;
stonewidget.register();

var woodwidgetleft = VanillaFactory.createItem("woodwidgetleft");
woodwidgetleft.maxStackSize = 64;
woodwidgetleft.register();

var woodwidgetright = VanillaFactory.createItem("woodwidgetright");
woodwidgetright.maxStackSize = 64;
woodwidgetright.register();

var stonewidgetup = VanillaFactory.createItem("stonewidgetup");
stonewidgetup.maxStackSize = 64;
stonewidgetup.register();

var stonewidgetdown = VanillaFactory.createItem("stonewidgetdown");
stonewidgetdown.maxStackSize = 64;
stonewidgetdown.register();

var grainsofinnocence = VanillaFactory.createItem("grainsofinnocence");
grainsofinnocence.maxStackSize = 64;
grainsofinnocence.register();

//var combinationcircuit = VanillaFactory.createItem("combinationcircuit");
//combinationcircuit.maxStackSize = 64;
//combinationcircuit.register();

//var electronicprocessor = VanillaFactory.createItem("electronicprocessor");
//electronicprocessor.maxStackSize = 64;
//electronicprocessor.register();
//
//var electronicprocessorarray = VanillaFactory.createItem("electronicprocessorarray");
//electronicprocessorarray.maxStackSize = 64;
//electronicprocessorarray.register();
//
//var refinedcircuit = VanillaFactory.createItem("refinedcircuit");
//refinedcircuit.maxStackSize = 64;
//refinedcircuit.register();
//
//var refinedprocessor = VanillaFactory.createItem("refinedprocessor");
//refinedprocessor.maxStackSize = 64;
//refinedprocessor.register();
//
//var refinedprocessorarray = VanillaFactory.createItem("refinedprocessorarray");
//refinedprocessorarray.maxStackSize = 64;
//refinedprocessorarray.register();
//
//var refinedprocessormainframe = VanillaFactory.createItem("refinedprocessormainframe");
//refinedprocessormainframe.maxStackSize = 64;
//refinedprocessormainframe.register();
//
//var microcircuit = VanillaFactory.createItem("microcircuit");
//microcircuit.maxStackSize = 64;
//microcircuit.register();
//
//var microprocessorarray = VanillaFactory.createItem("microprocessorarray");
//microprocessorarray.maxStackSize = 64;
//microprocessorarray.register();
//
//var microprocessormainframe = VanillaFactory.createItem("microprocessormainframe");
//microprocessormainframe.maxStackSize = 64;
//microprocessormainframe.register();
//
//var nanoprocessorarray = VanillaFactory.createItem("nanoprocessorarray");
//nanoprocessorarray.maxStackSize = 64;
//nanoprocessorarray.register();
//
//var nanoprocessormainframe = VanillaFactory.createItem("nanoprocessormainframe");
//nanoprocessormainframe.maxStackSize = 64;
//nanoprocessormainframe.register();
//
//var quantumprocessor = VanillaFactory.createItem("quantumprocessor");
//quantumprocessor.maxStackSize = 64;
//quantumprocessor.register();
//
//var quantumprocessorarray = VanillaFactory.createItem("quantumprocessorarray");
//quantumprocessorarray.maxStackSize = 64;
//quantumprocessorarray.register();
//
//var quantumprocessormainframe = VanillaFactory.createItem("quantumprocessormainframe");
//quantumprocessormainframe.maxStackSize = 64;
//quantumprocessormainframe.register();
//
//var crystalcircuit = VanillaFactory.createItem("crystalcircuit");
//crystalcircuit.maxStackSize = 64;
//crystalcircuit.register();
//
//var crystalprocessorarray = VanillaFactory.createItem("crystalprocessorarray");
//crystalprocessorarray.maxStackSize = 64;
//crystalprocessorarray.register();
//
//var crystalprocessormainframe = VanillaFactory.createItem("crystalprocessormainframe");
//crystalprocessormainframe.maxStackSize = 64;
//crystalprocessormainframe.register();




var warpengine = VanillaFactory.createItem("warpengine");
warpengine.maxStackSize = 64;
warpengine.rarity = "epic";
warpengine.register();

var radiumsalt = VanillaFactory.createItem("radiumsalt");
radiumsalt.maxStackSize = 64;
radiumsalt.register();

var gemsensor = VanillaFactory.createItem("gemsensor");
gemsensor.maxStackSize = 64;
gemsensor.register();

//var draconicstemcells = VanillaFactory.createItem("draconicstemcells");
//draconicstemcells.maxStackSize = 64;
//draconicstemcells.rarity = "epic";
//draconicstemcells.register();

var radiationlayer = VanillaFactory.createItem("radiationlayer");
radiationlayer.maxStackSize = 64;
radiationlayer.register();

var pressurelayer = VanillaFactory.createItem("pressurelayer");
pressurelayer.maxStackSize = 64;
pressurelayer.register();

var unpreparedspacehelmet = VanillaFactory.createItem("unpreparedspacehelmet");
unpreparedspacehelmet.maxStackSize = 64;
unpreparedspacehelmet.register();

var unpreparedspacechestpiece = VanillaFactory.createItem("unpreparedspacechestpiece");
unpreparedspacechestpiece.maxStackSize = 64;
unpreparedspacechestpiece.register();

var unpreparedspaceleggings = VanillaFactory.createItem("unpreparedspaceleggings");
unpreparedspaceleggings.maxStackSize = 64;
unpreparedspaceleggings.register();

var unpreparedspaceboots = VanillaFactory.createItem("unpreparedspaceboots");
unpreparedspaceboots.maxStackSize = 64;
unpreparedspaceboots.register();

var cloth = VanillaFactory.createItem("cloth");
cloth.maxStackSize = 64;
cloth.register();

var thermalcloth = VanillaFactory.createItem("thermalcloth");
thermalcloth.maxStackSize = 64;
thermalcloth.register();

var omnicoin = VanillaFactory.createItem("omnicoin");
omnicoin.maxStackSize = 64;
omnicoin.register();

var omnicoin5 = VanillaFactory.createItem("omnicoin5");
omnicoin5.maxStackSize = 64;
omnicoin5.rarity = "uncommon";
omnicoin5.register();

var omnicoin25 = VanillaFactory.createItem("omnicoin25");
omnicoin25.maxStackSize = 64;
omnicoin25.rarity = "rare";
omnicoin25.register();

var omnicoin100 = VanillaFactory.createItem("omnicoin100");
omnicoin100.maxStackSize = 64;
omnicoin100.rarity = "epic";
omnicoin100.register();

var moondust = VanillaFactory.createItem("moondust");
moondust.maxStackSize = 64;
moondust.register();

//var pulsatingwire = VanillaFactory.createItem("pulsatingwire");
//pulsatingwire.maxStackSize = 64;
//pulsatingwire.register();

var blazepowder = VanillaFactory.createItem("blazepowder");
blazepowder.maxStackSize = 64;
blazepowder.register();

var excitationcoil = VanillaFactory.createBlock("excitationcoil", <blockmaterial:iron>);
excitationcoil.axisAlignedBB = AxisAlignedBB.create(
     4.0 / 16.0,
     0.0 / 16.0,
     4.0 / 16.0,
    12.0 / 16.0,
     9.0 / 16.0,
    12.0 / 16.0
);
excitationcoil.lightValue = 1;
excitationcoil.fullBlock = false;
excitationcoil.register();

var block_dust = VanillaFactory.createBlock("block_dust", <blockmaterial:sand>);
block_dust.blockSoundType = <soundtype:cloth>;
block_dust.toolClass = "shovel";
block_dust.toolLevel = 0;
block_dust.blockHardness = 0.4;
block_dust.blockResistance = 0.4;
block_dust.gravity = true;
block_dust.register();

//var endstonedust = VanillaFactory.createItem("endstonedust");
//endstonedust.maxStackSize = 64;
//endstonedust.register();
//
//var knightslimeingot = VanillaFactory.createItem("knightslimeingot");
//knightslimeingot.maxStackSize = 64;
//knightslimeingot.register();

var redstonearmorplate = VanillaFactory.createItem("redstonearmorplate");
redstonearmorplate.maxStackSize = 64;
redstonearmorplate.register();

var carbonarmorplate = VanillaFactory.createItem("carbonarmorplate");
carbonarmorplate.maxStackSize = 64;
carbonarmorplate.register();

var lapisarmorplate = VanillaFactory.createItem("lapisarmorplate");
lapisarmorplate.maxStackSize = 64;
lapisarmorplate.register();

var solidifiedargon = VanillaFactory.createItem("solidifiedargon");
solidifiedargon.maxStackSize = 64;
solidifiedargon.register();

var solidifiedchlorine = VanillaFactory.createItem("solidifiedchlorine");
solidifiedchlorine.maxStackSize = 64;
solidifiedchlorine.register();

var solidifiedfluorine = VanillaFactory.createItem("solidifiedfluorine");
solidifiedfluorine.maxStackSize = 64;
solidifiedfluorine.register();

var solidifiedhelium = VanillaFactory.createItem("solidifiedhelium");
solidifiedhelium.maxStackSize = 64;
solidifiedhelium.register();

var solidifiedhydrogen = VanillaFactory.createItem("solidifiedhydrogen");
solidifiedhydrogen.maxStackSize = 64;
solidifiedhydrogen.register();

var solidifiedkrypton = VanillaFactory.createItem("solidifiedkrypton");
solidifiedkrypton.maxStackSize = 64;
solidifiedkrypton.register();

var solidifiedmercury = VanillaFactory.createItem("solidifiedmercury");
solidifiedmercury.maxStackSize = 64;
solidifiedmercury.register();

var solidifiedneon = VanillaFactory.createItem("solidifiedneon");
solidifiedneon.maxStackSize = 64;
solidifiedneon.register();

var solidifiednitrogen = VanillaFactory.createItem("solidifiednitrogen");
solidifiednitrogen.maxStackSize = 64;
solidifiednitrogen.register();

var solidifiedoxygen = VanillaFactory.createItem("solidifiedoxygen");
solidifiedoxygen.maxStackSize = 64;
solidifiedoxygen.register();

var solidifiedradon = VanillaFactory.createItem("solidifiedradon");
solidifiedradon.maxStackSize = 64;
solidifiedradon.register();

var solidifiedxenon = VanillaFactory.createItem("solidifiedxenon");
solidifiedxenon.maxStackSize = 64;
solidifiedxenon.register();

function makeFluid(name as string,
                   hexColor as string,
                   gaseous as bool,
                   viscosity as int,
                   rarity as string,
                   luminosity as int) {
    val fluid as Fluid = VanillaFactory.createFluid(name, Color.fromHex(hexColor));
    fluid.gaseous = gaseous;
    fluid.viscosity = viscosity;
    fluid.density = gaseous ? -viscosity : viscosity;
    fluid.rarity = rarity;
    fluid.luminosity = luminosity;
    fluid.register();
}

//        name                          color       gas?    viscosity   rarity      light
//makeFluid("krypton",                    "73f93e",   true,   500,        "RARE",     0);
//makeFluid("neon",                       "f435eb",   true,   500,        "RARE",     0);
//makeFluid("xenon",                      "8d1f9b",   true,   500,        "RARE",     0);

makeFluid("elementalreduction",         "588c5a",   false,  2000,       "COMMON",   7);

//makeFluid("einsteinium",                "ddc10b",   false,  4096,       "COMMON",   0);
//makeFluid("californium",                "9b110c",   false,  3072,       "COMMON",   0);
//makeFluid("berkelium",                  "ba5710",   false,  2048,       "COMMON",   0);
//makeFluid("curium",                     "421e5b",   false,  1024,       "COMMON",   0);
//makeFluid("neptunium",                  "c3dbc6",   false,  1024,       "COMMON",   0);
makeFluid("plutonium2",                 "f73663",   false,  1024,       "COMMON",   0);
makeFluid("uranium233",                 "187a30",   false,  1024,       "COMMON",   0);

//makeFluid("moltencreativeportabletank", "a02cba",   false,  1,          "EPIC",     0);
//makeFluid("awakeneddraconium",          "ff890c",   false,  2000,       "COMMON",   0);
//makeFluid("moltencrystalmatrix",        "4cffed",   false,  2000,       "COMMON",   0);
//makeFluid("moltensoularium",            "6b4411",   false,  1000,       "COMMON",   0);
makeFluid("moltendarksoularium",        "422805",   false,  1000,       "COMMON",   0);
//makeFluid("moltennetherstar",           "f2f2d8",   false,  100,        "COMMON",   15);

makeFluid("moltenempoweredrestonia",    "ff0000",   false,  10000,      "COMMON",   15);
makeFluid("moltenempoweredpalis",       "0026ff",   false,  10000,      "COMMON",   15);
makeFluid("moltenempoweredenori",       "e6e6e6",   false,  10000,      "COMMON",   15);
makeFluid("moltenempowereddiamatine",   "00fbff",   false,  10000,      "COMMON",   15);
makeFluid("moltenempoweredemeradic",    "00ff00",   false,  10000,      "COMMON",   15);
makeFluid("moltenempoweredvoid",        "0e0e0e",   false,  10000,      "COMMON",   15);

var universalnavigator = VanillaFactory.createItem("universalnavigator");
universalnavigator.maxStackSize = 64;
universalnavigator.rarity = "epic";
universalnavigator.register();

var stabilizedeinsteinium = VanillaFactory.createItem("stabilizedeinsteinium");
stabilizedeinsteinium.maxStackSize = 64;
stabilizedeinsteinium.rarity = "epic";
stabilizedeinsteinium.register();

var stabilizedberkelium = VanillaFactory.createItem("stabilizedberkelium");
stabilizedberkelium.maxStackSize = 64;
stabilizedberkelium.register();

var stabilizedneptunium = VanillaFactory.createItem("stabilizedneptunium");
stabilizedneptunium.maxStackSize = 64;
stabilizedneptunium.register();

var stabilizedplutonium = VanillaFactory.createItem("stabilizedplutonium");
stabilizedplutonium.maxStackSize = 64;
stabilizedplutonium.register();

var stabilizeduranium = VanillaFactory.createItem("stabilizeduranium");
stabilizeduranium.maxStackSize = 64;
stabilizeduranium.register();

var stabilizedthorium = VanillaFactory.createItem("stabilizedthorium");
stabilizedthorium.maxStackSize = 64;
stabilizedthorium.register();

var stabilizedcurium = VanillaFactory.createItem("stabilizedcurium");
stabilizedcurium.maxStackSize = 64;
stabilizedcurium.register();

var stabilizedcalifornium = VanillaFactory.createItem("stabilizedcalifornium");
stabilizedcalifornium.maxStackSize = 64;
stabilizedcalifornium.register();

var stabilizedamericium = VanillaFactory.createItem("stabilizedamericium");
stabilizedamericium.maxStackSize = 64;
stabilizedamericium.register();


var exoticmaterialscatalyst = VanillaFactory.createItem("exoticmaterialscatalyst");
exoticmaterialscatalyst.maxStackSize = 64;
exoticmaterialscatalyst.register();

var eternalcatalyst = VanillaFactory.createItem("eternalcatalyst");
eternalcatalyst.maxStackSize = 64;
eternalcatalyst.register();

var compressedoctadiccapacitor = VanillaFactory.createItem("compressedoctadiccapacitor");
compressedoctadiccapacitor.maxStackSize = 64;
compressedoctadiccapacitor.register();

var doublecompressedoctadiccapacitor = VanillaFactory.createItem("doublecompressedoctadiccapacitor");
doublecompressedoctadiccapacitor.maxStackSize = 64;
doublecompressedoctadiccapacitor.register();





var ultimate_gem = VanillaFactory.createItem("ultimate_gem");
ultimate_gem.maxStackSize = 1;
ultimate_gem.rarity = "epic";
ultimate_gem.register();

var ultimate_power_storage = VanillaFactory.createItem("ultimate_power_storage");
ultimate_power_storage.maxStackSize = 1;
ultimate_power_storage.rarity = "epic";
ultimate_power_storage.register();

var ultimate_generator = VanillaFactory.createItem("ultimate_generator");
ultimate_generator.maxStackSize = 1;
ultimate_generator.rarity = "epic";
ultimate_generator.register();







//var hotdraconiumingot = VanillaFactory.createItem("hotdraconiumingot");
//hotdraconiumingot.rarity = "rare";
//hotdraconiumingot.maxStackSize = 16;
//
//hotdraconiumingot.onItemUpdate = function(itemStack, world, owner, slot, isSelected) {
//    if (world.getWorldTime() % 20 == 0) {
//        owner.attackEntityFrom(<damageSource:heat>.setDamageBypassesArmor(), 3.0);
//    }
//    return;
//};
//
//hotdraconiumingot.register();





var netherstarsouth = VanillaFactory.createItem("netherstarsouth");
netherstarsouth.maxStackSize = 64;
netherstarsouth.register();

var netherstareast = VanillaFactory.createItem("netherstareast");
netherstareast.maxStackSize = 64;
netherstareast.register();

var netherstarwest = VanillaFactory.createItem("netherstarwest");
netherstarwest.maxStackSize = 64;
netherstarwest.register();



//var steelplating = VanillaFactory.createItem("steelplating");
//steelplating.rarity = "uncommon";
//steelplating.maxStackSize = 64;
//steelplating.register();
//
//var titaniumplating = VanillaFactory.createItem("titaniumplating");
//titaniumplating.rarity = "uncommon";
//titaniumplating.maxStackSize = 64;
//titaniumplating.register();
//
//var tungstencarbideplating = VanillaFactory.createItem("tungstencarbideplating");
//tungstencarbideplating.rarity = "uncommon";
//tungstencarbideplating.maxStackSize = 64;
//tungstencarbideplating.register();
//
//var signalumplating = VanillaFactory.createItem("signalumplating");
//signalumplating.rarity = "uncommon";
//signalumplating.maxStackSize = 64;
//signalumplating.register();
//
//var iridiumalloyplating = VanillaFactory.createItem("iridiumalloyplating");
//iridiumalloyplating.rarity = "uncommon";
//iridiumalloyplating.maxStackSize = 64;
//iridiumalloyplating.register();
//
//var enderiumplating = VanillaFactory.createItem("enderiumplating");
//enderiumplating.rarity = "rare";
//enderiumplating.maxStackSize = 64;
//enderiumplating.register();
//
//var draconiumplating = VanillaFactory.createItem("draconiumplating");
//draconiumplating.rarity = "rare";
//draconiumplating.maxStackSize = 64;
//draconiumplating.register();
//
//var crystalmatrixplating = VanillaFactory.createItem("crystalmatrixplating");
//crystalmatrixplating.rarity = "epic";
//crystalmatrixplating.maxStackSize = 64;
//crystalmatrixplating.register();

var quantumfluxedeterniumplating = VanillaFactory.createItem("quantumfluxedeterniumplating");
quantumfluxedeterniumplating.rarity = "epic";
quantumfluxedeterniumplating.maxStackSize = 64;
quantumfluxedeterniumplating.register();

//var neutroniumplating = VanillaFactory.createItem("neutroniumplating");
//neutroniumplating.rarity = "epic";
//neutroniumplating.maxStackSize = 64;
//neutroniumplating.register();

var heartofauniverse = VanillaFactory.createItem("heartofauniverse");
heartofauniverse.rarity = "epic";
heartofauniverse.maxStackSize = 1;
heartofauniverse.register();


var tieroneship = VanillaFactory.createItem("tieroneship");
tieroneship.rarity = "uncommon";
tieroneship.maxStackSize = 16;
tieroneship.register();

var t1guidance = VanillaFactory.createItem("t1guidance");
t1guidance.rarity = "uncommon";
t1guidance.maxStackSize = 64;
t1guidance.register();

var t2guidance = VanillaFactory.createItem("t2guidance");
t2guidance.rarity = "uncommon";
t2guidance.maxStackSize = 64;
t2guidance.register();

var t1laser = VanillaFactory.createItem("t1laser");
t1laser.rarity = "uncommon";
t1laser.maxStackSize = 64;
t1laser.register();

var t2laser = VanillaFactory.createItem("t2laser");
t2laser.rarity = "rare";
t2laser.maxStackSize = 64;
t2laser.register();

var t3laser = VanillaFactory.createItem("t3laser");
t3laser.rarity = "uncommon";
t3laser.maxStackSize = 64;
t3laser.register();

var tiertwoship = VanillaFactory.createItem("tiertwoship");
tiertwoship.rarity = "uncommon";
tiertwoship.maxStackSize = 16;
tiertwoship.register();

var tierthreeship = VanillaFactory.createItem("tierthreeship");
tierthreeship.rarity = "uncommon";
tierthreeship.maxStackSize = 16;
tierthreeship.register();

var tierfourship = VanillaFactory.createItem("tierfourship");
tierfourship.rarity = "uncommon";
tierfourship.maxStackSize = 16;
tierfourship.register();

var tierfiveship = VanillaFactory.createItem("tierfiveship");
tierfiveship.rarity = "rare";
tierfiveship.maxStackSize = 16;
tierfiveship.register();

var tiersixship = VanillaFactory.createItem("tiersixship");
tiersixship.rarity = "rare";
tiersixship.maxStackSize = 16;
tiersixship.register();

var tiersevenship = VanillaFactory.createItem("tiersevenship");
tiersevenship.rarity = "rare";
tiersevenship.maxStackSize = 16;
tiersevenship.register();

var tiereightship = VanillaFactory.createItem("tiereightship");
tiereightship.rarity = "epic";
tiereightship.maxStackSize = 16;
tiereightship.register();

var tiernineship = VanillaFactory.createItem("tiernineship");
tiernineship.rarity = "epic";
tiernineship.maxStackSize = 16;
tiernineship.register();

var tiertenship = VanillaFactory.createItem("tiertenship");
tiertenship.rarity = "epic";
tiertenship.maxStackSize = 16;
tiertenship.register();

var quantumflux = VanillaFactory.createItem("quantumflux");
quantumflux.rarity = "epic";
quantumflux.maxStackSize = 64;
quantumflux.register();

var dragonlairdata = VanillaFactory.createItem("dragonlairdata");
dragonlairdata.rarity = "epic";
dragonlairdata.maxStackSize = 64;
dragonlairdata.register();

var witherrealmdata = VanillaFactory.createItem("witherrealmdata");
witherrealmdata.rarity = "epic";
witherrealmdata.maxStackSize = 64;
witherrealmdata.register();

var impossiblerealmdata = VanillaFactory.createItem("impossiblerealmdata");
impossiblerealmdata.rarity = "rare";
impossiblerealmdata.maxStackSize = 64;
impossiblerealmdata.register();

var universecreationdata = VanillaFactory.createItem("universecreationdata");
universecreationdata.rarity = "epic";
universecreationdata.maxStackSize = 1;
universecreationdata.register();

var stellarcreationdata = VanillaFactory.createItem("stellarcreationdata");
stellarcreationdata.rarity = "rare";
stellarcreationdata.maxStackSize = 64;
stellarcreationdata.register();

//var lairoftheclockworkkingdata = VanillaFactory.createItem("lairoftheclockworkkingdata");
//lairoftheclockworkkingdata.rarity = "epic";
//lairoftheclockworkkingdata.maxStackSize = 1;
//lairoftheclockworkkingdata.register();

var lairofthechaosguardiandata = VanillaFactory.createItem("lairofthechaosguardiandata");
lairofthechaosguardiandata.rarity = "epic";
lairofthechaosguardiandata.maxStackSize = 1;
lairofthechaosguardiandata.register();

//var sentientgear = VanillaFactory.createItem("sentientgear");
//sentientgear.rarity = "epic";
//sentientgear.maxStackSize = 64;
//sentientgear.register();

var denseoilshale = VanillaFactory.createBlock("denseoilshale", <blockmaterial:rock>);
denseoilshale.blockSoundType = <soundtype:stone>;
denseoilshale.register();

var densehydrogen = VanillaFactory.createItem("densehydrogen");
densehydrogen.maxStackSize = 64;
densehydrogen.rarity = "uncommon";
densehydrogen.register();

var ultradensehydrogen = VanillaFactory.createItem("ultradensehydrogen");
ultradensehydrogen.maxStackSize = 64;
ultradensehydrogen.rarity = "rare";
ultradensehydrogen.register();

var microverse_casing = VanillaFactory.createBlock("microverse_casing", <blockmaterial:iron>);
microverse_casing.register();

var microverse_vent = VanillaFactory.createBlock("microverse_vent", <blockmaterial:iron>);
microverse_vent.register();

//Smores

var smingots as string[] = [
    "eightsmore",
    "sixteensmore",
    "thirtytwosmore",
    "sixtyfoursmore"
] as string[];

function getItemFoodEaten(duration as int) as IItemFoodEaten {
    return function(stack, world, player) {
        val potions = [ // These can't resolve when the script is run, so resolve them within the function.
            <potion:minecraft:absorption>,
            <potion:minecraft:speed>,
            <potion:minecraft:haste>,
            <potion:minecraft:saturation>,
            <potion:minecraft:health_boost>
        ] as IPotion[];
        for potion in potions {
            player.addPotionEffect(potion.makePotionEffect(duration, 1));
        }
    } as IItemFoodEaten;
}

var heal = 44;
var saturation = 8.6 as float;
var potionDuration = 1200;

for smingot in smingots {
    heal = (heal * 2) + 4;
    saturation = (saturation * 2) + 1;
    potionDuration = potionDuration * 2;

    val foodRep = VanillaFactory.createItemFood(smingot, heal);
    foodRep.saturation = saturation;
    foodRep.alwaysEdible = true;
    foodRep.onItemFoodEaten = getItemFoodEaten(potionDuration);

    foodRep.register();
}

// Forestry removal items
var pulsatingdust = VanillaFactory.createItem("pulsatingdust");
pulsatingdust.maxStackSize = 64;
pulsatingdust.register();

var pulsatingmesh = VanillaFactory.createItem("pulsatingmesh");
pulsatingmesh.maxStackSize = 64;
pulsatingmesh.register();


//var simulation_casing = VanillaFactory.createBlock("simulation_casing", <blockmaterial:iron>);
//simulation_casing.register();
//
//var simulation_casing_2 = VanillaFactory.createBlock("simulation_casing_2", <blockmaterial:iron>);
//simulation_casing_2.register();