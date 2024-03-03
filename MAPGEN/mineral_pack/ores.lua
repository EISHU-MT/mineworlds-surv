--- cobalt

minetest.register_node("mineral_pack:cobalt_ore", {
	description = "Cobalt ore",
	tiles = {"default_stone.png^mineral_pack_cobalt_ore.png"},
	groups = {cracky = 2, ore = 1},
	drop = 'mineral_pack:cobalt_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:cobalt_lump", {
	description = "Cobalt Lump",
	inventory_image = "mineral_pack_cobalt_lump.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:cobalt_ore",
		wherein        = "default:stone",
		clust_scarcity = 25 * 25 * 25,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -40,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:cobalt_ore",
		wherein        = "default:stone",
		clust_scarcity = 21 * 21 * 21,
		clust_num_ores = 6,
		clust_size     = 3,
		y_max          = -225,
		y_min          = -31000,
	})
--- amethyst

minetest.register_node("mineral_pack:amethyst_ore", {
	description = "Amethyst ore",
	tiles = {"default_stone.png^mineral_pack_amethyst_ore.png"},
	groups = {cracky = 2,ore = 1},
	drop = 'mineral_pack:amethyst',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:amethyst", {
	description = "Amethyst",
	inventory_image = "mineral_pack_amethyst.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:amethyst_ore",
		wherein        = "default:stone",
		clust_scarcity = 28 * 28 * 28,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -60,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:amethyst_ore",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -250,
		y_min          = -31000,
	})

--- spinel

minetest.register_node("mineral_pack:spinel_ore", {
	description = "Spinel ore",
	tiles = {"default_stone.png^mineral_pack_spinel_ore.png"},
	groups = {cracky = 2,ore = 1},
	drop = 'mineral_pack:spinel',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:spinel", {
	description = "Spinel",
	inventory_image = "mineral_pack_spinel.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:spinel_ore",
		wherein        = "default:stone",
		clust_scarcity = 30 * 30 * 30,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -80,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:spinel_ore",
		wherein        = "default:stone",
		clust_scarcity = 26 * 26 * 26,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -330,
		y_min          = -31000,
	})

--- topaz

minetest.register_node("mineral_pack:topaz_ore", {
	description = "Topaz ore",
	tiles = {"default_stone.png^mineral_pack_topaz_ore.png"},
	groups = {cracky = 2,ore = 1},
	drop = 'mineral_pack:topaz',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:topaz", {
	description = "Topaz",
	inventory_image = "mineral_pack_topaz.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:topaz_ore",
		wherein        = "default:stone",
		clust_scarcity = 31 * 30 * 31,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -85,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:topaz_ore",
		wherein        = "default:stone",
		clust_scarcity = 27 * 26 * 27,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -345,
		y_min          = -31000,
	})

--- ruby

minetest.register_node("mineral_pack:ruby_ore", {
	description = "ruby ore",
	tiles = {"default_stone.png^mineral_pack_ruby_ore.png"},
	groups = {cracky = 1,ore = 1},
	drop = 'mineral_pack:ruby',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:ruby", {
	description = "ruby",
	inventory_image = "mineral_pack_ruby.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:ruby_ore",
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -100,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:ruby_ore",
		wherein        = "default:stone",
		clust_scarcity = 28 * 28 * 28,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -400,
		y_min          = -31000,
	})

--- sapphire

minetest.register_node("mineral_pack:sapphire_ore", {
	description = "Sapphire ore",
	tiles = {"default_stone.png^mineral_pack_sapphire_ore.png"},
	groups = {cracky = 1,ore = 1},
	drop = 'mineral_pack:sapphire',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:sapphire", {
	description = "Sapphire",
	inventory_image = "mineral_pack_sapphire.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:sapphire_ore",
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -100,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:sapphire_ore",
		wherein        = "default:stone",
		clust_scarcity = 28 * 28 * 28,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -400,
		y_min          = -31000,
	})

--- emerald

minetest.register_node("mineral_pack:emerald_ore", {
	description = "Emerald ore",
	tiles = {"default_stone.png^mineral_pack_emerald_ore.png"},
	groups = {cracky = 1,ore = 1},
	drop = 'mineral_pack:emerald',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:emerald", {
	description = "Emerald",
	inventory_image = "mineral_pack_emerald.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:emerald_ore",
		wherein        = "default:stone",
		clust_scarcity = 31 * 31 * 31,
		clust_num_ores = 3,
		clust_size     = 3,
		y_max          = -90,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:emerald_ore",
		wherein        = "default:stone",
		clust_scarcity = 27 * 27 * 27,
		clust_num_ores = 5,
		clust_size     = 3,
		y_max          = -360,
		y_min          = -31000,
	})

--- titanium

minetest.register_node("mineral_pack:titanium_ore", {
	description = "titanium ore",
	tiles = {"default_stone.png^mineral_pack_titanium_ore.png"},
	groups = {cracky = 1,ore = 1},
	drop = 'mineral_pack:titanium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:titanium_lump", {
	description = "titanium Lump",
	inventory_image = "mineral_pack_titanium_lump.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:titanium_ore",
		wherein        = "default:stone",
		clust_scarcity = 21 * 21 * 21,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -65,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:titanium_ore",
		wherein        = "default:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 6,
		clust_size     = 3,
		y_max          = -325,
		y_min          = -31000,
	})

--- osmium

minetest.register_node("mineral_pack:osmium_ore", {
	description = "Osmium ore",
	tiles = {"default_stone.png^mineral_pack_osmium_ore.png"},
	groups = {cracky = 1,ore = 1},
	drop = 'mineral_pack:osmium_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:osmium_lump", {
	description = "Osmium Lump",
	inventory_image = "mineral_pack_osmium_lump.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:osmium_ore",
		wherein        = "default:stone",
		clust_scarcity = 34 * 34 * 34,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -80,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:osmium_ore",
		wherein        = "default:stone",
		clust_scarcity = 30 * 30 * 30,
		clust_num_ores = 6,
		clust_size     = 3,
		y_max          = -420,
		y_min          = -31000,
	})

--- platinum

minetest.register_node("mineral_pack:platinum_ore", {
	description = "Platinum ore",
	tiles = {"default_stone.png^mineral_pack_platinum_ore.png"},
	groups = {cracky = 1,ore = 1},
	drop = 'mineral_pack:platinum_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:platinum_lump", {
	description = "Platinum Lump",
	inventory_image = "mineral_pack_platinum_lump.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:platinum_ore",
		wherein        = "default:stone",
		clust_scarcity = 32 * 32 * 32,
		clust_num_ores = 4,
		clust_size     = 3,
		y_max          = -76,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:platinum_ore",
		wherein        = "default:stone",
		clust_scarcity = 29 * 29 * 29,
		clust_num_ores = 6,
		clust_size     = 3,
		y_max          = -400,
		y_min          = -31000,
	})

--- aluminum

minetest.register_node("mineral_pack:aluminum_ore", {
	description = "Aluminum ore",
	tiles = {"default_stone.png^mineral_pack_aluminum_ore.png"},
	groups = {cracky = 3,ore = 1},
	drop = 'mineral_pack:aluminum_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:aluminum_lump", {
	description = "Aluminum Lump",
	inventory_image = "mineral_pack_aluminum_lump.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:aluminum_ore",
		wherein        = "default:stone",
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 10,
		clust_size     = 4,
		y_max          = 31000,
		y_min          = -31000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:aluminum_ore",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 12,
		clust_size     = 4,
		y_max          = -45,
		y_min          = -31000,
	})

--- nickel

minetest.register_node("mineral_pack:nickel_ore", {
	description = "Nickel ore",
	tiles = {"default_stone.png^mineral_pack_nickel_ore.png"},
	groups = {cracky = 3,ore = 1},
	drop = 'mineral_pack:nickel_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("mineral_pack:nickel_lump", {
	description = "Nickel Lump",
	inventory_image = "mineral_pack_nickel_lump.png",
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:nickel_ore",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 10,
		clust_size     = 4,
		y_max          = 31000,
		y_min          = -20000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mineral_pack:nickel_ore",
		wherein        = "default:stone",
		clust_scarcity = 30 * 30 * 30,
		clust_num_ores = 12,
		clust_size     = 4,
		y_max          = -20000,
		y_min          = -31000,
	})




