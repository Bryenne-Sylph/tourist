--[[
Copyright © 2025, Bryenne [Sylph] - DragonGuard linkshell

THIS DATA IS PROVIDED FOR USE OF THE "Tourist Add-On for Windower" ONLY. IF YOU USE THIS DATE FOR OTHER PURPOSES, PLEASE CREDIT WHERE CREDIT IS DUE!

	* Do not use for commercial products, Add-On bundles sold for profit or any other product endorsements without written permission. My lawyer will find you kupo. 
	
Shout-Outs: Rubenator, Zirk, randomnick112233, AkadenTK
]]
-- this tables lists all items that can teleport the player and their destination zone, omits items like Warp Cudgel, Warp Ring etc since they don't have a fixed destination
return {
	['abyssea npc'] = {
		[260] = {zone=102}, -- La Theine Plateau (Abyssea - La Theine)
		[264] = {zone=108}, -- Konschtat Highlands (Abyssea - Konschtat)
		[268] = {zone=117}, -- Tahrongi Canyon (Abyssea - Tahrongi)
		[272] = {zone=104}, -- Jugner Forest (Abyssea - Vunkerl)
		[276] = {zone=103}, -- Valkurm Dunes (Abyssea - Misareaux)
		[280] = {zone=118},
		[284] = {zone=107},
		[288] = {zone=112},
		[292] = {zone=106}, -- 
	},
	['burrow investigator'] = {
		[1] = {zone=120, sub="Meeble Burrows Site"}, -- Sauromogue Champaign
		[2] = {zone=105, sub="Meeble Burrows Site"} -- Batallia Downs
	},
	['campaign arbiter'] = {
		[1] = {zone=137}, 
		[2] = {zone=136},
		[3] = {zone=84}, 
		[4] = {zone=91},
		[5] = {zone=98}, 
		[6] = {zone=82},
		[7] = {zone=90},
		[8] = {zone=97},
		[9] = {zone=83},
		[10] = {zone=89},
		[11] = {zone=96},
		[12] = {zone=81},
		[13] = {zone=88},
		[14] = {zone=95},
		[18] = {zone=164}, 
		[19] = {zone=171},
		[20] = {zone=175}
	},
	['cavernous maw'] = {
		[102] = {zone=132}, -- Abyssea - La Theine
		[132] = {zone=102},
		[108] = {zone=15}, -- Abyssea - Konschtat
		[15] = {zone=108},
		[45] = {zone=117}, -- Abyssea - Tahrongi
		[117] = {zone=45},
		[217] = {zone=104}, -- Abyssea - Vunkerl
		[104] = {zone=217},
		[103] = {zone=216}, -- Abyssea - Misareaux
		[216] = {zone=103},
		[118] = {zone=215}, -- Abyssea - Attohwa
		[215] = {zone=118},
		[107] = {zone=218}, -- Abyssea - Altepa
		[218] = {zone=107},
		[112] = {zone=253}, -- Abyssea - Uleguerand
		[253] = {zone=112}, 
		[106] = {zone=254}, -- Abyssea - Grauberg
		[254] = {zone=106},
		[255] = {zone=126} -- Abyssea - Empyreal Paradox > Qufim Island
	},
	['explorer moogle'] = {
		[1] = {zone=231}, -- San d'Oria
		[2] = {zone=234}, -- Bastok
		[3] = {zone=240}, -- Windurst
		[4] = {zone=248}, -- Selbina
		[5] = {zone=249} -- Mhaura
	},
	['gaddieux'] = {
		[256] = {zone=262} -- Western Adoulin > Foret de Henetiel (RUN AF cutscene)
	},
	['iron grate'] = {
		[1] = {zone=9} -- Pso'Xja
	},
	['proto-waypoint'] = {
		[4] = {zone=243 }, -- Jeuno
		[5] = {zone=248 }, -- Selbina
		[6] = {zone=249 }, -- Mhaura
		[7] = {zone=247 }, -- Rabao
		[8] = {zone=252 }, -- Norg
		[9] = {zone=100 }, -- West Ronfaure
		[10] = {zone=106 }, -- North Gustaberg
		[11] = {zone=115 }, -- West Sarutabaruta
		[12] = {zone=102 }, -- La Theine
		[13] = {zone=108 }, -- Konschtat
		[14] = {zone=117 }, -- Tahrongi
		[15] = {zone=104 }, -- Jugner
		[16] = {zone=109 }, -- Passhow
		[17] = {zone=119 }, -- Meriphataud
		[18] = {zone=7 }, -- Attohwa
		[19] = {zone=5 }, -- Uleguerand
		[20] = {zone=149 }, -- Davoi
		[21] = {zone=147 }, -- Beadeaux
		[22] = {zone=151 }, -- Oztroja
		[23] = {zone=208 }, -- Quicksand Caves
		[24] = {zone=176 }, -- Sea Serpent Grotto
		[25] = {zone=159 }, -- Uggalepih
		[26] = {zone=153 }, -- Boyahda Tree
		[27] = {zone=11 }, -- Oldton
		[28] = {zone=29 }, -- Riverne B01
		[29] = {zone=162 } -- Zvahl Keep
	},
	['shihu-danhu'] = { -- bad teleporter student in Al Zahbi
		[48] = {zone=991, sub="You're very brave"} -- We don't know where this idiot will take you
	},
	['swirling vortex'] = {
		[25] = {zone=126}, -- Misareaux Coast > Qufim Island
		[126] = {zone=25} -- Qufim Island > Misareaux Coast
	}
}