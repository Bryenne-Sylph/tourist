# TOURIST
#### v1.5 (Release)

### Written by Bryenne[Sylph], with huge improvement to zoning-destination lookup by Kenshi. 

This addon creates a loading screen every time Final Fantasy XI would go to a black screen to load a new area. Since Final Fantasy XI does not have one single 'zoning' method, it is not guaranteed the loading image works correctly in all instances. Please report missing loading screen moments so we can add them (DM me on the windower discord is best or email me at mrrudix@gmail.com).

### Installation

Download the entirity of this repository to: ```[your-windower-path]/addons/tourist```
Add this line to your init.txt: ```lua load tourist```
Or load it manually in-game by typing: ```//lua load tourist```

## COMMANDS

Use //tourist to give these COMMANDS

### static
Toggle [On/off] Determines whether Tourist uses a static loading image or zone-specific loading images. Default is OFF.
<br>
to change:
```
//tourist static
```
This turns using a static image [on] if it is [off], or [off] if it is [on].
			  
### small
Toggle [On/off] Determines whether Tourist uses full resolution images (1024 by 582) or low resolution images (512 by 300). Default is [off].
<br>
to change:
```
//tourist small
```
This turns using a high resolution images [on] if it is [off], or [off] if it is [on].
			  
### fadein
Toggle [On/off] When turned on, the loading screen will fade in instead of simply appearing. Default is [off].
<br>
to change:
```
//tourist fadein
```
This turns fading in images [on] if it is [off], or [off] if it is [on].
			  
### sd 
Toggle [on/off] Determines whether or not the Loading screen for the correct zone is displayed when being teleported by Shihu-Danhu, the crazy teleport mage in Al Zahbi. When this is on, the destination will not be shown in the loading screen.
```
For Example:
//tourist sd
```
This will show the image for the actual zone when [off], or use a special image keeping the destination a secret when it is [on]
			  
### test
Requires a numeric value as input and will show the loading screen of a specific zone...this is mostly to test graphics, or to confirm a loading screen exists for a certain zone. (Yet it is possible we missed one).
```
For Example:
//tourist test 230
```
This will show the image for zone 230 (Southern San d'Oria). Leave the number blank to remove the image:
```
//tourist test
```
							
# CHANGELOG

TODO:
* Diorama zones (ballista/brenner)
* Vagary / Delve
* Ruhotz Silver Mines 

Known Issues:
* Sometimes Warp activates so fast Tourist misses it
* Certain cutscenes might load a different zone, this is generally untested but should now load the correct screens

### v1.5
* Rewrote the entire zone-determination code thanks to a better method developed by Kenshi
* You no longer need lookup tables (vw.lua, dialogs.lua etc can all be deleted) the only additional luas still used are: [subtitles.lua] and [zonelines.lua] 
* Cutscenes that load new areas should now work correctly - this is hard to test, please report missing loading screens
* Crystal War era / Retrace no longer needs a temporary screen the first time
* Fixed a bug where entering Apollyon through a Swirling Vortex in Al'Taieu would show the wrong loading screen
* Added new images for Everbloom Hollow, Silver Knife, Gwora - Corridor and Gwora - Throne Room, Throne Room [V]
* Added new images that show if you will be getting pirates on your ferry ride to Mhaura or Selbina
* Added optional Fade In functionality
* Added optional functionality to mask your destination when warped by the apprentice warp-NPC in Al Zahbi (Shihu-Danhu)

Files to delete: 
'actions.lua', 'dialogs.lua', 'escape.lua', 'guides.lua', 'homepoints.lua', 'npcs.lua', 'unity.lua', 'vw.lua', 'waypoints.lua'

New files:
'subtitles.lua', 
'data\large\86.png', 'data\large\227.png', 'data\large\228.png', 'data\large\229.png', 'data\large\278.png', 'data\large\283.png', 'data\large\299.png'
'data\small\86.png', 'data\small\227.png', 'data\small\228.png', 'data\small\229.png', 'data\small\278.png', 'data\small\283.png', 'data\small\299.png'


### v1.4
* Fixed a bug where "Scroll of Instant Warp" was not recognized as a warp item
* Fixed a bug where teleporting to Reisenjima would show the wrong screen if you enter from the Crag of Mea
* Added support for Feretory - entering through all cities and Pashhow

Files to update:
'tourist.lua', 'dialogs.lua', 'npcs.lua' and new images 'data\large\285.png' + 'data\small\285.png'

### v1.3
Bug fixes: 
* fixed a bug where entering Sheol: gaol was not recognized as entering Odyssey
* fixed a bug where teleporting back to your "home" city in Crystal Era zones via a Campaign Arbiter would sometimes show Xarcabard [S] instead of the city. 
* fixed a bug with teleport-spells where a nearby player teleporting would change your zone (lol!)
* fixed a bug where entering Sortie would not be properly recognized if you are not the party leader
* added support for the "Waking the Colossus" battlefield in Nyzul

### v1.2
* Added "Lure of the Wildcat" NPC paid warp to Whitegate (Amutiyaal in South San d'Oria, Alib-Mufalib in Port Bastok, Ibwam in Windurst Woods, and Ajithaam in Upper Jeuno). 
* Added better error handling for NPC lookups, as a lot of cutscenes would create Tourist errors. 
* Bug fixes: Fixed a bug with accessing Dynamis Divergence - Jeuno not being recognized + added missing images. Fixed a bug with "Ernst" not being recognized as an Abyssea Warp NPC. 

Files to update:
'tourist.lua', 'dialogs.lua', 'npcs.lua' and new images 'data\large\297.png' + 'data\small\297.png'

### v1.1
* Fixed a bug where exiting Escha - Zi'tah would sometimes show 'Xarcabard [S]' screen.
* Added 'Repatriation' functionality for using an Outpost NPC to warp back to home nation. 
* Added the three Conquest Outpost Warp NPCs functionality (Jeanvirgaud (North San d'Oria), Conrad (Bastok Mines) and Rottata (Port Windurst))

If you have v1.0 installed, you *ONLY* need to update 'tourist.lua' and 'npcs.lua'!

### v1.0
Release to the public. Please report errors / missing loading screens!

### v0.9.7
Code Cleanup

### v0.9.6
Added functionality that automatically uses the last zone's loading screen if you zone witout player action, to cover auto-ejection from zones after a time out.

### v0.9.2
Added support for saving/loading settings - note: [cawarps.lua], [pwaypoints.lua] and [abyssea.lua] no longer exist, as functionality for these zones has been integrated in [npcs.lua] and [dialogs.lua]

### v0.9.1
Completely redid entire lookup logic for dialogs and npcs, so I could delete about ~40% of the code

### v0.9
Added table and teleportation support for Voidwatch NPCs and Unity NPCs. The table is [vw.lua] or [unity.lua]

### v0.8.5
Added support for city to city teleporting through the Explorer Moogle. Added support for Domenic (Lower Jeuno, Tenshodo HQ) special teleports to certain BCNM locations + two warp tarus in Whitegate

### v0.8.4
Changed how Tourist handles most single-dialog zoning, now using a table instead of individial logic. The table is [dialogs.lua]

### v0.8.3
Added support for entering and exiting all Promyvion zones. Added support for Entering and leaving Apollyon from Al'Taieu. 

### v0.8.2
Added support for items that can warp you to a different zone, like Cumulus Masque +1, Dimensional rings, warp ring, nation rings etc. Uses table [actions.lua]

### v0.8.1
Added support for White Mage teleport magic and recall magic + warping. Uses table [actions.lua] + Added functionality that deals with using the correct loading screens when using Escape.

### v0.8
Added support and table for teleporting by using the Survival Guides. The table is [guides.lua]

### v0.7
Added support for entering/leaving Chateau d'oraguile / Heaven's Tower. Omen entering/leaving. Ambuscade entering/leaving. Chocobo Circuit entering/leaving. Odyssey entering/leaving. 

### v0.6
Crystal War era maws + campaign arbiters. Added support for all airship routes to and from Jeuno, the ferry between Selbina/Mhaura and the ferry between Whitegate and Nashmau

### v0.5
Added support for entering Mog Houses, leaving Mog Houses (including "Choose an Area to exit to" and changing floors) + Mog Garden + Escha zones + Reisenjima

### v0.4
Added support for using Cavernous Maws to travel to Abyssea areas (uses [abyssea.lua]). Added support for Adoulinian Waypoints (uses [waypoints.lua])

### v0.3
Added support for the Runic Portal in Aht Urghan Whitegate (and returning to it) + recognizing when on Assault missions

### V0.2
Created logic and table to show the loading screen when using homepoints to teleport to a new zone. The table is [homepoints.lua]

### V0.1
Created logic and table to show the loading screen when passing zone lines normally (843 known zonelines). The table is [zonelines.lua]
