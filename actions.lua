--[[
Copyright © 2025, Bryenne [Sylph] - DragonGuard linkshell

THIS DATA IS PROVIDED FOR USE OF THE "Tourist Add-On for Windower" ONLY. IF YOU USE THIS DATE FOR OTHER PURPOSES, PLEASE CREDIT WHERE CREDIT IS DUE!

	* Do not use for commercial products, Add-On bundles sold for profit or any other product endorsements without written permission. My lawyer will find you kupo. 
	
Shout-Outs: Rubenator, AkadenTK, Arcon
]]
-- this tables lists all action IDs that can teleport the player (actions = use an item, an equipment piece, or cast a spell)
return {
	-- [SPELLS] ----------------------------------------------------------------->
	[81] = {zone=82}, -- Recall-Jugner
	[82] = {zone=90}, -- Recall-Meriph
	[83] = {zone=97}, -- Recall-Pashh
	[120] = {zone=124}, -- Teleport-Yhoat
	[121] = {zone=114}, -- Teleport-Altep
	[122] = {zone=102}, -- Teleport-Holla
	[123] = {zone=108}, -- Teleport-Dem
	[124] = {zone=117}, -- Teleport-Mea
	[139] = {zone=112}, -- Teleport-Vahzl
	-- [ITEMS] ------------------------------------------------------------------>
	[14672] = {zone=26}, -- Tavnazian Ring
	[14661] = {zone=102}, -- Holla Ring
	[14662] = {zone=108}, -- Dem Ring
	[14663] = {zone=117}, -- Mea Ring
	[14664] = {zone=112}, -- Vahzl Ring
	[14665] = {zone=124}, -- Yhoat Ring
	[14666] = {zone=125}, -- Altep Ring
	[26176] = {zone=102}, -- Dimensional Ring(Holla)
	[26177] = {zone=108}, -- Dimensional Ring(Dem)
	[26178] = {zone=117}, -- Dimensional Ring(Mea)
	[15769] = {zone=51}, -- Olduum Ring
	[10385] = {zone=291}, -- Cumulus Masque +1
	[26799] = {zone=127}, -- Behemoth's Masque +1
	[27855] = {zone=239}, -- Mandragora's Suit +1
	[25757] = {zone=30}, -- Wyrmking suit +1
	[26517] = {zone=162}, -- Shadow Lord Shirt
	[26235] = {zone=54}, -- Arrapago Ring
	[25585] = {zone=244}, -- Black Chocobo Cap
	[15213] = {zone=243}, -- Laurel Crown
	[15212] = {zone=243}, -- Stars Cap
	[15194] = {zone=243}, -- Maat's Cap
	[14657] = {zone=243}, -- Ducal Guard's Ring
	[16042] = {zone=244}, -- Duchy Earring
    [16039] = {zone=230}, -- Kingdom Earring
    [16040] = {zone=235}, -- Republic Earring
    [16041] = {zone=238}, -- Federation Earring
    [16043] = {zone=248}, -- Selbina Earring
    [16044] = {zone=249}, -- Mhaura Earring
    [16045] = {zone=247}, -- Rabao Earring
    [16046] = {zone=250}, -- Kazham Earring
    [16047] = {zone=252}, -- Norg Earring
    [16048] = {zone=26}, -- Safehold Earring
    [16049] = {zone=50}, -- Empire Earring
    [16050] = {zone=53}, -- Nashmau Earring
	[26523] = {zone=257}, -- Delegate's Garb
	[11273] = {zone=994}, -- Custom Gilet +1
    [11274] = {zone=994}, -- Custom Top +1
	[11280] = {zone=994}, -- Elder Gilet +1
    [11275] = {zone=994}, -- Magna Gilet +1
    [11276] = {zone=994}, -- Magna Top +1
	[11279] = {zone=994}, -- Savage Top +1
	[11277] = {zone=994}, -- Wonder Maillot +1
    [11278] = {zone=994}, -- Wonder Top +1
    [18612] = {zone=80}, -- Ram Staff
    [18613] = {zone=87}, -- Fourth Staff
    [18614] = {zone=94}, -- Cobra Staff
    [15841] = {zone=82}, -- Jugner Ring
    [15842] = {zone=90}, -- Passhow Ring
    [15843] = {zone=97}, -- Meriphataud Ring
    [13179] = {zone=230}, -- Kingdom Stable Scarf
    [13180] = {zone=234}, -- Republic Stable Scarf
    [13181] = {zone=241}, -- Federation Stable Scarf
    [28555] = {zone=261}, -- Ceizak Ring
    [28556] = {zone=260}, -- Yahse Ring
    [28557] = {zone=262}, -- Hennetiel Ring
    [28558] = {zone=265}, -- Morimar Ring
    [28559] = {zone=266}, -- Marjami Ring
    [28560] = {zone=263}, -- Yorcia Ring
    [28561] = {zone=267}, -- Kamihr Ring
	[26739] = {zone=281}, -- Leafkin Cap +1
	[18879] = {zone=70}, -- Rounsey Wand
	[5398] = {zone=72}, -- Zhayolm Remnants Fireflies
	[5399] = {zone=72}, -- Arrapago Remnants Fireflies
	[5400] = {zone=72}, -- Bhaflau Remnants Fireflies
	[5401] = {zone=72}, -- Silver Sea Remnants Fireflies
	[6574] = {zone=248}, -- Veridical Conflux Shard
    [5343] = {zone=79}, -- Azouph Fireflies
    [5344] = {zone=52}, -- Bhaflau Fireflies
    [5345] = {zone=61}, -- Zhayolm Fireflies
    [5346] = {zone=79}, -- Dvucca Fireflies
    [5347] = {zone=54}, -- Reef Fireflies
    [5348] = {zone=72}, -- Un. Ruins Fireflies
    [5349] = {zone=54}, -- Cutter Fireflies
    [6398] = {zone=276} -- Arena Fireflies (Sinister Reign?)
}, {"id", "zone"}