-- STRAWBERRY
farming.register_plant("x_farming:strawberry", {
	description = "Strawberry Seed",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_strawberry_seed.png",
	steps = 4,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 0
})

-- needed
minetest.override_item("x_farming:strawberry", {
	description = "Strawberry" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 2"),
	on_use = minetest.item_eat(2),
})

-- decorations
for length = 1, 4 do
	minetest.register_decoration({
		name = "x_farming:strawberry_"..length,
		deco_type = "simple",
		place_on = {"default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 2,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"coniferous_forest"},
		y_max = 30,
		y_min = 1,
		decoration = "x_farming:strawberry_"..length,
	})
end