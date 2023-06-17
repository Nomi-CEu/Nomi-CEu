# Server Information File

## Table Of Contents
This server information file is split into two parts:
- Server Setup (Only important for those hosting locally)
- Server Admin Information (Important regardless of your hosting method)

## Server Setup (In v1.6, hosting a server locally, on GNU/Linux, is broken. Please update to a newer version.)
### Downloading the Server
- Download the latest server zip file from [GitHub](https://github.com/Nomi-CEu/nomi-ceu/releases) or [CurseForge](https://www.curseforge.com/minecraft/modpacks/nomi-ceu/files).
- Extract it.

### Launching The Server
- Run the `launch.bat` script (Windows) or the `launch.sh` script (Apple/GNU/Linux) to launch the server. These two scripts are called the **launchscripts**.
- The first time you do this, the server will crash. To fix this, open the `eula.txt` file, and change the value from false to true.

### Server Options
- You can set your server RAM by changing the options in the launchscript. These are lines ***16 and 17*** for both launchscripts.
- You can enable the MC Server GUI by removing `nogui` in the launchscript. This is done in line ***20*** for both launchscripts.
- There are many options of which you can change in your `server.properties` file, such as changing the description (change the `motd` value).
- You can change the server icon by replacing the `server-icon.png` file. Note that the icon must be ***64 by 64***.

### Other
- If you wish to play on your server outside of your network, you will need to setup port-forwarding. That is out of the scope of this file, and you should be aware of the risks that are created when you do this. 

## Server Admin Information
### Island Cakes (available in versions 1.6.1-beta-4+)
There are Island Cakes available, which sends each team to a different void island. To set this up:
- Setup a way for players to go to their islands. The recommend way to do this is:
   - Setup a kind of hub, where players can teleport to their islands. You can do this in the void, in admin-claimed chunks.
   - Place two island cakes. These cannot be crafted, simply grab them from JEI, or the creative mode menu.
   - Turn one into a personal island cake, by right clicking it with a diamond.
   
#### How They Work + Options
Island Cakes and Personal Island Cakes do not get eaten. If you wish to make them be eaten, and be slowly consumed similar to Overworld, Void, Nether and End Cakes, change line ***332***, in `/config/DimensionalEdibles.cfg`, from `B:consumesFuel=false` to `B:consumesFuel=true`. To refill them, Pulsating Dust is used.

Island Cakes send each FTB Team to a unique island. A player simply right-clicks the cake and will be sent to their team's island. If no such island exists, an island will first be created.

In contrast, Personal Island Cakes sends each individual to a seperate island. This is useful for individuals who want some personal space, apart from their team.

By default, Islands will be 60 Regions apart, placed in a spiral. Regions are an area of 32 by 32 chunks. You can change the spacing by changing the number value in line ***343***, in `/config/DimensionalEdibles.cfg`, to any value between 2 and 100. Note that this value is in Regions.

In line ***338***, you can change the dimension the Islands are spawned in. You may have to play around. To get a list of all dimensions, do `/forge dimensions` to get a list of all dimensions and their IDs. You can also change the y level the islands are spawned at, in line ***354***.