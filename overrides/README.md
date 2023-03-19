# Expert Mode config files
Config files for normal and expert mode are found in `\config-overrides\normal` and `\config-overrides\expert` respectively.

Users can use any of the below methods to replace configs: 
Manual (All versions): 
- Drag the files inside `\config-overrides\expert` into the main `config` folder, as shown in below image
    - If on a server move the `server.properties` out of the config directory and into the root directory of your server (the path containing your launch script)
    - If on a client you can safely delete `server.properties`

![image](https://user-images.githubusercontent.com/61507029/168111281-65006a94-4b4d-4255-aca1-1f5039eec705.png)
        
Scripted Installation (>1.5.3)
- Windows: 
     - Download [here](https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.bat)(right click - save as) save it to the root directory of the pack (the same level as `\config`).
    - Run the pack mode switcher in a terminal with `./pack-mode-switcher.bat`
 - Any GNU/Linux (Mac and Linux) System:
    - Run `curl -O https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.sh` to download the file.
    - Verify the contents with your editor of choice.
    - Run `chmod +x pack-mode-switcher.sh; sh pack-mode-switcher.sh` in the pack root directory (the one containing `/config`).
