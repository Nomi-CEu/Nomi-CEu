#modloaded fluxnetworks

import scripts.common.makeShaped as makeShaped;

print("--- loading FluxNetworks.zs ---");

//Remove all default recipes
recipes.remove(<fluxnetworks:fluxcore>);
recipes.remove(<fluxnetworks:fluxconfigurator>);
recipes.remove(<fluxnetworks:fluxblock>);
recipes.remove(<fluxnetworks:fluxplug>);
recipes.remove(<fluxnetworks:fluxpoint>);
recipes.remove(<fluxnetworks:fluxcontroller>);
recipes.remove(<fluxnetworks:fluxstorage>);
recipes.remove(<fluxnetworks:herculeanfluxstorage>);
recipes.remove(<fluxnetworks:gargantuanfluxstorage>);

//Flux Plug
makeShaped("of_flux_plug", <fluxnetworks:fluxplug>,
    ["CSC",
     "XIX",
     "CUC"],
    { C : <ore:circuitLuv>, //T6 Circuit
      S : <metaitem:sensor.luv>, //LuV Sensor
      X : <enderio:item_endergy_conduit:11>, //Superconductor Wire
	  I : <actuallyadditions:block_phantom_energyface>, //Phantom Energyface
	  U : <metaitem:energy_converter.luv.16> //LuV CEU 16x
      });

//Flux Point
makeShaped("of_flux_point", <fluxnetworks:fluxpoint>,
    ["CUC",
     "XIX",
     "CSC"],
    { C : <ore:circuitLuv>, //T6 Circuit
      S : <metaitem:sensor.luv>, //LuV Sensor
      X : <enderio:item_endergy_conduit:11>, //Superconductor Wire
	  I : <actuallyadditions:block_phantom_energyface>, //Phantom Energyface
	  U : <metaitem:energy_converter.luv.16> //LuV CEU 16x
      });
	  
//Flux Controller
makeShaped("of_flux_controller", <fluxnetworks:fluxcontroller>,
    ["SPE",
     "CBC",
     "XIX"],
    { C : <ore:circuitLuv>, //T6 Circuit
      S : <metaitem:sensor.luv>, //LuV Sensor
	  E : <metaitem:emitter.luv>, //LuV Emitter
      X : <enderio:item_endergy_conduit:11>, //Superconductor Wire
	  I : <actuallyadditions:block_phantom_energyface>, //AA Phantom Energyface
	  B : <metaitem:battery_buffer.luv.16>, //LuV Battery Buffer 16x
	  P : <actuallyadditions:block_player_interface> //AA Player Interface
      });

//Flux Configurator
makeShaped("of_flux_configurator", <fluxnetworks:fluxconfigurator>,
    ["  S",
     " R ",
     "R  "],
    { S : <metaitem:sensor.luv>, //LuV Sensor
      R : <ore:stickEnderium> //Enderium Rod
      });
