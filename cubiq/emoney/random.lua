local max = 300
local min = 100
local f = math.floor

local timer = 0

local function get_count()
	local c = #core.get_connected_players()
	if c == 0 then
		return 1
	else
		return c
	end
end

core.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer >= 300 then
		local div = math.floor(300) / get_count()
		for _, p in pairs(core.get_connected_players()) do
			bank.add_value(Name(p), math.floor(div))
		end
		core.chat_send_all(core.colorize("#49A2EA", "[Bank] "..bank.S("Server dropped @1$ on every players!", tostring(math.floor(div)))))
		timer = 0
	end
end)