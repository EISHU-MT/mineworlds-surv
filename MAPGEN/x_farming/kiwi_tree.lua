-- Required wrapper to allow customization of default.after_place_leaves
local function after_place_leaves(...)
	return default.after_place_leaves(...)
end

-- decoration
minetest.register_decoration({
	name = "x_farming:kiwi_tree",
	deco_type = "schematic",
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"savanna"},
	y_max = 31000,
	y_min = 1,
	schematic = minetest.get_modpath("x_farming") .. "/schematics/x_farming_kiwi_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- trunk
minetest.register_node("x_farming:kiwi_tree", {
	description = "Kiwi Tree",
	tiles = {"x_farming_kiwi_tree_top.png", "x_farming_kiwi_tree_top.png", "x_farming_kiwi_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

-- leaves
minetest.register_node("x_farming:kiwi_leaves", {
	description = "Kiwi Tree Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"x_farming_kiwi_leaves.png"},
	special_tiles = {"x_farming_kiwi_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"x_farming:kiwi_sapling"},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"x_farming:kiwi_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
})

-- sapling
minetest.register_node("x_farming:kiwi_sapling", {
	description = "Kiwi Tree Sapling",
	drawtype = "plantlike",
	tiles = {"x_farming_kiwi_sapling.png"},
	inventory_image = "x_farming_kiwi_sapling.png",
	wield_image = "x_farming_kiwi_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = x_farming.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"x_farming:kiwi_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 4, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

-- fruit
minetest.register_node("x_farming:kiwi", {
	description = "Kiwi",
	drawtype = "plantlike",
	visual_scale = 0.5,
	tiles = {"x_farming_kiwi.png"},
	inventory_image = "x_farming_kiwi.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	drop = {
		max_items = 1,  -- Maximum number of items to drop.
		items = { -- Choose max_items randomly from this list.
			{
				items = {"x_farming:kiwi_fruit"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1, not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if oldnode.param2 == 0 then
			minetest.set_node(pos, {name = "x_farming:kiwi_mark"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

minetest.register_node("x_farming:kiwi_mark", {
	description = "Kiwi Marker",
	inventory_image = "x_farming:kiwi_fruit.png^default_invisible_node_overlay.png",
	wield_image = "x_farming:kiwi_fruit.png^default_invisible_node_overlay.png",
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
		if not minetest.find_node_near(pos, 1, "x_farming:kiwi_leaves") then
			minetest.remove_node(pos)
		elseif minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "x_farming:kiwi"})
		end
	end
})

minetest.register_node("x_farming:kiwi_fruit", {
	description = "Kiwi" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 2"),
	drawtype = "plantlike",
	visual_scale = 0.5,
	tiles = {"x_farming_kiwi_fruit.png"},
	inventory_image = "x_farming_kiwi_fruit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "x_farming:kiwi", param2 = 1})
	end,
})

-- leafdecay

default.register_leafdecay({
	trunks = {"x_farming:kiwi_tree"},
	leaves = {"x_farming:kiwi", "x_farming:kiwi_leaves"},
	radius = 3,
})

-- planks
minetest.register_node("x_farming:kiwi_wood", {
	description = "Kiwi Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"x_farming_kiwi_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "x_farming:kiwi_wood 4",
	recipe = {
		{"x_farming:kiwi_tree"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:kiwi_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:kiwi_tree",
	burntime = 22,
})

if minetest.global_exists("stairs") and minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab(
		"kiwi_wood",
		"x_farming:kiwi_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"x_farming_kiwi_wood.png"},
		"Kiwi Wooden Stair",
		"Kiwi Wooden Slab",
		default.node_sound_wood_defaults(),
		false
	)
end
