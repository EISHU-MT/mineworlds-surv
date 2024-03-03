-- Donuts
minetest.register_node("x_farming:donut", {
	description = "Donut" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 3"),
	drawtype = "plantlike",
	tiles = {"x_farming_donut.png"},
	inventory_image = "x_farming_donut.png",
	wield_image = "x_farming_donut.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -7/16, -7/16, 7/16, 7/16, 7/16}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(3),
})

minetest.register_node("x_farming:donut_chocolate", {
	description = "Chocolate Donut" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 4"),
	drawtype = "plantlike",
	tiles = {"x_farming_donut_chocolate.png"},
	inventory_image = "x_farming_donut_chocolate.png",
	wield_image = "x_farming_donut_chocolate.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -7/16, -7/16, 7/16, 7/16, 7/16}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(4),
})

-- Fries
minetest.register_node("x_farming:fries", {
	description = "Fries" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 6"),
	drawtype = "plantlike",
	tiles = {"x_farming_fries.png"},
	inventory_image = "x_farming_fries.png",
	wield_image = "x_farming_fries.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -7/16, -7/16, 7/16, 7/16, 7/16}
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(6),
})