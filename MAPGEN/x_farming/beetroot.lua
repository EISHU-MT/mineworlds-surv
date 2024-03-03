local minlight = 13
local maxlight = default.LIGHT_MAX

-- beetroot
farming.register_plant("x_farming:beetroot", {
	description = "Beetroot Seed",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_beetroot_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
	on_use = minetest.item_eat(3),
})

-- needed
minetest.override_item("x_farming:beetroot", {
	description = "Beetroot" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 3"),
	on_use = minetest.item_eat(3),
})

minetest.register_decoration({
	name = "x_farming:beetroot_8",
	deco_type = "simple",
	place_on = {"default:silver_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"cold_desert"},
	y_max = 31000,
	y_min = 1,
	decoration = "x_farming:beetroot_8",
	param2 = 3,
})