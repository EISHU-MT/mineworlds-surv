ehs_net = {}
local http = minetest.request_http_api()
local settings = minetest.settings

core.log("action", "[EHS] Loading EHS Net plugin")

if not http then core.log("error", "[EHS] Network Connection error!") return end

local timeout = 10

function ehs_net.send(message)
	local data = {
		type = 'MsgFromSurvival',
		content = minetest.strip_colors(message)
	}
	http.fetch({
		url = 'eee.minetest.land:4000',
		timeout = timeout,
		post_data = minetest.write_json(data)
	}, function(_) end)
end

function ehs_net.handle(response)
	local data = response.data
	if data == '' or data == nil then
		return
	end
	local data = minetest.parse_json(response.data)
	if not data then
		return
	end
	
	if data.mwc_msgs then
		for _, msg in pairs(data.mwc_msgs) do
			core.chat_send_all(core.colorize("#53B6A6", "[Creative] "..msg))
			core.log("action", "Message from Creative: "..msg)
		end
	end
end

local timer = 0
minetest.register_globalstep(function(dtime)
	if dtime then
		timer = timer + dtime
		if timer > 0.2 then
			http.fetch({
				url = 'eee.minetest.land:4000',
				timeout = timeout,
				post_data = minetest.write_json({
					type = 'request_data_QQ'
				})
			}, ehs_net.handle)
			timer = 0
		end
	end
end)

minetest.register_on_shutdown(function()
	ehs_net.send("==> Server Shutting Down <==")
end)
ehs_net.send("==> Starting MineWorlds Survival <==")
minetest.register_on_mods_loaded(function()
	core.after(1, function()
		ehs_net.send("==> Server Started <==")
	end)
end)