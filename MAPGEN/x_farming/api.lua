-- main class
x_farming = {
	hbhunger = minetest.get_modpath("hbhunger"),
	colors = {
		brown = "#DEB887",
		red = "#FF8080",
		green = "#98E698"
	},
	x_bonemeal = {}
}

-- how often node timers for plants will tick, +/- some random value
function x_farming.tick(pos)
	minetest.get_node_timer(pos):start(math.random(498, 1287))
end

-- how often a growth failure tick is retried (e.g. too dark)
function x_farming.tick_short(pos)
	minetest.get_node_timer(pos):start(math.random(332, 858))
end

-- just shorthand for minetest metadata handling
function x_farming.meta_get_str(key, pos)
	local meta = minetest.get_meta(pos)
	return meta:get_string(key)
end

-- just shorthand for minetest metadata handling
function x_farming.meta_set_str(key, value, pos)
	local meta = minetest.get_meta(pos)
	meta:set_string(key, value)
end

-- merge two indexed tables
function x_farming.mergeTables(t1, t2)
	local _t1 = {unpack(t1)}
	local _t2 = {unpack(t2)}

	for k, v in ipairs(_t2) do
		table.insert(_t1, v)
	end

	return _t1
end

-- Change an entire string to Title Case (i.e. capitalise the first letter of each word)
function x_farming.tchelper(first, rest)
	return first:upper()..rest:lower()
end

-- grow blocks next to the plant
function x_farming.grow_block(pos, elapsed)
	local node = minetest.get_node(pos)
	local random_pos = false
	local spawn_positions = {}
	local right_pos = {x=pos.x+1, y=pos.y, z=pos.z}
	local front_pos = {x=pos.x, y=pos.y, z=pos.z+1}
	local left_pos = {x=pos.x-1, y=pos.y, z=pos.z}
	local back_pos = {x=pos.x, y=pos.y, z=pos.z-1}
	local right = minetest.get_node(right_pos)
	local front = minetest.get_node(front_pos)
	local left = minetest.get_node(left_pos)
	local back = minetest.get_node(back_pos)
	local def = minetest.registered_nodes[node.name]

	local children = {}

	-- look for fruits around the stem
	if (right.name == def.next_plant) then
		children.right = right_pos
	end
	if (front.name == def.next_plant) then
		children.front = front_pos
	end
	if (left.name == def.next_plant) then
		children.left = left_pos
	end
	if (back.name == def.next_plant) then
		children.back = back_pos
	end

	-- check if the fruit belongs to this stem
	for side,child_pos in pairs(children) do

		local parent_pos_from_child = x_farming.meta_get_str("parent", child_pos)

		-- disable timer for fully grown plant - fruit for this stem already exists
		if minetest.pos_to_string(pos) == parent_pos_from_child then
			return
		end
	end

	-- make sure that at least one side of the plant has space to put fruit
	if right.name == "air" then
		table.insert(spawn_positions, right_pos)
	end
	if front.name == "air" then
		table.insert(spawn_positions, front_pos)
	end
	if left.name == "air" then
		table.insert(spawn_positions, left_pos)
	end
	if back.name == "air" then
		table.insert(spawn_positions, back_pos)
	end

	-- plant is closed from all sides
	if #spawn_positions < 1 then
		x_farming.tick_short(pos)
		return
	else
		-- pick random from the open sides
		local pick_random

		if #spawn_positions == 1 then
			pick_random = #spawn_positions
		else
			pick_random = math.random(1, #spawn_positions)
		end

		for k, v in pairs (spawn_positions) do
			if k == pick_random then
				random_pos = v
			end
		end
	end

	-- check light
	local light = minetest.get_node_light(pos)
	if not light or light < 13 or light > default.LIGHT_MAX then
		x_farming.tick_short(pos)
		return
	end

	-- spawn block
	if random_pos then
		minetest.set_node(random_pos, {name = def.next_plant})
		x_farming.meta_set_str("parent", minetest.pos_to_string(pos), random_pos)
	end
	return
end

function x_farming.grow_kiwi_tree(pos)
	local path = minetest.get_modpath("x_farming") ..
		"/schematics/x_farming_kiwi_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y, z = pos.z - 2},
		path, "random", nil, false)
end

-- Grow sapling

function x_farming.grow_sapling(pos)
	if not default.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	end

	local node = minetest.get_node(pos)
	if node.name == "x_farming:kiwi_sapling" then
		minetest.log("action", "A sapling grows into a tree at "..
		minetest.pos_to_string(pos))
		x_farming.grow_kiwi_tree(pos)
	end
end

-- Grow Large Cactus

function x_farming.grow_large_cactus(pos)
	local path = minetest.get_modpath("x_farming") ..
		"/schematics/x_farming_large_cactus_from_seedling.mts"
	minetest.place_schematic({x = pos.x, y = pos.y, z = pos.z},
		path, "random", nil, false, "place_center_x, place_center_z")
end

-- Grow Jungle Tree

function x_farming.grow_jungle_tree(pos)
	local path = minetest.get_modpath("x_farming") ..
		"/schematics/x_farming_jungle_tree_with_cocoa_from_sapling.mts"
		minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, nil, nil, false)
end

-- Pine Nut Tree

function x_farming.grow_pine_nut_tree(pos)
	local path = minetest.get_modpath("x_farming") ..
		"/schematics/x_farming_pine_nut_tree_from_sapling.mts"
		minetest.place_schematic({x = pos.x - 2, y = pos.y, z = pos.z - 2},
		path, "0", nil, false)
end

--
-- Bonemeal
--

------------
-- Main API for x_bonemeal Mod
-- @author Juraj Vajda
-- @license GNU LGPL 2.1
----

--- Get creative mode setting from minetest.conf
-- @local
local creative_mod_cache = minetest.settings:get_bool("creative_mode")

--- Check if creating mode is enabled or player has creative privs
-- @function
-- @param name Player name
-- @return Boolean
function x_farming.x_bonemeal.is_creative(name)
	return creative_mod_cache or minetest.check_player_privs(name, {creative = true})
end

--- Check if node has a soil below its self
-- @function
-- @param under table of position
-- @return Boolean
function x_farming.x_bonemeal.is_on_soil(under)
	local below = minetest.get_node({x = under.x, y = under.y - 1, z = under.z})
	if minetest.get_item_group(below.name, "soil") == 0 then
		return false
	end
	return true
end

--- Check if node has a sand below its self
-- @function
-- @param under table of position
-- @return Boolean
function x_farming.x_bonemeal.is_on_sand(under)
	local below = minetest.get_node({x = under.x, y = under.y - 1, z = under.z})
	if minetest.get_item_group(below.name, "sand") == 0 then
		return false
	end
	return true
end

--- Growth steps for farming plants, there is no way of getting them dynamically, so they are defined in the local table variable
-- @table farming_steps
-- @local
local farming_steps = {
	["farming:wheat"] = 8,
	["farming:cotton"] = 8,
	["x_farming:coffee"] = 5,
	["x_farming:corn"] = 10,
	["x_farming:obsidian_wart"] = 6,
	["x_farming:melon"] = 8,
	["x_farming:pumpkin"] = 8,
	["x_farming:carrot"] = 8,
	["x_farming:potato"] = 8,
	["x_farming:beetroot"] = 8,
	["x_farming:strawberry"] = 4,
	["x_farming:stevia"] = 8,
	["x_farming:soybean"] = 7,
	["x_farming:salt"] = 7,
}

--- Particle and sound effect after the bone meal is successfully used
-- @function
-- @param pos table containing position
function x_farming.x_bonemeal.particle_effect(pos)
	minetest.sound_play("x_farming_x_bonemeal_grow", {
		pos = pos,
		gain = 0.5,
	})

	minetest.add_particlespawner({
		amount = 6,
		time = 3,
		minpos = {x = pos.x - 0.4, y = pos.y - 0.4, z = pos.z - 0.4},
		maxpos = {x = pos.x + 0.4, y = pos.y, z = pos.z + 0.4},
		minvel = {x = 0, y = 0, z = 0},
		maxvel = {x = 0, y = 0.1, z = 0},
		minacc = vector.new({x = 0, y = 0, z = 0}),
		maxacc = vector.new({x = 0, y = 0.1, z = 0}),
		minexptime = 2,
		maxexptime = 3,
		minsize = 1,
		maxsize = 3,
		texture = "x_farming_x_bonemeal_particles.png",
		animation = {
			type = "vertical_frames",
			aspect_w = 8,
			aspect_h = 8,
			length = 3,
		},
	})
end

function x_farming.x_bonemeal.tableContains(table, value)
	local found = false

	if not table or type(table) ~= "table" then
		return found
	end

	for k, v in ipairs(table) do
		if v == value then
			found = true
			break
		end
	end

	return found
end

function x_farming.x_bonemeal.groupContains(groups, fertility, value)
	local found = false

	if not groups or type(groups) ~= "table" then
		return found
	end

	if groups[fertility] and groups[fertility] == value then
		found = true
	end

	return found
end

--- Handle growth of decorations based on biome
-- @function
function x_farming.x_bonemeal.grow_grass_and_flowers(itemstack, user, pointed_thing)
    if not pointed_thing then return end
	local node = minetest.get_node(pointed_thing.under)

    if not user then return end
   
    
	if not node then
		return itemstack
	end

	local pos0 = vector.subtract(pointed_thing.under, 3)
	local pos1 = vector.add(pointed_thing.under, 3)
	local biome_data = minetest.get_biome_data(pointed_thing.under)
	local biome_name = minetest.get_biome_name(biome_data.biome)
	local random_number = math.random(2, 6)
	local registered_decorations_filtered = {}
	local returned_itemstack = ItemStack(node.name .." 1")
	local node_def = minetest.registered_nodes[node.name]
	local below_water = false
	local floats_on_water = false
	local node_in_decor = false
	local positions_dirty = {}
	local positions = {}
	local decor_place_on = {}
	-- print('biome_name', biome_name)

	-- check 1 node below pointed node (floats on water)
	local test_node = minetest.get_node({x = pointed_thing.under.x, y = pointed_thing.under.y - 1, z = pointed_thing.under.z})
	local test_node_def = minetest.registered_nodes[test_node.name]

	if test_node_def and test_node_def.liquidtype == "source" and minetest.get_item_group(test_node_def.name, "water") > 0 then
		floats_on_water = true
	end

	-- check 2 nodes above pointed nodes (below water)
	local water_nodes_above = 0
	for i = 1, 2 do
		local test_node = minetest.get_node({x = pointed_thing.under.x, y = pointed_thing.under.y + i, z = pointed_thing.under.z})
		local test_node_def = minetest.registered_nodes[test_node.name]

		if test_node_def and test_node_def.liquidtype == "source" and minetest.get_item_group(test_node_def.name, "water") > 0 then
			water_nodes_above = water_nodes_above + 1
		end
	end

	if water_nodes_above == 2 then
		below_water = true
	end

	if below_water then
		positions_dirty = minetest.find_nodes_in_area(pos0, pos1, node.name)
	elseif floats_on_water then
		positions_dirty = minetest.find_nodes_in_area(pos0, pos1, "air")
	else
		positions_dirty = minetest.find_nodes_in_area_under_air(pos0, pos1, node.name)
	end

	-- find suitable decorations
	for k, v in pairs(minetest.registered_decorations) do
		-- only for "simple" decoration types
		if v.deco_type == "simple" then
			local found = false

			-- filter based on biome name in `biomes` table and node name in `place_on` table
			if x_farming.x_bonemeal.tableContains(v.biomes, biome_name) then
				table.insert(registered_decorations_filtered, v)
			end

		end

		-- clicked node is in decoration
		if v.decoration == node.name then
			node_in_decor = true
		end

		-- all nodes on which decoration can be placed on
		-- indexed by name
		if not decor_place_on[v.place_on] then
			for k, v in ipairs(v.place_on) do
				decor_place_on[v] = true
			end
		end
	end

	-- find suitable positions
	for j, pos_value in ipairs(positions_dirty) do
		local node_at_pos = minetest.get_node(pos_value)

		if below_water then
			-- below water
			local water_nodes_above = 0

			-- check if 2 nodes above are water
			for i = 1, 2 do
				local test_node = minetest.get_node({x = pos_value.x, y = pos_value.y + i, z = pos_value.z})
				local test_node_def = minetest.registered_nodes[test_node.name]

				if test_node_def and test_node_def.liquidtype == "source" and minetest.get_item_group(test_node_def.name, "water") > 0 then
					water_nodes_above = water_nodes_above + 1
				end
			end

			if water_nodes_above == 2 and decor_place_on[test_node.name] then
				table.insert(positions, pos_value)
			end
		else
			-- above water (not on water)
			if decor_place_on[node_at_pos.name] then
				table.insert(positions, pos_value)
			end
		end
	end

	-- find suitable positions (float on water)
	if floats_on_water then
		for j, pos_value in ipairs(positions_dirty) do
			local node_at_pos = minetest.get_node(pos_value)
			local node_at_pos_below = minetest.get_node({x = pos_value.x, y = pos_value.y - 1, z = pos_value.z})
			local test_node_def = minetest.registered_nodes[node_at_pos_below.name]

			if test_node_def and test_node_def.liquidtype == "source" and minetest.get_item_group(test_node_def.name, "water") > 0 then
				table.insert(positions, pos_value)
			end
		end
	end


	-- take item
	if returned_itemstack and returned_itemstack:is_empty() and not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
		itemstack:take_item()
	end

	return itemstack
end

--- Handle farming and farming addons plants. Needed to copy this function from minetest_game and modify it in order to ommit some checks (e.g. light..)
-- @function
function x_farming.x_bonemeal.grow_farming(itemstack, user, pointed_thing)
	local pos_under = pointed_thing.under
	local replace_node_name = minetest.get_node(pos_under).name
	local ndef = minetest.registered_nodes[replace_node_name]
	local take_item = false

	if not ndef.next_plant or ndef.next_plant == "x_farming:pumpkin_fruit" or ndef.next_plant == "x_farming:melon_fruit" then
		return itemstack
	end

	local pos0 = vector.subtract(pointed_thing.under, 3)
	local pos1 = vector.add(pointed_thing.under, 3)
	local positions = minetest.find_nodes_in_area(pos0, pos1, {"group:plant", "group:seed"})

	for i, pos in ipairs(positions) do
		local isFertile = false
		replace_node_name = minetest.get_node(pos).name

		-- check if on wet soil
		local below = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
		local below_def = minetest.registered_nodes[below.name]

		if minetest.get_item_group(below.name, "soil") == 3 then
			local plant = replace_node_name:split("_")[1]
			local current_step = tonumber(string.reverse(string.reverse(replace_node_name):split("_")[1]))
			local max_step = farming_steps[replace_node_name:gsub("_%d+", "", 1)]

			-- check if seed
			-- farming:seed_wheat
			local mod_plant = replace_node_name:split(":")
			-- seed_wheat
			local seed_plant = mod_plant[2]:split("_")
			local seed_name = replace_node_name

			if seed_plant[1] == "seed" then
				current_step = 0
				if replace_node_name == "x_farming:seed_obsidian_wart" then
					replace_node_name = mod_plant[1]..":"..seed_plant[2].."_"..seed_plant[3]
				else
					replace_node_name = mod_plant[1]..":"..seed_plant[2]
				end
				max_step = farming_steps[replace_node_name]
				replace_node_name = replace_node_name.."_"..current_step
			else
				if string.find(replace_node_name, "obsidian_wart") then
					seed_name = mod_plant[1]..":seed_"..seed_plant[1].."_"..seed_plant[2]
				else
					seed_name = mod_plant[1]..":seed_"..seed_plant[1]
				end
			end

			-- search for fertility (again after checking soil)
			local seed_def = minetest.registered_nodes[seed_name]

			if seed_def and below_def then
				if below_def.groups then
					for i,v in ipairs(seed_def.fertility) do
						if not isFertile then
							isFertile = x_farming.x_bonemeal.groupContains(below_def.groups, v, 1)
						end
					end
				end
			end

			if current_step ~= nil and max_step ~= nil and current_step ~= max_step and isFertile then
				local available_steps = max_step - current_step
				local new_step = max_step - available_steps + math.random(available_steps)
				local new_plant = replace_node_name:gsub("_%d+", "_"..new_step, 1)
				take_item = true

				local placenode_def = minetest.registered_nodes[new_plant]

				local placenode = {name = new_plant}
				if placenode_def and placenode_def.place_param2 then
					placenode.param2 = placenode_def.place_param2
				end
				x_farming.x_bonemeal.particle_effect(pos)
				minetest.swap_node(pos, placenode)
			end
		end
	end

	-- take item if not in creative
	if not x_farming.x_bonemeal.is_creative(user:get_player_name()) and take_item then
		itemstack:take_item()
	end

	return itemstack
end
