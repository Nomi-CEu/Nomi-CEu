# Hard mode config files
Config files for normal and hard modes are found in `\config-overrides\normal` and `\config-overrides\expert` respectively.

Users can use any of the below methods to replace configs: 
- Manual: 
    - Drag the files inside `\config-overrides\expert` into the main `config` folder, as shown in image:

![image](https://user-images.githubusercontent.com/61507029/168111281-65006a94-4b4d-4255-aca1-1f5039eec705.png)
    - Following this
        - If on a server move the `server.properties` into the root directory of your server (containing your launch script)
        - If on a client delete `server.properties`
- Script
    - Windows: 
        - Download [here](https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.bat)(right click - save as) save it to the root directory of the pack (the same level as `\config`).
        - Run the pack mode switcher in a terminal with `./pack-mode-switcher.bat`
    - Any GNU/Linux (Mac and Linux) System:
        - Run `curl -O https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.sh` to download the file.
        - Verify the contents with your editor of choice.
        - Run `chmod +x pack-mode-switcher.sh; sh pack-mode-switcher.sh` in the pack root directory (the one containing `/config`).
