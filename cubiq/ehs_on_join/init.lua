--minetest.register_on_prejoinplayer(function(name, ip)
--	core.chat_send_all(name.." esta entrando / "..name.." is joining the game")
--end)
--[[
minetest.register_on_newplayer(function(ObjectRef)
	core.chat_send_all(ObjectRef:get_player_name().." se ha unido por primera ves! Di hola / "..ObjectRef:get_player_name().." has joined the server for the first time, say hi!")
end)
minetest.register_on_authplayer(function(name, ip, is_success)
	if is_success and ip then
		core.chat_send_all("*** "..name.." is joining the game")
		if discord then
			discord.send("`*** "..name.." is joining the game` ")
		end
		core.log("action", name.." is logging in")
	end
end)--]]
