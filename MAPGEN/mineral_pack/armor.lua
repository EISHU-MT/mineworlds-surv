
if minetest.get_modpath("3d_armor") then

local S = function(t) return t end

----- cobalt

	armor:register_armor("mineral_pack:helmet_cobalt", {
		description = S("Cobalt Helmet"),
		inventory_image = "mineral_pack_inv_helmet_cobalt.png",
		groups = {armor_head=1, armor_heal=1, armor_use=1000,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=11},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_cobalt", {
		description = S("Cobalt Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_cobalt.png",
		groups = {armor_torso=1, armor_heal=1, armor_use=1000,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=16},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_cobalt", {
		description = S("Cobalt Leggings"),
		inventory_image = "mineral_pack_inv_leggings_cobalt.png",
		groups = {armor_legs=1, armor_heal=1, armor_use=1000,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=16},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_cobalt", {
		description = S("Cobalt Boots"),
		inventory_image = "mineral_pack_inv_boots_cobalt.png",
		groups = {armor_feet=1, armor_heal=1, armor_use=1000,
			physics_speed=-0.01, physics_gravity=0.01},
		armor_groups = {fleshy=11},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_cobalt", {
		description = S("Cobalt Shield"),
		inventory_image = "mineral_pack_inv_shield_cobalt.png",
		groups = {armor_shield=1, armor_heal=1, armor_use=1000,
			physics_speed=-0.03, physics_gravity=0.03},
		armor_groups = {fleshy=11},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})

----- nickel

	armor:register_armor("mineral_pack:helmet_nickel", {
		description = S("Nickel Helmet"),
		inventory_image = "mineral_pack_inv_helmet_nickel.png",
		groups = {armor_head=1, armor_heal=0, armor_use=900,
			physics_speed=-0.015, physics_gravity=0.015},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_nickel", {
		description = S("Nickel Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_nickel.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=900,
			physics_speed=-0.045, physics_gravity=0.045},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_nickel", {
		description = S("Nickel Leggings"),
		inventory_image = "mineral_pack_inv_leggings_nickel.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=900,
			physics_speed=-0.035, physics_gravity=0.035},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_nickel", {
		description = S("Nickel Boots"),
		inventory_image = "mineral_pack_inv_boots_nickel.png",
		groups = {armor_feet=1, armor_heal=0, armor_use=900,
			physics_speed=-0.015, physics_gravity=0.015},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_nickel", {
		description = S("Nickel Shield"),
		inventory_image = "mineral_pack_inv_shield_nickel.png",
		groups = {armor_shield=1, armor_heal=0, armor_use=900,
			physics_speed=-0.035, physics_gravity=0.035},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})


---- amethyst

	armor:register_armor("mineral_pack:helmet_amethyst", {
		description = S("Amethyst Helmet"),
		inventory_image = "mineral_pack_inv_helmet_amethyst.png",
		groups = {armor_head=1, armor_heal=10, armor_use=1150,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=12},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_amethyst", {
		description = S("Amethyst Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_amethyst.png",
		groups = {armor_torso=1, armor_heal=10, armor_use=1150,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=17},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_amethyst", {
		description = S("Amethyst Leggings"),
		inventory_image = "mineral_pack_inv_leggings_amethyst.png",
		groups = {armor_legs=1, armor_heal=10, armor_use=1150,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=17},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_amethyst", {
		description = S("Amethyst Boots"),
		inventory_image = "mineral_pack_inv_boots_amethyst.png",
		groups = {armor_feet=1, armor_heal=10, armor_use=1150,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=12},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_amethyst", {
		description = S("Amethyst Shield"),
		inventory_image = "mineral_pack_inv_shield_amethyst.png",
		groups = {armor_shield=1, armor_heal=10, armor_use=1150,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=12},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})

---- spinel

	armor:register_armor("mineral_pack:helmet_spinel", {
		description = S("Spinel Helmet"),
		inventory_image = "mineral_pack_inv_helmet_spinel.png",
		groups = {armor_head=1, armor_heal=10, armor_use=750,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=12.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_spinel", {
		description = S("Spinel Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_spinel.png",
		groups = {armor_torso=1, armor_heal=10, armor_use=750,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=17.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_spinel", {
		description = S("Spinel Leggings"),
		inventory_image = "mineral_pack_inv_leggings_spinel.png",
		groups = {armor_legs=1, armor_heal=10, armor_use=750,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=17.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_spinel", {
		description = S("Spinel Boots"),
		inventory_image = "mineral_pack_inv_boots_spinel.png",
		groups = {armor_feet=1, armor_heal=10, armor_use=750,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=12.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_spinel", {
		description = S("Spinel Shield"),
		inventory_image = "mineral_pack_inv_shield_spinel.png",
		groups = {armor_shield=1, armor_heal=10, armor_use=750,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=12.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})



---- ruby

	armor:register_armor("mineral_pack:helmet_ruby", {
		description = S("Ruby Helmet"),
		inventory_image = "mineral_pack_inv_helmet_ruby.png",
		groups = {armor_head=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_ruby", {
		description = S("Ruby Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_ruby.png",
		groups = {armor_torso=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=19},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_ruby", {
		description = S("Ruby Leggings"),
		inventory_image = "mineral_pack_inv_leggings_ruby.png",
		groups = {armor_legs=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=19},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_ruby", {
		description = S("Ruby Boots"),
		inventory_image = "mineral_pack_inv_boots_ruby.png",
		groups = {armor_feet=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_ruby", {
		description = S("Ruby Shield"),
		inventory_image = "mineral_pack_inv_shield_ruby.png",
		groups = {armor_shield=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})

---- sapphire

	armor:register_armor("mineral_pack:helmet_sapphire", {
		description = S("Sapphire Helmet"),
		inventory_image = "mineral_pack_inv_helmet_sapphire.png",
		groups = {armor_head=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_sapphire", {
		description = S("Sapphire Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_sapphire.png",
		groups = {armor_torso=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=19},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_sapphire", {
		description = S("Sapphire Leggings"),
		inventory_image = "mineral_pack_inv_leggings_sapphire.png",
		groups = {armor_legs=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=19},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_sapphire", {
		description = S("Sapphire Boots"),
		inventory_image = "mineral_pack_inv_boots_sapphire.png",
		groups = {armor_feet=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_sapphire", {
		description = S("Sapphire Shield"),
		inventory_image = "mineral_pack_inv_shield_sapphire.png",
		groups = {armor_shield=1, armor_heal=11, armor_use=300,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=14},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})

---- emerald

	armor:register_armor("mineral_pack:helmet_emerald", {
		description = S("emerald Helmet"),
		inventory_image = "mineral_pack_inv_helmet_emerald.png",
		groups = {armor_head=1, armor_heal=10.5, armor_use=400,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_emerald", {
		description = S("emerald Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_emerald.png",
		groups = {armor_torso=1, armor_heal=10.5, armor_use=400,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=18.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_emerald", {
		description = S("emerald Leggings"),
		inventory_image = "mineral_pack_inv_leggings_emerald.png",
		groups = {armor_legs=1, armor_heal=10.5, armor_use=400,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=18.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_emerald", {
		description = S("emerald Boots"),
		inventory_image = "mineral_pack_inv_boots_emerald.png",
		groups = {armor_feet=1, armor_heal=10.5, armor_use=400,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_emerald", {
		description = S("emerald Shield"),
		inventory_image = "mineral_pack_inv_shield_emerald.png",
		groups = {armor_shield=1, armor_heal=10.5, armor_use=400,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})

---- topaz

	armor:register_armor("mineral_pack:helmet_topaz", {
		description = S("Topaz Helmet"),
		inventory_image = "mineral_pack_inv_helmet_topaz.png",
		groups = {armor_head=1, armor_heal=10.0, armor_use=550,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_topaz", {
		description = S("Topaz Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_topaz.png",
		groups = {armor_torso=1, armor_heal=10.0, armor_use=550,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=18.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_topaz", {
		description = S("Topaz Leggings"),
		inventory_image = "mineral_pack_inv_leggings_topaz.png",
		groups = {armor_legs=1, armor_heal=10.0, armor_use=550,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=18.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_topaz", {
		description = S("Topaz Boots"),
		inventory_image = "mineral_pack_inv_boots_topaz.png",
		groups = {armor_feet=1, armor_heal=10.0, armor_use=550,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_topaz", {
		description = S("Topaz Shield"),
		inventory_image = "mineral_pack_inv_shield_topaz.png",
		groups = {armor_shield=1, armor_heal=10.0, armor_use=550,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})


---- titanium

	armor:register_armor("mineral_pack:helmet_titanium", {
		description = S("Titanium Helmet"),
		inventory_image = "mineral_pack_inv_helmet_titanium.png",
		groups = {armor_head=1, armor_heal=6.0, armor_use=125,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_titanium", {
		description = S("Titanium Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_titanium.png",
		groups = {armor_torso=1, armor_heal=6.0, armor_use=125,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=18.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_titanium", {
		description = S("Titanium Leggings"),
		inventory_image = "mineral_pack_inv_leggings_titanium.png",
		groups = {armor_legs=1, armor_heal=6.0, armor_use=125,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=18.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_titanium", {
		description = S("Titanium Boots"),
		inventory_image = "mineral_pack_inv_boots_titanium.png",
		groups = {armor_feet=1, armor_heal=6.0, armor_use=125,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_titanium", {
		description = S("Titanium Shield"),
		inventory_image = "mineral_pack_inv_shield_titanium.png",
		groups = {armor_shield=1, armor_heal=6.0, armor_use=125,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})



---- osmium

	armor:register_armor("mineral_pack:helmet_osmium", {
		description = S("Osmium Helmet"),
		inventory_image = "mineral_pack_inv_helmet_osmium.png",
		groups = {armor_head=1, armor_heal=3.0, armor_use=1250,
			physics_speed=-0.08, physics_gravity=0.07},
		armor_groups = {fleshy=14.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_osmium", {
		description = S("Osmium Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_osmium.png",
		groups = {armor_torso=1, armor_heal=3.0, armor_use=1250,
			physics_speed=-0.12, physics_gravity=0.11},
		armor_groups = {fleshy=19.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_osmium", {
		description = S("Osmium Leggings"),
		inventory_image = "mineral_pack_inv_leggings_osmium.png",
		groups = {armor_legs=1, armor_heal=3.0, armor_use=1250,
			physics_speed=-0.10, physics_gravity=0.09},
		armor_groups = {fleshy=19.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_osmium", {
		description = S("Osmium Boots"),
		inventory_image = "mineral_pack_inv_boots_osmium.png",
		groups = {armor_feet=1, armor_heal=3.0, armor_use=1250,
			physics_speed=-0.10, physics_gravity=0.09},
		armor_groups = {fleshy=14.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_osmium", {
		description = S("Osmium Shield"),
		inventory_image = "mineral_pack_inv_shield_osmium.png",
		groups = {armor_shield=1, armor_heal=3.0, armor_use=1250,
			physics_speed=-0.08, physics_gravity=0.07},
		armor_groups = {fleshy=14.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})

---- platinum

	armor:register_armor("mineral_pack:helmet_platinum", {
		description = S("Platinum Helmet"),
		inventory_image = "mineral_pack_inv_helmet_platinum.png",
		groups = {armor_head=1, armor_heal=7.0, armor_use=950,
			physics_speed=-0.07, physics_gravity=0.06},
		armor_groups = {fleshy=10.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_platinum", {
		description = S("Platinum Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_platinum.png",
		groups = {armor_torso=1, armor_heal=7.0, armor_use=950,
			physics_speed=-0.11, physics_gravity=0.10},
		armor_groups = {fleshy=15.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_platinum", {
		description = S("Platinum Leggings"),
		inventory_image = "mineral_pack_inv_leggings_platinum.png",
		groups = {armor_legs=1, armor_heal=7.0, armor_use=950,
			physics_speed=-0.09, physics_gravity=0.08},
		armor_groups = {fleshy=15.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_platinum", {
		description = S("Platinum Boots"),
		inventory_image = "mineral_pack_inv_boots_platinum.png",
		groups = {armor_feet=1, armor_heal=7.0, armor_use=950,
			physics_speed=-0.09, physics_gravity=0.08},
		armor_groups = {fleshy=10.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_platinum", {
		description = S("Platinum Shield"),
		inventory_image = "mineral_pack_inv_shield_platinum.png",
		groups = {armor_shield=1, armor_heal=7.0, armor_use=950,
			physics_speed=-0.07, physics_gravity=0.06},
		armor_groups = {fleshy=10.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})


---- aluminum

	armor:register_armor("mineral_pack:helmet_aluminum", {
		description = S("Aluminum Helmet"),
		inventory_image = "mineral_pack_inv_helmet_aluminum.png",
		groups = {armor_head=1, armor_heal=0.0, armor_use=1000,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:chestplate_aluminum", {
		description = S("Aluminum Chestplate"),
		inventory_image = "mineral_pack_inv_chestplate_aluminum.png",
		groups = {armor_torso=1, armor_heal=0.0, armor_use=1000,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=8.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:leggings_aluminum", {
		description = S("Aluminum Leggings"),
		inventory_image = "mineral_pack_inv_leggings_aluminum.png",
		groups = {armor_legs=1, armor_heal=0.0, armor_use=1000,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=13.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:boots_aluminum", {
		description = S("Aluminum Boots"),
		inventory_image = "mineral_pack_inv_boots_aluminum.png",
		groups = {armor_feet=1, armor_heal=0.0, armor_use=1000,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=8.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
	})
	armor:register_armor("mineral_pack:shield_aluminum", {
		description = S("Aluminum Shield"),
		inventory_image = "mineral_pack_inv_shield_aluminum.png",
		groups = {armor_shield=1, armor_heal=0.0, armor_use=1000,
			physics_speed=-0.00, physics_gravity=0.00},
		armor_groups = {fleshy=8.0},
		damage_groups = {cracky=2, snappy=3, choppy=2, crumbly=1, level=2},
		reciprocate_damage = true,
	})
end

