--
-- Crafting recipes & items
--

-- Cocoa
minetest.register_craft( {
	output = "dye:brown",
	recipe = {
		{ "x_farming:cocoa_bean" },
	}
})

minetest.register_craftitem("x_farming:cookie", {
	description = "Cookie" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 2"),
	inventory_image = "x_farming_cookie.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft( {
	type = "shapeless",
	output = "x_farming:cookie 8",
	recipe = {"farming:wheat", "x_farming:cocoa_bean", "farming:flour", "x_farming:bottle_soymilk", "x_farming:sugar" }
})

minetest.register_craftitem("x_farming:chocolate", {
	description = "Chocolate" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 3"),
	inventory_image = "x_farming_chocolate.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craft( {
	output = "x_farming:chocolate",
	recipe = {
		{"", "", "x_farming:cocoa_bean"},
		{"", "x_farming:cocoa_bean", ""},
		{"default:paper", "", ""},
	}
})

-- Soup Bowl
minetest.register_craftitem("x_farming:bowl", {
	description = "Empty Soup Bowl",
	inventory_image = "x_farming_bowl.png",
})

minetest.register_craft({
	output = "x_farming:bowl 3",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""}
	}
})

-- Hog Stew
minetest.register_craftitem("x_farming:hog_stew", {
	description = "Hog Stew" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 8"),
	inventory_image = "x_farming_hog_stew.png",
	on_use = minetest.item_eat(8, "x_farming:bowl"),
})

minetest.register_craft({
	output = "x_farming:hog_stew",
	recipe = {
		{"", "mobs:pork_raw", ""},
		{"x_farming:carrot", "x_farming:bakedpotato", "flowers:mushroom_brown"},
		{"", "x_farming:bowl", ""}
	}
})

minetest.register_craft({
	output = "x_farming:hog_stew",
	recipe = {
		{"", "mobs:pork_raw", ""},
		{"x_farming:carrot", "x_farming:bakedpotato", "flowers:mushroom_red"},
		{"", "x_farming:bowl", ""}
	}
})

-- Beetroot
minetest.register_craftitem("x_farming:beetroot_soup", {
	description = "Beetroot Soup" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 6"),
	inventory_image = "x_farming_beetroot_soup.png",
	on_use = minetest.item_eat(6, "x_farming:bowl"),
})

minetest.register_craft({
	output = "x_farming:beetroot_soup",
	recipe = {
		{"x_farming:beetroot", "x_farming:beetroot", "x_farming:beetroot"},
		{"x_farming:beetroot", "x_farming:beetroot", "x_farming:beetroot"},
		{"", "x_farming:bowl", ""}
	}
})

-- Carrot
local golden_carrot_desc = "Golden Carrot" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 10")

if x_farming.hbhunger ~= nil then
	golden_carrot_desc = golden_carrot_desc .. "\n" .. minetest.colorize(x_farming.colors.red, "Heal: 10")
end

minetest.register_craftitem("x_farming:carrot_golden", {
	description = golden_carrot_desc,
	inventory_image = "x_farming_carrot_golden.png",
	wield_image = "x_farming_carrot_golden.png^[transformR270",
	on_use = minetest.item_eat(10),
})

minetest.register_craft({
	output = "x_farming:carrot_golden",
	recipe = {
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"},
		{"default:gold_lump", "x_farming:carrot", "default:gold_lump"},
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"}
	},
})

-- Coffee
minetest.register_craftitem("x_farming:bottle_coffee", {
	description = "Coffee Bottle",
	tiles = {"x_farming_bottle_coffee.png"},
	inventory_image = "x_farming_bottle_coffee.png",
	wield_image = "x_farming_bottle_coffee.png",
	groups = {vessel = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "x_farming:bottle_coffee",
	recipe = {"x_farming:coffee","x_farming:bottle_water"}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 7,
	output = "x_farming:coffee_cup_hot",
	recipe = "x_farming:bottle_coffee",
	replacements = {{"x_farming:bottle_coffee", "vessels:glass_bottle"}}
})

-- backwards compatibility
minetest.register_alias("x_farming:coffee_cup", "x_farming:bottle_coffee")

-- Corn
minetest.register_craftitem("x_farming:corn_pop", {
	description = "Popped corn" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 1"),
	inventory_image = "x_farming_corn_pop.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craft( {
	type = "cooking",
	cooktime = 10,
	output = "x_farming:corn_pop",
	recipe = "x_farming:corn"
})

minetest.register_craft( {
	output = "x_farming:corn_popcorn",
	recipe = {
		{"x_farming:corn_pop", "x_farming:corn_pop","x_farming:corn_pop"},
		{"default:paper", "x_farming:salt","default:paper"},
		{"default:paper", "default:paper","default:paper"},
	}
})

-- Melon
local golden_melon_desc = "Golden Melon" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 10")

if x_farming.hbhunger ~= nil then
	golden_melon_desc = golden_melon_desc .. "\n" .. minetest.colorize(x_farming.colors.red, "Heal: 10")
end

minetest.register_craftitem("x_farming:golden_melon", {
	description = golden_melon_desc,
	inventory_image = "x_farming_golden_melon.png",
	wield_image = "x_farming_golden_melon.png^[transformR90",
	on_use = minetest.item_eat(10),
})

minetest.register_craft({
	output = "x_farming:golden_melon",
	recipe = {
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"},
		{"default:gold_lump", "x_farming:melon", "default:gold_lump"},
		{"default:gold_lump", "default:gold_lump", "default:gold_lump"}
	},
})

minetest.register_craft({
	output = "x_farming:melon_block",
	recipe = {
		{"x_farming:melon", "x_farming:melon", "x_farming:melon"},
		{"x_farming:melon", "x_farming:melon", "x_farming:melon"},
		{"x_farming:melon", "x_farming:melon", "x_farming:melon"}
	},
})

-- Obsidian Wart
minetest.register_craftitem("x_farming:wart_brick", {
	description = "Wart Brick",
	inventory_image = "x_farming_wart_brick.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "x_farming:wart_brick",
	recipe = "x_farming:obsidian_wart"
})

minetest.register_craft({
	output = "x_farming:wart_block",
	recipe = {
		{"x_farming:obsidian_wart", "x_farming:obsidian_wart", "x_farming:obsidian_wart"},
		{"x_farming:obsidian_wart", "x_farming:obsidian_wart", "x_farming:obsidian_wart"},
		{"x_farming:obsidian_wart", "x_farming:obsidian_wart", "x_farming:obsidian_wart"}
	}
})

minetest.register_craft({
	output = "x_farming:wart_brick_block",
	recipe = {
		{"x_farming:wart_brick", "x_farming:wart_brick", ""},
		{"x_farming:wart_brick", "x_farming:wart_brick", ""}
	}
})

minetest.register_craft({
	output = "x_farming:wart_red_brick_block",
	recipe = {
		{"x_farming:obsidian_wart", "x_farming:wart_brick", ""},
		{"x_farming:wart_brick", "x_farming:obsidian_wart", ""}
	},
})

minetest.register_craft({
	output = "x_farming:wartrack 4",
	recipe = {
		{"x_farming:wart_block", "x_farming:wart_block", ""},
		{"x_farming:wart_block", "x_farming:wart_block", ""}
	},
})

-- Potato
minetest.register_craftitem("x_farming:bakedpotato", {
	description = "Baked Potato" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 6"),
	inventory_image = "x_farming_potato_baked.png",
	on_use = minetest.item_eat(6),
})

local poisonouspotato_desc = "Poisonous Potato" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: -6")

if x_farming.hbhunger ~= nil then
	poisonouspotato_desc = poisonouspotato_desc .. "\n" .. minetest.colorize(x_farming.colors.green, "Poison: 5")
end

minetest.register_craftitem("x_farming:poisonouspotato", {
	description = poisonouspotato_desc,
	inventory_image = "x_farming_potato_poisonous.png",
	on_use = minetest.item_eat(-6),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "x_farming:bakedpotato",
	recipe = "x_farming:potato"
})

-- Pumpkin
-- pumpkin lantern recipe
minetest.register_craft({
	output = "x_farming:pumpkin_lantern",
	recipe = {
		{"", "", ""},
		{"", "x_farming:pumpkin_block", ""},
		{"", "default:torch", ""}
	},
})

-- crafted item from recipe
minetest.register_craftitem("x_farming:pumpkin_pie", {
	description = "Pumpkin Pie" .. "\n" .. minetest.colorize(x_farming.colors.brown, "Hunger: 6"),
	inventory_image = "x_farming_pumpkin_pie.png",
	on_use = minetest.item_eat(6),
})

-- pumpkin pie crafting recipe
minetest.register_craft({
	type = "shapeless",
	output = "x_farming:pumpkin_pie",
	recipe = {"x_farming:pumpkin_block", "farming:flour", "x_farming:bottle_soymilk", "x_farming:sugar"}
})

-- pumpkin as fuel (better than cactus)
minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:pumpkin_block",
	burntime = 20,
})

minetest.register_craft({
	type = "fuel",
	recipe = "x_farming:pumpkin_lantern",
	burntime = 20,
})

-- Bottle Water
minetest.register_craftitem("x_farming:bottle_water", {
	description = "Water Bottle",
	tiles = {"x_farming_bottle_water.png"},
	inventory_image = "x_farming_bottle_water.png",
	wield_image = "x_farming_bottle_water.png",
	groups = {vessel = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "x_farming:bottle_water 5",
	recipe = {"vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle", "vessels:glass_bottle", "bucket:bucket_water"},
	replacements = {{"bucket:water_bucket", "bucket:bucket_empty"}},
})

-- Donuts
minetest.register_craft({
	type = "shapeless",
	output = "x_farming:donut",
	recipe = {"x_farming:bottle_soymilk", "x_farming:sugar", "farming:flour"}
})

minetest.register_craft({
	type = "shapeless",
	output = "x_farming:donut_chocolate",
	recipe = {"x_farming:bottle_soymilk", "x_farming:sugar", "farming:flour", "x_farming:cocoa_bean"}
})

-- Fries

minetest.register_craft({
	output = "x_farming:fries",
	recipe = {
		{"", "", "x_farming:salt"},
		{"", "x_farming:bakedpotato", ""},
		{"default:paper", "", ""}
	},
})

-- Ice Fishing

minetest.register_craft({
	output = "x_farming:seed_icefishing",
	recipe = {
		{"group:wool", "farming:string", "group:stick"},
		{"", "farming:string", "group:stick"},
		{"", "farming:string", "group:stick"}
	},
})

minetest.register_craft({
	output = "dye:black 4",
	recipe = {
		{"x_farming:black_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:blue 4",
	recipe = {
		{"x_farming:blue_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:brown 4",
	recipe = {
		{"x_farming:brown_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:cyan 4",
	recipe = {
		{"x_farming:cyan_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:dark_grey 4",
	recipe = {
		{"x_farming:gray_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:grey 4",
	recipe = {
		{"x_farming:light_gray_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:dark_green 4",
	recipe = {
		{"x_farming:green_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:green 4",
	recipe = {
		{"x_farming:lime_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:magenta 4",
	recipe = {
		{"x_farming:magenta_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:orange 4",
	recipe = {
		{"x_farming:orange_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:pink 4",
	recipe = {
		{"x_farming:pink_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:violet 4",
	recipe = {
		{"x_farming:purple_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:red 4",
	recipe = {
		{"x_farming:red_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:white 4",
	recipe = {
		{"x_farming:white_seashroom"}
	}
})

minetest.register_craft({
	output = "dye:yellow 4",
	recipe = {
		{"x_farming:yellow_seashroom"}
	}
})

minetest.register_craft({
	output = "default:diamond",
	recipe = {
		{"x_farming:diamond_angler"}
	}
})

minetest.register_craft({
	output = "default:gold_lump",
	recipe = {
		{"x_farming:goldfish"}
	}
})

minetest.register_craft({
	output = "default:gold_ingot",
	recipe = {
		{"x_farming:true_goldfish"}
	}
})

minetest.register_craft({
	output = "default:iron_lump",
	recipe = {
		{"x_farming:ironfish"}
	}
})

minetest.register_craft({
	output = "x_farming:seed_pumpkin",
	recipe = {
		{"x_farming:pumpkinseed"}
	}
})
