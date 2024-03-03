-- SOYBEAN
farming.register_plant("x_farming:soybean", {
	description = "Soybean Seed",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_soybean_seed.png",
	steps = 7,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

minetest.register_craftitem("x_farming:bottle_soymilk", {
	description = "Soymilk Bottle",
	tiles = {"x_farming_bottle_soymilk.png"},
	inventory_image = "x_farming_bottle_soymilk.png",
	wield_image = "x_farming_bottle_soymilk.png",
	groups = {vessel = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craftitem("x_farming:bottle_soymilk_raw", {
	description = "Raw Soymilk Bottle",
	tiles = {"x_farming_bottle_soymilk_raw.png"},
	inventory_image = "x_farming_bottle_soymilk_raw.png",
	wield_image = "x_farming_bottle_soymilk_raw.png",
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "x_farming:bottle_soymilk_raw",
	recipe = {"x_farming:soybean", "x_farming:soybean", "x_farming:soybean", "x_farming:soybean", "x_farming:soybean", "x_farming:bottle_water"}
})

minetest.register_craft({
	type="cooking",
	output = "x_farming:bottle_soymilk",
	recipe = "x_farming:bottle_soymilk_raw",
	cooktime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:soybean",
	burntime = 1,
})

minetest.register_decoration({
	name = "x_farming:soybean_7",
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
	decoration = "x_farming:soybean_7",
	param2 = 3,
})
