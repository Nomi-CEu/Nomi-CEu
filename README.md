# Nomi-CEu
[![Downloads](http://cf.way2muchnoise.eu/full_594351_downloads.svg)](https://www.curseforge.com/minecraft/modpacks/nomi-ceu) [![MC Version](http://cf.way2muchnoise.eu/versions/For%20MC_557242_all.svg)](https://www.curseforge.com/minecraft/modpacks/nomi-ceu)

[![GitHub Issues](https://img.shields.io/github/issues/Nomi-CEu/nomi-ceu.svg)](https://github.com/Nomi-CEu/nomi-ceu/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Nomi-CEu/nomi-ceu.svg)](https://github.com/Nomi-CEu/nomi-ceu/pulls) [![license](https://img.shields.io/github/license/Nomi-CEu/nomi-ceu.svg)](../master/LICENSE)

[![Discord](https://img.shields.io/discord/927050775073534012.svg?colorB=7289DA&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHYAAABWAgMAAABnZYq0AAAACVBMVEUAAB38%2FPz%2F%2F%2F%2Bm8P%2F9AAAAAXRSTlMAQObYZgAAAAFiS0dEAIgFHUgAAAAJcEhZcwAACxMAAAsTAQCanBgAAAAHdElNRQfhBxwQJhxy2iqrAAABoElEQVRIx7WWzdGEIAyGgcMeKMESrMJ6rILZCiiBg4eYKr%2Fd1ZAfgXFm98sJfAyGNwno3G9sLucgYGpQ4OGVRxQTREMDZjF7ILSWjoiHo1n%2BE03Aw8p7CNY5IhkYd%2F%2F6MtO3f8BNhR1QWnarCH4tr6myl0cWgUVNcfMcXACP1hKrGMt8wcAyxide7Ymcgqale7hN6846uJCkQxw6GG7h2MH4Czz3cLqD1zHu0VOXMfZjHLoYvsdd0Q7ZvsOkafJ1P4QXxrWFd14wMc60h8JKCbyQvImzlFjyGoZTKzohwWR2UzSONHhYXBQOaKKsySsahwGGDnb%2FiYPJw22sCqzirSULYy1qtHhXGbtgrM0oagBV4XiTJok3GoLoDNH8ooTmBm7ZMsbpFzi2bgPGoXWXME6XT%2BRJ4GLddxJ4PpQy7tmfoU2HPN6cKg%2BledKHBKlF8oNSt5w5g5o8eXhu1IOlpl5kGerDxIVT%2BztzKepulD8utXqpChamkzzuo7xYGk%2FkpSYuviLXun5bzdRf0Krejzqyz7Z3p0I1v2d6HmA07dofmS48njAiuMgAAAAASUVORK5CYII%3D)](https://discord.com/invite/zwQzqP8b6q)

Port of [Nomifactory](https://github.com/Nomifactory/Nomifactory) 1.3 to [GregTech CEu](https://github.com/GregTechCEu/GregTech) and its related mods, with updated quests, progression and balance changes to adapt to CEu's changes, and to extend on the pack.  

## Featuring:
- Overhauled circuit progression closely following CEu stock   
- Multiblock versions of nearly all machines, including EBF, Freezer and DT, processing up to 256 recipes in parallel  
- New processing chains for Naquadah, Advanced SMDs, Crystal Chips, and more  
- Fixed lots of unpleasant CE-ness - fixed infinite Amp bug, different ore stone types don't clog up your inventory, etc.   
- Super-performant emissive effects on machines, coil blocks, the Fusion Reactor, and more  
- Updated questbook to guide you through all the new stuff, including a completely new chapter, the Processing Lines Tab, to give you more info, useful tips and a visual representation of different processing lines, both new and old  
- Many QoL features - Wiremill can produce any wire, Creative Tank no longer uses fluids, new creative chests and tanks from CEu, etc.
- And more...  

## Addon Mods
Nomi-CEu comes with addon scripts for the following mods. You can drop them into the mods folder, and their recipes will be adjusted accordingly.  
- [AE2 Fluid Crafting Rework](https://www.curseforge.com/minecraft/mc-mods/ae2-fluid-crafting-rework)  
- [Compact Machines](https://www.curseforge.com/minecraft/mc-mods/compact-machines)  
- [Flux Networks](https://www.curseforge.com/minecraft/mc-mods/flux-networks)  
- [Lazy AE2](https://www.curseforge.com/minecraft/mc-mods/lazy-ae2)  
- [Project Red - Illumination](https://www.curseforge.com/minecraft/mc-mods/project-red-illumination)    

\* Note: If you are adding these mods via the CurseForge app, remove the extra copy of AE2 (non-extended life), of which it might automatically download.

## Expert Mode 
If you want a harder, or perhaps a more "true" GregTech experience, check out the Expert mode. This pack mode is based on the [Self-Torture Edition fork](https://github.com/NotMyWing/Omnifactory-Self-Torture-Edition) of the original pack. 

### Highlights include:
- Forced Peaceful Mode
- No DME for easy infinite resources
- Nomicoins can't be spent, or obtained
- The Steam Age
- More Focus on GT Power Generation
- No Creative Tank; instead...
    - Stabilized Micro Miners for late-game infinite resources  
- Harder recipes for assorted things like Iridium, Graphene, Numismatic Dynamos, and more  

### Installation Instructions:
NOTE: Scripts will not work on versions <1.6, thus manual installation will be necessary. 

#### Script Installation Instructions
##### Windows: 
    - Download [here](https://raw.githubusercontent.com/Nomi-CEu/nomi-ceu/main/pack-mode-switcher.bat) (right click - save as) save it to the root directory of the pack (the same level as `\config`).
    - Run the pack mode switcher in a terminal with `./pack-mode-switcher.bat`
        
##### Any GNU/Linux (Mac and Linux):
    - Run `curl -O https://raw.githubusercontent.com/Nomi-CEu/nomi-ceu/main/pack-mode-switcher.sh` to download the file.
    - Verify the contents with your editor of choice.
    - Run `chmod +x pack-mode-switcher.sh; sh pack-mode-switcher.sh` in the pack root directory (the one containing `/config`).

#### Manual installation instructions are available [here](overrides/README.md).

## Bansoukou
This pack uses two bansoukou patches. 
The first one is for [NuclearCraft](https://github.com/tomdodd4598/NuclearCraft/tree/1.12.2), and the second one is for [Draconic Evolution](https://github.com/Draconic-Inc/Draconic-Evolution/tree/1.12.2).

The two patch repos are:
- [NuclearCraft](https://github.com/Exaxxion/NuclearCraft/tree/2.18y-ceu). This fixes GTCEu incompatability with NuclearCraft.
- [Draconic Evolution](https://github.com/Nomi-CEu/Draconic-Evolution). This adds the destruct core button, and allows GT blocks in place of DE blocks, in the Energy Core and Reactor.

If there are issues or crashes with Draconic Evolution, please report them to [here](https://github.com/Nomi-CEu/Draconic-Evolution/issues) instead of the main Draconic Evolution repo.

## Credits
Original pack by [Exaxxion](https://github.com/Exaxxion).  
Certain new quests from [GregTech Community Pack](https://github.com/GregTechCEu/GregTech-Community-Pack).  
GTCE item-ID to GTCEu item-ID conversion scripts by [brachy84](https://github.com/brachy84).   
Perfect Gem textures from [FurfSky Reborn](http://furfsky.net/). ([Permission](https://ibb.co/bBpksq0) at [this message](https://discord.com/channels/771187253937438762/774353150278369351/938438074503942184) in [FurfSky Reborn server](https://discord.gg/fsr)).  
Certain hard mode recipe chains and Magnetron texture from [GCY Science](https://github.com/GregTechCEu/gregicality-science).  
Stabilized miner textures from [Self-Torture Edition](https://github.com/NotMyWing/Omnifactory-Self-Torture-Edition).  
Flux Networks compatibility recipes from [smudgerox](https://github.com/smudgerox).  
Thank you!
