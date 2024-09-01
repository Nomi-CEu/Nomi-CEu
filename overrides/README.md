# Expert Mode Instalation
Config Changes for Normal and Expert Mode are found in `/config-overrides/normal` and `/config-overrides/expert` respectively.

Users can use any of the below methods to replace configs:

## Manual
- Drag the files inside `/config-overrides/expert` into the main `config` folder, as shown in the below image.
- **Make sure to replace existing files!**
- **MacOS: Merge folders, don't replace them!**

![image](https://user-images.githubusercontent.com/61507029/168111281-65006a94-4b4d-4255-aca1-1f5039eec705.png)

## Automatic Installation
### Windows:
1. **(CurseForge Downloads Only)** Download [here](https://raw.githubusercontent.com/Nomi-CEu/Nomi-CEu/main/pack-mode-switcher.bat) (right click - save as) save it to the root directory of the pack (the same level as `\config`).
2. Run the pack mode switcher in a terminal with `./pack-mode-switcher.bat`.

### Mac/GNU/Linux System:
1. **(CurseForge Downloads Only)** Run `curl -O https://raw.githubusercontent.com/Nomi-CEu/Nomi-CEu/main/pack-mode-switcher.sh` to download the script, or download it [here](https://raw.githubusercontent.com/Nomi-CEu/Nomi-CEu/main/pack-mode-switcher.sh).
2. Run `chmod +x pack-mode-switcher.sh; sh pack-mode-switcher.sh` in the pack root directory (the one containing `/config`).
