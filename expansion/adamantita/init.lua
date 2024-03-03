if minetest.global_exists("armor") and armor.elements then
    table.insert(armor.elements, "shield")
end

local S = minetest.get_translator("adamantita")

minetest.register_node("adamantita:bloqueadamantita", {
    description = S("adamantite block"),
    tiles = {"bloqueadamantita.png"},
    groups = {cracky = 1, level = 2},
})

minetest.register_node("adamantita:adamantitaore", {
    description = S("adamantite ore"),
    tiles = {"adamantita_ore.png"},
    is_ground_content = true,
    groups = {cracky = 1, level = 4},
    drop = "adamantita:adamantitalump"
})

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "adamantita:adamantitaore",
        wherein        = "default:stone",
        clust_scarcity = 16 * 17 * 15,
        clust_num_ores = 4,
        clust_size     = 5,
        y_max          = -1800,
        y_min          = -31000,
 })

minetest.register_tool("adamantita:cascodeadamantita", {
    description = S("adamantite helmet"),
    inventory_image = "cascodeadamantita_inv.png",
    groups = {armor_head=1, armor_heal=12, armor_use=170} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("adamantita:bostasadamantita", {
    description = S("adamantite boots"),
    inventory_image = "bostasadamantita_inv.png",
    groups = {armor_feet=1, armor_heal=12, armor_use=170, physics_speed=0.1, physics_jump=0.2} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=2},

})

minetest.register_tool("adamantita:petodeadamantita", {
    description = S("adamantite chestplate"),
    inventory_image = "petodeadamantita_inv.png",
    groups = {armor_torso=1, armor_heal=12, armor_use=170, physics_speed=0.1} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=2},

})

minetest.register_tool("adamantita:grebasdeadamantita", {
    description = S("adamantite kneepads"),
    inventory_image = "grebasdeadamantita_inv.png",
    groups = {armor_legs=1, armor_heal=12, armor_use=170, physics_speed=0.1} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=2},

})

minetest.register_tool("adamantita:escudodeadamantita", {
    description = S("adamantite shield"),
    inventory_image = "escudodeadamantita_inv.png",
    groups = {armor_shield=1, armor_heal=12, armor_use=170, physics_speed=0.1} ,
    wear = 0,
    armor_groups = {fleshy=13},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=2},   

})

minetest.register_tool("adamantita:picodeadamantita", {
    description = S("adamantite pickaxe"),
    inventory_image = "picodeadamantita.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            cracky = {
                maxlevel = 5,
                uses = 50,
                times = { [1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
})

minetest.register_tool("adamantita:espadaadamantita", {
    description = S("adamantite sword"),
    inventory_image = "espadaadamantita.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            fleshy = {
                maxlevel = 4.1,
                uses = 40,
                times = { [1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=11},
    },
})

minetest.register_tool("adamantita:hachadeadamantita", {
    description = S("adamantite axe"),
    inventory_image = "hachadeadamantita.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            choppy = {
                maxlevel = 3,
                uses = 35,
                times = { [1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})

    minetest.register_craftitem("adamantita:adamantitalump", {
    description = S("adamantite material"),
    inventory_image = "adamantitalump.png"
})

    minetest.register_craftitem("adamantita:lingotedeadamantita", {
    description = S("adamantite ingot"),
    inventory_image = "lingotedeadamantita.png"
})

minetest.register_craft({
    type = "cooking",
    output = "adamantita:lingotedeadamantita",
    recipe = "adamantita:adamantitalump",
    cooktime = 7,
})

minetest.register_craft({
    output = "adamantita:picodeadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "adamantita:espadaadamantita",
    recipe = {
        {"", "adamantita:lingotedeadamantita", ""},
        {"", "adamantita:lingotedeadamantita", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "adamantita:hachadeadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", ""},
        {"adamantita:lingotedeadamantita", "default:stick", ""},
        {"", "default:stick", ""},
    },
})


minetest.register_craft({
    output = "adamantita:petodeadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
    },
})

minetest.register_craft({
    output = "adamantita:cascodeadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "", "adamantita:lingotedeadamantita"},
        {"", "", ""},
    },
})

minetest.register_craft({
    output = "adamantita:grebasdeadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "", "adamantita:lingotedeadamantita"},
    },
})

minetest.register_craft({
    output = "adamantita:bostasadamantita",
    recipe = {
        {"", "", ""},
        {"adamantita:lingotedeadamantita", "", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "", "adamantita:lingotedeadamantita"},
    },
})

minetest.register_craft({
    output = "adamantita:escudodeadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"", "adamantita:lingotedeadamantita", ""},
    },
})



minetest.register_craft({
    output = "adamantita:bloqueadamantita",
    recipe = {
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
        {"adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita", "adamantita:lingotedeadamantita"},
    },
})