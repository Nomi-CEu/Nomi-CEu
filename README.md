# nomi-ceu
[![Curseforge](http://cf.way2muchnoise.eu/full_594351_downloads.svg)](https://www.curseforge.com/minecraft/modpacks/nomi-ceu)  
Port of [Nomifactory](https://github.com/Nomifactory/Nomifactory) 1.3 to the [GregTech CE Unofficial](https://github.com/GregTechCEu/GregTech) generation of GT mods, with updated quests, progression and minor balance changes to adapt to CEu's changes.
- Overhauled circuit progression closely following CEu stock 
- Multiblock versions of nearly all machines, including EBF, Freezer and DT, processing up to 256 recipes in parallel
- New processing chains for Naquadah, Advanced SMDs, Crystal Chips, and more
- Fixed lots of unpleasant CE-ness - no more stupid Amp system, different ore stone types don't clog up your inventory, etc.
- Super-performant emissive effects on machines, coil blocks, the Fusion Reactor, and more
- Updated questbook to guide you through all the new stuff
- lots more...

Installation instructions for building the bleeding-edge version:  
- Download [Node.js](https://nodejs.org/en/)  
- Open a command line in `buildtools`  
- Run `npm install` (only 1st time)  
- Run `npx gulp buildAll` and `npx gulp zipAll`  

## Hard mode info
If you want a harder, or perhaps a more "true" GregTech experience, check out the Expert mode. This pack mode is based on the [Self-Torture Edition fork](https://github.com/NotMyWing/Omnifactory-Self-Torture-Edition) of the original pack. Highlights include:

- No DML for easy infinite resources
- Omnicoins can't be spent
- The Steam Age
- No Creative Tank; instead...
- Stabilized Micro Miners for late-game infinite resources
- Harder recipes for assorted things like Iridium, Numismatic Dynamos, and more

Installation instructions:
- Change the packmode to Expert (Options -> Pack Mode). Restart to have this take effect.
- Grab the hardmode config files from [here](https://github.com/m2r1k5/nomi-ceu/tree/main/hardmode%20config%20overrides). Drag this into your minecraft folder (you should be "replacing" the existing `config` folder).
- Run `/bq_admin default load ExpertQuests` to load the hard mode questbook.
## Credits
Certain new quests from [GregTech Community Pack](https://github.com/GregTechCEu/GregTech-Community-Pack).  
GTCE item-ID to GTCEu item-ID conversion scripts by [brachy84](https://github.com/brachy84).   
Perfect Gem textures from [FurfSky Reborn](http://furfsky.net/). ([Permission](https://ibb.co/bBpksq0) at [this message](https://discord.com/channels/771187253937438762/774353150278369351/938438074503942184) in [FurfSky Reborn server](https://discord.gg/fsr))  
Thank you!
