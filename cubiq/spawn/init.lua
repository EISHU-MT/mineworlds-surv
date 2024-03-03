core.register_chatcommand("spawn", {
	description = "Teletransportarse al spawn / Teleport to spawn",
	func = function(name, params)
		local player = Player(name)
		local pos = minetest.setting_get_pos("static_spawnpoint")
		if pos then
			if player then
				player:set_pos(pos)
			else
				core.log("error", "Attempt of crash blocked!: Trace: Command => spawn => function => param 1: name => player not known")
				return true, "Trying to call /spawn on a unknown env!\nReporting this error...."
			end
		end
	end
})