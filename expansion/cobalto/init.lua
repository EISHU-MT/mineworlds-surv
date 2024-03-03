if minetest.global_exists("armor") and armor.elements then
    table.insert(armor.elements, "shield")
end
local herramienta = minetest.register_tool
local S = minetest.get_translator("cobalto")

herramienta("cobalto:botascobalto", {
    description = S("cobalto boots"),
    inventory_image = "botas_de_cobalto_inv.png",
    groups = {armor_feet=1, armor_heal=11, armor_use=150} ,
    wear = 0,
    armor_groups = {fleshy=12},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

herramienta("cobalto:cascocobalto", {
    description = S("cobalto helmet"),
    inventory_image = "casco_cobalto_inv.png",
    groups = {armor_head=1, armor_heal=11, armor_use=150} ,
    wear = 0,
    armor_groups = {fleshy=12},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

herramienta("cobalto:petocobalto", {
    description = S("cobalto chestplate"),
    inventory_image = "peto_cobalto_inv.png",
    groups = {armor_torso=1, armor_heal=11, armor_use=150} ,
    wear = 0,
    armor_groups = {fleshy=12},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

herramienta("cobalto:grebascobalto", {
    description = S("cobalto kneepads"),
    inventory_image = "grebas_cobalto_inv.png",
    groups = {armor_legs=1, armor_heal=11, armor_use=150} ,
    wear = 0,
    armor_groups = {fleshy=12},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

herramienta("cobalto:escudocobalto", {
    description = S("cobalto shield"),
    inventory_image = "escudo_cobaltoexpansion_inv.png",
    groups = {armor_shield=1, armor_heal=11, armor_use=150} ,
    wear = 0,
    armor_groups = {fleshy=12},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

    minetest.register_craftitem("cobalto:cobaltolump", {
    description = S("cobalto material"),
    inventory_image = "cobaltolump.png"
})  
    
    minetest.register_craftitem("cobalto:lingotedecobalto", {
    description = S("cobalto ingot"),
    inventory_image = "lingotedecobalto.png"
})

minetest.register_craft({
    type = "cooking",
    output = "cobalto:lingotedecobalto",
    recipe = "cobalto:cobaltolump",
    cooktime = 6,
})

minetest.register_craft({
    output = "cobalto:picodecobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "cobalto:espadacobalto",
    recipe = {
        {"", "cobalto:lingotedecobalto", ""},
        {"", "cobalto:lingotedecobalto", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "cobalto:hachadecobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", ""},
        {"cobalto:lingotedecobalto", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_node("cobalto:cobaltoore", {
    description = S("cobalto mineral"),
    tiles = {"cobalto_mineral.png"},
    is_ground_content = true,
    groups = {cracky = 1, level = 3},
    drop = "cobalto:cobaltolump"
})

    minetest.register_ore({
        ore_type       = "scatter",
        ore            = "cobalto:cobaltoore",
        wherein        = "default:stone",
        clust_scarcity = 15 * 15 * 15,
        clust_num_ores = 5,
        clust_size     = 3,
        y_max          = -1000,
        y_min          = -31000,
})

minetest.register_node("cobalto:bloquecobalto", {
    description = S("cobalto block"),
    tiles = {"bloquecobalto.png"},
    groups = {cracky = 1, level = 2},
})

herramienta("cobalto:hachadecobalto", {
    description = S("cobalto axe"),
    inventory_image = "hachadecobalto.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            choppy = {
                maxlevel = 3.5,
                uses = 45,
                times = { [1]=1.80, [2]=1.80, [3]=0.99 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})

herramienta("cobalto:picodecobalto", {
    description = S("cobalto pickaxe"),
    inventory_image = "picodecobalto.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            cracky = {
                maxlevel = 4,
                uses = 30,
                times = { [1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})

herramienta("cobalto:espadacobalto", {
    description = S("cobalto sword"),
    inventory_image = "espadacobalto.png",
    tool_capabilities = {
        full_punch_interval = 1.8,
        max_drop_level = 0,
        groupcaps = {
            fleshy = {
                maxlevel = 3.9,
                uses = 35,
                times = { [1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=2},
    },
})

minetest.register_craft({
    output = "cobalto:petocobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
    },
})

minetest.register_craft({
    output = "cobalto:cascocobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "", "cobalto:lingotedecobalto"},
        {"", "", ""},
    },
})

minetest.register_craft({
    output = "cobalto:grebascobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "", "cobalto:lingotedecobalto"},
    },
})

minetest.register_craft({
    output = "cobalto:botascobalto",
    recipe = {
        {"", "", ""},
        {"cobalto:lingotedecobalto", "", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "", "cobalto:lingotedecobalto"},
    },
})

minetest.register_craft({
    output = "cobalto:escudocobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"", "cobalto:lingotedecobalto", ""},
    },
})



minetest.register_craft({
    output = "cobalto:bloquecobalto",
    recipe = {
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
        {"cobalto:lingotedecobalto", "cobalto:lingotedecobalto", "cobalto:lingotedecobalto"},
    },
})