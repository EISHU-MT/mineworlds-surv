local minlight = 13
local maxlight = default.LIGHT_MAX

-- carrot
farming.register_plant("x_farming:carrot", {
	description = "Planting Carrot",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_carrot_seed.png",
	steps = 8,
	minlight = minlight,
	maxlight = maxlight,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
	on_use = minetest.item_eat(3),
})

-- needed
minetest.override_item("x_farming:carrot", {
	description = "Carrot" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 3"),
	on_use = minetest.item_eat(3),
})

minetest.register_decoration({
	name = "x_farming:carrot_8",
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"grassland"},
	y_max = 31000,
	y_min = 1,
	decoration = "x_farming:carrot_8",
	param2 = 3,
})
