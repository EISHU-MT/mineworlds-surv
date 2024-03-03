-- how often a growth failure tick is retried (e.g. too dark)
local function tick_again(pos)
	minetest.get_node_timer(pos):start(math.random(80, 160))
end

-- SALT
minetest.register_craftitem("x_farming:salt", {
	description = "Salt",
	tiles = {"x_farming_salt.png"},
	inventory_image = "x_farming_salt.png",
	wield_image = "x_farming_salt.png"
})

minetest.register_node("x_farming:seed_salt", {
	description = "Salty Water (plant on wet soil)",
	tiles = {"x_farming_salt_water.png"},
	inventory_image = "x_farming_salt_water.png",
	wield_image = "x_farming_salt_water.png",
	fertility = {"grassland"},
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_1_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {seed = 1, snappy = 3, flammable = 2, plant = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_1",
	on_timer = farming.grow_plant,

	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local udef = minetest.registered_nodes[node.name]
		if udef and udef.on_rightclick and
				not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		return farming.place_seed(itemstack, placer, pointed_thing, "x_farming:seed_salt")
	end,
})

-- 1
minetest.register_node("x_farming:salt_1", {
	description = "Salt 1",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_1_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 8},
			{items = {"x_farming:seed_salt"}, rarity = 8},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_2",
	on_timer = farming.grow_plant,
	minlight = 13,
	maxlight = 15
})

-- 2
minetest.register_node("x_farming:salt_2", {
	description = "Salt 2",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_2_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png",
		"x_farming_salt_1_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 7},
			{items = {"x_farming:seed_salt"}, rarity = 7},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_3",
	on_timer = farming.grow_plant,
	minlight = 13,
	maxlight = 15
})

-- 3
minetest.register_node("x_farming:salt_3", {
	description = "Salt 3",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_2_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_2_side.png",
		"x_farming_salt_2_side.png",
		"x_farming_salt_2_side.png",
		"x_farming_salt_2_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 6},
			{items = {"x_farming:seed_salt"}, rarity = 6},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.0625, -0.5, -0.0625, 0.0625, -0.25, 0.0625},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_4",
	on_timer = farming.grow_plant,
	minlight = 13,
	maxlight = 15
})

-- 4
minetest.register_node("x_farming:salt_4", {
	description = "Salt 4",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_3_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_2_side.png",
		"x_farming_salt_2_side.png",
		"x_farming_salt_2_side.png",
		"x_farming_salt_2_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 5},
			{items = {"x_farming:seed_salt"}, rarity = 5},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.0625, -0.5, -0.0625, 0.0625, -0.25, 0.0625},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_5",
	on_timer = farming.grow_plant,
	minlight = 13,
	maxlight = 15
})

-- 5
minetest.register_node("x_farming:salt_5", {
	description = "Salt 5",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_3_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_3_side.png",
		"x_farming_salt_3_side.png",
		"x_farming_salt_3_side.png",
		"x_farming_salt_3_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 4},
			{items = {"x_farming:seed_salt"}, rarity = 4},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.1875, -0.375, -0.1875, 0.1875, -0.25, 0.1875},
			{-0.0625, -0.25, -0.0625, 0.0625, -0.125, 0.0625},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_6",
	on_timer = farming.grow_plant,
	minlight = 13,
	maxlight = 15
})

-- 6
minetest.register_node("x_farming:salt_6", {
	description = "Salt 6",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_4_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_3_side.png",
		"x_farming_salt_3_side.png",
		"x_farming_salt_3_side.png",
		"x_farming_salt_3_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 3},
			{items = {"x_farming:seed_salt"}, rarity = 3},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.1875, -0.375, -0.1875, 0.1875, -0.25, 0.1875},
			{-0.0625, -0.25, -0.0625, 0.0625, -0.125, 0.0625},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	next_plant = "x_farming:salt_7",
	on_timer = farming.grow_plant,
	minlight = 13,
	maxlight = 15
})

-- 7
minetest.register_node("x_farming:salt_7", {
	description = "Salt 7",
	drawtype = "nodebox",
	tiles = {
		"x_farming_salt_4_top.png",
		"x_farming_salt_1_bottom.png",
		"x_farming_salt_4_side.png",
		"x_farming_salt_4_side.png",
		"x_farming_salt_4_side.png",
		"x_farming_salt_4_side.png"
	},
	paramtype = "light",
	sunlight_propagates = true,
	on_rotate = screwdriver.disallow,
	is_ground_content = false,
	walkable = false,
	buildable_to = true,
	drop = {
		items = {
			{items = {"x_farming:salt"}, rarity = 1},
			{items = {"x_farming:salt"}, rarity = 2},
			{items = {"x_farming:seed_salt"}, rarity = 1},
			{items = {"x_farming:seed_salt"}, rarity = 2},
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.3125, -0.5, -0.3125, 0.3125, -0.25, 0.3125},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.125, 0.1875},
			{-0.0625, -0.5, -0.0625, 0.0625, 0, 0.0625},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5},
		},
	},
	groups = {snappy = 3, flammable = 2, plant = 1, not_in_creative_inventory = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	minlight = 13,
	maxlight = 15
})

-- replacement LBM for pre-nodetimer plants
minetest.register_lbm({
	name = "x_farming:start_nodetimer_salt",
	nodenames = {
		"x_farming:seed_salt",
		"x_farming:salt_1",
		"x_farming:salt_2",
		"x_farming:salt_3",
		"x_farming:salt_4",
		"x_farming:salt_5",
		"x_farming:salt_6",
	},
	action = function(pos, node)
		tick_again(pos)
	end,
})

minetest.register_decoration({
	name = "x_farming:salt_7",
	deco_type = "schematic",
	place_on = {"default:dirt", "default:dry_dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"rainforest_swamp", "savanna_shore"},
	y_max = 0,
	y_min = 0,
	schematic = minetest.get_modpath("x_farming") .. "/schematics/x_farming_salt_decor.mts",
})
