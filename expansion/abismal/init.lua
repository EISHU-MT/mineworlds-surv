if minetest.global_exists("armor") and armor.elements then
    table.insert(armor.elements, "shield")
end
local tool = minetest.register_tool
local S = minetest.get_translator("abismal")

minetest.register_craftitem("abismal:abismallump", {
    description = S("abysmal lump"),
    inventory_image = "abismallump.png"
})


minetest.register_craftitem("abismal:lingoteabismal", {
    description = S("abysmal ingot"),
    inventory_image = "lingoteabismal.png",
    light_source = 7
})

minetest.register_craft({
    type = "cooking",
    output = "abismal:lingoteabismal",
    recipe = "abismal:abismallump",
    cooktime = 15,
})

minetest.register_node("abismal:abismalore", {
    description = S("abysmal ore"),
    tiles = {{
            name = "ore_abismal.png",
    }},
    is_ground_content = true,
    groups = {cracky = 1, level = 7},
    drop = "abismal:abismallump",
    use_texture_alpha = "clip",
    glow = 2,
    damage_per_second = 1 * 2,
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 4,

})
minetest.register_ore({
        ore_type       = "scatter",
        ore            = "abismal:abismalore",
        wherein        = "Desolation:piedra",
        clust_scarcity = 26 * 26 * 26,
        clust_num_ores = 3,
        clust_size     = 3,
        y_max          = -3000,
        y_min          = -31000,
})

minetest.register_node("abismal:bloqueabismal", {
    description = S("abysmal block"),
    tiles = {"bloqueabismal.png"},
    groups = {cracky = 1, level = 2},
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 4,
    glow = 2,

})

tool("abismal:picoabismal", {
    description = S("abysmal pickaxe"),
    inventory_image = "picoabismal.png",
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level = 2,
        groupcaps = {
            cracky = {
                maxlevel = 8,
                uses = 290,
                times = { [1]=1.20, [2]=1.10, [3]=0.70 }
            },
        },
        damage_groups = {fleshy=3},
    },
    sound = {breaks = "tool_breaks"},
})

tool("abismal:espadaabismal", {
    description = S("abysmal sword"),
    inventory_image = "espadaabismal.png",
    tool_capabilities = {
        full_punch_interval = 1,
        max_drop_level = 0,
        groupcaps = {
            fleshy = {
                maxlevel = 6,
                uses = 200,
                times = { [1]=1.0, [2]=1.0, [3]=0.50 }
            },
        },
        damage_groups = {fleshy=17},
    },
    sound = {breaks = "tool_breaks"},
})

tool("abismal:hachadeabismal", {
    description = S("abysmal axe"),
    inventory_image = "hachaabismal.png",
    tool_capabilities = {
        full_punch_interval = 1,
        max_drop_level = 2,
        groupcaps = {
            choppy = {
                maxlevel = 6,
                uses = 200,
                times = { [1]=1.0, [2]=1.0, [3]=0.50 }
            },
        },
        damage_groups = {fleshy=5},
    },
    sound = {breaks = "tool_breaks"},
})

tool("abismal:escudoabismal", {
    description = S("abysmal shield"),
    inventory_image = "escudoabismal_inv.png",
    groups = {armor_shield=1, armor_heal=14.5, armor_use=300} ,
    wear = 0,
    armor_groups = {fleshy=17},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    light_source = 7,
    sound = {breaks = "tool_breaks"},

})

tool("abismal:petoabismal", {
    description = S("abysmal chestplate"),
    inventory_image = "petoabismal_inv.png",
    groups = {armor_torso=1, armor_heal=14.5, armor_use=300} ,
    wear = 0,
    armor_groups = {fleshy=17},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    light_source = 7,
})

tool("abismal:cascoabismal", {
    description = S("abysmal helmet"),
    inventory_image = "cascoabismal_inv.png",
    groups = {armor_head=1, armor_heal=1, armor_use=300} ,
    wear = 0,
    armor_groups = {fleshy=17},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    light_source = 7,
    sound = {breaks = "tool_breaks"},
})


tool("abismal:grebasabismal", {
    description = S("abysmal kneepads"),
    inventory_image = "grebasabismal_inv.png",
    groups = {armor_legs=1, armor_heal=14.5, armor_use=300} ,
    wear = 0,
    armor_groups = {fleshy=17},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    light_source = 7,
    sound = {breaks = "tool_breaks"},    
})


tool("abismal:botasabismal", {
    description = S("abysmal boots"),
    inventory_image = "botasabismal_inv.png",
    groups = {armor_feet=1, armor_heal=14.5, armor_use=300,physics_speed=0.3, physics_jump=0.3} ,
    wear = 0,
    armor_groups = {fleshy=17},
    damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
    light_source = 7,
    sound = {breaks = "tool_breaks"},
})

minetest.register_craft({
    output = "abismal:picoabismal",
    recipe = {
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"", "Desolation:stick", ""},
        {"", "Desolation:stick", ""},
    },
})

minetest.register_craft({
    output = "abismal:espadaabismal",
    recipe = {
        {"", "abismal:lingoteabismal", ""},
        {"", "abismal:lingoteabismal", ""},
        {"", "Desolation:stick", ""},
    },
})

minetest.register_craft({
    output = "abismal:hachadeabismal",
    recipe = {
        {"abismal:lingoteabismal", "abismal:lingoteabismal", ""},
        {"abismal:lingoteabismal", "Desolation:stick", ""},
        {"", "Desolation:stick", ""},
    },
})


------mecanica de la hierba abismal----
minetest.register_node("abismal:hierbaabismal", {
    description = S("abysmal grass"),
    drawtype = "plantlike",
    tiles = {{
      name = "hierbaabismal.png",
      animation = {type = "vertical_frames", aspect_w = 3, aspect_h = 3, length = 1.5},
    }},
    inventory_image = "hierbaabismalinv.png",
    wield_image = "hierbaabismalinv.png",
    paramtype = "light",
    sunlight_propagates = true,
    walkable = false,
    light_source = 4,
    damage_per_second = 1 * 2,
    selection_box = {
        type = "fixed",
        fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
    },
    groups = {snappy = 3, flammable = 2},

})
---aparicion-----------------------------------------------------------------------mineral abismal
minetest.register_abm({
    nodenames = {"Desolation:piedra", "Desolation:adoquin"},
    neighbors = {"abismal:abismalore"},
    interval = 7000,
    chance = 20,
    action = function(pos, node, active_object_count,
            active_object_count_wider)
        local pos = {x = pos.x + 6, y = pos.y + 0, z = pos.z + 6}
        local pos = {x = pos.x - 6, y = pos.y - 0, z = pos.z - 6}
        minetest.set_node(pos, {name = "abismal:hierbaabismal"})
    end
}) 


minetest.register_abm({
    nodenames = {"Desolation:piedra", "Desolation:cobblestone", "Desolation:desert_stone"},
    neighbors = {"abismal:hierbaabismal"},
    interval = 7000,
    chance = 20,
    action = function(pos, node, active_object_count,
            active_object_count_wider)
        local pos = {x = pos.x + 0, y = pos.y - 0, z = pos.z + 0}
        minetest.set_node(pos, {name = "abismal:pastoabismal"})
    end
}) 


minetest.register_node("abismal:pastoabismal", {
    description = S("abysmal dirt grass"),
    tiles = {
    "pastoabismalup.png",
    "pastoabismal.png",
    "pastoabismal.png",
    "pastoabismal.png",
    "pastoabismal.png",
},
    groups = {crumbly = 1, level = 2},
    paramtype = "light",
    sunlight_propagates = true,
    light_source = 4,
    glow = 2,
})
----

minetest.register_craft({
    output = "abismal:petoabismal",
    recipe = {
        {"abismal:lingoteabismal", "", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
    },
})

minetest.register_craft({
    output = "abismal:cascoabismal",
    recipe = {
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "", "abismal:lingoteabismal"},
        {"", "", ""},
    },
})

minetest.register_craft({
    output = "abismal:grebasabismal",
    recipe = {
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "", "abismal:lingoteabismal"},
    },
})

minetest.register_craft({
    output = "abismal:botasabismal",
    recipe = {
        {"", "", ""},
        {"abismal:lingoteabismal", "", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "", "abismal:lingoteabismal"},
    },
})

minetest.register_craft({
    output = "abismal:escudoabismal",
    recipe = {
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"", "abismal:lingoteabismal", ""},
    },
})


minetest.register_craft({
    output = "abismal:bloqueabismal",
    recipe = {
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
        {"abismal:lingoteabismal", "abismal:lingoteabismal", "abismal:lingoteabismal"},
    },
})
