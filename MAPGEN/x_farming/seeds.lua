-- Register farming items as dungeon loot
if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register({
		{name = "x_farming:seed_obsidian_wart", chance = 0.3, count = {1, 2}},
		{name = "x_farming:seed_pumpkin", chance = 0.4, count = {1, 4}},
		{name = "x_farming:seed_beetroot", chance = 0.4, count = {1, 4}},
		{name = "x_farming:seed_carrot", chance = 0.4, count = {1, 4}},
		{name = "x_farming:seed_potato", chance = 0.4, count = {1, 4}},
		{name = "x_farming:seed_coffee", chance = 0.4, count = {1, 4}},
		{name = "x_farming:seed_corn", chance = 0.4, count = {1, 4}},
		{name = "x_farming:seed_melon", chance = 0.4, count = {1, 4}},
		{name = "x_farming:cocoa_bean", chance = 0.4, count = {1, 4}},
		{name = "x_farming:large_cactus_with_fruit_seedling", chance = 0.4, count = {1, 1}},
		{name = "x_farming:kiwi_sapling", chance = 0.4, count = {1, 1}},
		{name = "x_farming:seed_strawberry", chance = 0.4, count = {1, 4}},
	})
end