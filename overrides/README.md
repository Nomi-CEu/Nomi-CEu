# Hard mode config files
Config files for normal and hard modes are found in `\config-overrides\normal` and `\config-overrides\expert` respectively.

Users can use any of the below methods to repalace configs: 
- Manual: 
    - drag the files inside `\config-overrides\expert` into the main `config` folder, as shown in image:

![image](https://user-images.githubusercontent.com/61507029/168111281-65006a94-4b4d-4255-aca1-1f5039eec705.png)

- Script
    - Windows : Download [here](https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.bat)(right click - save as), save it to the root directory of the pack (the same level as `\config`).
    - Any GNU/Linux (Mac and Linux) System: `curl -O https://raw.githubusercontent.com/tracer4b/nomi-ceu/main/pack-mode-switcher.sh` then verify the contents with your editor of choice before running `chmod +x pack-mode-switcher.sh; sh pack-mode-switcher.sh` in the pack root directory (the one containing `/config`).
