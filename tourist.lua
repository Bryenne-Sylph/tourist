--[[
    Copyright © 2025/2026, Bryenne - Sylph server [DragonGuard]
    All rights reserved.
]]

-- Windower Add On Mandatory fields
_addon.name = 'Tourist'
_addon.author = 'Bryenne'
_addon.version = '1.5 Release'
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
subs = require('subtitles')

function init_tourist()
	init = nil
	logging_out = nil
	zone_id = 999
	chat = windower.add_to_chat
	loading_img = nil
	local f_type = 1
	local test = false
	local entered_from = nil
	local mog_house = nil
	local zoning_data = nil
	local subtitle = nil
	local lastfound = false
	local player_homepoint = nil

	-- check if we are logged in or do nothing
	w_info = windower.ffxi.get_info()
	if not w_info.logged_in then return end
	
	-- check if the player has loaded yet or do nothing
	player_id = windower.ffxi.get_player()
	if not player_id then return end

	-- Resolution settngs
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
	defaults.fadein = false
	defaults.sdmask = false
	defaults.homepoint = 0
	defaults.static_file = "nozone"

	settings = config.load(defaults)
	config.save(settings)
	
	-- default variables
	small = settings.small
	static = settings.static
	fadein = settings.fadein
	sdmask = settings.sdmask
	static_file = defaults.static_file
	SetSize()
	-- we're done initializing
	init = true
end

-- [LOAD INITIALIZATION] ------------------------------------------------>
windower.register_event('login', 'logout', 'load', init_tourist)

-- ADD ON COMMANDS HANDLING] --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
windower.register_event('addon command', function(command, ...)
    command = command and command:lower()
    local params = {...}
	-- [TEST AN IMAGE] --------------------------------------------->
	if command == 'test' then
		test = true
		if not params[1] then
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Tourist is exiting test mode ::')
			test = false
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
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Static Image mode off')
		else
			static = true
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Static Image mode on')
		end
		settings.static = static
		settings:save(player_name)
	-- [CHANGE SIZE] ----------------------------------------------->
	elseif command == 'small' then
		if small then
			small = false
			SetSize()
			chat(217, ':: [ TOURIST ] \31\200\31\59:: High resolution mode on')
		else
			small = true
			SetSize()
			chat(217, ':: [ TOURIST ] \31\200\31\59:: High resolution mode off')
		end
		settings.small = small
		settings:save(player_name)
	-- [FADE IN TOGGLE] -------------------------------------------->
	elseif command == 'fadein' then
		if fadein then
			fadein = false
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Fade in disabled')
		else
			fadein = true
			SetSize()
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Fade in enabled')
		end
		settings.fadein = fadein
		settings:save(player_name)
	-- [SHIHU-DANHU MASK TOGGLE] ----------------------------------->
	elseif command == 'sd' or command == 'sdmask' then
		if sdmask then
			sdmask = false
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Showing loading screen for actual zone Shihi-Danhu teleports you to.')
		else
			sdmask = true
			chat(217, ':: [ TOURIST ] \31\200\31\59:: Masking Shihu-Danhu`s teleport destination. You are very brave!')
		end
		settings.sdmask = sdmask
		settings:save(player_name)
	-- [SHOW HELP] ------------------------------------------------->
    else
		chat(217, '+---------------------------------------------------------------------------------------------------------------------------------+')
        chat(217, '//tourist help  :  \31\200\31\206Shows this help message')
		chat(217, '//tourist small  :  \31\200\31\206Toggles between using large or small Loading images')
		chat(217, '//tourist fadein  :  \31\200\31\206Toggles between fading in the Loading image or not; (default is off)')
		chat(217, '//tourist sd  :  \31\200\31\206Toggles between masking \31\200\31\213Shihu-Danhu`s \31\200\31\206random telepport or not; (default is off)')
		chat(217, '//tourist static  :  \31\200\31\206Toggles between static image on/off; turning this on will load default image every time')
		chat(217, '//tourist test [zone ID]  :  \31\200\31\206Test image (for example: \31\200\31\208"//tourist test 234"\31\200\31\206). Leave blank to remove')
		chat(217, '+---------------------------------------------------------------------------------------------------------------------------------+')
    end
end)

-- [OUTGOING CHUNKS] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
windower.register_event('outgoing chunk', function(id, data)

	-- [ZONELINES] -------------------------------------------------+
	if id == 0x05E then
		zonereq = packets.parse('outgoing', data)
		-- -- look up where we are exiting if we are in a mog house
		if mog_house then
			mog_house = false
			w_info = windower.ffxi.get_info()
			zone_id = w_info.zone
			get_mog_exit()
		else
			-- if not look up which zoneline we are crossing
			zoneline = (zonereq['Zone Line'])
			Find_ZoneLine(zoneline)
		end
	-- [EXCEPTIONS LOGIC] --------------------------------------------------------------------------------------------------------+++
	elseif id == 0x05B then
		local local_packet = packets.parse('outgoing', data)
		local menu_id = (local_packet['Menu ID'])
		local target_index = (local_packet['Target Index'])
		local menu_option = (local_packet['Option Index'])
		local npc_name = string.lower(windower.ffxi.get_mob_by_index(target_index).name)
		local CurZone = windower.ffxi.get_info().zone
		
		-- check if player is changing his homepoint
		if menu_id == 8700 and menu_option == 1 then
			player_homepoint = CurZone
			settings.homepoint = player_homepoint
			settings:save(player_name)
		end
		
		-- [ZONE SPECIFIC SUBTITLES] ---------------------------------------+
		if subs[menu_id] then
			-- look for menu ID in table
			local FindZone = subs[menu_id]
			-- look if there is an entry for that menu_id in the current zone (menu_ids often get re-used in multiple locations)
			FindZone = FindZone and FindZone[CurZone]
			-- check if there are multiple options
			if FindZone and not FindZone.zone then
				FindZone = FindZone and FindZone[menu_option]
			end
			-- set lastfound, prevent double actions
			if FindZone and FindZone.zone then
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
		
		-- Create subtitles when warping to a Meeble Burrows Dig Site
		if npc_name == 'burrow investigator' then
				if menu_option == 1 or menu_option == 2 then 
					sub="Meeble Burrows Dig Site"
					Get_Subtitle_Settings(sub)
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
				entered_from = CurZone
			end
		-- [SHIHU-DANHU] -------------------------------------------+
		elseif npc_name == 'shihu-danhu' then
			if sdmask then
				zone_id = 991
			end
		end
		
		-- [SUPPORT FOR PURGONORGO ISLE] ---------------------------+
		-- this is part of Bibiki Bay but since I love this zone it gets its own loading screen
		if CurZone == 3 and menu_id == 0 then
			if windower.ffxi.get_info().time > 400 and windower.ffxi.get_info().time < 540 then
					zone_id = 994
			elseif windower.ffxi.get_info().time > 1160 and windower.ffxi.get_info().time < 1260 then
					zone_id = 994
			else	
					zone_id = 999
			end
		end
			
	-- [DONE ZONING ] ----------------------------------------------+
	elseif id == 0x00C then	
		img_fading = true
		if subtitle then
			subtitle:hide()
			subtitle = nil
		end
		-- START FADE OUT 
		f_type = 1
		refresh_image()
		lastfound = false
	-- prevent loading screen when logging out (0x0E7)
	elseif id == 0x0E7 then
		logging_out = true
	end
end)

-- [INCOMING CHUNKS] ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
windower.register_event('incoming chunk', function(id, data)

	-- [ZONING] ----------------------------------------------------+
	if id == 0x00B then
        local packet = packets.parse('incoming', data)
        zoning_data = packet['IP']..'_'..packet['Port']

		if (zone_id == 0 or zone_id == 998) then
			mog_house = true
		else
			-- zone_ids above 900 are special case exceptions handled in code, in all other situations, the zone_id can just be read from the packet
			-- if zone_id = 999 it should be replaced with the packet value as well
			if (zone_id < 900 or zone_id == 999) then
				zone_id = packet['Port'] % 1000
            end
            mog_house = false
		end

		-- Show UI if it is not already visible
        if not loading_img then
            ShowUI()
			if fadein then
				f_type = 0
				img_fading = true
				refresh_image()
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
		if fadein and not test then 
			img_def.color.alpha = 10
		else
			img_def.color.alpha = 200
		end
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

-- [ZONELINES] -----------------------------------------------------+
function Find_ZoneLine(id) 
	-- look through the table below to see if the zoneline_id matches a known Zone Line, this is only used to determine zoning into Mog Houses
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

function NotFound()
	-- reset base variables to prevent any fuck ups
	zone_id = 999
	lastfound = false
	destination = nil
	subtitle = nil
	CurZone = nil
end

-- [IMAGE FUNCTIONS FOR FADING] ------------------------------------------------------------------>
function refresh_image()
	if img_fading then
		-- fade out on a fixed interval
		if (loading_img and f_type == 1) then
			-- fade out
			fade(1)
			coroutine.schedule(refresh_image, 0.010)
		elseif (loading_img and f_type == 0) then
			-- fade in
			fade(0)
			coroutine.schedule(refresh_image, 0.005)
		end
	end
end

function fade(f_type)
	-- substract a value from the alpha value every time this is called (1=slow fade, 10=very fast fade)
	if f_type == 1 then
		do_alpha(loading_img:alpha() - 4)
	elseif f_type == 0 then
		do_alpha(loading_img:alpha() + 4)
	end
end

function do_alpha(alpha)
	if f_type == 1 then
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
		end
	elseif f_type == 0 then
		if (alpha <= 200) then
			-- update the image's alpha value
			loading_img:alpha(alpha)
		else
			-- fade in is complete
			img_fading = false
		end
	end
end

-- [TEXT SETTINGS FOR SUBTITLES] ----------------------------------------------------------------->
function Get_Subtitle_Settings(sub)
	-- settings for subtitles if we have one
	local offset = 0
	local offset_y = 0
	local fontsize = 22
	
	if small then
		-- center text with small Loading image
		offset = (248 - ((string.len(sub)*9)/2))
		fontsize = 14
		offset_y = 280
	else
		-- center text with large Loading image
		offset = (504 - ((string.len(sub)*15)/2))
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