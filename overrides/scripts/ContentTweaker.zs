#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;
import mods.contenttweaker.Fluid;

import mods.contenttweaker.AxisAlignedBB;

import mods.contenttweaker.IItemFoodEaten;
import crafttweaker.potions.IPotion;


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


makeFluid("elementalreduction",         "588c5a",   false,  2000,       "COMMON",   7);

makeFluid("plutonium2",                 "f73663",   false,  1024,       "COMMON",   0);
makeFluid("uranium233",                 "187a30",   false,  1024,       "COMMON",   0);
makeFluid("tough_alloy",                "10041c",   false,  1024,       "COMMON",   0);

makeFluid("moltendarksoularium",        "422805",   false,  1000,       "COMMON",   0);

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

//var stabilizedthorium = VanillaFactory.createItem("stabilizedthorium");
//stabilizedthorium.maxStackSize = 64;
//stabilizedthorium.register();

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





var netherstarsouth = VanillaFactory.createItem("netherstarsouth");
netherstarsouth.maxStackSize = 64;
netherstarsouth.register();

var netherstareast = VanillaFactory.createItem("netherstareast");
netherstareast.maxStackSize = 64;
netherstareast.register();

var netherstarwest = VanillaFactory.createItem("netherstarwest");
netherstarwest.maxStackSize = 64;
netherstarwest.register();



var quantumfluxedeterniumplating = VanillaFactory.createItem("quantumfluxedeterniumplating");
quantumfluxedeterniumplating.rarity = "epic";
quantumfluxedeterniumplating.maxStackSize = 64;
quantumfluxedeterniumplating.register();


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

var tierfourandhalfship = VanillaFactory.createItem("tierfourandhalfship");
tierfourandhalfship.rarity = "uncommon";
tierfourandhalfship.maxStackSize = 16;
tierfourandhalfship.register();

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

var tiereightandhalfship = VanillaFactory.createItem("tiereightandhalfship");
tiereightandhalfship.rarity = "epic";
tiereightandhalfship.maxStackSize = 16;
tiereightandhalfship.register();

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


var lairofthechaosguardiandata = VanillaFactory.createItem("lairofthechaosguardiandata");
lairofthechaosguardiandata.rarity = "epic";
lairofthechaosguardiandata.maxStackSize = 1;
lairofthechaosguardiandata.register();

var densemagma = VanillaFactory.createBlock("densemagma", <blockmaterial:rock>);
densemagma.blockSoundType = <soundtype:stone>;
densemagma.register();


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

// Vents are useless...
// var microverse_vent = VanillaFactory.createBlock("microverse_vent", <blockmaterial:iron>);
// microverse_vent.register();

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


var tiereightship_stabilized = VanillaFactory.createItem("tiereightship_stabilized");
tiereightship_stabilized.rarity = "epic";
tiereightship_stabilized.maxStackSize = 1;
tiereightship_stabilized.register();

var tiereightship_stabilized_matter = VanillaFactory.createItem("tiereightship_stabilized_matter");
tiereightship_stabilized_matter.rarity = "epic";
tiereightship_stabilized_matter.glowing = true;
tiereightship_stabilized_matter.maxStackSize = 64;
tiereightship_stabilized_matter.register();

var tierfiveship_stabilized = VanillaFactory.createItem("tierfiveship_stabilized");
tierfiveship_stabilized.rarity = "epic";
tierfiveship_stabilized.maxStackSize = 1;
tierfiveship_stabilized.register();

var tierfiveship_stabilized_matter = VanillaFactory.createItem("tierfiveship_stabilized_matter");
tierfiveship_stabilized_matter.rarity = "epic";
tierfiveship_stabilized_matter.glowing = true;
tierfiveship_stabilized_matter.maxStackSize = 64;
tierfiveship_stabilized_matter.register();

var tierfourandhalfship_stabilized = VanillaFactory.createItem("tierfourandhalfship_stabilized");
tierfourandhalfship_stabilized.rarity = "epic";
tierfourandhalfship_stabilized.maxStackSize = 1;
tierfourandhalfship_stabilized.register();

var tierfourandhalfship_stabilized_matter = VanillaFactory.createItem("tierfourandhalfship_stabilized_matter");
tierfourandhalfship_stabilized_matter.rarity = "epic";
tierfourandhalfship_stabilized_matter.glowing = true;
tierfourandhalfship_stabilized_matter.maxStackSize = 64;
tierfourandhalfship_stabilized_matter.register();

var tierfourship_stabilized = VanillaFactory.createItem("tierfourship_stabilized");
tierfourship_stabilized.rarity = "epic";
tierfourship_stabilized.maxStackSize = 1;
tierfourship_stabilized.register();

var tierfourship_stabilized_matter = VanillaFactory.createItem("tierfourship_stabilized_matter");
tierfourship_stabilized_matter.rarity = "epic";
tierfourship_stabilized_matter.glowing = true;
tierfourship_stabilized_matter.maxStackSize = 64;
tierfourship_stabilized_matter.register();

var tieroneship_stabilized = VanillaFactory.createItem("tieroneship_stabilized");
tieroneship_stabilized.rarity = "epic";
tieroneship_stabilized.maxStackSize = 1;
tieroneship_stabilized.register();

var tieroneship_stabilized_matter = VanillaFactory.createItem("tieroneship_stabilized_matter");
tieroneship_stabilized_matter.rarity = "epic";
tieroneship_stabilized_matter.glowing = true;
tieroneship_stabilized_matter.maxStackSize = 64;
tieroneship_stabilized_matter.register();

var tiersevenship_stabilized = VanillaFactory.createItem("tiersevenship_stabilized");
tiersevenship_stabilized.rarity = "epic";
tiersevenship_stabilized.maxStackSize = 1;
tiersevenship_stabilized.register();

var tiersevenship_stabilized_matter = VanillaFactory.createItem("tiersevenship_stabilized_matter");
tiersevenship_stabilized_matter.rarity = "epic";
tiersevenship_stabilized_matter.glowing = true;
tiersevenship_stabilized_matter.maxStackSize = 64;
tiersevenship_stabilized_matter.register();

var tiersixship_stabilized = VanillaFactory.createItem("tiersixship_stabilized");
tiersixship_stabilized.rarity = "epic";
tiersixship_stabilized.maxStackSize = 1;
tiersixship_stabilized.register();

var tiersixship_stabilized_matter = VanillaFactory.createItem("tiersixship_stabilized_matter");
tiersixship_stabilized_matter.rarity = "epic";
tiersixship_stabilized_matter.glowing = true;
tiersixship_stabilized_matter.maxStackSize = 64;
tiersixship_stabilized_matter.register();

var tierthreeship_stabilized = VanillaFactory.createItem("tierthreeship_stabilized");
tierthreeship_stabilized.rarity = "epic";
tierthreeship_stabilized.maxStackSize = 1;
tierthreeship_stabilized.register();

var tierthreeship_stabilized_matter = VanillaFactory.createItem("tierthreeship_stabilized_matter");
tierthreeship_stabilized_matter.rarity = "epic";
tierthreeship_stabilized_matter.glowing = true;
tierthreeship_stabilized_matter.maxStackSize = 64;
tierthreeship_stabilized_matter.register();

var tiertwoship_stabilized = VanillaFactory.createItem("tiertwoship_stabilized");
tiertwoship_stabilized.rarity = "epic";
tiertwoship_stabilized.maxStackSize = 1;
tiertwoship_stabilized.register();

var tiertwoship_stabilized_matter = VanillaFactory.createItem("tiertwoship_stabilized_matter");
tiertwoship_stabilized_matter.rarity = "epic";
tiertwoship_stabilized_matter.glowing = true;
tiertwoship_stabilized_matter.maxStackSize = 64;
tiertwoship_stabilized_matter.register();

var magnetron = VanillaFactory.createItem("magnetron");
magnetron.rarity = "rare";
magnetron.maxStackSize = 64;
magnetron.register();

var dark_red_coal = VanillaFactory.createItem("dark_red_coal");
dark_red_coal.maxStackSize = 64;
dark_red_coal.register();
