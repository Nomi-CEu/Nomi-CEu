# nomi-ceu
[![Curseforge](http://cf.way2muchnoise.eu/full_594351_downloads.svg)](https://www.curseforge.com/minecraft/modpacks/nomi-ceu) [![Curseforge](http://cf.way2muchnoise.eu/versions/For%20MC_557242_all.svg)](https://www.curseforge.com/minecraft/modpacks/nomi-ceu)

Port of [Nomifactory](https://github.com/Nomifactory/Nomifactory) 1.3 to the [GregTech CE Unofficial](https://github.com/GregTechCEu/GregTech) generation of GT mods, with updated quests, progression and minor balance changes to adapt to CEu's changes.  
- Overhauled circuit progression closely following CEu stock   
- Multiblock versions of nearly all machines, including EBF, Freezer and DT, processing up to 256 recipes in parallel  
- New processing chains for Naquadah, Advanced SMDs, Crystal Chips, and more  
- Fixed lots of unpleasant CE-ness - fixed infinite Amp bug, different ore stone types don't clog up your inventory, etc.   
- Super-performant emissive effects on machines, coil blocks, the Fusion Reactor, and more  
- Updated questbook to guide you through all the new stuff, including a completely new chapter, the Processing Lines Tab, to give you more info, useful tips and a visual representation of different processing lines, both new and old  
- lots more...   

## Mod compatibility info
nomi-ceu comes with compatibility scripts for the following mods. You can drop them into the mods folder and their recipes will be adjusted accordingly.  
- [AE2 Fluid Crafting Rework](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)  
- [Compact Machines](https://www.curseforge.com/minecraft/mc-mods/compact-machines)  
- [Flux Networks](https://www.curseforge.com/minecraft/mc-mods/flux-networks)  
- [Lazy AE2](https://www.curseforge.com/minecraft/mc-mods/lazy-ae2)  
- [Project Red - Illumination](https://www.curseforge.com/minecraft/mc-mods/project-red-illumination)    

\* Note: If you are adding these mods via the CurseForge app, remove the copy of non-Extended Life AE2 it might automatically download.

## Hard mode info
If you want a harder, or perhaps a more "true" GregTech experience, check out the Expert mode. This pack mode is based on the [Self-Torture Edition fork](https://github.com/NotMyWing/Omnifactory-Self-Torture-Edition) of the original pack. Highlights include:

- No DME for easy infinite resources   
- Nomicoins can't be spent  
- The Steam Age  
- No Creative Tank; instead...  
- Stabilized Micro Miners for late-game infinite resources  
- Harder recipes for assorted things like Iridium, Graphene, Numismatic Dynamos, and more  

Installation instructions:
- Install the hardmode config files from [here](https://github.com/tracer4b/nomi-ceu/tree/main/overrides). Restart the pack for this to take effect. 
  - Windows users may grab the utility [here](https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.bat)(right click - save as), save it to the root directory of the pack (the same level as `\config`).   
  - MacOS and GNU/Linux users can run `curl -O https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.sh` then verify the contents with your editor of choice before running `chmod +x pack-mode-switcher.sh; sh pack-mode-switcher.sh` in the pack root directory (the one containing `/config`).
- If you are on an existing world, run `/bq_admin default load` to load the hard mode questbook.

## Bansoukou
This pack uses three bansoukou patches. 
The first one is for [NuclearCraft](https://github.com/tomdodd4598/NuclearCraft/tree/1.12.2), the second one is for [Draconic Evolution](https://github.com/Draconic-Inc/Draconic-Evolution/tree/1.12.2), and the third one is for [Tool Belt](https://github.com/gigaherz/ToolBelt/tree/1.12.x).

The three patch repos are:
- [NuclearCraft](https://github.com/Exaxxion/NuclearCraft/tree/2.18y-ceu). This fixes GTCEu incompatability with NuclearCraft.
- [Draconic Evolution](https://github.com/IntegerLimit/Draconic-Evolution). This adds the destruct core button, and allows GT blocks in place of DE blocks, in the Energy Core and Reactor.
- [Tool Belt](https://github.com/gigaherz/ToolBelt/tree/1.12.x). This simply adds changes to the lang, in [this PR](https://github.com/gigaherz/ToolBelt/pull/132), to the mod, because of a lack of a update.

If there are issues or crashes with Draconic Evolution, please report them to [here](https://github.com/IntegerLimit/Draconic-Evolution/issues) instead of the main Draconic Evolution repo.

## Credits
Original pack by [Exaxxion](https://github.com/Exaxxion).  
Certain new quests from [GregTech Community Pack](https://github.com/GregTechCEu/GregTech-Community-Pack).  
GTCE item-ID to GTCEu item-ID conversion scripts by [brachy84](https://github.com/brachy84).   
Perfect Gem textures from [FurfSky Reborn](http://furfsky.net/). ([Permission](https://ibb.co/bBpksq0) at [this message](https://discord.com/channels/771187253937438762/774353150278369351/938438074503942184) in [FurfSky Reborn server](https://discord.gg/fsr)).  
Certain hard mode recipe chains and Magnetron texture from [GCY Science](https://github.com/GregTechCEu/gregicality-science).  
Stabilized miner textures from [Self-Torture Edition](https://github.com/NotMyWing/Omnifactory-Self-Torture-Edition).  
Flux Networks compatibility recipes from [smudgerox](https://github.com/smudgerox).  
Thank you!
