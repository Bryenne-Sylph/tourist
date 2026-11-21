--[[
Copyright © 2025, Bryenne [Sylph] - DragonGuard linkshell

THIS DATA IS PROVIDED FOR USE OF THE "Tourist Add-On for Windower" ONLY. IF YOU USE THIS DATE FOR OTHER PURPOSES, PLEASE CREDIT WHERE CREDIT IS DUE!

	* Do not use for commercial products, Add-On bundles sold for profit or any other product endorsements without written permission. My lawyer will find you kupo. 
	
Shout-Outs: Rubenator, Dimitrious, AkadenTK, Arcon

Table structure is based on outgoing packet 0x05B: first index is MENU_ID, second index is the zone we are in, third index (where applicable) is MENU_OPTION)
]]
return {
		[101] = { 
			[50] = { -- Runic Portal
				[1] = {zone=79, sub="Azouph Isle Staging Point"}, -- > Caedarva Mire
				[2] = {zone=79, sub="Dvucca Isle Staging Point"}, -- > Caedarva Mire 
				[3] = {zone=52, sub="Mamool Ja Staging Point"}, -- > Bhaflau Thickets
				[4] = {zone=61, sub="Halvung Staging Point"}, -- > Mount Zhayolm
				[5] = {zone=54, sub="Ilrusi Atoll Staging Point"}, -- > Arrapago Reef
				[6] = {zone=72, sub="Nyzul Isle Staging Point"} --> Alzadaal Undersea Ruins
			},
		[120] = {
			[50] = {zone=79, sub="Azouph Isle Staging Point"} -- Whitegate > Caedarva Mire (under Assault Orders)
		},
		[121] = {
			[50] = {zone=52, sub="Mamool Ja Staging Point"} -- Whitegate > Bhaflau Thickets (under Assault Orders)
		},
		[122] = {
			[50] = {zone=61, sub="Halvung Staging Point"} -- Whitegate > Mount Zhayolm (under Assault Orders)
		},
		[123] = {
			[50] = {zone=79, sub="Dvucca Isle Staging Point"} -- Whitegate > Caedarva Mire (under Assault Orders)
		},
		[124] = {
			[50] = {zone=54, sub="Ilrusi Atoll Staging Point"}, -- Whitegate > Arrapago Reef (under Assault Orders) 
		},
		[375] = {
			[249] = {zone=183, sub="Ambuscade"} -- Mhaura > Maquette Abdhaljs-LegionA, Entering Ambuscade (manually)
		},
		[378] = {
			[249] = {zone=183, sub="Ambuscade"} -- Mhaura > Maquette Abdhaljs-LegionA, Entering Ambuscade (Auto-Accept)
		},
		[5500] = {
			[263] = {zone=264, sub="Skirmish Dungeon"}, -- Yorcia Weald > Yorcia Weald [U] (Skirmish - Augural Conveyor)
			[270] = {zone=271, sub="Skirmish Dungeon"}, -- Cirdas Caverns > Cirdas Caverns [U] (Skirmish - Augural Conveyor)
			[274] = {zone=275, sub="Skirmish Dungeon"} -- Outer Ra'Kaznar > Outer Ra'Kaznar [U1] (Skirmish - Augural Conveyor)
		},
		[5502] = {
			[105] = {zone=129, sub="Meeble Burrows Mission"} -- Batallia Downs > Ghoyu's Reverie (Meeble Burrows B)
		},
		[5504] = {
			[265] = {zone=271, sub="Delve Expedition"} -- Morimar Basalt Fields > Cirdas Caverns [U] (Delve)
		},
		[5513] = {
			[258] = {zone=259, sub="Skirmish Dungeon"} -- Rala Waterways > Rala Waterways [U] (Skirmish - Augural Conveyor)
		}
	}
}