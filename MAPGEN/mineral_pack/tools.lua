---- cobalt

minetest.register_tool("mineral_pack:pick_cobalt", {
	description = "Cobalt Pickaxe",
	inventory_image = "mineral_pack_pick_cobalt.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.80, [2]=1.10, [3]=0.55}, uses=15, maxlevel=2},
		},
		damage_groups = {fleshy=5,knockback=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_cobalt", {
	description = "Cobalt Shovel",
	inventory_image = "mineral_pack_shovel_cobalt.png",
	wield_image = "mineral_pack_shovel_cobalt.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.60, [3]=0.28}, uses=23, maxlevel=2},
		},
		damage_groups = {fleshy=4,knockback=14},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_cobalt", {
	description = "Cobalt Axe",
	inventory_image = "mineral_pack_axe_cobalt.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.75, [2]=1.00, [3]=0.70}, uses=15, maxlevel=2},
		},
		damage_groups = {fleshy=6,knockback=11},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_cobalt", {
	description = "Cobalt Sword",
	inventory_image = "mineral_pack_sword_cobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.75, [2]=0.80, [3]=0.22}, uses=23, maxlevel=2},
		},
		damage_groups = {fleshy=7,knockback=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- nickel

minetest.register_tool("mineral_pack:pick_nickel", {
	description = "Nickel Pickaxe",
	inventory_image = "mineral_pack_pick_nickel.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.20, [2]=1.70, [3]=0.85}, uses=16, maxlevel=2},
		},
		damage_groups = {fleshy=5,knockback=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_nickel", {
	description = "Nickel Shovel",
	inventory_image = "mineral_pack_shovel_nickel.png",
	wield_image = "mineral_pack_shovel_nickel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.60, [2]=0.96, [3]=0.42}, uses=24, maxlevel=2},
		},
		damage_groups = {fleshy=4,knockback=14},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_nickel", {
	description = "Nickel Axe",
	inventory_image = "mineral_pack_axe_nickel.png",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.65, [2]=1.5, [3]=1.05}, uses=16, maxlevel=2},
		},
		damage_groups = {fleshy=4,knockback=11},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_nickel", {
	description = "Nickel Sword",
	inventory_image = "mineral_pack_sword_nickel.png",
	tool_capabilities = {
		full_punch_interval = 0.875,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.65, [2]=1.30, [3]=0.38}, uses=24, maxlevel=2},
		},
		damage_groups = {fleshy=6,knockback=7},
	},
	sound = {breaks = "default_tool_breaks"},
})


---- amethyst

minetest.register_tool("mineral_pack:pick_amethyst", {
	description = "amethyst Pickaxe",
	inventory_image = "mineral_pack_pick_amethyst.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.00, [2]=1.5, [3]=0.75}, uses=5, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_amethyst", {
	description = "amethyst Shovel",
	inventory_image = "mineral_pack_shovel_amethyst.png",
	wield_image = "mineral_pack_shovel_amethyst.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.75, [3]=0.40}, uses=5, maxlevel=3},
		},
		damage_groups = {fleshy=4,knockback=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_amethyst", {
	description = "amethyst Axe",
	inventory_image = "mineral_pack_axe_amethyst.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.75, [2]=1.30, [3]=0.75}, uses=5, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_amethyst", {
	description = "amethyst Sword",
	inventory_image = "mineral_pack_sword_amethyst.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.15, [3]=0.525}, uses=8, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- spinel

minetest.register_tool("mineral_pack:pick_spinel", {
	description = "Spinel Pickaxe",
	inventory_image = "mineral_pack_pick_spinel.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.00, [2]=1.5, [3]=0.75}, uses=10, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_spinel", {
	description = "Spinel Shovel",
	inventory_image = "mineral_pack_shovel_spinel.png",
	wield_image = "mineral_pack_shovel_spinel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.30, [2]=0.75, [3]=0.40}, uses=10, maxlevel=3},
		},
		damage_groups = {fleshy=4,knockback=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_spinel", {
	description = "Spinel Axe",
	inventory_image = "mineral_pack_axe_spinel.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.75, [2]=1.30, [3]=0.75}, uses=10, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_spinel", {
	description = "Spinel Sword",
	inventory_image = "mineral_pack_sword_spinel.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.15, [3]=0.525}, uses=15, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- topaz

minetest.register_tool("mineral_pack:pick_topaz", {
	description = "Topaz Pickaxe",
	inventory_image = "mineral_pack_pick_topaz.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.60, [2]=1.3, [3]=0.625}, uses=18, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_topaz", {
	description = "Topaz Shovel",
	inventory_image = "mineral_pack_shovel_topaz.png",
	wield_image = "mineral_pack_shovel_topaz.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.15, [2]=0.65, [3]=0.35}, uses=18, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_topaz", {
	description = "Topaz Axe",
	inventory_image = "mineral_pack_axe_topaz.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.4, [2]=1.15, [3]=0.625}, uses=18, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_topaz", {
	description = "Topaz Sword",
	inventory_image = "mineral_pack_sword_topaz.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.25, [2]=1.075, [3]=0.40}, uses=26, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})


---- ruby

minetest.register_tool("mineral_pack:pick_ruby", {
	description = "Ruby Pickaxe",
	inventory_image = "mineral_pack_pick_ruby.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.20, [2]=1.1, [3]=0.55}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_ruby", {
	description = "Ruby Shovel",
	inventory_image = "mineral_pack_shovel_ruby.png",
	wield_image = "mineral_pack_shovel_ruby.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.15, [2]=0.55, [3]=0.30}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_ruby", {
	description = "Ruby Axe",
	inventory_image = "mineral_pack_axe_ruby.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.15, [2]=0.95, [3]=0.55}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_ruby", {
	description = "Ruby Sword",
	inventory_image = "mineral_pack_sword_ruby.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.95, [2]=0.95, [3]=0.325}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=8,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- sapphire

minetest.register_tool("mineral_pack:pick_sapphire", {
	description = "sapphire Pickaxe",
	inventory_image = "mineral_pack_pick_sapphire.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.20, [2]=1.1, [3]=0.55}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_sapphire", {
	description = "sapphire Shovel",
	inventory_image = "mineral_pack_shovel_sapphire.png",
	wield_image = "mineral_pack_shovel_sapphire.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.15, [2]=0.55, [3]=0.30}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_sapphire", {
	description = "sapphire Axe",
	inventory_image = "mineral_pack_axe_sapphire.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.15, [2]=0.95, [3]=0.55}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_sapphire", {
	description = "sapphire Sword",
	inventory_image = "mineral_pack_sword_sapphire.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.95, [2]=0.95, [3]=0.325}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=8,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- emerald

minetest.register_tool("mineral_pack:pick_emerald", {
	description = "Emerald Pickaxe",
	inventory_image = "mineral_pack_pick_emerald.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.20, [2]=1.1, [3]=0.55}, uses=22, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_emerald", {
	description = "Emerald Shovel",
	inventory_image = "mineral_pack_shovel_emerald.png",
	wield_image = "mineral_pack_shovel_emerald.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.15, [2]=0.55, [3]=0.30}, uses=22, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_emerald", {
	description = "Emerald Axe",
	inventory_image = "mineral_pack_axe_emerald.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.15, [2]=0.95, [3]=0.55}, uses=22, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_emerald", {
	description = "Emerald Sword",
	inventory_image = "mineral_pack_sword_emerald.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.95, [2]=0.95, [3]=0.325}, uses=32, maxlevel=3},
		},
		damage_groups = {fleshy=8,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- titanium

minetest.register_tool("mineral_pack:pick_titanium", {
	description = "Titanium Pickaxe",
	inventory_image = "mineral_pack_pick_titanium.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=5,knockback=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_titanium", {
	description = "Titanium Shovel",
	inventory_image = "mineral_pack_shovel_titanium.png",
	wield_image = "mineral_pack_shovel_titanium.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=4,knockback=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_titanium", {
	description = "Titanium Axe",
	inventory_image = "mineral_pack_axe_titanium.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=6,knockback=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_titanium", {
	description = "Titanium Sword",
	inventory_image = "mineral_pack_sword_titanium.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=7,knockback=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- osmium

minetest.register_tool("mineral_pack:pick_osmium", {
	description = "Osmium Pickaxe",
	inventory_image = "mineral_pack_pick_osmium.png",
	tool_capabilities = {
		full_punch_interval = 1.7,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=2.25, [2]=1.1, [3]=0.55}, uses=4, maxlevel=3},
		},
		damage_groups = {fleshy=12,knockback=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_osmium", {
	description = "Osmium Shovel",
	inventory_image = "mineral_pack_shovel_osmium.png",
	wield_image = "mineral_pack_shovel_osmium.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.8,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.55, [3]=0.275}, uses=4, maxlevel=3},
		},
		damage_groups = {fleshy=11,knockback=24},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_osmium", {
	description = "Osmium Axe",
	inventory_image = "mineral_pack_axe_osmium.png",
	tool_capabilities = {
		full_punch_interval = 1.7,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.95, [3]=0.55}, uses=4, maxlevel=3},
		},
		damage_groups = {fleshy=12,knockback=18},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_osmium", {
	description = "Osmium Sword",
	inventory_image = "mineral_pack_sword_osmium.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.9, [2]=0.95, [3]=0.325}, uses=8, maxlevel=3},
		},
		damage_groups = {fleshy=13,knockback=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

---- platinum

minetest.register_tool("mineral_pack:pick_platinum", {
	description = "Platinum Pickaxe",
	inventory_image = "mineral_pack_pick_platinum.png",
	tool_capabilities = {
		full_punch_interval = 1.6,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=3.70, [2]=1.45, [3]=0.72}, uses=14, maxlevel=2},
		},
		damage_groups = {fleshy=10,knockback=11},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_platinum", {
	description = "Platinum Shovel",
	inventory_image = "mineral_pack_shovel_platinum.png",
	wield_image = "mineral_pack_shovel_platinum.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.7,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.36, [2]=0.82, [3]=0.36}, uses=22, maxlevel=2},
		},
		damage_groups = {fleshy=9,knockback=23},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_platinum", {
	description = "Platinum Axe",
	inventory_image = "mineral_pack_axe_platinum.png",
	tool_capabilities = {
		full_punch_interval = 1.6,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.30, [2]=1.28, [3]=0.9}, uses=14, maxlevel=2},
		},
		damage_groups = {fleshy=10,knockback=17},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_platinum", {
	description = "Platinum Sword",
	inventory_image = "mineral_pack_sword_platinum.png",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.35, [2]=1.1, [3]=0.34}, uses=22, maxlevel=2},
		},
		damage_groups = {fleshy=11,knockback=11},
	},
	sound = {breaks = "default_tool_breaks"},
})


---- aluminum

minetest.register_tool("mineral_pack:pick_aluminum", {
	description = "Aluminum Pickaxe",
	inventory_image = "mineral_pack_pick_aluminum.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=5.0, [2]=2.20, [3]=0.70}, uses=12, maxlevel=2},
		},
		damage_groups = {fleshy=2,knockback=2},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:shovel_aluminum", {
	description = "Aluminum Shovel",
	inventory_image = "mineral_pack_shovel_aluminum.png",
	wield_image = "mineral_pack_shovel_aluminum.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=2.20, [2]=1.25, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=1,knockback=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:axe_aluminum", {
	description = "Aluminum Axe",
	inventory_image = "mineral_pack_axe_aluminum.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.5, [2]=2.15, [3]=1.4}, uses=12, maxlevel=2},
		},
		damage_groups = {fleshy=3,knockback=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("mineral_pack:sword_aluminum", {
	description = "Aluminum Sword",
	inventory_image = "mineral_pack_sword_aluminum.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=3.5, [2]=1.65, [3]=0.5}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4,knockback=2},
	},
	sound = {breaks = "default_tool_breaks"},
})
