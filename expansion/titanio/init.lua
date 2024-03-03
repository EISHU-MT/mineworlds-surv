if minetest.global_exists("armor") and armor.elements then
    table.insert(armor.elements, "shield")
end

local S = minetest.get_translator("titanio")

minetest.register_tool("titanio:grebastitanio", {
    description = S("titanium kneepads"),
    inventory_image = "grebas_titanio_inv.png",
    groups = {armor_legs=1, armor_heal=12.5, armor_use=200} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("titanio:botastitanio", {
    description = S("titanium boots"),
    inventory_image = "botas_titanio_inv.png",
    groups = {armor_feet=1, armor_heal=12.5, armor_use=200} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("titanio:petotitanio", {
    description = S("titanium chestplate"),
    inventory_image = "peto_titanio_inv.png",
    groups = {armor_torso=1, armor_heal=12.5, armor_use=200} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("titanio:cascotitanio", {
    description = S("titanium helmet"),
    inventory_image = "casco_titanio_inv.png",
    groups = {armor_head=1, armor_heal=12.5, armor_use=200} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("titanio:escudotitanio", {
    description = S("titanium shield"),
    inventory_image = "escudotitanio_inv.png",
    groups = {armor_shield=1, armor_heal=12.5, armor_use=200} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

    minetest.register_craftitem("titanio:titaniolump", {
    description = S("titanium lump"),
    inventory_image = "titaniolump.png"
})

    minetest.register_craftitem("titanio:lingotedetitanio", {
    description = S("titanium ingot"),
    inventory_image = "lingotedetitanio.png"
})

minetest.register_craft({
    type = "cooking",
    output = "titanio:lingotedetitanio",
    recipe = "titanio:titaniolump",
    cooktime = 8,
})

minetest.register_craft({
    output = "titanio:picodetitanio",
    recipe = {
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "titanio:espadatitanio",
    recipe = {
        {"", "titanio:lingotedetitanio", ""},
        {"", "titanio:lingotedetitanio", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "titanio:hachadetitanio",
    recipe = {
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", ""},
        {"titanio:lingotedetitanio", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_node("titanio:titanioore", {
    description = S("titanium ore"),
    tiles = {"ore.png"},
    is_ground_content = true,
    groups = {cracky = 1, level = 5},
    drop = "titanio:titaniolump"
})

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "titanio:titanioore",
        wherein        = "default:stone",
        clust_scarcity = 17 * 15 * 14,
        clust_num_ores = 4,
        clust_size     = 4,
        y_max          = -2000,
        y_min          = -31000,
})

minetest.register_node("titanio:bloquetitanio", {
    description = S("titanium block"),
    tiles = {"bloquetitanio.png"},
    groups = {cracky = 1, level = 2},
})

minetest.register_tool("titanio:picodetitanio", {
    description = S("titanium pickaxe"),
    inventory_image = "picodetitanio.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            cracky = {
                maxlevel = 6,
                uses =50,
                times = { [1]=1.70, [2]=1.70, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
})

minetest.register_tool("titanio:espadatitanio", {
    description = S("titanium sword"),
    inventory_image = "espadatitanio.png",
    tool_capabilities = {
        full_punch_interval = 1.7,
        max_drop_level = 0,
        groupcaps = {
            fleshy = {
                maxlevel = 4.5,
                uses = 50,
                times = { [1]=1.70, [2]=1.70, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=12},
    },
    sound = {breaks = "tool_breaks"},
})

minetest.register_tool("titanio:hachadetitanio", {
    description = S("titanium axe"),
    inventory_image = "hachadetitanio.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            choppy = {
                maxlevel = 4,
                uses = 40,
                times = { [1]=1.70, [2]=1.70, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})


minetest.register_craft({
    output = "titanio:petotitanio",
    recipe = {
        {"titanio:lingotedetitanio", "", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
    },
})

minetest.register_craft({
    output = "titanio:cascotitanio",
    recipe = {
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "", "titanio:lingotedetitanio"},
        {"", "", ""},
    },
})

minetest.register_craft({
    output = "titanio:grebastitanio",
    recipe = {
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "", "titanio:lingotedetitanio"},
    },
})

minetest.register_craft({
    output = "titanio:botastitanio",
    recipe = {
        {"", "", ""},
        {"titanio:lingotedetitanio", "", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "", "titanio:lingotedetitanio"},
    },
})

minetest.register_craft({
    output = "titanio:escudotitanio",
    recipe = {
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"", "titanio:lingotedetitanio", ""},
    },
})


minetest.register_craft({
    output = "titanio:bloquetitanio",
    recipe = {
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
        {"titanio:lingotedetitanio", "titanio:lingotedetitanio", "titanio:lingotedetitanio"},
    },
})