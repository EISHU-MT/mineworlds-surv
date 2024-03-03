-- COFFEE
farming.register_plant("x_farming:coffee", {
	description = "Coffee Seed",
	paramtype2 = "meshoptions",
	inventory_image = "x_farming_coffee_seed.png",
	steps = 5,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- hot cup of coffee
local coffee_cup_hot_desc = "Hot Cup of Coffee" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 6")

if x_farming.hbhunger ~= nil then
	coffee_cup_hot_desc = coffee_cup_hot_desc .. "\n" .. minetest.colorize(x_farming.colors.red, "Heal: 4")
end

minetest.register_node("x_farming:coffee_cup_hot", {
	description = coffee_cup_hot_desc,
	drawtype = "plantlike",
	tiles = {"x_farming_coffee_cup_hot.png"},
	inventory_image = "x_farming_coffee_cup_hot.png",
	wield_image = "x_farming_coffee_cup_hot.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.25, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	on_use = minetest.item_eat(6),
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_decoration({
	name = "x_farming:coffee_5",
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
	decoration = "x_farming:coffee_5",
	param2 = 3,
})
