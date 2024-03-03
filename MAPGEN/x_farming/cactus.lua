-- Large cactus

minetest.register_decoration({
	name = "x_farming:large_cactus",
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.0003,
		scale = 0.0009,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_max = 31000,
	y_min = 4,
	schematic = minetest.get_modpath("x_farming") .. "/schematics/x_farming_large_cactus.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_node("x_farming:cactus_fruit", {
	description = "Dragon Fruit",
	inventory_image = "x_farming_cactus_fruit_sides.png",
	is_ground_content = false,
	tiles = {
		"x_farming_cactus_fruit_top.png",
		"x_farming_cactus_fruit_bottom.png",
		"x_farming_cactus_fruit_sides.png",
		"x_farming_cactus_fruit_sides.png",
		"x_farming_cactus_fruit_sides.png",
		"x_farming_cactus_fruit_sides.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.0625, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.0625, 0.25},
	},
	drop = {
		max_items = 1,  -- Maximum number of items to drop.
		items = { -- Choose max_items randomly from this list.
			{
				items = {"x_farming:cactus_fruit_item"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			}
		},
	},
	groups = {choppy = 3, flammable = 2, not_in_creative_inventory=1, leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_wood_defaults(),

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if oldnode.param2 == 20 then
			minetest.set_node(pos, {name = "x_farming:cactus_fruit_mark"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

minetest.register_node("x_farming:cactus_fruit_mark", {
	description = "Cactus Fruit Marker",
	inventory_image = "x_farming_cactus_fruit_sides.png^default_invisible_node_overlay.png",
	wield_image = "x_farming_cactus_fruit_sides.png^default_invisible_node_overlay.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_timer = function(pos, elapsed)
		local n = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})

		if n.name ~= "default:cactus" then
			minetest.remove_node(pos)
		elseif minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "x_farming:cactus_fruit", param2 = 20})
		end
	end
})

minetest.register_node("x_farming:cactus_fruit_item", {
	description = "Dragon Fruit" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 2"),
	drawtype = "plantlike",
	tiles = {"x_farming_cactus_fruit_item.png"},
	inventory_image = "x_farming_cactus_fruit_item.png",
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "x_farming:cactus_fruit"})
	end,
})

minetest.register_node("x_farming:large_cactus_with_fruit_seedling", {
	description = "Large Cactus with Fruit Seedling",
	drawtype = "plantlike",
	tiles = {"x_farming_large_cactus_with_fruit_seedling.png"},
	inventory_image = "x_farming_large_cactus_with_fruit_seedling.png",
	wield_image = "x_farming_large_cactus_with_fruit_seedling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {
			-5 / 16, -0.5, -5 / 16,
			5 / 16, 0.5, 5 / 16
		}
	},
	groups = {choppy = 3, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"x_farming:large_cactus_with_fruit_seedling",
			{x = -3, y = 0, z = -3},
			{x = 3, y = 6, z = 3},
			4)

		return itemstack
	end,

	on_construct = function(pos)
		-- Normal cactus farming adds 1 cactus node by ABM,
		-- interval 12s, chance 83.
		-- Consider starting with 5 cactus nodes. We make sure that growing a
		-- large cactus is not a faster way to produce new cactus nodes.
		-- Confirmed by experiment, when farming 5 cacti, on average 1 new
		-- cactus node is added on average every
		-- 83 / 5 = 16.6 intervals = 16.6 * 12 = 199.2s.
		-- Large cactus contains on average 14 cactus nodes.
		-- 14 * 199.2 = 2788.8s.
		-- Set random range to average to 2789s.
		minetest.get_node_timer(pos):start(math.random(1859, 3719))
	end,

	on_timer = function(pos)
		local node_under = minetest.get_node_or_nil(
			{x = pos.x, y = pos.y - 1, z = pos.z})
		if not node_under then
			-- Node under not yet loaded, try later
			minetest.get_node_timer(pos):start(300)
			return
		end

		if minetest.get_item_group(node_under.name, "sand") == 0 then
			-- Seedling dies
			minetest.remove_node(pos)
			return
		end

		local light_level = minetest.get_node_light(pos)
		if not light_level or light_level < 13 then
			-- Too dark for growth, try later in case it's night
			minetest.get_node_timer(pos):start(300)
			return
		end

		minetest.log("action", "A large cactus seedling grows into a large" ..
			"cactus at ".. minetest.pos_to_string(pos))
		x_farming.grow_large_cactus(pos)
	end,
})

default.register_leafdecay({
	trunks = {"default:cactus"},
	leaves = {"x_farming:cactus_fruit"},
	radius = 1,
})

minetest.register_craft({
	output = "x_farming:large_cactus_with_fruit_seedling",
	recipe = {
		{"", "x_farming:cactus_fruit_item", ""},
		{"x_farming:cactus_fruit_item", "default:large_cactus_seedling", "x_farming:cactus_fruit_item"},
		{"", "x_farming:cactus_fruit_item", ""},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:large_cactus_with_fruit_seedling",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:cactus_fruit_item",
	burntime = 10,
})
