-- Factions
faction = {
	get_formspec = function(fname,fcolor,fplayers,fadmins,faoip,pname)
		return "size[12.41,9.82]" ..
		"label[5.14,-0.24;Clan Settings]" ..
		"box[-0.14,0.2;12.48,0.17;#000000]" ..
		"field[0.16,1.17;6.52,0.69;faction_name;Clan name;"..fname.."]" ..
		"field[0.16,2.04;6.52,0.69;faction_color;Clan color (English);"..fcolor.."]" ..
		"textlist[-0.14,2.62;12.48,2.34;n1;"..table.concat(fplayers,",")..";1;false]" ..
		"label[-0.14,2.19;Players List]" ..
		"box[-0.14,5.14;12.48,0.17;#000000]" ..
		"image_button[-0.14,5.48;6.53,0.74;blank.png;set_pos;Set clan pos here!]" ..
		"checkbox[-0.14,8.0;allow_others_invite_player;Allow players invite other players;"..tostring(faoip).."]" ..
		"textlist[-0.14,6.52;12.48,1.65;n2;"..table.concat(fadmins,",")..";1;false]" ..
		"label[-0.14,6.09;Admins]" ..
		"image_button[-0.14,8.69;3.41,0.83;blank.png;apply;Apply]" ..
		"image_button[3.06,8.69;3.33,0.83;blank.png;discard;Discard]" ..
		"image_button_exit[-0.14,9.38;3.41,0.83;blank.png;apply;Apply and Exit]" ..
		"image_button_exit[3.06,9.38;3.33,0.83;blank.png;discard;Discard and Exit]" ..
		"image_button[6.42,8.69;3.17,0.83;blank.png;invite;Invite player]" ..
		"field[6.72,1.17;6.12,1.56;player_name;Player name;"..pname.."]" ..
		"image_button[6.42,9.38;3.17,0.83;blank.png;kick_player;Kick Player]" ..
		"image_button[6.42,5.48;6.13,0.74;blank.png;go_to;Go to clan pos]" ..
		"image_button[9.38,8.69;3.17,0.83;blank.png;rmv_admin;Remove admin]" ..
		"image_button[9.38,9.38;3.17,0.83;blank.png;add_admin;Add admin]"
	end,
	queued_invites = {},
	faction_to_unite_with = {}
}

--[["formspec_version[6]" ..
		"size[9,12.2]" ..
		"label[3.3,0.3;Faction Settings]" ..
		"box[0.2,0.6;8.6,0.2;#000000]" ..
		"field[0.2,1.4;8.6,0.6;faction_name;Faction name;"..fname.."]" ..
		"field[0.2,2.4;8.6,0.6;faction_color;Faction color (English);"..fcolor.."]" ..
		"textlist[0.2,3.4;8.6,2.7;n1;"..table.concat(fplayers,",")..";1;false]" ..
		"label[0.2,3.2;Players List]" ..
		"box[0.2,6.3;8.6,0.2;#000000]" ..
		"button[0.2,6.7;8.6,0.7;set_pos;Setpos here!]" ..
		"checkbox[0.2,10.1;allow_others_invite_player;Allow players invite other players;"..tostring(faoip).."]" ..
		"textlist[0.2,7.9;8.6,1.9;n2;"..table.concat(fadmins,",")..";1;false]" ..
		"label[0.2,7.7;Admins]" ..
		"button[0.2,10.4;4.3,0.8;apply;Apply]" ..
		"button[4.5,10.4;4.3,0.8;discard;Discard]" ..
		"button_exit[0.2,11.2;4.3,0.8;apply;Apply and Exit]" ..
		"button_exit[4.5,11.2;4.3,0.8;discard;Discard and Exit]"--]]

local storage = ehs.storage
local xys = vector.new()

do
	local strs = storage:get_string("factions_data")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
				e8f7a1d = {name="crispulo",players={maosedong=true},config={pos={xys},allow_others_invite_player=true,color="#00000"},admins={deducto=true}}
			}
		local sr = core.serialize(newtable)
		storage:set_string("factions_data", sr)
	end
	local strs = storage:get_string("factions_players")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
				__null = "e8f7a1d",
			}
		local sr = core.serialize(newtable)
		storage:set_string("factions_players", sr)
	end
	local strs = storage:get_string("factions_names")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
				["crispulo"] = "e8f7a1d",
			}
		local sr = core.serialize(newtable)
		storage:set_string("factions_names", sr)
	end
end

-- Reallocate allies

function check_vector(v)
	return (v ~= nil) and (v.x ~= nil) and (v.y ~= nil) and (v.z ~= nil)
end

do
	local fids = core.deserialize(storage:get_string("factions_data"))
	for id, data in pairs(fids) do
		if not data.allies then
			fids[id].allies = {} -- allies mode
			core.log("action", "Perform EHS Clan v0.5 to v1.0, making allies for: "..id)
		end
		if not check_vector(data.config.pos) then
			fids[id].config.pos = {x=0,y=0,z=0}
			core.log("action", "Fixing unknown pos for clan: "..id)
		end
	end
	core.log("action", "ReCheck and saving data....")
	storage:set_string("factions_data", core.serialize(fids))
end

-- We will make EISHU great again

function faction.get_faction_data(id_or_name)
	local fnames = core.deserialize(storage:get_string("factions_names"))
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fnames[id_or_name] then
		return fids[fnames[id_or_name]]
	elseif fids[id_or_name] then
		return fids[id_or_name]
	end
end

function faction.get_faction(name)
	--data
	local fnames = core.deserialize(storage:get_string("factions_players"))
	local fids = core.deserialize(storage:get_string("factions_data"))
	local player = Player(name)
	local name = Name(name)
	--find
	if fnames[name] then
		local fdata = fids[fnames[name]]
		if fdata then
			return fdata
		end
	end
end

function faction.get_faction_id_from_name(name)
	local fnames = core.deserialize(storage:get_string("factions_names"))
	if fnames[name] then
		return fnames[name]
	else
		return nil, ehs.S("Theres no clan with that name: @1, from getting clan ID", name)
	end
end

function faction.get_faction_name_from_id(id)
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fids[id] then
		return fids[id].name
	else
		return nil, ehs.S("Failure to get name of the clan, internal error.")
	end
end



function faction.get_faction_from_pos(pos)
	local fids = core.deserialize(storage:get_string("factions_data"))
	--print(pos)
	for id, data in pairs(fids) do
		if data.config.pos and check_vector(data.config.pos) then
			if vector.distance(pos, data.config.pos) <= 30 then
				return id, data
			end
		end
	end
	return "", {}
end

function faction.add_player(id, name)
	--data
	local fids = core.deserialize(storage:get_string("factions_data"))
	local fplayers = core.deserialize(storage:get_string("factions_players"))
	if fids[id] then
		if not fids[id].players[name] then
			fids[id].players[name] = true
			fplayers[name] = id
			local sr = core.serialize(fids)
			local sr2 = core.serialize(fplayers)
			storage:set_string("factions_data", sr)
			storage:set_string("factions_players", sr2)
			return true
		else
			return false, ehs.S("Theres already the player in the clan.")
		end
	else
		return false, ehs.S("An internal error happened!")
	end
end

function faction.do_admin(id, name)
	--data
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fids[id] then
		if not fids[id].players[name] then
			return false, ehs.S("Not an player of the clan.")
		else
			fids[id].admins[name] = true
			local sr = core.serialize(fids)
			storage:set_string("factions_data", sr)
			return true
		end
	end
end

function faction.remove_allie(id, fid)
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fids[id] then
		if fids[id].allies[fid] then
			fids[id].allies[fid] = nil
			fids[fid].allies[id] = nil
			for admin in pairs(fids[fid].admins) do
				if admin and Player(admin) then
					core.chat_send_player(admin, ehs.S("@1 broke the alliance between your clan and his clan", faction.get_faction_name_from_id(id)))
				end
			end
			ehs.storage:set_string("factions_data", core.serialize(fids))
			return true, ehs.S("Done.")
		else
			return false, ehs.S("Your clan is not allied with: @1", faction.get_faction_name_from_id(fid))
		end
	end
end

function faction.add_allie(id, fid)
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fids[id] then
		if fids[fid] then
			fids[id].allies[fid] = true
			fids[fid].allies[id] = true
			ehs.storage:set_string("factions_data", core.serialize(fids))
			return true, ehs.S("Done.")
		else
			return false, ehs.S("Unknown Clan")
		end
	end
end

function faction.remove_player(id, name)
	local fids = core.deserialize(storage:get_string("factions_data"))
	local fplayers = core.deserialize(storage:get_string("factions_players"))
	if fids[id] then
		if fids[id].players[name] then
			fids[id].players[name] = nil
			fplayers[name] = nil
			local sr = core.serialize(fids)
			local sr2 = core.serialize(fplayers)
			storage:set_string("factions_data", sr)
			storage:set_string("factions_players", sr2)
			return true, ehs.S("Done.")
		else
			return false, ehs.S("Theres no player of this/that clan.")
		end
	end
end

function faction.remove_admin(id, name)
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fids[id] then
		if not fids[id].admins[name] then
			return false, ehs.S("Not an admin of the clan.")
		else
			fids[id].admins[name] = false
			local sr = core.serialize(fids)
			storage:set_string("factions_data", sr)
			return true
		end
	end
end

function faction.remove_faction(id)
	local fplayers = core.deserialize(storage:get_string("factions_players"))
	local fnames = core.deserialize(storage:get_string("factions_names"))
	local fids = core.deserialize(storage:get_string("factions_data"))
	if not fids[id] then
		return false, ehs.S("That clan does not exist")
	end
	local fname = fids[id].name
	fnames[fname] = nil
	fids[id] = nil
	for player, idR in pairs(fplayers) do
		if idR == id then
			fplayers[player] = nil
		end
	end
	for idd, data in pairs(fids) do
		if data.allies[id] then
			fids[idd].allies[id] = nil
		end
	end
	storage:set_string("factions_data", core.serialize(fids))
	storage:set_string("factions_names", core.serialize(fnames))
	storage:set_string("factions_players", core.serialize(fplayers))
	return true, ehs.S("Done.")
end

function faction.settings(name, id)
	local fids = core.deserialize(storage:get_string("factions_data"))
	if fids[id] then
		-- DATA
		local fname = fids[id].name
		local fadminsRAW = fids[id].admins
		local fplayersRAW = fids[id].players
		local fcolor = fids[id].config.color
		local faoip = fids[id].config.allow_other_players_invite
		-- PROCCESS
		local fplayers = {}
		local fadmins = {}
		for player, bool in pairs(fplayersRAW) do
			if bool then
				table.insert(fplayers, player)
			end
		end
		for admin, bool in pairs(fadminsRAW) do
			if bool then
				table.insert(fadmins, admin)
			end
		end
		-- FORMSPEC
		local fm = faction.get_formspec(fname,fcolor,fplayers,fadmins,faoip,name)
		if fm then
			core.show_formspec(name, "faction:settings", fm)
			return true, ehs.S("Initialized!")
		else
			return false, ehs.S("Failed to get settings, internal error")
		end
	else
		return false, ehs.S("Unknown clan")
	end
end

local C = core.colorize

-- COMMMAMNNDNDNNDDNNDNDNDDND

minetest.register_chatcommand("clan_settings", {
	params = "",
	description = ehs.S("Manage your clan settings"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			local id, inf = faction.get_faction_id_from_name(fdata.name)
			if not id then
				core.chat_send_player(name, C("#00FFFF", inf))
				return
			end
			if fdata.admins[name] then
				local bool, inf = faction.settings(name, id)
				core.chat_send_player(name, C("#00FFFF", inf))
			else
				core.chat_send_player(name, ehs.S("You are not the admin of the clan"))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are not on a clan or theres a internal error")))
		end
	end,
})

minetest.register_chatcommand("clan_list_players", {
	params = "",
	description = ehs.S("Show list of players on a clan or on yours"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if param ~= "" then
				local ifdata, str = faction.get_faction_id_from_name(name)
				local Ifdata = faction.get_faction_data(ifdata)
				if ifdata then
					local players = {}
					for player in pairs(Ifdata.players) do
						table.insert(players, player)
					end
					local admins = {}
					for player in pairs(Ifdata.admins) do
						table.insert(admins, player)
					end
					core.chat_send_player(name, C("#00FFFF", ehs.S("Players: @1", table.concat(players, ", "))))
					core.chat_send_player(name, C("#00FFFF", ehs.S("Admins: @1", table.concat(admins, ", "))))
				else
					--core.chat_send_player(name, C("#00FFFF", ehs.S("Noclanfound.")))
					core.chat_send_player(name, C("#00FFFF", ehs.S(str)))
				end
			else
				local players = {}
				for player in pairs(fdata.players) do
					table.insert(players, player)
				end
				local admins = {}
				for player in pairs(fdata.admins) do
					table.insert(admins, player)
				end
				core.chat_send_player(name, C("#00FFFF", ehs.S("Players: @1", table.concat(players, ", "))))
				core.chat_send_player(name, C("#00FFFF", ehs.S("Admins: @1", table.concat(admins, ", "))))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are not on a clan or theres a internal error")))
		end
	end,
})

minetest.register_chatcommand("clan_invite_player", {
	params = "",
	description = ehs.S("Invite a player to your clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if param ~= "" then
				if fdata.admins[name] or fdata.config.allow_other_players_invite then
					if Player(param) then
						core.chat_send_player(param, C("#00FFFF", ehs.S("You are being invited to:").." "..C(fdata.config.color,fdata.name).." "..ehs.S("clan by:").." "..name))
						faction.queued_invites[param] = faction.get_faction_id_from_name(fdata.name)
					end
				else
					core.chat_send_player(name, C("#00FFFF", ehs.S("You are not the admin")))
				end
			else
				core.chat_send_player(name, C("#00FFFF", ehs.S("Atleast specify what player you want to invite! Must be online to do this")))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are not on a clan or theres a internal error")))
		end
	end,
})

minetest.register_chatcommand("clan_req_allie", {
	params = "",
	description = ehs.S("Request to a clan to be your allie"),
	func = function(name, raw_param)
		local fdata = faction.get_faction(name)
		local param = raw_param:split(" ")[1]
		local requested_fid = faction.get_faction_id_from_name(param)
		if not requested_fid then
			return true, core.chat_send_player(name, C("#00FFFF", "No clan with that name"))
		end
		local rf = faction.get_faction_data(requested_fid)
		if fdata then
			if rf then
				for ID, d in pairs(faction.faction_to_unite_with) do
					if d.to_faction and d.to_faction == requested_fid then
						return true, core.chat_send_player(name, C("#00FFFF", "Theres another clan that sent a invite to this mentioned clan '@1'", param))
					end
				end
				do
					--for sector, data in pairs(rf) do
						--if sector == "admins" then
							for admin in pairs(rf.admins) do
								if Player(admin) then
									core.chat_send_player(admin, C("#00FFFF", ehs.S("@1 is requesting to be your allie", fdata.name)))
									faction.faction_to_unite_with[tostring(math.random(2000))] = {to_faction = requested_fid, invite_from = faction.get_faction_id_from_name(fdata.name), player = name}
								end
							end
						--end
					--end
				end
			else
				core.chat_send_player(name, C("#00FFFF", ehs.S("No clan found")))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are not on a clan or theres a internal error")))
		end
	end,
})

minetest.register_chatcommand("clan_accept_allie", {
	params = "",
	description = ehs.S("Accept allie request"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			for ID, d in pairs(faction.faction_to_unite_with) do
				if faction.get_faction_id_from_name(fdata.name) == d.to_faction then
					faction.add_allie(d.to_faction, d.invite_from)
					if Player(d.player) then
						core.chat_send_player(d.player, C("#00FFFF", "[Clans] "..ehs.S("Request for alliance accepted!")))
					end
					for pname in pairs(fdata.admins) do
						if pname ~= d.player then
							if Player(pname) then
								core.chat_send_player(pname, C("#00FFFF", "[Clans] "..ehs.S("Your clan is now allied with: @1", faction.get_faction_name_from_id(d.to_faction))))
							end
						end
					end
					local data = faction.get_faction_data(d.invite_from)
					if data then
						for pname in pairs(data.admins) do
							if pname ~= d.player then
								if Player(pname) then
									core.chat_send_player(pname, C("#00FFFF", "[Clans] "..ehs.S("Your clan is now allied with: @1", fdata.name)))
								end
							end
						end
					else
						core.chat_send_player(name, C("#FF7474", "[Clans] Attempt to find a unexistent clan on FindACT"))
						core.chat_send_player(name, C("#FF7474", "[Clans] Reporting error...."))
					end
					faction.faction_to_unite_with[ID] = nil
				end
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are not on a clan or theres a internal error")))
		end
	end,
})

minetest.register_chatcommand("clan_decline_invite_player", {
	params = "",
	description = ehs.S("Decline a invite to a clan made by the admin"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if param ~= "" then
				if fdata.admins[name] or fdata.config.allow_other_players_invite then
					if Player(param) then
						--core.chat_send_player(param, C("#00FFFF", ehs.S("You are being invited to:").." "..C(fdata.color,fdata.name).." "..ehs.S("faction by:").." "..name)))
						faction.queued_invites[param] = nil
						core.chat_send_player(param, C("#00FFFF", ehs.S("Declined invite.")))
					end
				end
			else
				core.chat_send_player(name, C("#00FFFF", ehs.S("Atleast specify what player you want to invite! Must be online to do this")))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are not on a clan or theres a internal error")))
		end
	end,
})


minetest.register_chatcommand("clan_remove_admin", {
	params = "",
	description = ehs.S("Remove admin from your clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if param ~= "" then
				if fdata.admins[name] then
					if fdata.admins[param] then
						fdata.admins[param] = nil
						local id, str = faction.get_faction_id_from_name(fdata.name)
						if not id then return true, str end
						local fids = core.deserialize(storage:get_string("factions_data"))
						fids[id] = fdata
						storage:set_string("factions_data", core.serialize(fids))
					end
				else
					core.chat_send_player(name, C("#00FFFF", ehs.S("You are not the admin")))
				end
			else
				core.chat_send_player(name, ehs.S("Atleast specify what player you want to invite! Must be online to do this"))
			end
		else
			core.chat_send_player(name, ehs.S("You are not on a clan or theres a internal error"))
		end
	end,
})

minetest.register_chatcommand("clan_accept", {
	params = "",
	description = ehs.S("Accept an invite"),
	func = function(name, param)
		if faction.queued_invites[name] then
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are now at the clan: @1", faction.get_faction_name_from_id(faction.queued_invites[name]))))
			local bool, inf = faction.add_player(faction.queued_invites[name], name)
			if not bool then
				core.chat_send_player(name, C("#00FFFF", inf))
			end
			faction.queued_invites[name] = nil
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent invited on any clan")))
		end
	end,
})

minetest.register_chatcommand("clan_do_admin", {
	params = "",
	description = ehs.S("Do admin"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata and param ~= "" then
			if fdata.admins[name] then
				--core.chat_send_player(name, C("#00FFFF", ehs.S("You are now at the faction: @1", faction.get_faction_name_from_id(faction.queued_invites[name]))))
				local bool, inf = faction.do_admin(faction.get_faction_id_from_name(fdata.name), param)--faction.add_player(faction.queued_invites[name], name)
				if not bool then
					core.chat_send_player(name, C("#00FFFF", inf))
				end
			else
				core.chat_send_player(name, C("#00FFFF", ehs.S("You are not the admin")))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent in a clan")))
		end
	end,
})

minetest.register_chatcommand("clan_cancel", {
	params = "",
	description = ehs.S("Cancel an invite"),
	func = function(name, param)
		if faction.queued_invites[name] then
			core.chat_send_player(name, C("#00FFFF", ehs.S("You declined @1 invite", faction.get_faction_name_from_id(faction.queued_invites[name]))))
			faction.queued_invites[name] = nil
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent invited on any clan")))
		end
	end,
})

minetest.register_chatcommand("clan_exit", {
	params = "",
	description = ehs.S("Exit from a clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if fdata.players[name] then
				faction.remove_player(faction.get_faction_id_from_name(fdata.name), name)
				core.chat_send_player(name, C("#00FFFF", ehs.S("You are now out from the clan: @1", fdata.name)))
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent in a clan")))
		end
	end,
})

minetest.register_chatcommand("clan_kick", {
	params = "",
	description = ehs.S("Kick a player from a clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if fdata.admins[name] then
				local res, inf = faction.remove_player(faction.get_faction_id_from_name(fdata.name), name)
				if not res then return res, inf end
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent in a clan")))
		end
	end,
})

minetest.register_chatcommand("clan_teleport", {
	params = "",
	description = ehs.S("Teleport to a clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if fdata.config.pos then
				Player(name):set_pos(fdata.config.pos)
			else
				if fdata.admins[name] then
					core.chat_send_player(name, C("#00FFFF", ehs.S("Your clan has no pos, please set on /clan_settings")))
				else
					core.chat_send_player(name, C("#00FFFF", ehs.S("The current clan has no pos")))
				end
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent in a clan")))
		end
	end,
})



minetest.register_chatcommand("clan_make", {
	params = "<clan name>",
	description = ehs.S("Make your own clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			core.chat_send_player(name, C("#00FFFF", ehs.S("You are on a clan")))
		else
			local fname = ""
			if param ~= "" then
				fname = param
			end
			local data = {
				name = fname,
				players = {
					[name] = true
				},
				config = {
					pos = CheckPos(Player(name):get_pos()),
					allow_others_invite_player=false,
					color = GetColor(name),
				},
				admins = {
					[name] = true
				},
				allies = {
					
				}
			}
			local id = FormRandomString(5)
			local fids = core.deserialize(storage:get_string("factions_data"))
			local fnames = core.deserialize(storage:get_string("factions_names"))
			local fplayers = core.deserialize(storage:get_string("factions_players"))
			fids[id] = data
			fnames[fname] = id
			fplayers[name] = id
			local sr1 = core.serialize(fids)
			local sr2 = core.serialize(fnames)
			local sr3 = core.serialize(fplayers)
			storage:set_string("factions_data", sr1)
			storage:set_string("factions_names", sr2)
			storage:set_string("factions_players", sr3)
			core.chat_send_player(name, C("#00FFFF", ehs.S("You made your clan '@1', do /clan_settings to configure it!", fname)))
		end
	end,
})

minetest.register_chatcommand("clan_remove", {
	params = "<clan name>",
	description = ehs.S("Remove your own clan"),
	func = function(name, param)
		local fdata = faction.get_faction(name)
		if fdata then
			if fdata.admins[name] then
				local bool, inf = faction.remove_faction(faction.get_faction_id_from_name(fdata.name))
				return inf
			end
		else
			core.chat_send_player(name, C("#00FFFF", ehs.S("You arent in a clan")))
		end
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local name = Name(player)
	if formname == "faction:settings" then
		local fdata = faction.get_faction(name)
		if fdata then
			if not fields.discard then
				if fields.faction_name and not (fields.allow_others_invite_player and fields.n1 and fields.n2 and fields.set_pos) then
					if fields.faction_name ~= fdata.name then
						-- data
						local fids = core.deserialize(storage:get_string("factions_data"))
						local fnames = core.deserialize(storage:get_string("factions_names"))
						local id = faction.get_faction_id_from_name(fdata.name)
						-- aaa
						fnames[fdata.name] = nil
						fdata.name = fields.faction_name
						fnames[fields.faction_name] = id
						-- set
						fids[id] = fdata
						local sr = core.serialize(fids)
						storage:set_string("factions_data", sr)
						local sr2 = core.serialize(fnames)
						storage:set_string("factions_names", sr2)
						core.chat_send_player(name, C("#00FFFF", ehs.S("Name of clan set!")))
					end
				end
				if fields.faction_color and not (fields.allow_others_invite_player and fields.n1 and fields.n2 and fields.set_pos) then
					if fields.faction_color ~= fdata.config.color then
						-- data
						local fids = core.deserialize(storage:get_string("factions_data"))
						local id = faction.get_faction_id_from_name(fdata.name)
						-- aaa
						fdata.config.color = fields.faction_color
						-- set
						fids[id] = fdata
						local sr = core.serialize(fids)
						storage:set_string("factions_data", sr)
						core.chat_send_player(name, C("#00FFFF", ehs.S("Color of clan set!")))
					end
				end
				if fields.set_pos then
					if not vector.equals(CheckPos(player:get_pos()), fdata.config.pos) then
						local fids = core.deserialize(storage:get_string("factions_data"))
						local id = faction.get_faction_id_from_name(fdata.name)
						fdata.config.pos = CheckPos(player:get_pos())
						fids[id] = fdata
						local sr = core.serialize(fids)
						storage:set_string("factions_data", sr)
						core.chat_send_player(name, C("#00FFFF", ehs.S("Pos of clan set!")))
					end
				end
				if fields.go_to then
					if player then
						player:set_pos(fdata.config.pos)
					end
					core.chat_send_player(name, C("#00FFFF", ehs.S("Done.")))
				end
				if fields.allow_others_invite_player then
					local bstr = tostring(fdata.config.allow_others_invite_player)
					if bstr ~= fields.allow_others_invite_player then
						local fids = core.deserialize(storage:get_string("factions_data"))
						local id = faction.get_faction_id_from_name(fdata.name)
						if fields.allow_others_invite_player == "true" then
							fdata.config.allow_others_invite_player = true
						else
							fdata.config.allow_others_invite_player = false
						end
						fids[id] = fdata
						local sr = core.serialize(fids)
						storage:set_string("factions_data", sr)
						core.chat_send_player(name, C("#00FFFF", ehs.S("Allow others invite players:").." "..fields.allow_others_invite_player))
					end
				end
				if fields.kick_player then
					if not (fields.player_name == name) then
						local id = faction.get_faction_id_from_name(fdata.name)
						local res, str = faction.remove_player(id, fields.player_name)
						if not res then
							core.chat_send_player(name, C("#00FFFF", inf))
						end
					end
				end
				if fields.invite then
					if not (fields.player_name == name) then
						if param ~= "" then
							if fdata.admins[name] or fdata.config.allow_other_players_invite then
								if Player(fields.player_name) then
									core.chat_send_player(fields.player_name, C("#00FFFF", ehs.S("You are being invited to:").." "..C(fdata.config.color,fdata.name).." "..ehs.S("clan by:").." "..name))
									faction.queued_invites[fields.player_name] = faction.get_faction_id_from_name(fdata.name)
								end
							else
								core.chat_send_player(name, C("#00FFFF", ehs.S("You are not the admin")))
							end
						else
							core.chat_send_player(name, C("#00FFFF", ehs.S("Atleast specify what player you want to invite! Must be online to do this")))
						end
					end
				end
				if fields.kick_player then
					if not (fields.player_name == name) then
						local res, inf = faction.remove_player(faction.get_faction_id_from_name(fdata.name), name)
						if not res then core.chat_send_player(name, C("#00FFFF", inf)) end
					end
				end
				if fields.add_admin then
					if not (fields.player_name == name) then
						local bool, inf = faction.do_admin(faction.get_faction_id_from_name(fdata.name), fields.player_name)
						if not bool then
							core.chat_send_player(name, C("#00FFFF", inf))
						end
					end
				end
				if fields.rmv_admin then
					if not (fields.player_name == name) then
						local bool, inf = faction.do_admin(faction.get_faction_id_from_name(fdata.name), fields.player_name)
						if not bool then
							core.chat_send_player(name, C("#00FFFF", inf))
						end
					end
				end
			end
		end
	end
end)

minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	if hitter:is_player() then
		local hf = faction.get_faction(hitter)
		local vf = faction.get_faction(player)
		if hf and vf then
			if hf.name == vf.name then
				player:set_hp(player:get_hp()+damage)
				hud_events.new(player, {
					text = ehs.S("@1 did hit you (clan member)", Name(hitter)),
					color = "info",
					quick = false,
				})
			else
				if faction.get_faction_id_from_name(hf.name) then
					if not (vf.allies and vf.allies[faction.get_faction_id_from_name(hf.name)]) then
						if pvp_players[player:get_player_name()] and pvp_players[hitter:get_player_name()] then
							for name in pairs(vf.players) do
								if Player(name) then
									hud_events.new(Player(name), {
										text = ehs.S("@1 did hit our clan member: @2", Name(hitter), Name(player)),
										color = "warning",
										quick = false,
									})
								end
							end
						end
					end
				end
			end
		end
	end
end)





















