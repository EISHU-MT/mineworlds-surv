local minlight = 0
local maxlight = default.LIGHT_MAX

-- OBSIDIAN WART
farming.register_plant("x_farming:obsidian_wart", {
	description = "Obsidian Wart Seed" .. "\n" .. "Plant on Obsidian",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_obsidian_wart_seed.png",
	steps = 6,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"underground"},
	groups = {flammable = 4},
	place_param2 = 3
})

-- default obsidian
minetest.override_item("default:obsidian", {
	groups = {cracky = 1, level = 2, soil = 1, underground = 1},
	soil = {
		base = "default:obsidian",
		dry = "x_farming:obsidian_soil",
		wet = "x_farming:obsidian_soil_wet"
	}
})

-- obsidian - soil
minetest.register_node("x_farming:obsidian_soil", {
	description = "Obsidian Soil",
	drop = "default:obsidian",
	tiles = {"x_farming_obsidian_soil.png", "default_obsidian.png"},
	groups = {cracky = 1, level = 2, soil = 2, underground = 1, field = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	soil = {
		base = "default:obsidian",
		dry = "x_farming:obsidian_soil",
		wet = "x_farming:obsidian_soil_wet"
	}
})

-- obsidian - soil - wet
minetest.register_node("x_farming:obsidian_soil_wet", {
	description = "Wet Obsidian Soil",
	drop = "default:obsidian",
	tiles = {"x_farming_obsidian_soil_wet.png", "x_farming_obsidian_soil_wet_side.png"},
	groups = {cracky = 1, level = 2, soil = 3, wet = 1, underground = 1, field = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults(),
	soil = {
		base = "default:obsidian",
		dry = "x_farming:obsidian_soil",
		wet = "x_farming:obsidian_soil_wet"
	}
})

--
-- Nodes
--
minetest.register_node("x_farming:wart_block", {
	description = "Wart Block",
	tiles = {"x_farming_wart_block.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("x_farming:wartrack", {
	description = "Wartrack",
	tiles = {"x_farming_wartrack.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("x_farming:wart_brick_block", {
	description = "Wart Brick Block",
	tiles = {"x_farming_wart_brick_block.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("x_farming:wart_red_brick_block", {
	description = "Wart Red Brick Block",
	tiles = {"x_farming_wart_red_brick_block.png"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults()
})

--
-- Register Wart stairs and slabs
--
stairs.register_stair_and_slab(
	"wart_block",
	"x_farming:wart_block",
	{cracky = 3},
	{"x_farming_wart_block.png"},
	"Wart Block Stair",
	"Wart Block Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"wart_brick_block",
	"x_farming:wart_brick_block",
	{cracky = 2},
	{"x_farming_wart_brick_block.png"},
	"Wart Brick Stair",
	"Wart Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"wart_red_brick_block",
	"x_farming:wart_red_brick_block",
	{cracky = 2},
	{"x_farming_wart_red_brick_block.png"},
	"Wart Red Brick Stair",
	"Wart Red Brick Slab",
	default.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"wartrack",
	"x_farming:wartrack",
	{cracky = 3},
	{"x_farming_wartrack.png"},
	"Wartrack Stair",
	"Wartrack Slab",
	default.node_sound_stone_defaults()
)


minetest.register_node("x_farming:obsidian_wart_decor", {
	description = "Obsidian Wart",
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_obsidian.png"},
	special_tiles = {{name = "x_farming_obsidian_wart_6.png", tileable_vertical = true}},
	inventory_image = "x_farming_obsidian_wart_6.png",
	groups = {snappy = 3, not_in_creative_inventory = 1},
	light_source = 3,
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:obsidian",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),
	drop = {
		items = {
			{items = {"x_farming:obsidian_wart"}, rarity = 1},
			{items = {"x_farming:obsidian_wart"}, rarity = 2},
			{items = {"x_farming:seed_obsidian_wart"}, rarity = 1},
			{items = {"x_farming:seed_obsidian_wart"}, rarity = 2}
		}
	},

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:obsidian"})
	end,
})

minetest.register_decoration({
	name = "x_farming:obsidian_wart_decor",
	deco_type = "simple",
	place_offset_y = -1,
	place_on = {"default:stone"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"icesheet_under", "tundra_under", "taiga_under", "snowy_grassland_under", "grassland_under", "coniferous_forest_under", "deciduous_forest_under", "desert_under", "sandstone_desert_under", "cold_desert_under", "savanna_under", "rainforest_under"},
	y_max = -1000,
	y_min = -31000,
	flags = "force_placement, all_floors",
	decoration = {"x_farming:obsidian_wart_decor"},
})
