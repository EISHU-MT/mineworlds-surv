local S = minetest.get_translator("obsidiana")

minetest.register_tool("obsidiana:grebasobsidiana", {
    description = S("obsidian kneepads"),
    inventory_image = "grebasobsidiana_inv.png",
    groups = {armor_legs=1, armor_heal=10, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("obsidiana:escudoobsidiana", {
    description = S("obsidian shield"),
    inventory_image = "escudoobsidiana_inv.png",
    groups = {armor_shield=1, armor_heal=10, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})


minetest.register_tool("obsidiana:botasobsidiana", {
    description = S("obsidian boots"),
    inventory_image = "botasobsidiana_inv.png",
    groups = {armor_feet=1, armor_heal=10, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})


minetest.register_tool("obsidiana:petoobsidiana", {
    description = S("obsidian chestplate"),
    inventory_image = "petoobsidiana_inv.png",
    groups = {armor_torso=1, armor_heal=10, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

minetest.register_tool("obsidiana:cascoobsidiana", {
    description = S("obsidian helmet"),
    inventory_image = "cascoobsidiana_inv.png",
    groups = {armor_head=1, armor_heal=10, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},

})

    minetest.register_craftitem("obsidiana:laminadeobsidiana", {
    description = S("obsidian sheet"),
    inventory_image = "laminaobsidiana.png"
})

minetest.register_craft({
    type = "cooking",
    output = "obsidiana:laminadeobsidiana",
    recipe = "default:obsidian",
    cooktime = 8,
})

minetest.register_craft({
    output = "obsidiana:hachadeobsidiana",
    recipe = {
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", ""},
        {"obsidiana:laminadeobsidiana", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "obsidiana:espadadeobsidiana",
    recipe = {
        {"", "obsidiana:laminadeobsidiana", ""},
        {"", "obsidiana:laminadeobsidiana", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "obsidiana:picodeobsidiana",
    recipe = {
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "obsidiana:petoobsidiana",
    recipe = {
        {"obsidiana:laminadeobsidiana", "", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
    },
})

minetest.register_craft({
    output = "obsidiana:cascoobsidiana",
    recipe = {
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "", "obsidiana:laminadeobsidiana"},
        {"", "", ""},
    },
})

minetest.register_craft({
    output = "obsidiana:grebasobsidiana",
    recipe = {
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "", "obsidiana:laminadeobsidiana"},
    },
})

minetest.register_craft({
    output = "obsidiana:botasobsidiana",
    recipe = {
        {"", "", ""},
        {"obsidiana:laminadeobsidiana", "", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "", "obsidiana:laminadeobsidiana"},
    },
})

minetest.register_craft({
    output = "obsidiana:escudoobsidiana",
    recipe = {
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
        {"obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana", "obsidiana:laminadeobsidiana"},
        {"", "obsidiana:laminadeobsidiana", ""},
    },
})

minetest.register_tool("obsidiana:picodeobsidiana", {
    description = S("obsidian pickaxe"),
    inventory_image = "picodeobsidiana.png",
    tool_capabilities = {
        full_punch_interval = 1.6,
        max_drop_level = 0,
        groupcaps = {
            cracky = {
                maxlevel = 3,
                uses = 15,
                times = { [1]=1.60, [2]=1.80, [3]=0.70 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})

minetest.register_tool("obsidiana:espadadeobsidiana", {
    description = S("obsidian sword"),
    inventory_image = "espadadeobsidiana.png",
    tool_capabilities = {
        full_punch_interval = 1.6,
        max_drop_level = 0,
        groupcaps = {
            fleshy = {
                maxlevel = 3,
                uses = 15,
                times = { [1]=1.60, [2]=1.80, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=9},
    },
    sound = {breaks = "tool_breaks"},
})

minetest.register_tool("obsidiana:hachadeobsidiana", {
    description = S("obsidian axe"),
    inventory_image = "hachadeobsidiana.png",
    tool_capabilities = {
        full_punch_interval = 1.6,
        max_drop_level = 0,
        groupcaps = {
            choppy = {
                maxlevel = 3,
                uses = 15,
                times = { [1]=1.60, [2]=1.80, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})
