---- cobalt

minetest.register_craft({
	type = "cooking",
	output = "mineral_pack:cobalt_ingot",
	recipe = "mineral_pack:cobalt_lump",
})

minetest.register_craft({
	output = "mineral_pack:cobalt_block",
	recipe = {
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:cobalt_ingot 9",
	recipe = {
		{"mineral_pack:cobalt_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:cobalt_ingot",
	recipe = {
		{"mineral_pack:cobalt_nugget", "mineral_pack:cobalt_nugget", "mineral_pack:cobalt_nugget"},
		{"mineral_pack:cobalt_nugget", "mineral_pack:cobalt_nugget", "mineral_pack:cobalt_nugget"},
		{"mineral_pack:cobalt_nugget", "mineral_pack:cobalt_nugget", "mineral_pack:cobalt_nugget"},
	}
})

minetest.register_craft({
	output = "mineral_pack:cobalt_nugget 9",
	recipe = {
		{"mineral_pack:cobalt_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_cobalt",
	recipe = {
		{"", "mineral_pack:cobalt_ingot", ""},
		{"", "mineral_pack:cobalt_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_cobalt",
	recipe = {
		{"", "mineral_pack:cobalt_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", ""},
		{"mineral_pack:cobalt_ingot", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_cobalt",
	recipe = {
		{"", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"", "group:stick", "mineral_pack:cobalt_ingot"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "", "mineral_pack:cobalt_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "", "mineral_pack:cobalt_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "", "mineral_pack:cobalt_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_cobalt",
	recipe = {
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot", "mineral_pack:cobalt_ingot"},
		{"", "mineral_pack:cobalt_ingot", ""},
	}
})

---- nickel

minetest.register_craft({
	type = "cooking",
	output = "mineral_pack:nickel_ingot",
	recipe = "mineral_pack:nickel_lump",
})

minetest.register_craft({
	output = "mineral_pack:nickel_block",
	recipe = {
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:nickel_ingot 9",
	recipe = {
		{"mineral_pack:nickel_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:nickel_ingot",
	recipe = {
		{"mineral_pack:nickel_nugget", "mineral_pack:nickel_nugget", "mineral_pack:nickel_nugget"},
		{"mineral_pack:nickel_nugget", "mineral_pack:nickel_nugget", "mineral_pack:nickel_nugget"},
		{"mineral_pack:nickel_nugget", "mineral_pack:nickel_nugget", "mineral_pack:nickel_nugget"},
	}
})

minetest.register_craft({
	output = "mineral_pack:nickel_nugget 9",
	recipe = {
		{"mineral_pack:nickel_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_nickel",
	recipe = {
		{"", "mineral_pack:nickel_ingot", ""},
		{"", "mineral_pack:nickel_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_nickel",
	recipe = {
		{"", "mineral_pack:nickel_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", ""},
		{"mineral_pack:nickel_ingot", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_nickel",
	recipe = {
		{"", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"", "group:stick", "mineral_pack:nickel_ingot"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "", "mineral_pack:nickel_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "", "mineral_pack:nickel_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "", "mineral_pack:nickel_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_nickel",
	recipe = {
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot", "mineral_pack:nickel_ingot"},
		{"", "mineral_pack:nickel_ingot", ""},
	}
})


---- amethyst

minetest.register_craft({
	output = "mineral_pack:amethyst_block",
	recipe = {
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
	}
})

minetest.register_craft({
	output = "mineral_pack:amethyst 9",
	recipe = {
		{"mineral_pack:amethyst_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_amethyst",
	recipe = {
		{"", "mineral_pack:amethyst", ""},
		{"", "mineral_pack:amethyst", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_amethyst",
	recipe = {
		{"", "mineral_pack:amethyst", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "mineral_pack:amethyst", ""},
		{"mineral_pack:amethyst", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_amethyst",
	recipe = {
		{"", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"", "group:stick", "mineral_pack:amethyst"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "", "mineral_pack:amethyst"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "", "mineral_pack:amethyst"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "", "mineral_pack:amethyst"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_amethyst",
	recipe = {
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"mineral_pack:amethyst", "mineral_pack:amethyst", "mineral_pack:amethyst"},
		{"", "mineral_pack:amethyst", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:amethyst",
	recipe = {
		{"mineral_pack:amethyst_fragment", "mineral_pack:amethyst_fragment", "mineral_pack:amethyst_fragment"},
		{"mineral_pack:amethyst_fragment", "mineral_pack:amethyst_fragment", "mineral_pack:amethyst_fragment"},
		{"mineral_pack:amethyst_fragment", "mineral_pack:amethyst_fragment", "mineral_pack:amethyst_fragment"},
	}
})

minetest.register_craft({
	output = "mineral_pack:amethyst_fragment 9",
	recipe = {
		{"mineral_pack:amethyst"},
	}
})
---- spinel

minetest.register_craft({
	output = "mineral_pack:spinel_block",
	recipe = {
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
	}
})

minetest.register_craft({
	output = "mineral_pack:spinel 9",
	recipe = {
		{"mineral_pack:spinel_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_spinel",
	recipe = {
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_spinel",
	recipe = {
		{"", "mineral_pack:spinel", ""},
		{"", "mineral_pack:spinel", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_spinel",
	recipe = {
		{"", "mineral_pack:spinel", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_spinel",
	recipe = {
		{"mineral_pack:spinel", "mineral_pack:spinel", ""},
		{"mineral_pack:spinel", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_spinel",
	recipe = {
		{"", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"", "group:stick", "mineral_pack:spinel"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_spinel",
	recipe = {
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "", "mineral_pack:spinel"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_spinel",
	recipe = {
		{"mineral_pack:spinel", "", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "", "mineral_pack:spinel"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_spinel",
	recipe = {
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "", "mineral_pack:spinel"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_spinel",
	recipe = {
		{"mineral_pack:spinel", "", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_spinel",
	recipe = {
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"mineral_pack:spinel", "mineral_pack:spinel", "mineral_pack:spinel"},
		{"", "mineral_pack:spinel", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:spinel",
	recipe = {
		{"mineral_pack:spinel_fragment", "mineral_pack:spinel_fragment", "mineral_pack:spinel_fragment"},
		{"mineral_pack:spinel_fragment", "mineral_pack:spinel_fragment", "mineral_pack:spinel_fragment"},
		{"mineral_pack:spinel_fragment", "mineral_pack:spinel_fragment", "mineral_pack:spinel_fragment"},
	}
})

minetest.register_craft({
	output = "mineral_pack:spinel_fragment 9",
	recipe = {
		{"mineral_pack:spinel"},
	}
})

---- topaz

minetest.register_craft({
	output = "mineral_pack:topaz_block",
	recipe = {
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
	}
})

minetest.register_craft({
	output = "mineral_pack:topaz 9",
	recipe = {
		{"mineral_pack:topaz_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_topaz",
	recipe = {
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_topaz",
	recipe = {
		{"", "mineral_pack:topaz", ""},
		{"", "mineral_pack:topaz", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_topaz",
	recipe = {
		{"", "mineral_pack:topaz", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_topaz",
	recipe = {
		{"mineral_pack:topaz", "mineral_pack:topaz", ""},
		{"mineral_pack:topaz", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_topaz",
	recipe = {
		{"", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"", "group:stick", "mineral_pack:topaz"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_topaz",
	recipe = {
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "", "mineral_pack:topaz"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_topaz",
	recipe = {
		{"mineral_pack:topaz", "", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "", "mineral_pack:topaz"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_topaz",
	recipe = {
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "", "mineral_pack:topaz"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_topaz",
	recipe = {
		{"mineral_pack:topaz", "", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_topaz",
	recipe = {
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"mineral_pack:topaz", "mineral_pack:topaz", "mineral_pack:topaz"},
		{"", "mineral_pack:topaz", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:topaz",
	recipe = {
		{"mineral_pack:topaz_fragment", "mineral_pack:topaz_fragment", "mineral_pack:topaz_fragment"},
		{"mineral_pack:topaz_fragment", "mineral_pack:topaz_fragment", "mineral_pack:topaz_fragment"},
		{"mineral_pack:topaz_fragment", "mineral_pack:topaz_fragment", "mineral_pack:topaz_fragment"},
	}
})

minetest.register_craft({
	output = "mineral_pack:topaz_fragment 9",
	recipe = {
		{"mineral_pack:topaz"},
	}
})


---- ruby

minetest.register_craft({
	output = "mineral_pack:ruby_block",
	recipe = {
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
	}
})

minetest.register_craft({
	output = "mineral_pack:ruby 9",
	recipe = {
		{"mineral_pack:ruby_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_ruby",
	recipe = {
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_ruby",
	recipe = {
		{"", "mineral_pack:ruby", ""},
		{"", "mineral_pack:ruby", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_ruby",
	recipe = {
		{"", "mineral_pack:ruby", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_ruby",
	recipe = {
		{"mineral_pack:ruby", "mineral_pack:ruby", ""},
		{"mineral_pack:ruby", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_ruby",
	recipe = {
		{"", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"", "group:stick", "mineral_pack:ruby"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_ruby",
	recipe = {
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "", "mineral_pack:ruby"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_ruby",
	recipe = {
		{"mineral_pack:ruby", "", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "", "mineral_pack:ruby"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_ruby",
	recipe = {
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "", "mineral_pack:ruby"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_ruby",
	recipe = {
		{"mineral_pack:ruby", "", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_ruby",
	recipe = {
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"mineral_pack:ruby", "mineral_pack:ruby", "mineral_pack:ruby"},
		{"", "mineral_pack:ruby", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:ruby",
	recipe = {
		{"mineral_pack:ruby_fragment", "mineral_pack:ruby_fragment", "mineral_pack:ruby_fragment"},
		{"mineral_pack:ruby_fragment", "mineral_pack:ruby_fragment", "mineral_pack:ruby_fragment"},
		{"mineral_pack:ruby_fragment", "mineral_pack:ruby_fragment", "mineral_pack:ruby_fragment"},
	}
})

minetest.register_craft({
	output = "mineral_pack:ruby_fragment 9",
	recipe = {
		{"mineral_pack:ruby"},
	}
})


---- sapphire

minetest.register_craft({
	output = "mineral_pack:sapphire_block",
	recipe = {
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
	}
})

minetest.register_craft({
	output = "mineral_pack:sapphire 9",
	recipe = {
		{"mineral_pack:sapphire_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_sapphire",
	recipe = {
		{"", "mineral_pack:sapphire", ""},
		{"", "mineral_pack:sapphire", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_sapphire",
	recipe = {
		{"", "mineral_pack:sapphire", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "mineral_pack:sapphire", ""},
		{"mineral_pack:sapphire", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_sapphire",
	recipe = {
		{"", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"", "group:stick", "mineral_pack:sapphire"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "", "mineral_pack:sapphire"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "", "mineral_pack:sapphire"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "", "mineral_pack:sapphire"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_sapphire",
	recipe = {
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"mineral_pack:sapphire", "mineral_pack:sapphire", "mineral_pack:sapphire"},
		{"", "mineral_pack:sapphire", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sapphire",
	recipe = {
		{"mineral_pack:sapphire_fragment", "mineral_pack:sapphire_fragment", "mineral_pack:sapphire_fragment"},
		{"mineral_pack:sapphire_fragment", "mineral_pack:sapphire_fragment", "mineral_pack:sapphire_fragment"},
		{"mineral_pack:sapphire_fragment", "mineral_pack:sapphire_fragment", "mineral_pack:sapphire_fragment"},
	}
})

minetest.register_craft({
	output = "mineral_pack:sapphire_fragment 9",
	recipe = {
		{"mineral_pack:sapphire"},
	}
})

---- emerald

minetest.register_craft({
	output = "mineral_pack:emerald_block",
	recipe = {
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
	}
})

minetest.register_craft({
	output = "mineral_pack:emerald 9",
	recipe = {
		{"mineral_pack:emerald_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_emerald",
	recipe = {
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_emerald",
	recipe = {
		{"", "mineral_pack:emerald", ""},
		{"", "mineral_pack:emerald", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_emerald",
	recipe = {
		{"", "mineral_pack:emerald", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_emerald",
	recipe = {
		{"mineral_pack:emerald", "mineral_pack:emerald", ""},
		{"mineral_pack:emerald", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_emerald",
	recipe = {
		{"", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"", "group:stick", "mineral_pack:emerald"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_emerald",
	recipe = {
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "", "mineral_pack:emerald"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_emerald",
	recipe = {
		{"mineral_pack:emerald", "", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "", "mineral_pack:emerald"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_emerald",
	recipe = {
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "", "mineral_pack:emerald"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_emerald",
	recipe = {
		{"mineral_pack:emerald", "", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_emerald",
	recipe = {
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"mineral_pack:emerald", "mineral_pack:emerald", "mineral_pack:emerald"},
		{"", "mineral_pack:emerald", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:emerald",
	recipe = {
		{"mineral_pack:emerald_fragment", "mineral_pack:emerald_fragment", "mineral_pack:emerald_fragment"},
		{"mineral_pack:emerald_fragment", "mineral_pack:emerald_fragment", "mineral_pack:emerald_fragment"},
		{"mineral_pack:emerald_fragment", "mineral_pack:emerald_fragment", "mineral_pack:emerald_fragment"},
	}
})

minetest.register_craft({
	output = "mineral_pack:emerald_fragment 9",
	recipe = {
		{"mineral_pack:emerald"},
	}
})

---- titanium

minetest.register_craft({
	type = "cooking",
	cooktime = 30,
	output = "mineral_pack:titanium_nugget 5",
	recipe = "mineral_pack:titanium_lump",
})

minetest.register_craft({
	output = "mineral_pack:titanium_block",
	recipe = {
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:titanium_ingot 9",
	recipe = {
		{"mineral_pack:titanium_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:titanium_ingot",
	recipe = {
		{"mineral_pack:titanium_nugget", "mineral_pack:titanium_nugget", "mineral_pack:titanium_nugget"},
		{"mineral_pack:titanium_nugget", "mineral_pack:titanium_nugget", "mineral_pack:titanium_nugget"},
		{"mineral_pack:titanium_nugget", "mineral_pack:titanium_nugget", "mineral_pack:titanium_nugget"},
	}
})

minetest.register_craft({
	output = "mineral_pack:titanium_nugget 9",
	recipe = {
		{"mineral_pack:titanium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_titanium",
	recipe = {
		{"", "mineral_pack:titanium_ingot", ""},
		{"", "mineral_pack:titanium_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_titanium",
	recipe = {
		{"", "mineral_pack:titanium_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", ""},
		{"mineral_pack:titanium_ingot", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_titanium",
	recipe = {
		{"", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"", "group:stick", "mineral_pack:titanium_ingot"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "", "mineral_pack:titanium_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "", "mineral_pack:titanium_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "", "mineral_pack:titanium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_titanium",
	recipe = {
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot", "mineral_pack:titanium_ingot"},
		{"", "mineral_pack:titanium_ingot", ""},
	}
})

---- osmium

minetest.register_craft({
	type = "cooking",
	output = "mineral_pack:osmium_ingot",
	recipe = "mineral_pack:osmium_lump",
})

minetest.register_craft({
	output = "mineral_pack:osmium_block",
	recipe = {
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:osmium_ingot 9",
	recipe = {
		{"mineral_pack:osmium_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:osmium_ingot",
	recipe = {
		{"mineral_pack:osmium_nugget", "mineral_pack:osmium_nugget", "mineral_pack:osmium_nugget"},
		{"mineral_pack:osmium_nugget", "mineral_pack:osmium_nugget", "mineral_pack:osmium_nugget"},
		{"mineral_pack:osmium_nugget", "mineral_pack:osmium_nugget", "mineral_pack:osmium_nugget"},
	}
})

minetest.register_craft({
	output = "mineral_pack:osmium_nugget 9",
	recipe = {
		{"mineral_pack:osmium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_osmium",
	recipe = {
		{"", "mineral_pack:osmium_ingot", ""},
		{"", "mineral_pack:osmium_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_osmium",
	recipe = {
		{"", "mineral_pack:osmium_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", ""},
		{"mineral_pack:osmium_ingot", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_osmium",
	recipe = {
		{"", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"", "group:stick", "mineral_pack:osmium_ingot"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "", "mineral_pack:osmium_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "", "mineral_pack:osmium_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "", "mineral_pack:osmium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_osmium",
	recipe = {
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot", "mineral_pack:osmium_ingot"},
		{"", "mineral_pack:osmium_ingot", ""},
	}
})

---- platinum

minetest.register_craft({
	type = "cooking",
	output = "mineral_pack:platinum_ingot",
	recipe = "mineral_pack:platinum_lump",
})

minetest.register_craft({
	output = "mineral_pack:platinum_block",
	recipe = {
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:platinum_ingot 9",
	recipe = {
		{"mineral_pack:platinum_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:platinum_ingot",
	recipe = {
		{"mineral_pack:platinum_nugget", "mineral_pack:platinum_nugget", "mineral_pack:platinum_nugget"},
		{"mineral_pack:platinum_nugget", "mineral_pack:platinum_nugget", "mineral_pack:platinum_nugget"},
		{"mineral_pack:platinum_nugget", "mineral_pack:platinum_nugget", "mineral_pack:platinum_nugget"},
	}
})

minetest.register_craft({
	output = "mineral_pack:platinum_nugget 9",
	recipe = {
		{"mineral_pack:platinum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_platinum",
	recipe = {
		{"", "mineral_pack:platinum_ingot", ""},
		{"", "mineral_pack:platinum_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_platinum",
	recipe = {
		{"", "mineral_pack:platinum_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", ""},
		{"mineral_pack:platinum_ingot", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_platinum",
	recipe = {
		{"", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"", "group:stick", "mineral_pack:platinum_ingot"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "", "mineral_pack:platinum_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "", "mineral_pack:platinum_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "", "mineral_pack:platinum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_platinum",
	recipe = {
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot", "mineral_pack:platinum_ingot"},
		{"", "mineral_pack:platinum_ingot", ""},
	}
})


---- aluminum

minetest.register_craft({
	type = "cooking",
	cooktime = 20,
	output = "mineral_pack:aluminum_ingot",
	recipe = "mineral_pack:aluminum_lump",
})

minetest.register_craft({
	output = "mineral_pack:aluminum_block",
	recipe = {
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:aluminum_ingot 9",
	recipe = {
		{"mineral_pack:aluminum_block"},
	}
})

minetest.register_craft({
	output = "mineral_pack:aluminum_ingot",
	recipe = {
		{"mineral_pack:aluminum_nugget", "mineral_pack:aluminum_nugget", "mineral_pack:aluminum_nugget"},
		{"mineral_pack:aluminum_nugget", "mineral_pack:aluminum_nugget", "mineral_pack:aluminum_nugget"},
		{"mineral_pack:aluminum_nugget", "mineral_pack:aluminum_nugget", "mineral_pack:aluminum_nugget"},
	}
})

minetest.register_craft({
	output = "mineral_pack:aluminum_nugget 9",
	recipe = {
		{"mineral_pack:aluminum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:pick_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:sword_aluminum",
	recipe = {
		{"", "mineral_pack:aluminum_ingot", ""},
		{"", "mineral_pack:aluminum_ingot", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:shovel_aluminum",
	recipe = {
		{"", "mineral_pack:aluminum_ingot", ""},
		{"", "group:stick", ""},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:axe_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", ""},
		{"mineral_pack:aluminum_ingot", "group:stick", ""},
		{"", "group:stick", ""},
	}
})
minetest.register_craft({
	output = "mineral_pack:axe_aluminum",
	recipe = {
		{"", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"", "group:stick", "mineral_pack:aluminum_ingot"},
		{"", "group:stick", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:helmet_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "", "mineral_pack:aluminum_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:boots_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "", "mineral_pack:aluminum_ingot"},
		{"", "", ""},
	}
})

minetest.register_craft({
	output = "mineral_pack:leggings_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "", "mineral_pack:aluminum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:chestplate_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
	}
})

minetest.register_craft({
	output = "mineral_pack:shield_aluminum",
	recipe = {
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot", "mineral_pack:aluminum_ingot"},
		{"", "mineral_pack:aluminum_ingot", ""},
	}
})
