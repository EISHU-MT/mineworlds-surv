afk = {
	players = {},
	ad = {},
	ad2 = {},
	queued_afk = {},
}
local S = minetest.get_translator(minetest.get_current_modname())
core.register_chatcommand("afk", {
	description = "ON/OFF",
	func = function(name, param)
		if afk.players[name] then
			afk.players[name] = nil
			core.chat_send_all(core.colorize("#FFC06E", "[AFK] "..S("@1 came back!", name)))
			--afk.queued_afk[name] = 300
			return true, core.colorize("#FFC06E", "[AFK] "..S("Status: off"))
		else
			afk.players[name] = true
			core.chat_send_all(core.colorize("#FFC06E", "[AFK] "..S("@1 is afk!", name)))
			--afk.queued_afk[name] = 300
			return true, core.colorize("#FFC06E", "[AFK] "..S("Status: on"))
		end
	end
})
function afk.is_afk(p)
	return afk.players[p:get_player_name()]
end
core.register_globalstep(function(dt)
	for _, p in pairs(core.get_connected_players()) do
		local controls = p:get_player_control()
		if (not controls.up) and (not controls.down) and (not controls.left) and (not controls.right) and (not controls.dig) and (not controls.place) then
			if (not afk.players[p:get_player_name()]) and not (afk.queued_afk[p:get_player_name()] and afk.queued_afk[p:get_player_name()] >= 300) then
				if type(afk.queued_afk[p:get_player_name()]) ~= "number" then afk.queued_afk[p:get_player_name()] = 0 end
				afk.queued_afk[p:get_player_name()] = afk.queued_afk[p:get_player_name()] + dt
			end
		else
			if afk.players[p:get_player_name()] then
				if not afk.ad2[p:get_player_name()] then
					core.chat_send_all(core.colorize("#FFC06E", "[AFK] "..S("@1 came back!", p:get_player_name())))
					afk.players[p:get_player_name()] = nil
					afk.ad[p:get_player_name()] = nil
					afk.ad2[p:get_player_name()] = true
					core.after(0.5, function(p) afk.ad2[p:get_player_name()] = nil end, p)
				end
			end
			afk.queued_afk[p:get_player_name()] = 0
		end
		if type(afk.queued_afk[p:get_player_name()]) == "number" and afk.queued_afk[p:get_player_name()] >= 300 then
			if not afk.ad[p:get_player_name()] then
				afk.ad[p:get_player_name()] = true
				afk.players[p:get_player_name()] = true
				core.chat_send_all(core.colorize("#FFC06E", "[AFK] "..S("@1 is afk! (after 5mins)", p:get_player_name())))
			end
		end
	end
end)

core.register_on_joinplayer(function(player)
	afk.players[player:get_player_name()] = nil
	afk.queued_afk[player:get_player_name()] = 0
end)
core.register_on_leaveplayer(function(player)
	afk.players[player:get_player_name()] = nil
	afk.queued_afk[player:get_player_name()] = nil
end)