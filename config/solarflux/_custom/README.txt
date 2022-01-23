~ README v1.1 ~
This directory enables pack developers to add custom solar panels, with custom textures. Read this guide to understand, how to do so...


The first this you want to do is create a folder with internal solar panel name (registry ID). In-game, you would be able to give it to yourself using /give @p solarflux:custom_solar_panel_{NAME}
After you've created the folder, make a new file called "panel.json"
There, fill out the following template:

{
	"capacity": 0,
	"generation": 0,
	"transfer": 0,
	"thickness": 6,
	"connected_textures": true,
	"localizations": {
		"en_us": "NAME Solar Panel"
	}
}

When you're done, save it to "panel.json"
Oh also, please fill out the numerical fields to be greater than zero, or you'll run into troubles.
Small tips for the JSON:
- You can remove "thickness" if you want to use standard 6-pixel thickness.
- You can remove "connected_textures" if you want the panels to connect anyway.
- Any language is supported, but the fallback is always "en_us", so keep that in place!


Next up: textures!
In your panel folder, you're going to need 3 texture files: "top.png", "top_full.png" and "base.png".
Let's have a quick look through each file...
- base.png - The base texture. It's applied to sides and bottom of the solar panel.
- top.png - this is what you would expect, the top face of the solar panel. HOWEVER! This texture MUST have borders of the "base.png", because this texture is rendered in the inventory.
- top_full.png - this is the same as "top.png", but without any borders.
These textures can be animated, if provided with the NAME.mcmeta files, and fill them as in default minecraft resource packs.


If you're lazy enough to read all of this, I made a tutorial video, explaining all of this in details:
https://youtu.be/AhEaUzP4ozk


Sincerely, Zeitheron.
https://www.curseforge.com/projects/246974