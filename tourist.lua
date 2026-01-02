--[[
    Copyright © 2025/2026, Bryenne - Sylph server [DragonGuard]
    All rights reserved.
]]
-- Windower Add On Mandatory fields
_addon.name = 'Tourist'
_addon.author = 'Bryenne'
_addon.version = '1.1'
_addon.commands = {'tourist'}
-- windower library imports
packets = require('packets')	-- to be able to receive data from the game
res = require('resources')		-- to look up general resource names
images = require('images')		-- to be able to use graphics
config = require ('config')		-- to load and save settings
texts = require ('texts')		-- to be able to print advanced texts
-- Windower functions
require('strings')
require('lists')
require('tables')

-- data tables (these are separate .lua files that should be included with this addon
zonelines = require('zonelines')
homepoints = require('homepoints')
npcs = require('npcs')
escapezones = require('escape')
dialogs = require('dialogs')
waypoints = require('waypoints')
guides = require('guides')
actions = require('actions')
vw = require('vw')
unity = require('unity')
-- Initialization
function init_tourist()
	init = nil
	logging_out = nil
	subtitle = nil
	lastfound = false
	zone_id = 999
	PrevZone = nil
	entered_from = nil
	mog_house = nil
	loading_img = nil
	player_homepoint = nil
	save_retrace = false
	chat = windower.add_to_chat
	-- check if we are logged in or do nothing
	w_info = windower.ffxi.get_info()
	if not w_info.logged_in then return end
	-- check if the player has loaded yet or do nothing
	player_id = windower.ffxi.get_player()
	if not player_id then return end
	-- Resolution math for centering images
	windower_settings = windower.get_windower_settings()
	posX = ((windower_settings.ui_x_res / 2)-512)
	posY = ((windower_settings.ui_y_res / 2)-291)
	-- player initialization
	player_nation =	(player_id['nation'])
	player_name = (player_id['name'])
	zone_id = (w_info.zone)
	-- determine if we are inside the mog house
	if w_info.mog_house then
		mog_house = true
		entered_from = zone_id
	else
		mog_house = false
	end
	-- add-on settngs 
	defaults = {}
	defaults.small = false
	defaults.static = false
	defaults.homepoint = 0
	defaults.war_nation = 0
	defaults.static_file = "nozone"
	-- create/load settings
	settings = config.load(defaults)
	config.save(settings)
	-- default variables
	dev = false
	awnpcs = L{ "cyril", "ernst", "horst", "ivan", "kierron", "vincent", "willis" } -- Abyssea Warp NPCs
	uwnpcs = L{ "urbiolaine", "igsli", "teldro-kesdrodo", "yonolala", "nunaarl bthtrogg" } -- Unity Warp NPCs
	small = settings.small
	static = settings.static
	wnation = settings.war_nation
	static_file = defaults.static_file
	SetSize()
	-- we're done initializing
	init = true
end

-- [LOAD INITIALIZATION] ------------------------------------------------>
windower.register_event('login', 'logout', 'load', init_tourist)

-- [SET ZONE TO HOMEPOINT WHEN DEAD] ------------------------------->
windower.register_event('status change',function(new,old)
	-- player death = status 2
	if new == 2 then
		zone_id = settings.homepoint
	end
end)

-- ADD ON COMMANDS HANDLING] --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
windower.register_event('addon command', function(command, ...)
    command = command and command:lower()
    local params = {...}
	-- [TEST AN IMAGE] --------------------------------------------->
	if command == 'test' then
		if not params[1] then
			chat(007, ':: [ TOURIST ] :: Tourist is exiting test mode ::')
			-- hide and destroy image if there is one
			if loading_img then
				loading_img:hide()
				loading_img = nil
			end
		else
			-- if an image already exists
			if loading_img then
				loading_img:hide()
				loading_img = nil
			end
			-- render new image
			test_id = tonumber(params[1])
			file_name = (img_path .. test_id ..'.png')
			Create_UI(test_id)
			loading_img = images.new(img_def)
			loading_img:show()
		end
	elseif command == 'static' then
		if static then 
			static = false
			chat(007, ':: [ TOURIST ] :: Static Image mode off')
		else
			static = true
			chat(007, ':: [ TOURIST ] :: Static Image mode on')
		end
		settings.static = static
		settings:save(player_name)
	-- [CHANGE SIZE] ----------------------------------------------->
	elseif command == 'small' then
		if small then
			small = false
			SetSize()
			chat(007, ':: [ TOURIST ] :: High resolution mode on')
		else
			small = true
			SetSize()
			chat(007, ':: [ TOURIST ] :: High resolution mode off')
		end
	-- [SHOW HELP] ------------------------------------------------->
    else
        chat(007, '//tourist help : Shows this help message')
		chat(007, '//tourist small : Toggles between using large and small images')
		chat(007, '//tourist static : Toggles between static image on/off; turning this on will not use zone specific screens but use the standard loading image instead')
		chat(007, '//tourist test [zone ID]: Test image (for example: "//tourist test 234"). Leave blank to remove')
    end
end)

-- [OUTGOING CHUNKS] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
windower.register_event('outgoing chunk', function(id, data)

	-- [ITEMS] -----------------------------------------------------+
	if id == 0x037 then
		local local_packet = packets.parse('outgoing', data)
		local current_item = windower.ffxi.get_items(local_packet['Bag'], local_packet['Slot']).id

		-- Check table to see if this item is a teleporting item
		if actions[current_item] then
			zone_id = actions[current_item].zone
			lastfound = true
		-- Check if this item is a Warp item
		elseif (current_item == 28540 or current_item == 17040 or current_item == 17587 or current_item == 17588) then
			-- 28540: Warp Ring, 17040: Warp Cudgel, 17587: Treat Staff II, 17588: Trick Staff II
			zone_id = player_homepoint
		-- Check if this item is a Repatriation item
		elseif (current_item == 16118 or current_item == 16119) then
			-- Moogle Cap / Nomad Cap (repatriation)
			Repatriation()
		else
			NotFound()
			return
		end
	-- [ZONELINES] -------------------------------------------------+
	elseif id == 0x05E then	
		zonereq = packets.parse('outgoing', data)
		-- look up where we are exiting if we are in a mog house
		if mog_house then
			mog_house = false
			zone_id = windower.ffxi.get_info().zone
			get_mog_exit()
		else
			-- if not look up which zoneline we are crossing
			zoneline = (zonereq['Zone Line'])
			Find_ZoneLine(zoneline)
		end
	-- [DIALOGS] --------------------------------------------------------------------------------------------------------+++
	elseif id == 0x05B then	
		local local_packet = packets.parse('outgoing', data)
		local menu_id = (local_packet['Menu ID'])
		local target_index = (local_packet['Target Index'])
		local menu_option = (local_packet['Option Index'])
		local unknown1 = (local_packet['_unknown1'])
		local npc_name = string.lower(windower.ffxi.get_mob_by_index(target_index).name)
		local CurZone = windower.ffxi.get_info().zone
		
		-- check if player is changing his homepoint
		if menu_id == 8700 and menu_option == 1 then
			player_homepoint = CurZone
			settings.homepoint = player_homepoint
			settings:save(player_name)
		end

	-- [BASED ON NPC NAME] ----------------------------------------------------------------------------------------------+++
	
		-- Do NPC Name checks
		npc_name = CheckNPC(npc_name)

		-- [NPC LOOKUP TABLE] --------------------------------------+		
		if npcs[npc_name] and not lastfound then
			local FindZone = npcs[npc_name]
			-- check for menu options
			if (FindZone and FindZone[menu_option]) then
				FindZone = FindZone and FindZone[menu_option]
				zone_id = FindZone.zone
				lastfound = true
			-- check for current zone
			elseif (FindZone and FindZone[CurZone]) then
				FindZone = FindZone and FindZone[CurZone]
				zone_id = FindZone.zone
				lastfound = true
			-- check for unknown field
			elseif (FindZone and FindZone[unknown1]) then
				FindZone = FindZone and FindZone[unknown1]
				zone_id = FindZone.zone
				lastfound = true
			-- not found
			else
				NotFound()
				return
			end
			-- check if the zone action leads to a destination other than the next zone (for airships and ferries)
			if not FindZone.dest then
				destination = nil
			elseif FindZone then
				destination = FindZone.dest 
			end
			-- check if there is a subtitle
			if not FindZone.sub then
				subtitle = nil
			else
				subtitle = Get_Subtitle_Settings(FindZone.sub)
			end
		-- [HOMEPOINTS] --------------------------------------------+
		elseif npc_name:find("^home point") then
			if menu_option == 2 then
				local hp_id = unknown1
				-- look up where we are going
				Find_Zone(hp_id)
			end
		-- [VOIDWATCH WARP} ----------------------------------------+
		elseif npc_name == 'atmacite refiner' then
			if menu_option ~= 0 then
				if vw[unknown1] then
					zone_id = vw[unknown1].zone
					lastfound = true
				else
					NotFound()
				end
			end
		elseif npc_name == 'unity npc' then
		-- [UNITY WARP] --------------------------------------------+
			if menu_option ~= 0 then
				if unity[menu_option] then
					zone_id = unity[menu_option].zone
					lastfound = true
				else
					NotFound()
				end
			end
		-- [SURVIVAL GUIDES] ---------------------------------------+
		elseif npc_name:find("^survival guide") then
			local guide_id = local_packet._unknown1
			-- if menu option wasn't cancelled
			if menu_option ~= 0 then
				-- look up destination zone from table
				if guides[guide_id] then
					zone_id = guides[guide_id].zone
					lastfound = true
				else
					NotFound()
					return
				end
			end
		-- [ADOULIN WAYPOINTS] -------------------------------------+
		elseif npc_name == 'waypoint' then
			-- if menu option wasn't cancelled
			if menu_option ~= 0 then
				-- look up destination zone from table
				if waypoints[menu_option] then
					zone_id = waypoints[menu_option].zone
					if zone_id ~= CurZone then
						lastfound = true
					end
				else
					NotFound()
					return
				end
			end
		-- [MOG DINGHY] --------------------------------------------+ 
		elseif npc_name == 'mog dinghy' then
			if (CurZone == 280 and menu_option == 1) then
				-- If we did not enter the garden through our Mog House
				if entered_from then
					zone_id = entered_from
					entered_from = nil
				else
					-- if we DID enter through our Mog House
					mog_house = true
					zone_id = 0
				end
			elseif (menu_id == 808 or menu_id == 440 or menu_id == 896) then
				-- taking a dinghy to go to the garden instead of through the mog house
				zone_id = 280
				entered_from = CurZone
			end
		-- [REPATRIATION] ------------------------------------------+
		elseif (npc_name:find("^field manual") and menu_option == 21) or (npc_name:find("^grounds tome") and menu_option == 20) then
			player_nation = (player_id.nation)
			Repatriation()
		elseif npc_name == "kaduru-haiduru" then
			if menu_option == 1 then
				-- go to Ru'Lude Gardens
				zone_id = 243
			elseif menu_option == 2 then
				-- repatriation
				player_nation = (player_id.nation)
				Repatriation()
			end
		end
		-- [END OF NPC LOOKUPS] -----------------------------------------------------------------------------------------+++
		
	-- [BASED ON DIALOG NR] ---------------------------------------------------------------------------------------------+++
		if not lastfound then

			-- [GENERAL DIALOGS] ---------------------------------------+
			if dialogs[menu_id] then
				-- look for menu ID in table
				local FindZone = dialogs[menu_id]
				-- look if there is an entry for that menu_id in the current zone (menu_ids often get re-used in multiple locations)
				FindZone = FindZone and FindZone[CurZone]
				-- check if there are multiple options
				if FindZone and not FindZone.zone then
					FindZone = FindZone and FindZone[menu_option]
				end
				-- set lastfound, prevent double actions
				if FindZone and FindZone.zone then
					zone_id = FindZone.zone
					-- check if the zone action leads to a destination other than the next zone (for airships and ferries)
					if not FindZone.dest then
						destination = nil
					elseif FindZone then
						destination = FindZone.dest 
					end
					-- check if there is a subtitle
					if not FindZone.sub then
						subtitle = nil
					else
						subtitle = Get_Subtitle_Settings(FindZone.sub)
					end
					lastfound = true
				else
					NotFound()
				end
			end
			
			if not lastfound then
				-- [SUPPORT FOR PURGONORGO ISLE] ---------------------------+
				if CurZone == 3 and menu_id == 100 then
					-- arriving at destination
					zone_id = destination
				elseif CurZone == 3 and menu_id == 0 then
					-- Arriving at Purgonorgo Isle
					if windower.ffxi.get_info().time > 400 and windower.ffxi.get_info().time < 540 then
						zone_id = 994
					-- Arriving at Purgonorgo Isle
					elseif windower.ffxi.get_info().time > 1160 and windower.ffxi.get_info().time < 1260 then
						zone_id = 994
					else
						zone_id = 4
					end
				-- [FERRY LEAVING MHAURA] ----------------------------------+
				elseif CurZone == 249 and menu_id == 200 then
					local time = windower.ffxi.get_info().time
					-- both the Ferry to Selbina and the Ferry to Al Zahbi use the same dialog, so we have to check the time
					if  (time > 240 and time < 290) or (time > 720 and time < 770) or (time > 1200 and time < 1250) then
						zone_id = 46
					else
						zone_id = 220
					end
				-- [Outpost NPCs Repatriation]
				elseif menu_id == 32689 then
					Repatriation()
				end
				-- [AIRSHIP DISEMBARKING] ----------------------------------+
				if menu_id == 10 or menu_id == 100 or menu_id == 702 then
					-- check to make sure we are on an airship
					if CurZone >= 223 and 226 >= CurZone then
						-- arriving at destination
						zone_id = destination
						destination = nil
					end
				end
			end
	-- [END OF DIALOGS] -------------------------------------------------------------------------------------------------+++
		end
	-- [DONE ZONING ] ----------------------------------------------+
	elseif id == 0x00C then	
		img_fading = true
		if subtitle then
			subtitle:hide()
			subtitle = nil
		end
		refresh_image()
		lastfound = false
		-- save zone if this is the first time using Retrace
		if save_retrace then
			wnation = windower.ffxi.get_info().zone
			settings.war_nation = wnation
			settings:save(player_name)
			save_retrace = false
		end
	-- prevent loading screen when logging out (0x0E7)
	elseif id == 0x0E7 then
		logging_out = true
	end
end)

-- [INCOMING CHUNKS] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
windower.register_event('incoming chunk', function(id, data)

	-- [ZONING] ----------------------------------------------------+
	if id == 0x00B then
	
		-- determine if we are zoning into the mog house or not
		if (zone_id and zone_id ~= 999) then
			if (zone_id == 0 or zone_id == 998) then
				mog_house = true
			else
				mog_house = false
			end
		elseif (not zone_id or zone_id == 999) then
			-- make zone_id the previous zone, if no new zone_id is set (we're being auto-ejected)
			zone_id = PrevZone
		end
		PrevZone = windower.ffxi.get_info().zone
		ShowUI()

	-- [TELEPORT MAGIC] --------------------------------------------+
	elseif id == 0x028 then
		-- retrieve action data from the FFXI packet
		local act_data = packets.parse('incoming', data)
			-- category 8 is "casting magic"
			if act_data['Category'] == 8 then
				if act_data['Param'] ~= 28787 then
					-- retrieve the spell ID from the FFXI packet data
					local spell_id = act_data['Target 1 Action 1 Param']
					zone_id = 999
					-- warp / warp II
					if (spell_id == 261 or spell_id == 262) then
						zone_id = settings.homepoint
					-- Retrace
					elseif spell_id == 241 then
						if wnation == 0 then -- we don't know which nation the player aligns to
							save_retrace = true -- setting this will save the retrace destination in settings
							zone_id = 996 -- shows a general Crystal War Era loading screen
						else
							zone_id = wnation
						end
					-- Escape
					elseif spell_id == 263 then
						if escapezones[windower.ffxi.get_info().zone] then
							zone_id = escapezones[windower.ffxi.get_info().zone].zone
							lastfound = true
						else
							NotFound()
						end
					-- All other spells (Lookup Table)
					elseif actions[spell_id] then
						zone_id = actions[spell_id].zone
					else
						NotFound()
					end
				end
			end
	-- set the player's homepoint to return to through death or warp
	elseif id == 0x061 then
		local act_data = packets.parse('incoming', data)
		player_homepoint = act_data['Home point']
		-- if this is a newly set homepoint, update it in settings
		if player_homepoint ~= settings.homepoint then
			settings.homepoint = player_homepoint
			settings:save(player_name)
		end
	-- [END OF INCOMING CHUNKS] ------------------------------------------------------------------>
	end
end)

-- [UI FUNCTIONS] -------------------------------------------------------------------------------->
function Create_UI(new_id)
	-- use default image if we didn't get a zone ID
	if (static or (new_id == 999 or new_id == nil)) then
		new_id = static_file
	else
		-- use default image as well if a specific zone image doesn't exist
		if not windower.file_exists((img_path .. new_id ..'.png')) then
			new_id = static_file
		end
	end
	-- image creation defaults
	img_def = {}
	img_def.pos = {}
		img_def.pos.x = posX
		img_def.pos.y = posY
	img_def.color = {}
		img_def.color.alpha = 200
	img_def.texture = {}
		img_def.texture.path = (img_path .. new_id ..'.png')
		img_def.texture.fit = true 
	img_def.size = {}
		img_def.size.height = 582
		img_def.size.width = 1024
		img_def.draggable = false
		img_def.repeatable = {}
		img_def.repeatable.x = 1
		img_def.repeatable.y = 1
	return img_def
end

function ShowUI()

		-- show image (and subtitle)
		if not logging_out then
			Create_UI(zone_id)
			if loading_img then
				loading_img:hide()
				loading_img = nil
			else
				loading_img = images.new(img_def)
				loading_img:show()
				lastfound = false
			end
			-- show subtitle if there is one
			if subtitle then
				subtitle:show()
			end
		end
		
end

function SetSize()
	-- This function determines if we use full size pictures (1024*582) or the smaller ones (512*300)
	if small then
		posX = ((windower_settings.ui_x_res / 2)-256)
		posY = ((windower_settings.ui_y_res / 2)-150)
		img_path = windower.addon_path .. 'data/small/'
		settings.small = true
	else
		posX = ((windower_settings.ui_x_res / 2)-512)
		posY = ((windower_settings.ui_y_res / 2)-291)
		img_path = windower.addon_path .. 'data/large/'
		settings.small = false
	end
	settings:save(player_name)
end

-- [LOOKUP FUNCTIONS] ---------------------------------------------------------------------------->
-- [HOMEPOINTS] ----------------------------------------------------+
function Find_Zone(hp_id) 
	-- if the homepoint is found in the table
	if homepoints[hp_id] then
		zone_id = homepoints[hp_id].zone
		if zone_id ~= windower.ffxi.get_info().zone then
			lastfound = true
		else
			lastfound = false
		end
		return zone_id
	else
		-- we did not find the homepoint in the database
		NotFound()
		return zone_id
	end
end
-- [ZONELINES] -----------------------------------------------------+
function Find_ZoneLine(id) 
	-- look through the table below to see if the zoneline_id matches a known Zone Line
	for index=1,table.getn(zonelines),1 do
		-- if the homepoint is found in the table
		if zonelines[index].id == id then
			zone_id = zonelines[index].to
			lastfound = true
			return zone_id
		end
	end
	-- we did not find the homepoint in the database
	NotFound()
	return zone_id
end

function NotFound()
	-- reset base variables to prevent any fuck ups
	zone_id = 999
	lastfound = false
	destination = nil
	CurZone = nil
end

function Repatriation()
	-- repatriation
	if player_nation == 0 then
		-- Northern San d'Oria
		zone_id = 231
	elseif player_nation == 1 then
		-- Bastok Mines
		zone_id = 234
	elseif player_nation == 2 then
		-- Port Windurst
		zone_id = 240
	end
	lastfound = true
end

function CheckNPC(npc)
	npc_name = npc
	local suffix = npc_name:sub(-4)
	-- Abyssea Warp NPCs
	if awnpcs:find(name) then
		npc_name = 'abyssea npc'
	-- Unity NPC
	elseif uwnpcs:find(npc_name) then
		npc_name = 'unity npc'
	elseif suffix == 'c.a.' or suffix == 'r.k.' or suffix == 'c.c.' or suffix == 'l.c.' then
		if res.zones[windower.ffxi.get_info().zone].en:endswith('[S]') then
			npc_name = 'campaign arbiter'
		end
		-- skip looking for destinations if we are just returning to the city
		if menu_id == 457 then
			if wnation ~= 0 then
				zone_id = wnation
			else
				save_retrace = true
				zone_id = 996
			end
			return npc_name
		end
	end
	return npc_name
end

-- [MOG HOUSES] ----------------------------------------------------+
function get_mog_exit()
	mog_house = false
	if (zonereq['MH Door Menu']) then
		-- San d'Oria Mog House Exits
		if (zonereq['MH Door Menu']) == 1 then
			if (zonereq['Type']) == 1 then
				zone_id = 230 -- Southern San d'Oria
			elseif (zonereq['Type']) == 2 then
				zone_id = 231 -- Northern San d'Oria
			elseif (zonereq['Type']) == 3 then
				zone_id = 232 -- Port San d'Oria
			elseif (zonereq['Type']) == 125 then
				-- change floors to second floor
				zone_id = 998
				mog_house = true 
			elseif (zonereq['Type']) == 126 then
				-- change floors to first floor
				zone_id = 0
				mog_house = true 
			elseif (zonereq['Type']) == 127 then
				zone_id = 280 -- Mog Garden
			end
		elseif 
			-- Bastok Mog House Exit
			(zonereq['MH Door Menu']) == 2 then
			if (zonereq['Type']) == 1 then
				zone_id = 234 -- Bastok Mines
			elseif (zonereq['Type']) == 2 then
				zone_id = 235 -- Bastok Markets
			elseif (zonereq['Type']) == 3 then
				zone_id = 236 -- Port Bastok
			elseif (zonereq['Type']) == 125 then
				-- change floors to second floor
				zone_id = 998
				mog_house = true 
			elseif (zonereq['Type']) == 126 then
				-- change floors to first floor
				zone_id = 0
				mog_house = true 
			elseif (zonereq['Type']) == 127 then
				zone_id = 280 -- Mog Garden
			end
		elseif 
			-- Windurst Mog House Exits
			(zonereq['MH Door Menu']) == 3 then
			if (zonereq['Type']) == 1 then
				zone_id = 238 -- Windurst Waters
			elseif (zonereq['Type']) == 2 then
				zone_id = 239 -- Windurst Walls
			elseif (zonereq['Type']) == 3 then
				zone_id = 240 -- Port Windurst
			elseif (zonereq['Type']) == 4 then
				zone_id = 241 -- Windurst Woods
			elseif (zonereq['Type']) == 125 then
				-- change floors to second floor
				zone_id = 998
				mog_house = true 
			elseif (zonereq['Type']) == 126 then
				-- change floors to first floor
				zone_id = 0
				mog_house = true 
			elseif (zonereq['Type']) == 127 then
				zone_id = 280 -- Mog Garden
			end
		elseif 
			-- Jeuno Mog House Exits
			(zonereq['MH Door Menu']) == 4 then
			if (zonereq['Type']) == 1 then
				zone_id = 243 -- Ru'Lude Garden
			elseif (zonereq['Type']) == 2 then
				zone_id = 244 -- Upper Jeuno
			elseif (zonereq['Type']) == 3 then
				zone_id = 245 -- Lower Jeuno
			elseif (zonereq['Type']) == 4 then
				zone_id = 246 -- Port Jeuno
			elseif (zonereq['Type']) == 127 then
				zone_id = 280 -- Mog Garden
			end
		elseif 
			-- Aht Urghan Mog House Exits
			(zonereq['MH Door Menu']) == 5 then
			if (zonereq['Type']) == 1 then
				zone_id = 48 -- Al Zahbi
			elseif (zonereq['Type']) == 2 then
				zone_id = 50 -- Whitegate
			elseif (zonereq['Type']) == 127 then
				zone_id = 280 -- Mog Garden
			end
		elseif
			-- Adoulin Mog House Exits
			(zonereq['MH Door Menu']) == 9 then
			if (zonereq['Type']) == 1 then
				zone_id = 256 -- West Adoulin
			elseif (zonereq['Type']) == 2 then
				zone_id = 257 -- East Adoulin
			elseif (zonereq['Type']) == 127 then
				zone_id = 280 -- Mog Garden
			end
		end
	end
end
-- [IMAGE FUNCTIONS FOR FADING] ------------------------------------------------------------------>
function refresh_image()
	if img_fading then
		-- fade out on a fixed interval
		if loading_img then
			fade_out()
			coroutine.schedule(refresh_image, 0.010)
		end
	end
end

function fade_out()
	-- substract a value from the alpha value every time this is called (1=slow fade, 10=very fast fade)
    substract_alpha(loading_img:alpha() - 4)
end

function substract_alpha(alpha)
    if (alpha >= 0) then
		-- update the image's alpha value
        loading_img:alpha(alpha)
	else
		-- fade out is complete, hide and clean up image
		img_fading = false
		loading_img:hide()
		loading_img = nil
		-- save current zone so we don't show images when teleporting within the same zone (includes mog house)
		current_zone = zone_id
		NotFound()
		
		-- check for pirates
		CurZone = windower.ffxi.get_info().zone
		if CurZone == 227 or CurZone == 228 then
			chat(008,"ARRRR! Thar will be pirates laddie! Beware before thy bones get dragged to Davy Jones' Locker!")
		end
    end
end
-- [TEXT SETTINGS FOR SUBTITLES] ----------------------------------------------------------------->
function Get_Subtitle_Settings(sub)
	-- settings for subtitles if we have one
	local offset = 0
	local offset_y = 0
	local fontsize = 22
	
	if small == true then
		offset = (256 - ((string.len(sub)/2)*9))
		fontsize = 14
		offset_y = 280
	else
		offset = (512 - ((string.len(sub)/2)*15))
		fontsize = 22
		offset_y = 545
	end
	
	-- create settings tables
	txt_def = {}
		txt_def.pos = {}		
			txt_def.pos.x = (posX + offset)
			txt_def.pos.y = (posY + offset_y)
		txt_def.bg = {}			
			txt_def.bg.visible = false
		txt_def.text = {}
			txt_def.text.font = "Candara"
			txt_def.text.size = fontsize
			txt_def.text.red = 255
			txt_def.text.green = 255
			txt_def.text.blue = 255
			txt_def.text.alpha = 200
		txt_def.flags = {}
			txt_def.flags.draggable = false
			txt_def.flags.italic = true
			txt_def.flags.bold = true
			txt_def.flags.right = false
		txt_def.text.stroke = {}
			txt_def.text.stroke.width = 2
			txt_def.text.stroke.alpha = 200
	
	subtitle = texts.new(sub, txt_def)
	return subtitle
end