-- STEVIA
farming.register_plant("x_farming:stevia", {
	description = "Stevia Seed",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_stevia_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 4,
})

minetest.register_craftitem("x_farming:sugar", {
	description = "Sugar",
	inventory_image = "x_farming_sugar.png",
	groups = {flammable = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "x_farming:sugar",
	recipe = {"x_farming:stevia", "x_farming:stevia", "x_farming:stevia", "x_farming:stevia"}
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:stevia",
	burntime = 1,
})

minetest.register_decoration({
	name = "x_farming:stevia_8",
	deco_type = "simple",
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"savanna"},
	y_max = 31000,
	y_min = 1,
	decoration = "x_farming:stevia_8",
	param2 = 4,
})
