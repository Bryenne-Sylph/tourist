--[[
Copyright © 2025, Bryenne [Sylph] - DragonGuard linkshell

THIS DATA IS PROVIDED FOR USE OF THE "Tourist Add-On for Windower" ONLY. IF YOU USE THIS DATE FOR OTHER PURPOSES, PLEASE CREDIT WHERE CREDIT IS DUE!

	* Do not use for commercial products, Add-On bundles sold for profit or any other product endorsements without written permission. My lawyer will find you kupo. 
	
Shout-Outs: Rubenator, Dimitrious, AkadenTK, Arcon

Table structure is based on outgoing packet 0x05B: first index is MENU_ID, second index is the zone we are in, third index (where applicable) is MENU_OPTION)
]]
return {
		[0] = {
			[1] = {zone=2}, -- Disembarking Phanauet Channel barge at North Landing or Central Landing
			[158] = {zone=157} -- Upper Delkfutt's Tower > Middle Delkfutt's Tower
		},
		[1] = { 
			[77] = {zone=72}, -- auto-exit Nyzul
			[157] = {zone=184}, -- Middle Delkfutt's Tower > Lower Delkfutt's Tower
			[158] = {zone=179}, -- Upper Delkfutt's Tower > Stellar Fulcrum
			[289] = {zone=25} -- Escha Ru'Aun > Misareaux Coast
		},
		[2] = { 
			[157] = {zone=184} -- Middle Delkfutt's Tower > Lower Delkfutt's Tower
		},
		[3] = { 
			[182] = {zone=89}, -- Walk of Echoes > Grauberg [S] (Veridical Conflux)
			[184] = {zone=157} -- Lower Delkfutt's Tower > Middle Delkfutt's Tower
		},
		[4] = { 
			[184] = {zone=157}, -- Lower Delkfutt's Tower > Middle Delkfutt's Tower
			[288] = {zone=126} -- Escha - Zi'tah > Qufim Island
		},
		[8] = {
			[179] = {zone=158} -- Stellar Fulcrum > Upper Delkfutt's Tower
		},
		[9] = {
			[290] = {zone=182} -- Desuetia - Empyreal Paradox > Walk of Echoes
		},
		[10] = {
			[1] = {zone=2}, -- Disembarking the Phanauet Channel barge in South Landing
			[29] = {zone=25}, -- Riverne Site #B01 > Misareaux Coast
			[31] = {zone=29}, -- Monarch Linn > Riverne Site #B01
			[157] = {zone=158} -- Middle Delkfutt's Tower > Upper Delkfutt's Tower
		},
		[11] = {
			[31] = {zone=30}, -- Monarch Linn > Riverne Site #A01
			[291] = {zone=293} -- Reisenjima > Reisenjima Sanctorium
		}, 
		[12] = {
			[182] = {
				[11] = {zone=222}, -- Walk of Echoes > Provenance
				[32] = {zone=182}, -- Walk of Echoes > Walk of Echoes main
				[33] = {zone=90} -- Walk of Echoes > Pashhow Marshlands [S]
			}
		},
		[13] = {
			[90] = {zone=182} -- Pashhow Marshlands [S] > Walk of Echoes (Veridical Conflux)
		},
        [14] = { 
			[2] = {zone=1, dest=2}, -- Carpenter's Landing > boarding Barge in South Landing
			[4] = {zone=3, dest=994}, -- Bibiki Bay > Manaclipper (heading to Purgonorgo Isle)
			[25] = {zone=289}, -- Misareaux Coast > Escha Ru'aun
			[291] = {zone=102}-- Reisenjima > La Theine Plateau
		},
		[15] = {
			[222] = {zone=182} -- Provenance > Walk of Echoes
		},
        [16] = { 
			[2] = {zone=1, dest=2}, -- Carpenter's Landing > boarding Barge in North Landing
			[4] = {zone=3, dest=4}, -- Purgonorgo Isle > Manaclipper (heading to Bibiki Bay)
			[293] = {zone=291} -- Reisenjima Sanctorium > Reisenjima
		},
		[17] = { 
			[291] = {zone=292} -- Reisenjima > Reisenjima-Henge, entering Omen
		},
		[19] = {
			[36] = { -- Empyreal Paradox Dimensional Portal
				[1] = {zone=102}, -- > La Theine Plateau (Crag of Holla)
				[2] = {zone=108}, -- > Konschtat Highlands (Crag of Dem) 
				[3] = {zone=117}, -- > Tahrongi Canyon (Crag of Mea)
				[4] = {zone=293} -- > Reisenjima Sanctorium
			}
		},
		[26] = {
			[284] = {zone=257} -- Celennia Memorial Library > Eastern Adoulin
		},
		[28] = {
			[274] = {zone=267} -- Outer Ra'Kaznar > Kamihr Drifts (Liseran Door)
		},
		[29] = {
			[89] = {zone=182} -- Grauberg [S] > Walk of Echoes (Veridical Conflux)
		},
		[33] = { 
			[29] = {zone=31} -- Riverne Site #B01 > Monarch Linn
		},
		[34] = {
			[267] = {zone=274}, -- Kamihr Drifts > Outer Ra'Kaznar (Liseran Door)
		},
		[35] = { 
			[30] = {zone=31} -- Riverne Site #A01 > Monarch Linn
		},
		[36] = {
			[182] = {zone=290} -- Walk of Echoes > Desuetia - Empyreal Paradox (???)
		},
		[40] = {
			[2] = {zone=1, dest=2} -- Carpenter's Landing > boarding Barge in Central Landing
		},
		[41] = {
			[242] = {zone=239} -- Heaven's Tower > Windurst Woods
		}, 
		[44] = {
			[137] = {zone=182} -- Xarcabard [S] > Walk of Echoes
		}, 
		[45] = {
			[22] = {zone=9} -- Promyvion - Vahzl > Pso'Xja
		}, 
		[46] = {
			[16] = {zone=14}, -- Promyvion - Holla > Hall of Transference
			[18] = {zone=14}, -- Promyvion - Dem > Hall of Transference
			[20] = {zone=14}, -- Promyvion - Mea > Hall of Transference
			[126] = {zone=255}, -- Qufim Island > Abyssea - Empyreal Paradox
		},
		[48] = {
			[126] = {zone=41}, -- Qufim Island > Dynamis - Qufim
		},
		[51] = {
			[71] = {zone=50} -- The Colosseum > Whitegate
		},
		[52] = { 
			[34] = {zone=35} -- Grand Palaze of Hu'Xzoi > The Garden of Ru'Hmet (Gate of the Gods)
		}, 
		[58] = {
			[103] = {zone=39} -- Valkurm Dunes > Dynamis - Valkurm
		}, 
		[64] = {
			[118] = {zone=40}, -- Buburimu Peninsula > Dynamis - Buburimu
		},
		[65] = {
			[126] = {zone=288} -- Qufim Island > Escha - Zi'tah
		},
		[68] = {
			[267] = {zone=133} -- Kamihr Drifts > Ra'Kaznar U2 (Sortie)
		},
		[71] = {
			[236] = {zone=224} -- Port Bastok > Airship, boarding Airship to Jeuno
		},
		[72] = {
			[267] = {zone=133} -- Kamihr Drifts > Ra'Kaznar U2 (Sortie - Manual entrance)
		},
		[82] = {
			[276] = {zone=277}, -- Ra'Kaznar Inner Court > Ra'Kaznar Turris (vertical transport device)
			[277] = {zone=276} -- Ra'Kaznar Turris > Ra'Kaznar Inner Court (vertical transport device)
		},
		[86] = { 
			[239] = {zone=242} -- Windurst Woods > Heaven's Tower
		}, 
		[100] = {
			[33] = {zone=34}, -- Al'taieu > Grand Palace of Hu'Xzoi
			[36] = {zone=35}, -- Empyreal Paradox > Garden of Ru'Hmet
			[38] = {zone=33}, -- Apollyon > Al'taieu
			[55] = {zone=54}, -- Ilrusi Atoll > Arrapago Reef (Rune of Release)
			[56] = {zone=79}, -- Periqia > Caedarva Mire (Rune of Release)
			[63] = {zone=61}, -- Lebros Caverns > Mounth Zhayolm (Rune of Release)
			[66] = {zone=52}, -- Mamool Ja Training Grounds > Bhaflau Thickets (Rune of Release)
			[69] = {zone=79} -- Leujaoam Sanctum > Caedarva Mire (Rune of Release)
		}, 
		[101] = { 
			[38] = {zone=33}, -- Apollyon > Al'taieu
			[39] = {zone=103}, -- Dynamis - Valkurm > Valkurm Dunes (Somnial Threshold)
			[40] = {zone=118}, -- Dynamis - Buburimu > Buburimu Peninsula (Somnial Threshold)
			[41] = {zone=126}, -- Dynamis - Qufim > Qufim Island (Somnial Threshold)
			[42] = {zone=26}, -- Dynamis - Tavnazia > Tavnazian Safehold (Somnial Threshold)
			[50] = { -- Runic Portal
				[1] = {zone=79, sub="Azouph Isle Staging Point"}, -- > Caedarva Mire
				[2] = {zone=79, sub="Dvucca Isle Staging Point"}, -- > Caedarva Mire 
				[3] = {zone=52, sub="Mamool Ja Staging Point"}, -- > Bhaflau Thickets
				[4] = {zone=61, sub="Halvung Staging Point"}, -- > Mount Zhayolm
				[5] = {zone=54, sub="Ilrusi Atoll Staging Point"}, -- > Arrapago Reef
				[6] = {zone=72, sub="Nyzul Isle Staging Point"} --> Alzadaal Undersea Ruins
			},
			[134] = {zone=111}, -- Dynamis - Beaucedine > Beaucedine Glacier (Somnial Threshold)
			[135] = {zone=112}, -- Dynamis - Xarcabard > Xarcabard (Somnial Threshold)
			[186] = {zone=234}, -- Dynamis - Bastok > Bastok Mines (Somnial Threshold)
			[187] = {zone=239}, -- Dynamis - Windurst > Windurst Walls (Somnial Threshold)
			[188] = {zone=243} -- Dynamis - Jeuno > Ru'lude Gardens (Somnial Threshold)
		}, 
		[102] = {
			[56] = {zone=79}, -- Periqia time-out
			[63] = {zone=61}, -- Lebros Caverns time-out
			[66] = {zone=52}, -- Mamool Ja Mission time-out
			[90] = {zone=92} -- Pashhow Marshlands [S] > Beadeaux [S] (Corroded Gate)
		},
		[103] = {
			[14] = {zone=102}, -- Hall of Transference > La Theine Plateau
			[98] = {zone=164} -- Sauromogue Champaign [S] > Garlaige Citadel [S] (Ebon Door)
		}, 
		[104] = { 
			[14] = {zone=108}, -- Hall of Transference > Konschtat Highlands
			[91] = {zone=171}, -- Rolanberry Fields [S] > Crawler's Nest [S] (Sturdy Door)
			[97] = {zone=99}, -- Meriphataud Mountains [S] > Castle Oztroja [S]
			[98] = {zone=164} -- Sauromogue Champaign [S] > Garlaige Citadel [S] (Ebon Door #2)
		}, 
		[105] = { 
			[14] = {zone=117} -- Hall of Transference > Tahrongi Canyon
		},
		[109] = {
			[52] = {zone=50}, -- Bhaflau Thickets > Whitegate (Mamool Ja Runic Portal)
			[54] = {zone=50}, -- Arrapago Reef > Whitegate (Ilrusi Atoll Runic Portal)
			[61] = {zone=50} -- Mount Zhayolm > Whitegate (Halvung Runic Portal)
		},
		[112] = {
			[9] = {zone=22}, -- Pso'Xja > Promyvion - Vahzl
			[35] = {zone=34} -- Garden of Ru'Hmet > Grand Palaze of Hu'Xzoi (particle gate)
		},
		[117] = {
			[72] = {zone=50} -- Alzadaal Undersea Ruins > Whitegate (Nyzul North Runic Portal)
		},
		[118] = {
			[72] = {zone=50} -- Alzadaal Undersea Ruins > Whitegate (Nyzul South Runic Portal)
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
			[50] = {zone=54, sub="Ilrusi Atoll Staging Point"} -- Whitegate > Arrapago Reef (under Assault Orders) 
		},
		[130] = { 
			[50] = {zone=52} -- Whitegate > Bhaflau Thickets, through the Iron Gate
		}, 
		[131] = { 
			[50] = {zone=51}, -- Whitegate > Wajaom Woodlands, through the Iron Gate
			[79] = {zone=50} -- Caedarva Mire > Whitegate (Azouph Isle Runic Portal)
		},
		[132] = {
			[50] = {zone=70} -- Whitegate > Chocobo Circuit
		},
		[133] = {
			[50] = {zone=71} -- Whitegate > The Colosseum
		},
		[134] = {
			[79] = {zone=50} -- Caedarva Mire > Whitegate (Dvucca Isle Runic Portal)
		},
		[140] = {
			[79] = {zone=69} -- Caedarva Mire > Leujaoam Sanctum (Runic Seal, Assault Mission)
		},
		[143] = {
			[79] = {zone=56} -- Caedarva Mire -> Periqia (Runic Seal, Assault Mission)
		},
		[150] = {
			[14] = {zone=16} -- Hall of Transference > Promyvion Holla
		},
		[151] = {
			[14] = {zone=18}, -- Hall of Transference > Promyvion Dem
			[33] = {zone=102} -- Al'Taieu > La Theine Plateau
		}, 
		[152] = {
			[14] = {zone=20}, -- Hall of Transference > Promyvion Mea
			[33] = {zone=108} -- Al'Taieu > Konschtat Highlands
		}, 
		[153] = {
			[33] = {zone=117} -- Al'Taieu > Tahrongi Canyon
		},
        [159] = {
			[33] = {zone=38} -- Al'taieu > Apollyon
		},
        [160] = {
			[33] = {zone=38} -- Al'taieu > Apollyon
		},
		[172] = { 
			[247] = {zone=298} -- Rabao > Walk of Echoes, Odyssey
		},
		[176] = { 
			[247] = {zone=298} -- Rabao > Walk of Echoes, Odyssey auto-transport
		},
		[184] = { 
			[35] = {zone=36} -- Garden of Ru'Hmet -> Empyreal Paradox 
		},
		[200] = {
			[50] = {zone=47}, -- Boarding Ferry to Mhaura in Whitegate
			[53] = {zone=59}, -- Boarding Ferry in Nashmau (going to Al Zahbi)
			[80] = {zone=81}, -- Southern San d'Oria [S] > East Ronfaure [S] (gate guard)
			[87] = {zone=88}, -- Bastok Markets [S] > North Gustaberg [S] (Red Canyon)
			[248] = {zone=221}, -- Boarding ferry in Selbina (going to Mhaura)
		},
		[202] = { 
			[102] = {zone=14} -- La Theine Plateau > Hall of Transference
		},
		[203] = {
			[50] = {zone=58}, -- Whitegate > Ferry to Nashmau
			[61] = {zone=63} -- Mount Zhayolm > Lebros Caverns (Runic Seal, Assault Mission)
		},
		[205] = {
			[112] = {zone=135} -- Xarcabard > Dynamis - Xarcabard
		},
		[219] = {
			[54] = {zone=55} -- Arrapago Reef > Ilrusi Atoll (Runic Seal, Assault Mission)
		},
		[222] = {
			[102] = { -- Crag of Holla
				[1] = {zone=33}, -- > Al'Taieu
				[2] = {zone=291} -- > Reisenjima
			}
		},
		[229] = {
			[111] = {zone=134} -- Beaucedine Glacier > Dynamis - Beaucedine
		},
		[244] = { 
			[70] = {zone=230} -- Chocobo Circuit > Southern San d'Oria
		},
		[245] = { 
			[70] = {zone=234} -- Chocobo Circuit > Bastok Mines
		},
		[246] = {
			[70] = {zone=241} -- Chocobo Circuit > Windurst Woods
		},
		[247] = {
			[70] = { -- Chocobo Circuit 
				[1] = {zone=243}, -- > Ru'Lude Gardens
				[2] = {zone=244}, -- > Upper Jeuno
				[3] = {zone=245}, -- > Lower Jeuno
				[4] = {zone=246}, -- > Port Jeuno
			}
		},
		[248] = {
			[70] = {zone=50} -- Chocobo Circuit > Whitegate
		},
		[255] = {
			[220] = {zone=248}, -- Disembarking ferry in Selbina
			[227] = {zone=248}, -- Disembarking ferry in Selbina (after pirates)
			[228] = {zone=249} -- Disembarking ferry in Mhaura (after pirates)
		},
		[319] = {
			[246] = {zone=70} -- Port Jeuno > Chocobo Circuit
		},
		[375] = {
			[249] = {zone=183, sub="Ambuscade"} -- Mhaura > Maquette Abdhaljs-LegionA, Entering Ambuscade (manually)
		},
		[378] = {
			[249] = {zone=183, sub="Ambuscade"} -- Mhaura > Maquette Abdhaljs-LegionA, Entering Ambuscade (Auto-Accept)
		},
		[408] = {
			[72] = {zone=74} -- Alzadaal > Arrapago Remnants
		},
		[409] = { 
			[72] = {zone=75} -- Alzadaal > Bhaflau Remnants
		},
		[410] = {
			[72] = {zone=76} -- Alzadaal > Silver Sea Remnants
		},
		[502] = { 
			[25] = {zone=28}, -- Misareaux Coast > Sacrarium
			[26] = {zone=27}, -- Tavnazian Safehold > Phomiuna Aquaducts
			[51] = {zone=50}, -- Wajoam Woodlands > Whitegate (through Iron Gate)
			[52] = {zone=50} -- Bhaflau Thickets > Whitegate (through Iron Gate)
		},
		[505] = {
			[52] = {zone=66} -- Mamool Ja Training Grounds (Runic Seal, Assault Mission)
		},
		[506] = { 
			[233] = {zone=231} -- Chateau d'Oraguille > Northern San d'Oria
		},
		[512] = {
			[221] = {zone=249} -- Disembarking ferry in Mhaura
		},
		[513] = {
			[239] = {zone=187} -- Windurst Walls > Dynamis - Windurst
		},
		[516] = {
			[262] = {zone=256} -- Foret de Hennetiel > Western Adoulin (RUN AF Cutscene)
		},
		[553] = {
			[239] = {zone=296} -- Windurst Walls > Dynamis - Windurst [D] (regular)
		},
		[566] = {
			[234] = {zone=70} -- Bastok Mines > Chocobo Circuit
		},
		[569] = {
			[231] = {zone=233} -- North San d'Oria > Chateau d'Oraguille
		},
		[581] = {
			[239] = {zone=296} -- Windurst Walls > Dynamis - Windurst [D] (shared)
		},
		[591] = {
			[257] = {zone=284} -- Eastern Adoulin > Celennial Memorial Library
		},
		[597] = {
			[234] = {zone=186} -- Bastok Mines > Dynamis - Bastok
		},
		[624] = {
			[26] = {zone=42} -- Tavnazian Safehold > Dynamis - Tavnazia
		},
		[655] = {
			[234] = {zone=295} -- Bastok Mines > Dynamis - Bastok [D] (regular)
		},
		[691] = {
			[234] = {zone=295} -- Bastok Mines > Dynamis - Bastok [D] (shared)
		},
		[700] = { 
			[232] = {zone=223, dest=246} -- Port San d'Oria > Airship, boarding Airship to Jeuno
		},
		[795] = {
			[241] = {zone=70} -- Windurst Woods > Chocobo Circuit
		},
		[882] = {
			[230] = {zone=70} -- Southern San d'Oria > Chocobo Circuit
		},
		[913] = {
			[108] = {zone=14}, -- Crag of Dem > Hall of Transference
			[117] = {zone=14} -- Crag of Mea > Hall of Transference
		},
		[926] = {
			[108] = { -- Crag of Dem Dimensional Portal
				[1] = {zone=33}, -- > Al'taieu
				[2] = {zone=291} -- > Reisenjima
			}
		},
		[1004] = {
			[182] = {zone=137} -- Walk of Echoes > Xarcabard [S]
		},
		[1000] = {
			[259] = {zone=258} -- Rala Waterways [U] > Rala Waterways
		},
		[1015] = { -- mog dinghy in mog garden
			[280] = {
				[2] = {zone=256}, -- Mog Garden > Western Adoulin
				[3] = {zone=257} -- Mog Garden > Eastern Adoulin
			}
		},
		[1028] = {
			[46] = {zone=50}, -- Disembarking Open Sea Ferry in Whitegate
			[47] = {zone=249}, -- Disembarking Open Sea Ferry in Mhaura
			[58] = {zone=53}, -- Disembarking ferry in Nashmau
			[59] = {zone=50} -- Disembarking ferry in Whitegate
		},
		[3593] = {
			[230] = {zone=294} -- Southern San d'Oria > Dynamis Divergence - San d'Oria (regular)
		},
		[3636] = {
			[230] = {zone=294} -- Southern San d'Oria > Dynamis Divergence - San d'Oria (Shared)
		},
		[5500] = {
			[263] = {zone=264, sub="Skirmish Dungeon"}, -- Yorcia Weald > Yorcia Weald [U] (Skirmish - Augural Conveyor)
			[270] = {zone=271, sub="Skirmish Dungeon"}, -- Cirdas Caverns > Cirdas Caverns [U] (Skirmish - Augural Conveyor)
			[274] = {zone=275, sub="Skirmish Dungeon"}, -- Outer Ra'Kaznar > Outer Ra'Kaznar [U1] (Skirmish - Augural Conveyor)
		},
		[5502] = {
			[105] = {zone=129, sub="Meeble Burrows Mission"}, -- Batallia Downs > Ghoyu's Reverie (Meeble Burrows B)
		},
		[5513] = {
			[258] = {zone=259, sub="Skirmish Dungeon"} -- Rala Waterways > Rala Waterways [U] (Skirmish - Augural Conveyor)
		},
		[5515] = {
			[258] = {zone=995} -- Rala Waterways > Rala Waterways [U] ~ Coliseum (RUN fights)
		},
		[8801] = {
			[270] = {zone=276}, -- Cirdas Caverns > Ra'Kaznar Inner Court (???)
			[272] = {zone=276}, -- Dho Gates > Ra'Kaznar Inner Court (???)
			[273] = {zone=276}, -- Woh Gates > Ra'Kaznar Inner Court (???)
			[276] = {zone=272} -- Ra'Kaznar Inner Court > Dho Gates (???)
		},
		[8803] = {
			[276] = {zone=270} -- Ra'Kaznar Inner Court > Cirdas Caverns (???)
		},
		[8804] = {
			[276] = {zone=273} -- Ra'Kaznar Inner Court > Woh Gates (???)
		},
		[10000] = { 
			[250] = {zone=226, dest=246}, -- Kazham > Airship, boarding Airship to Jeuno
			[292] = {zone=291}, -- Reisenjima Henge > Reisenjima (exiting Omen - Voracious Resurgance)
			[298] = {zone=248} -- Walk of Echoes > Selbina (exiting HTBCNM Conflux)
		},
		[10001] = { 
			[183] = {zone=249}, -- Maquette Abdhaljs-LegionA > Mhaura (exiting Ambuscade)
			[287] = {zone=249}, -- Maquette Abdhaljs-LegionA > Mhaura (exiting Ambuscade)
			[292] = {zone=291} -- Reisenjima Henge > Reisenjima (exiting Omen)
		},
		[10002] = { 
			[240] = {zone=225, dest=246} -- Port Windurst > Airship, boarding Airship to Jeuno
		},
		[10010] = { 
			[246] = {zone=223, dest=232} -- Port Jeuno > Airship, boarding Airship to San d'Oria
		},
		[10011] = { 
			[246] = {zone=225, dest=240} -- Port Jeuno > Airship, boarding Airship to Windurst
		},
		[10012] = { 
			[246] = {zone=224, dest=236} -- Port Jeuno > Airship, boarding Airship to Bastok
		}, 
		[10013] = { 
			[246] = {zone=226, dest=250} -- Port Jeuno > Airship, boarding Airship to Kazham
		},
		[10038] = {
			[248] = {zone=998} -- Selbina > Walk of Echoes (Maiden's HTBCNM) - auto-transport
		},
		[10041] = {
			[248] = {zone=998} -- Selbina > Walk of Echoes (Maiden's HTBCNM) - manual
		},
		[10115] = { -- Domenic
			[245] = { -- Lower Jeuno (Neptune's Spire)
				[1] = {zone=140}, -- Ghelsba Outpost
				[2] = {zone=139}, -- Horlais Peak
				[3] = {zone=144}, -- Waughroon Shrine
				[4] = {zone=146}, -- Balga's Dais
				[5] = {zone=206} -- Qu'Bia Arena
			}
		},
		[10176] = {
			[243] = {zone=188} -- Ru'lude Gardens > Dynamis - Jeuno
		}
}