local death_cetro = {}
local give_on_death = true
local S = core.get_translator("death_cetro")

--Almacenar (Temporalmente) la ubicacion de muerte del jugador
minetest.register_on_dieplayer(function(player)
    death_cetro[player:get_player_name()] = player:get_pos()
end)

--Dar el cristal cuando el player muere (si give_on_death es verdadero)
minetest.register_on_respawnplayer(function(player) 
    if give_on_death and death_cetro[player:get_player_name()]then
        inv = player:get_inventory()
        if inv and inv:room_for_item("main", ItemStack("death_cetro:cetro")) then
            inv:add_item("main","death_cetro:cetro")
        else
            core.chat_send_player(player:get_player_name(), "[Bones] Use /bones to return yo your death pos | Pon /bones para ir al lugar que has muerto")
        end
    end 
end)

minetest.register_craftitem("death_cetro:cetro", {
	description = minetest.colorize("yellow", S("Staff of return to death pos")),
	wield_scale = {x=0.75,y=0.75,z=0.75},
	inventory_image = "resurection_wand.png",
    stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
        local died = death_cetro[user:get_player_name()]
        if died then
            local posd = {x = died.x, y = died.y+1, z = died.z}
            user:set_pos(posd)
            death_cetro[user:get_player_name()] = nil
            itemstack:take_item()
        else
            minetest.chat_send_player(user:get_player_name(), S("You dint die, Congrats!"))
        end
        return itemstack
    end
})

core.register_chatcommand("bones", {
	description = S("Teleport to your bones"),
	func = function(name, param)
		local died = death_cetro[name]
		if died then
			local p = core.get_player_by_name(name)
			if p then
				local posd = {x = died.x, y = died.y+1, z = died.z}
				p:set_pos(posd)
				death_cetro[name] = nil
				local inv = p:get_inventory()
				if inv then
					local list = inv:get_list("main")
					if list then
						for _, item in pairs(list) do
							if item:get_name() == "death_cetro:cetro" then
								item:take_item()
							end
						end
						inv:set_list("main", list)
					end
				end
			end
		else
			minetest.chat_send_player(name, S("You dint die, Congrats!"))
		end
	end,
})

if not give_on_death then
    minetest.register_craft({
	    output = "death_cetro:cetro",
	    recipe = {
			    {"dye:red", "default:diamond", "dye:red"},
			    {"", "default:gold_ingot", ""},
			    {"", "default:gold_ingot", ""}
		     }
    })
else


end
