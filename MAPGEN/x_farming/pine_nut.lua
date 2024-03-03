-- decoration
minetest.register_decoration({
	name = "x_farming:pine_nut_tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	sidelen = 16,
	noise_params = {
		offset = 0.010,
		scale = 0.005,
		spread = {x = 100, y = 100, z = 100},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"taiga", "coniferous_forest"},
	y_max = 31000,
	y_min = 4,
	schematic = minetest.get_modpath("x_farming") .. "/schematics/x_farming_pine_nut_tree.mts",
	flags = "place_center_x, place_center_z"
})

-- trunk
minetest.register_node("x_farming:pine_nut_tree", {
	description = "Pine Nut Tree",
	tiles = {"x_farming_pine_nut_tree_top.png", "x_farming_pine_nut_tree_top.png", "x_farming_pine_nut_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

-- leaves
minetest.register_node("x_farming:pine_nut_leaves", {
	description = "Pine Nut Needles",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"x_farming_pine_nut_leaves.png"},
	special_tiles = {"x_farming_pine_nut_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {"x_farming:pine_nut_sapling"},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {"x_farming:pine_nut_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

-- sapling
minetest.register_node("x_farming:pine_nut_sapling", {
	description = "Pine Nut Sapling",
	drawtype = "plantlike",
	tiles = {"x_farming_pine_nut_sapling.png"},
	inventory_image = "x_farming_pine_nut_sapling.png",
	wield_image = "x_farming_pine_nut_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = x_farming.grow_pine_nut_tree,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"x_farming:pine_nut_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 8, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
})

-- fruit
minetest.register_node("x_farming:pine_nut", {
	description = "Pine Nut",
	drawtype = "plantlike",
	tiles = {"x_farming_pine_nut.png"},
	inventory_image = "x_farming_pine_nut.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {
			-4 / 16,
			-5 / 16,
			-4 / 16,
			4 / 16,
			7 / 16,
			4 / 16
		}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "x_farming:pine_nut", param2 = 1})
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if oldnode.param2 == 0 then
			minetest.set_node(pos, {name = "x_farming:pine_nut_mark"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end
	end,
})

minetest.register_craftitem("x_farming:pine_nut_roasted", {
	description = "Pine Nut Roasted" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 2"),
	inventory_image = "x_farming_pine_nut_roasted.png",
	on_use = minetest.item_eat(2),
	groups = {flammable = 2},
})

minetest.register_node("x_farming:pine_nut_mark", {
	description = "Pine Nut Marker",
	inventory_image = "x_farming:pine_nut.png^default_invisible_node_overlay.png",
	wield_image = "x_farming:pine_nut.png^default_invisible_node_overlay.png",
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
		if not minetest.find_node_near(pos, 1, "x_farming:pine_nut_leaves") then
			minetest.remove_node(pos)
		elseif minetest.get_node_light(pos) < 11 then
			minetest.get_node_timer(pos):start(200)
		else
			minetest.set_node(pos, {name = "x_farming:pine_nut"})
		end
	end
})

-- leafdecay

default.register_leafdecay({
	trunks = {"x_farming:pine_nut_tree"},
	leaves = {"x_farming:pine_nut", "x_farming:pine_nut_leaves"},
	radius = 3,
})

-- planks
minetest.register_node("x_farming:pine_nut_wood", {
	description = "Pine Nut Wood Planks",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"x_farming_pine_nut_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_craft({
	output = "x_farming:pine_nut_wood 4",
	recipe = {
		{"x_farming:pine_nut_tree"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:pine_nut_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:pine_nut_tree",
	burntime = 26,
})

minetest.register_craft({
	type = "cooking",
	cooktime = 7,
	output = "x_farming:pine_nut_roasted",
	recipe = "x_farming:pine_nut"
})

if minetest.global_exists("stairs") and minetest.get_modpath("stairs") then
	stairs.register_stair_and_slab(
		"pine_nut_wood",
		"x_farming:pine_nut_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"x_farming_pine_nut_wood.png"},
		"Pine Nut Wooden Stair",
		"Pine Nut Wooden Slab",
		default.node_sound_wood_defaults(),
		false
	)
end
