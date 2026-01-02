# TOURIST
#### v1.1

### Written by Bryenne[Sylph]

This addon creates a loading screen every time Final Fantasy XI would go to a black screen to load a new area. Since Final Fantasy XI does not have one single 'zoning' method, it is not guaranteed the loading image works correctly in all instances. Please report missing loading screen moments so we can add them (DM me on the windower discord is best or email me at mrrudix@gmail.com).

### Installation

Download the entirity of this repository to: ```[your-windower-path]/addons/tourist```
Add this line to your init.txt: ```lua load tourist```
Or load it manually in-game by typing: ```lua load tourist```

## COMMANDS

Use //tourist to give these COMMANDS

### static
Toggle [On/off] Determines whether Tourist uses a static loading image or zone-specific loading images. Default is OFF.\
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
* TVR Final Zones (Silver Knife / Gwora corridor / Throne Room)
* Feretory
* Vagary / Delve
* Ruhotz Silver Mines / Everbloom Hollow

Known Issues:
* Sometimes Warp activates so fast Tourist misses it
* Certain cutscenes might load a different zone, this is generally not supported
* There is no way to check what your allegiance in the Crystal War era is (for retrace), Tourist will show a general Crystal War loading screen the first time, but save your allegiance after the first time Retrace is used. 

### v1.1
Fixed a bug where exiting Escha - Zi'tah would sometimes show 'Xarcabard [S]' screen.
Added 'Repatriation' functionality for using an Outpost NPC to warp back to home nation. 
Added the three Conquest Outpost Warp NPCs functionality (Jeanvirgaud (North San d'Oria), Conrad (Bastok Mines) and Rottata (Port Windurst))

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