local S = minetest.get_translator("obsidiana")

minetest.register_tool("obsidian:grebasobsidiana", {
    description = S("obsidian kneepads"),
    inventory_image = "grebasobsidiana_inv.png",
    groups = {armor_legs=1, armor_heal=8, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    sound = {breaks = "default_tool_breaks"},

})

minetest.register_tool("obsidian:escudoobsidiana", {
    description = S("obsidian shield"),
    inventory_image = "escudoobsidiana_inv.png",
    groups = {armor_shield=1, armor_heal=9, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    sound = {breaks = "default_tool_breaks"},

})


minetest.register_tool("obsidian:botasobsidiana", {
    description = S("obsidian boots"),
    inventory_image = "botasobsidiana_inv.png",
    groups = {armor_feet=1, armor_heal=7, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    sound = {breaks = "default_tool_breaks"},

})


minetest.register_tool("obsidian:petoobsidiana", {
    description = S("obsidian chestplate"),
    inventory_image = "petoobsidiana_inv.png",
    groups = {armor_torso=1, armor_heal=9, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    sound = {breaks = "default_tool_breaks"},

})

minetest.register_tool("obsidian:cascoobsidiana", {
    description = S("obsidian helmet"),
    inventory_image = "cascoobsidiana_inv.png",
    groups = {armor_head=1, armor_heal=7, armor_use=180} ,
    wear = 0,
    armor_groups = {fleshy=11},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    sound = {breaks = "default_tool_breaks"},

})

    minetest.register_craftitem("obsidian:laminadeobsidiana", {
    description = S("obsidian sheet"),
    inventory_image = "laminaobsidiana.png"
})

minetest.register_craft({
    type = "cooking",
    output = "obsidian:laminadeobsidiana",
    recipe = "default:obsidian",
    cooktime = 8,
})

minetest.register_craft({
    output = "obsidian:hachadeobsidiana",
    recipe = {
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", ""},
        {"obsidian:laminadeobsidiana", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "obsidian:espadadeobsidiana",
    recipe = {
        {"", "obsidian:laminadeobsidiana", ""},
        {"", "obsidian:laminadeobsidiana", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "obsidian:picodeobsidiana",
    recipe = {
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    },
})

minetest.register_craft({
    output = "obsidian:petoobsidiana",
    recipe = {
        {"obsidian:laminadeobsidiana", "", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
    },
})

minetest.register_craft({
    output = "obsidian:cascoobsidiana",
    recipe = {
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "", "obsidian:laminadeobsidiana"},
        {"", "", ""},
    },
})

minetest.register_craft({
    output = "obsidian:grebasobsidiana",
    recipe = {
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "", "obsidian:laminadeobsidiana"},
    },
})

minetest.register_craft({
    output = "obsidian:botasobsidiana",
    recipe = {
        {"", "", ""},
        {"obsidian:laminadeobsidiana", "", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "", "obsidian:laminadeobsidiana"},
    },
})

minetest.register_craft({
    output = "obsidian:escudoobsidiana",
    recipe = {
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
        {"obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana", "obsidian:laminadeobsidiana"},
        {"", "obsidian:laminadeobsidiana", ""},
    },
})

minetest.register_tool("obsidian:picodeobsidiana", {
    description = S("obsidian pickaxe"),
    inventory_image = "picodeobsidiana.png",
    tool_capabilities = {
        full_punch_interval = 1.6,
        max_drop_level = 0,
        groupcaps = {
            cracky = {
                maxlevel = 3,
                uses = 20,
                times = { [1]=1.60, [2]=1.80, [3]=0.70 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})

minetest.register_tool("obsidian:espadadeobsidiana", {
    description = S("obsidian sword"),
    inventory_image = "espadadeobsidiana.png",
    tool_capabilities = {
        full_punch_interval = 1.6,
        max_drop_level = 0,
        groupcaps = {
            fleshy = {
                maxlevel = 3,
                uses = 20,
                times = { [1]=1.60, [2]=1.80, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=9},
    },
    sound = {breaks = "tool_breaks"},
})

minetest.register_tool("obsidian:hachadeobsidiana", {
    description = S("obsidian axe"),
    inventory_image = "hachadeobsidiana.png",
    tool_capabilities = {
        full_punch_interval = 1.6,
        max_drop_level = 0,
        groupcaps = {
            choppy = {
                maxlevel = 3,
                uses = 20,
                times = { [1]=1.60, [2]=1.80, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=1},
    },
    sound = {breaks = "tool_breaks"},
})
