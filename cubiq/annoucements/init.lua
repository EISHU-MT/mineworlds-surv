-- Mod hecho para reemplasar el sistema de annoucements actual de multicraft.
hyper_an = {
	gname = "etest",
	gversion = "5.4.1-2.0.3",
}
--if not diejoid then return end
local http = minetest.request_http_api()
local settings = minetest.settings
function hyper_an.get_users()
	local users = core.get_connected_players()
	local names = {}
	for _, p in pairs(users) do
		table.insert(names, p:get_player_name())
	end
	return names
end
hyper_an.is_enabled = http ~= nil
function hyper_an.dosub(str)
	return str
end
function hyper_an.send(mc)
	--print(data, mc)
	if hyper_an.is_enabled then
		http.fetch({
			url = 'https://servers.multicraft.world/announce',
			timeout = 30,
			multipart = true,
			method = "POST",
			data = {json = mc}
		}, function(...) print(dump(...)) end)
	else
		core.log("error", "Attempt of use of HyperManualAnnouce: HTTP not enabled!")
	end
end
function hyper_an.do_json(t)
	local str = "{"
	for element, d in pairs(t) do
		if type(d) == "string" then	
			str = str..'"'..element..'":"'..d..'",'
		elseif type(d) == "boolean" then
			str = str..'"'..element..'":'..tostring(d)..','
		elseif type(d) == "number" then
			str = str..'"'..element..'":'..tostring(d)..','
		elseif type(d) == "table" then
			str = str..'"'..element..'":['
			for el, st in pairs(d) do
				if type(st) == "string" then
					if el < #d then
						str = str..'"'..st..'",'
					else
						str = str..'"'..st..'"'
					end
				end
			end
			str = str..'],'
		end	
	end
	print(str:sub(-(str:len()), str:len()-1).."}")
	return str:sub(-(str:len()), str:len()-1).."}"
end

--if http then
	function hyper_an.compile_server_data(act) --minetest.get_server_max_lag()
		local to_compile_mc = {address = settings:get("server_address"), action = act, port = settings:get("port")}
		if act ~= "delete" then
			to_compile_mc = {
				name = settings:get("server_name"),
				description = settings:get("server_description"),
				version = hyper_an.gversion,
				proto_min = 25,
				proto_max = 49,
				url = "https://chiwi.net/donate",
				creative = false,
				damage = true,
				password = false,
				pvp = true,
				uptime = math.floor(minetest.get_server_uptime()),
				game_time = minetest.get_gametime(),
				clients = #core.get_connected_players(),
				clients_max = tonumber(settings:get("max_users")),
				clients_list = hyper_an.get_users(),
				gameid = hyper_an.gname,
				address = settings:get("server_address"),
				port = settings:get("port"),
				dedicated = true,
				rollback = false,
				mapgen = minetest.get_mapgen_params().mgname,
				privs = settings:get("default_privs"),
				can_see_far_names = true,
				action = act,
				server_id = "multicraft",
			}
		end
		if act == "start" then
			to_compile_mc = {
				name = settings:get("server_name"),
				description = settings:get("server_description"),
				version = hyper_an.gversion,
				proto_min = 25,
				proto_max = 49,
				url = "https://chiwi.net/donate",
				creative = false,
				damage = true,
				password = false,
				pvp = true,
				uptime = math.floor(minetest.get_server_uptime()),
				game_time = minetest.get_gametime(),
				clients = #core.get_connected_players(),
				clients_max = tonumber(settings:get("max_users")),
				clients_list = hyper_an.get_users(),
				gameid = hyper_an.gname,
				address = settings:get("server_address"),
				port = settings:get("port"),
				dedicated = true,
				rollback = false,
				mapgen = minetest.get_mapgen_params().mgname,
				privs = settings:get("default_privs"),
				can_see_far_names = true,
				action = act,
				server_id = "multicraft",
			}
		elseif act == "update" then
			to_compile_mc = {
				name = settings:get("server_name"),
				description = settings:get("server_description"),
				version = hyper_an.gversion,
				proto_min = 25,
				proto_max = 49,
				url = "https://chiwi.net/donate",
				creative = false,
				damage = true,
				password = false,
				pvp = true,
				uptime = math.floor(minetest.get_server_uptime()),
				game_time = minetest.get_gametime(),
				clients = #core.get_connected_players(),
				clients_max = tonumber(settings:get("max_users")),
				clients_list = hyper_an.get_users(),
				gameid = hyper_an.gname,
				address = settings:get("server_address"),
				port = settings:get("port"),
				dedicated = true,
				rollback = false,
				mapgen = minetest.get_mapgen_params().mgname,
				privs = settings:get("default_privs"),
				can_see_far_names = true,
				action = act,
				server_id = "multicraft",
			}
		end
--		
		to_compile_mc.gameid = "MultiCraft"
		to_compile_mc.version = "2.0.2"
		return hyper_an.do_json(to_compile_mc)
	end
	core.register_on_mods_loaded(function()
		core.after(1, function()
			hyper_an.send(hyper_an.compile_server_data("start"))
		end)
	end)
--end
local time = 0
core.register_globalstep(function(dt)
	if hyper_an.is_enabled then
		time = time + dt
		if time >= 60.0 then
			hyper_an.send(hyper_an.compile_server_data("update"))
			core.log("action", "Updating to serverlist")
			time = 0
		end
	end
end)
minetest.register_on_shutdown(function()
	if hyper_an.is_enabled then
		hyper_an.send(hyper_an.compile_server_data("delete"))
		core.log("action", "Deleting server from serverlist")
	end
end)













