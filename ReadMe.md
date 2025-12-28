# TOURIST
#### v1.0

### Written by Bryenne[Sylph]

This addon creates a loading screen every time Final Fantasy XI would go to a black screen to load a new area. Since Final Fantasy XI does not have one single 'zoning' method, it is not guaranteed the loading image works correctly in all instances. Please report missing loading screen moments so we can add them (DM me on the windower discord is best or email me at mrrudix@gmail.com).

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
* Warping to Abyssea zones through an NPC
* Unity Warps
* Death warp
* Einherjar
* Dynamis II

### v0.9.5
Added support for saving/loading settings + added support for Qufim <> Misareaux Coast Swirling Vortex
note: [cawarps.lua], and [abyssea.lua] no longer exist, as functionality for these zones has been integrated in [npcs.lua] and [dialogs.lua]

### v0.9.4
Completely redid entire lookup logic for dialogs and npcs, so I could delete about ~40% of the code

### v0.9.3
Added support for the ferry between Nashmau and Al Zahbi

### v0.9.2
Added support for Salvage areas, and using fireflies to exit zones

### v0.9.1
Added support for Repatriation through Grounds Tome

### v0.9
Added table and teleportation support for Voidwatch NPCs and Unity NPCs. The table is [vw.lua] or [unity.lua]

### v0.8.6
Added support for city to city teleporting through the Explorer Moogle. 

### v0.8.5
Added support for Riverne's spatial displacements and Monarch Linn. 

### v0.8.4
Added support and table for teleporting by using the Proto-Waypoints. The table is [pwaypoints.lua]

### v0.8.3
Changed how Tourist handles most single-dialog zoning, now using a table instead of individial logic. The table is [dialogs.lua]

### v0.8.2
Added support for Purgonorgo Isle to have its own loading screen, even though it is Bibiki Bay. When taking the manaclipper it checks for times to make sure we are disembarking in Purgonorgo Isle. 

### v0.8.1
Added support for entering and exiting all Promyvion zones

### v0.8
Added support for items that can warp you to a different zone, like Cumulus Masque +1, Dimensional rings, warp ring, nation rings etc. Uses table [teleportitems.lua]

### v0.7.2
Added support for White Mage teleport magic and recall magic.

### v0.7.1
Added support for entering Pso'Xja through Iron Grates in Beaucedine Glacier and the Shrouded Maw BCNM arena.

### v0.7
Added support and table for teleporting by using the Survival Guides. The table is [guides.lua]

### v0.6.6
Added support for Entering and leaving the Heaven's Tower in Windurst Walls

### v0.6.5
Added support for Entering and leaving Apollyon from Al'Taieu

### v0.6.4
Added support for all Chocobo Circuit entry points and exits

### v0.6.3
Added support for Domenic (Lower Jeuno, Tenshodo HQ) special teleports to certain BCNM locations + support for entering Odyssey

### v0.6.2
Added support for entering and exiting Omen 

### v0.6.1
Added support for entering/leaving Chateau d'oraguile.

### v0.6
Added support for all airship routes to and from Jeuno, the ferry between Selbina/Mhaura and the ferry between Whitegate and Nashmau

### v0.5.3
Added support for entering and exiting Ambuscade both through the Tome and auto-enter. Also added correctly handling zoning in and out of Whitegate through the Ironbound Gates. Lastly, made sure Mog House is correctly initialized on log in. 

### v0.5.2
Added support for entering the past (Crystal War era) through Cavernous Maws, teleporting to campaign areas through Campaign Arbiters, and returning from the Allied Tags NPCs (uses [cawarps.lua]).

### v0.5.1
Added support for going to and returning from the Mog Garden (including using Mog Dinghy in city ports)

### v0.5
Added support for entering Mog Houses, leaving Mog Houses (including "Choose an Area to exit to" and changing floors)

### v0.4.1
Added support for entering and returning from Escha - Zi'tah, Escha - Ru'Aun and Reisenjima. 

### v0.4
Added support for using Cavernous Maws to travel to Abyssea areas (uses [abyssea.lua]). 

### v0.3.1
Added support for Adoulinian Waypoints (uses [waypoints.lua])

### v0.3
Added support for the Runic Portal in Aht Urghan Whitegate (and returning to it) + recognizing when on Assault missions

### V0.2
Created logic and table to show the loading screen when using homepoints to teleport to a new zone. The table is [homepoints.lua]

### V0.1
Created logic and table to show the loading screen when passing zone lines normally (843 known zonelines). The table is [zonelines.lua]