-- NODE WAYPOINT
nw = {
	return_form = function(name, color)
		if type(name) == "table" then
			return "size[3.51,2.72]" ..
			"box[-0.3,-0.32;3.92,0.52;#04FF00]" ..
			"label[-0.22,-0.32;Waypoint]" ..
			"field[0.08,0.91;3.96,0.87;name;Waypoint name;"..name.waypoint.."]" ..
			"field[0.08,1.95;3.96,0.87;color;Waypoint color (HEX);"..tostring(name.color).."]" ..
			"image_button_exit[-0.22,2.45;1.97,0.74;blank.png;set;Set]" ..
			"image_button_exit[1.78,2.45;1.97,0.74;blank.png;cancel;Cancel]"
		end
		return "size[3.51,2.72]" ..
		"box[-0.3,-0.32;3.92,0.52;#04FF00]" ..
		"label[-0.22,-0.32;Waypoint]" ..
		"field[0.08,0.91;3.96,0.87;name;Waypoint name;"..name.."]" ..
		"field[0.08,1.95;3.96,0.87;color;Waypoint color (HEX);"..color.."]" ..
		"image_button_exit[-0.22,2.45;1.97,0.74;blank.png;set;Set]" ..
		"image_button_exit[1.78,2.45;1.97,0.74;blank.png;cancel;Cancel]"
	end,
	tmp_huds = {},
	latest_pos = {},
}

local storage = core.get_mod_storage("node_waypoint")

do
	local strs = storage:get_string("waypoints")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					[1] = {pos = vector.new(), waypoint = "This", color = "#FFFFFF"}
				}
		local sr = core.serialize(newtable)
		storage:set_string("waypoints", sr)
	end
end

function nw.get_data()
	return core.deserialize(storage:get_string("waypoints"))
end
function nw.save_data(data)
	return storage:set_string("waypoints", core.serialize(data))
end

function nw.add_new_waypoint(def)
	def.pos = def.pos or vector.new()
	def.color = def.color or "white"
	def.waypoint = def.waypoint or "Waypoint"
	local data = nw.get_data()
	data[core.pos_to_string(def.pos)] = def
	nw.save_data(data)
end

function nw.get_waypoint(pos)
	local data = nw.get_data()
	if data[pos] then
		return data[pos]
	end
	return {waypoint = "Set it/Configuralo", pos = core.string_to_pos(pos), color = "#FFFFFF"}
end

local function transform(hex)
	hex = hex:gsub("#","")
	return tonumber(hex, 16) or 0xFFFFFF
end

core.register_globalstep(function(dt)
	for _, p in pairs(core.get_connected_players()) do
		local pos = p:get_pos()
		if pos then
			local data = nw.get_data()
			for _, waypoint in pairs(data) do
				if vector.distance(waypoint.pos, pos) <= 30 then
					if nw.tmp_huds[p:get_player_name()] and (not nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)]) then
						if core.get_node(waypoint.pos).name == "node_waypoint:waypoint" then
							nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)] = p:hud_add({
								hud_elem_type = "waypoint",
								number = transform(waypoint.color),
								name = waypoint.waypoint,
								text = nil,
								world_pos = waypoint.pos,
								precision = 0,
							})
						else
							if nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)] then
								p:hud_remove(nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)])
								nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)] = nil
							end
						end
					else
						if nw.tmp_huds[p:get_player_name()] then
							p:hud_change(nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)], "name", waypoint.waypoint)
							p:hud_change(nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)], "number", transform(waypoint.color))
						end
					end
				else
					if nw.tmp_huds[p:get_player_name()] and nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)] then
						p:hud_remove(nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)])
						nw.tmp_huds[p:get_player_name()][core.pos_to_string(waypoint.pos)] = nil
					end
				end
			end
		end
	end
end)

minetest.register_node("node_waypoint:waypoint", {
	description = "Waypoint/Punto de mapa",
	tiles = {"node_waypoint.lua.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, _, player)
		core.show_formspec(player:get_player_name(), "waypoint:settings", nw.return_form(nw.get_waypoint(core.pos_to_string(pos))))
		nw.latest_pos[player:get_player_name()] = pos
	end,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		core.show_formspec(placer:get_player_name(), "waypoint:settings", nw.return_form(nw.get_waypoint(core.pos_to_string(pos))))
		nw.latest_pos[placer:get_player_name()] = pos
	end,
	on_destruct = function(pos)
		local data = nw.get_data()
		data[core.pos_to_string(pos)] = nil
		nw.save_data(data)
		for _, p in pairs(core.get_connected_players()) do
			for pname, d in pairs(nw.tmp_huds) do
				for poss, hud in pairs(d) do
					if poss == core.pos_to_string(pos) then
						p:hud_remove(hud)
					end
				end
			end
		end
	end,
})


minetest.register_on_joinplayer(function(p)
	nw.tmp_huds[p:get_player_name()] = {}
end)

core.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "waypoint:settings" then
		if fields.set then
			local name = fields.name
			local colr = fields.color
			local poss = nw.latest_pos[player:get_player_name()]
			if name and colr and poss then
				local data_to_save = {waypoint = name, color = colr, pos = poss}
				local data = nw.get_data()
				data[core.pos_to_string(poss)] = data_to_save
				nw.save_data(data)
				core.chat_send_player(player:get_player_name(), "[WayPoint] Done! / Listo!")
			end
		end
	end
end)

minetest.register_craft({
	output = "node_waypoint:waypoint",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "default:diamond", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})









