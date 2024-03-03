-- Particles

-- NICO SPRITE ANIMATION PATH:
--/exec core.add_particle({pos=vector.add(core.get_player_by_name("singleplayer"):get_pos(), vector.new(0,1.4,0)), expiration_time=1, velocity=vector.new(0,1,0), acceleration=vector.new(math.random(-1, 2),-math.random(3, 6),math.random(-1, 2)), texture="default_dirt.png", size=10})

-- EISHU SPRITE ANIMATION PATH
--/exec core.add_particlespawner({attached=core.get_player_by_name("singleplayer"), minacc=vector.new(0,1,0), maxacc=vector.new(0,2,0), minpos=vector.new(0.5,0,0.5), maxpos=vector.new(-0.5,1,-0.5), time=2, amount=20, glow=15, expiration_time=3, texture="default_toolpick_diamond.png", size=3})

local storage = bank.storage

function bank.GenerateParticlesToPlayer(pos, m)
	core.add_particlespawner({
		pos = pos,
		minacc = vector.new(0,1,0),
		maxacc = vector.new(0,2,0),
		minpos = vector.new(0.5,0,0.5),
		maxpos = vector.new(-0.5,1,-0.5),
		time = 1,
		amount = 1,
		glow = 15,
		expiration_time = 3,
		texture = "emoney_given_amount_"..m..".png",
		size = 3
	})
end

function bank.GenerateParticlesToPlayerTwo(player, m)
	core.add_particlespawner({
		attached = Player(player),
		minacc = vector.new(0,1,0),
		maxacc = vector.new(0,2,0),
		minpos = vector.new(0.5,0,0.5),
		maxpos = vector.new(-0.5,1,-0.5),
		time = 1,
		amount = 10,
		glow = 15,
		expiration_time = 3,
		texture = "emoney_given_amount_"..m..".png",
		size = 3
	})
end

do
	local strs = storage:get_string("queued_mining")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					__null = 0
				}
		local sr = core.serialize(newtable)
		storage:set_string("queued_mining", sr)
	end
end

function bank.get_mining_data()
	return core.deserialize(storage:get_string("queued_mining"))
end
function bank.save_mining_data(data)
	return storage:set_string("queued_mining", core.serialize(data))
end

bank.correct_amount_to_give = 5

bank.registered_ores = {}

minetest.register_on_mods_loaded(function()
	core.log("action", "Proceed to reload ores")
	for name, def in pairs(core.registered_items) do
		if name:match("_ore") or name:match("stone_with") then
			bank.registered_ores[name] = true
			core.log("action", "Registered: "..name)
		end
	end
end)

minetest.register_on_dignode(function(pos, oldnode, digger)
	if bank.registered_ores[oldnode.name] then
		bank.add_value(Name(digger), 1)
		bank.GenerateParticlesToPlayer(pos, 1)
	else
		--local data = bank.get_mining_data()
		--data[Name(digger)] = data[Name(digger)] + 1
		--if data[Name(digger)] >= 10 then
		--	bank.add_value(Name(digger), 2)
		--	bank.GenerateParticlesToPlayerTwo(Player(digger), 2)
		--	data[Name(digger)] = 0
		--end
		--bank.save_mining_data(data)
		if Name(digger) and Player(digger) then
			digger = Player(digger)
			local meta = digger:get_meta()
			if not meta then return end
			local int = meta:get_int("nodes_dug_from_bank")
			meta:set_int("nodes_dug_from_bank", meta:get_int("nodes_dug_from_bank")+1)
			if int >= 10 then
				bank.add_value(Name(digger), 2)
				bank.GenerateParticlesToPlayerTwo(Player(digger), 2)
				meta:set_int("nodes_dug_from_bank", 0)
			end
		end
	end
end)

minetest.register_on_placenode(function(pos, newnode, digger, oldnode, itemstack, pointed_thing)
	if Name(digger) and Player(digger) then
		digger = Player(digger)
		local meta = digger:get_meta()
		if not meta then return end
		local int = meta:get_int("nodes_placed_from_bank")
		meta:set_int("nodes_placed_from_bank", meta:get_int("nodes_placed_from_bank")+1)
		if int >= 10 then
			bank.add_value(Name(digger), 2)
			bank.GenerateParticlesToPlayerTwo(Player(digger), 2)
			meta:set_int("nodes_placed_from_bank", 0)
		end
	end
end)

minetest.register_craft({
	output = "emoney:atm",
	recipe = {
		{"default:stone", "default:steel_ingot", "default:stone"},
		{"default:stone", "default:paper", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})








