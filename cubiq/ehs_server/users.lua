
local S = ehs.S
ehs.vanish = {}
local storage = ehs.storage
local function ReturnFormspec(pname, current_nametag_color)
	return "formspec_version[6]" ..
	"size[8,9.3]" ..
	"label[0.2,0.4;"..S("Player Properties").."]" ..
	"field[0.2,1.2;7.6,1;name3;"..S("Your Player Name")..";Cambiar de nombre deshabilitado]" ..
	"box[0.2,0.6;7.6,0.2;#000000]" ..
	"label[6,0.4;Jugador]" ..
	"field[0.2,2.6;7.6,1;nametag_color;"..S("You Player Name color (Advanced)")..";"..current_nametag_color.."]" ..
	"image_button[0.2,4.2;1.6,0.8;ehs_color_pink.png;nametag_pink;"..S("Pink")..";false;true]" ..
	"image_button[2.2,4.2;1.6,0.8;ehs_color_red.png;nametag_red;"..S("Red")..";false;true]" ..
	"image_button[4.2,4.2;1.6,0.8;ehs_color_blue.png;nametag_blue;"..S("Blue")..";false;true]" ..
	"image_button[6.2,4.2;1.6,0.8;ehs_color_black.png;nametag_black;"..S("Black")..";false;true]" ..
	"label[2.3,3.9;"..S("Your Player Name color").."]" ..
	"box[0.2,5.9;7.6,0.2;#000000]" ..
	"button_exit[0.2,6.2;7.6,0.9;apply;"..S("Apply and Exit").."]" ..
	"button[0.2,7.2;7.6,0.9;apply;"..S("Apply").."]" ..
	"button[0.2,8.2;7.6,0.9;discard;"..S("Reset everything").."]" ..
	"button_exit[0.2,5.1;7.6,0.7;reset_nametag;"..S("Discard and Exit").."]"
end
--------
do
	local strs = storage:get_string("color")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					__null = "#00F"
				}
		local sr = core.serialize(newtable)
		storage:set_string("color", sr)
	end
	strs = storage:get_string("playername")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					__null = "ae"
				}
		local sr = core.serialize(newtable)
		storage:set_string("playername", sr)
	end
	strs = storage:get_string("saved_names")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					["ae"] = "__null"
				}
		local sr = core.serialize(newtable)
		storage:set_string("saved_names", sr)
	end
end
--------
-- API
function GetName(player)
	local name = Name(player)
	--local ObjectRef = Player(player)
	local playername_data = core.deserialize(storage:get_string("playername"))
	local playername = playername_data[name] or name
	return playername
end
function GetColor(player)
	local name = Name(player)
	--local ObjectRef = Player(player)
	local nametags_data = core.deserialize(storage:get_string("color"))
	local color = nametags_data[name] or "#FFFFFF"
	return color
end
--
---------
minetest.register_on_joinplayer(function(ObjectRef, last_login)
	-- name tag color
	local nametags_data = core.deserialize(storage:get_string("color"))
	local color = nametags_data[ObjectRef:get_player_name()] or "#FFFFFF"
	-- player name
	local playername_data = core.deserialize(storage:get_string("playername"))
	local playername = playername_data[ObjectRef:get_player_name()] or ObjectRef:get_player_name()
	-- Apply
	--local obj = core.add_entity(ObjectRef:get_pos(), "ehs_server:nametag")
	--obj:set_attach(ObjectRef, "", {x=0, y=16, z=0}, {x=0, y=0, z=0}, true)
    if discord then
            discord.send("```diff\n++ => "..ObjectRef:get_player_name().." has joined the server```")
    end
	local str = "=> "..core.colorize(color, ObjectRef:get_player_name()).." has joined the server"
	core.chat_send_all(str)
	if ehs_net then
		ehs_net.send("<= "..ObjectRef:get_player_name().." has joined the server")
	end
	--player_entities[Name(ObjectRef)] = obj
end)

function TransformRGB(colour)
	if type(colour) == "table" and minetest.rgba then
		return minetest.rgba(colour.r, colour.g, colour.b, colour.a)
	elseif type(colour) == "string" then
		return colour
	else
		return "#ffffff"
	end
end

function ChatSendAll(msg, name)
	for _, p in pairs(core.get_connected_players()) do
		local name2 = Name(p)
		local priv = core.get_player_privs(name2)
		core.chat_send_player(name2, msg)
	end
end

function RGBToHEX(t)
	return string.format("#%02x%02x%02x", t.r, t.g, t.b)
end

minetest.register_on_chat_message(function(name, message)
    if core.get_player_privs(name) and core.get_player_privs(name).shout then
        local ObjectRef = Player(name)
        -- name tag color
        local nametags_data = core.deserialize(storage:get_string("color"))
        local color = nametags_data[ObjectRef:get_player_name()] or "#FFFFFF"
        -- player name
        local playername_data = core.deserialize(storage:get_string("playername"))
        local playername = ObjectRef:get_player_name()
        -- Get roles
        local info = ranks.get_rank(name)--roles.get_max_role(name)
        local Role = "["..core.colorize(RGBToHEX(xp_redo.get_rank(xp_redo.get_xp(name)).color), xp_redo.get_rank(xp_redo.get_xp(name)).name)
        local rstr = ""
        if info ~= nil then
            if type(info) == "table" then
                local defn = ranks.get_def(info.normal)
                if defn and defn.prefix then
                    if info.normal ~= "miembro" then
                        Role = "] "..core.colorize(TransformRGB(defn.colour), defn.prefix).." "
                        rstr = defn.prefix
                    end
                end
                local def = ranks.get_def(info.staff)
                if def and def.prefix then
                    Role = core.colorize(TransformRGB(def.colour), def.prefix).." "
                    rstr = def.prefix
                end
            else
                local def = ranks.get_def(info)
                if def and def.prefix and info ~= "miembro" then
                    Role = "] "..core.colorize(TransformRGB(def.colour), def.prefix).." "
                    rstr = def.prefix
                else
                    Role = Role.."] "
                end
            end
        end
        -- Get Fanction
        text_to_override = ""
        local faction = faction.get_faction(name)
        if faction and faction.name then
            text_to_override = core.colorize(faction.config.color, "["..faction.name.."] ")
        end
        -- Apply
        local colorised_nametag = core.colorize(color, "<"..playername..">")
        local text = Role..text_to_override..colorised_nametag.." "..message
        if core.get_player_by_name(name) and message:len() <= 22 then
            physical_msg.do_msg(core.get_player_by_name(name), message)
        end
        ChatSendAll(text, name)
        if discord then
            discord.send("```md\n <" .. name .. ">  " .. message .. "```")
            if ehs_net then
                ehs_net.send("<"..name.."> " .. message)
            end
        end
    end
	return true
end)

--[[
```md
<wolffiekitty2> or banned her```

```diff
*** <Zaxoo> times out.```--]]
minetest.register_on_newplayer(function(ObjectRef)
	-- Get data
	local nametags_data = core.deserialize(storage:get_string("color"))
	local playername_data = core.deserialize(storage:get_string("playername"))
	local saved_names_data = core.deserialize(storage:get_string("saved_names"))
	-- Set data
	nametags_data[ObjectRef:get_player_name()] = "#FFFFFF"
	playername_data[ObjectRef:get_player_name()] = ObjectRef:get_player_name()
	saved_names_data[ObjectRef:get_player_name()] = ObjectRef:get_player_name()
	-- Write
	local sndata = core.serialize(nametags_data)
	local spdata = core.serialize(playername_data)
	local spdata = core.serialize(saved_names_data)
	storage:set_string("color", sndata)
	storage:set_string("playername", spdata)
	storage:set_string("saved_names", spdata)
end)

core.register_chatcommand("color", {
	params = "<color>",
	description = S("Modify your nametag color"),
	func = function(name, param)
		local c = param:split(" ")
		if (c and c[1]) and name then
			local nametags_data = core.deserialize(ehs.storage:get_string("color"))
			if c[1] ~= nametags_data[name] then
				nametags_data[name] = c[1]
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(name, core.colorize("#00FFFF", S("You changed your user color to: "))..core.colorize(c[1], c[1]))
			end
		end
	end,
})
core.register_chatcommand("nametag", {
	params = "<color>",
	description = S("Modify your nametag color"),
	func = function(name, param)
		local c = param:split(" ")
		if (c and c[1]) and name then
			local nametags_data = core.deserialize(ehs.storage:get_string("color"))
			if c[1] ~= nametags_data[name] then
				nametags_data[name] = c[1]
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(name, core.colorize("#00FFFF", S("You changed your user color to: "))..core.colorize(c[1], c[1]))
			end
		end
	end,
})
core.register_chatcommand("vanish", {
	params = "",
	privs = {ban=true},
	description = S("Invisible"),
	func = function(name, param)
		if not ehs.vanish[name] then
			ehs.vanish[name] = true
			return true, "[eServ] Done! / Listo!"
		else
			--return true, "[eServ] Already invisible / Ya estas invisible"
			if ehs.vanish[name] then
				ehs.vanish[name] = nil
				return true, "[eServ] Done! / Listo! (<=> rev)"
			end
		end
	end,
})
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "p:p" then
		if fields.name then
			local playername_data = core.deserialize(storage:get_string("playername"))
			local saved_names_data = core.deserialize(storage:get_string("saved_names"))
			if fields.name ~= playername_data[player:get_player_name()] and ((not saved_names_data[fields.name]) or (saved_names_data[fields.name] == Name(player))) then
				playername_data[player:get_player_name()] = fields.name
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("You changed your username to:").." "..fields.name))
				local spdata = core.serialize(playername_data)
				storage:set_string("playername", spdata)
			elseif fields.name ~= playername_data[player:get_player_name()] then
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("Failed to change name (Nametag already on use)")))
			end
		end
		if fields.nametag_color and not (fields.nametag_pink or fields.nametag_red or fields.nametag_blue or fields.nametag_black) then
			local nametags_data = core.deserialize(storage:get_string("color"))
			if fields.nametag_color ~= nametags_data[player:get_player_name()] then
				nametags_data[player:get_player_name()] = fields.nametag_color
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("You changed your user color to:").." "..fields.nametag_color))
			end
		end
		-- colors
		if fields.nametag_pink then
			local nametags_data = core.deserialize(storage:get_string("color"))
			if "pink" ~= nametags_data[player:get_player_name()] then
				nametags_data[player:get_player_name()] = "pink"
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("You changed your user color to: Pink")))
			end
		end
		if fields.nametag_red then
			local nametags_data = core.deserialize(storage:get_string("color"))
			if "red" ~= nametags_data[player:get_player_name()] then
				nametags_data[player:get_player_name()] = "red"
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("You changed your user color to: Red")))
			end
		end
		if fields.nametag_blue then
			local nametags_data = core.deserialize(storage:get_string("color"))
			if "blue" ~= nametags_data[player:get_player_name()] then
				nametags_data[player:get_player_name()] = "blue"
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("You changed your user color to: Blue")))
			end
		end
		if fields.nametag_black then
			local nametags_data = core.deserialize(storage:get_string("color"))
			if "black" ~= nametags_data[player:get_player_name()] then
				nametags_data[player:get_player_name()] = "black"
				local sndata = core.serialize(nametags_data)
				storage:set_string("color", sndata)
				core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("You changed your user color to: Black")))
			end
		end
		if fields.apply then
			local nametags_data = core.deserialize(storage:get_string("color"))
			local color = nametags_data[player:get_player_name()] or "#FFFFFF"
			-- player name
			local playername_data = core.deserialize(storage:get_string("playername"))
			local playername = playername_data[player:get_player_name()] or player:get_player_name()
			-- Apply
			--player:set_nametag_attributes({
			--	text = playername,
			--	color = color,
			--})
				--:set_nametag_attributes({
				--	text = playername,
				--	color = color,
				--})
			core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("Applied !")))
		end
		if fields.discard then
			local playername_data = core.deserialize(storage:get_string("playername"))
			playername_data[player:get_player_name()] = Name(player)
			local spdata = core.serialize(playername_data)
			storage:set_string("playername", spdata)
			
			local nametags_data = core.deserialize(storage:get_string("color"))
			nametags_data[player:get_player_name()] = "white"
			local sndata = core.serialize(nametags_data)
			storage:set_string("color", sndata)
			
				--p:set_properties({nametag=Role..core.colorize(color, name)})
			core.chat_send_player(player:get_player_name(), core.colorize("#00FFFF", S("Your info have been reset!")))
		end
	end
end)
minetest.register_on_leaveplayer(function(player, t)
	-- name tag color
	local nametags_data = core.deserialize(storage:get_string("color"))
	local color = nametags_data[player:get_player_name()] or "#FFFFFF"
	local s = ""
	if t then s = " (timed out?)" end
    if discord then
            discord.send("```diff\n-- <= "..player:get_player_name().." left the server"..s.."```")
            
    end
	if ehs_net then
		ehs_net.send("<= "..player:get_player_name().." left the server"..s)
	end
	local str = "<= "..core.colorize(color, player:get_player_name()).." left the server"..s
	core.chat_send_all(str)
	ehs.vanish[player:get_player_name()] = nil
end)

local clock = 0

core.register_globalstep(function(dt)
	local playername_data = core.deserialize(storage:get_string("playername"))
	local nametags_data = core.deserialize(storage:get_string("color"))
	
	-- Clock section
	clock = clock + dt
	if clock >= 120 then
		local count = #core.get_connected_players() or 0
		local names = {}
		for _,p in pairs(core.get_connected_players()) do table.insert(names,p:get_player_name()) end
		core.chat_send_all(core.colorize("#00BA00", "[Server] "..tostring(count).." users connected, players: "..table.concat(names, ", ")))
		clock = 0
	end
		
	for _, p in pairs(core.get_connected_players()) do
		--p:set_nametag_attributes({text=nil,color=nil})
		local name = Name(p)
		--
			-- roles
			local role, rcolor = roles.get_max_role(name)
			-- color
			local color = nametags_data[p:get_player_name()] or "#FFFFFF"
			-- player name
			local playername = playername_data[p:get_player_name()] or p:get_player_name()
			local Role = core.colorize(RGBToHEX(xp_redo.get_rank(xp_redo.get_xp(name)).color), xp_redo.get_rank(xp_redo.get_xp(name)).name)
			local info = ranks.get_rank(name)--roles.get_max_role(name)
			local rstr = ""
			if info ~= nil then
				if type(info) == "table" then
					local defn = ranks.get_def(info.normal)
					if defn and defn.prefix then
						if info.normal ~= "miembro" then
							Role = "-"..core.colorize(TransformRGB(defn.colour), defn.prefix)
							rstr = defn.prefix
						end
					end
					local def = ranks.get_def(info.staff)
					if def and def.prefix then
						Role = core.colorize(TransformRGB(def.colour), def.prefix)
						rstr = def.prefix
					end
				else
					local def = ranks.get_def(info)
					if def and def.prefix and info ~= "miembro" then
						Role = "-"..core.colorize(TransformRGB(def.colour), def.prefix)
						rstr = def.prefix
					else
						Role = Role
					end
				end
			end
			
			-- AFK
			
			local afkis = ""
			if afk.is_afk(p) then
				afkis = core.colorize("#FFC06E", "[AFK] ")
			end
			
			
			
			--local obj = core.add_entity(p:get_pos(), "ehs_server:nametag")
			--obj:set_attach(p, "", {x=0, y=16, z=0}, {x=0, y=0, z=0}, true)
			--p:set_nametag_attributes({
			--	text = Role..core.colorize(color, playername),
--				color = color,
			--})
			if not ehs.vanish[name] then
				if ehs.vanish[name] ~= false then
					p:set_properties({
						nametag = afkis..Role.." "..core.colorize(color, name),
						nametag_bgcolor = {a=0},
						nametag_color = {a=255},
						pointable = true,
						visual_size = vector.new(1,1,1)
					})
					ehs.vanish[name] = false
				end
			else
				--if ehs.vanish[name] ~= false then
					p:set_properties({
						nametag = " ",
						nametag_color = {a=0},
						nametag_bgcolor = {a=0},
						pointable = false,
						visual_size = vector.new(0,0,0)
					})
				--	ehs.vanish[name] = false
				--end
			end
			--player_entities[name] = obj
		--end
	end
end)

minetest.register_on_mods_loaded(function()
	local function empty_func() end
	minetest.send_join_message = empty_func
	minetest.send_leave_message = empty_func
end)
