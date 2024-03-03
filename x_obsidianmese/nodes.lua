--
-- Nodes
--

-- dirt path
minetest.register_node('x_obsidianmese:path_dirt', {
    description = 'Dirt Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_dirt_path_top.png',
        'x_obsidianmese_dirt_path_top.png',
        'x_obsidianmese_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults(),
})

-- grass path
minetest.register_node('x_obsidianmese:path_grass', {
    description = 'Grass Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dirt_base.png^(default_grass.png^[mask:x_obsidianmese_path_overlay.png)',
        'x_obsidianmese_dirt_path_top.png', 'x_obsidianmese_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- rainforest litter path
minetest.register_node('x_obsidianmese:path_dirt_with_rainforest_litter', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dirt_base.png^(default_rainforest_litter.png^[mask:x_obsidianmese_path_overlay.png)',
        'x_obsidianmese_dirt_path_top.png',
        'x_obsidianmese_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- dirt with snow path
minetest.register_node('x_obsidianmese:path_dirt_with_snow', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dirt_base.png^(default_snow.png^[mask:x_obsidianmese_path_overlay.png)',
        'x_obsidianmese_dirt_path_top.png', 'x_obsidianmese_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- dirt with dry grass path
minetest.register_node('x_obsidianmese:path_dirt_with_dry_grass', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dirt_base.png^(default_dry_grass.png^[mask:x_obsidianmese_path_overlay.png)',
        'x_obsidianmese_dirt_path_top.png', 'x_obsidianmese_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- dirt with coniferous litter path
minetest.register_node('x_obsidianmese:path_dirt_with_coniferous_litter', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dirt_base.png^(default_coniferous_litter.png^[mask:x_obsidianmese_path_overlay.png)',
        'x_obsidianmese_dirt_path_top.png',
        'x_obsidianmese_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- dry dirt path
minetest.register_node('x_obsidianmese:path_dry_dirt', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dry_dirt_base.png',
        'x_obsidianmese_path_dry_dirt_base.png',
        'x_obsidianmese_dry_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dry_dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults(),
})

-- dry dirt with dry grass path
minetest.register_node('x_obsidianmese:path_dry_dirt_with_dry_grass', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_dry_dirt_base.png^(default_dry_grass.png^[mask:x_obsidianmese_path_overlay.png)',
        'x_obsidianmese_path_dry_dirt_base.png',
        'x_obsidianmese_dry_dirt_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:dry_dirt',
    groups = { crumbly = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- permafrost path
minetest.register_node('x_obsidianmese:path_permafrost', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_permafrost_base.png',
        'x_obsidianmese_path_permafrost_base.png',
        'x_obsidianmese_path_permafrost_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:permafrost',
    groups = { cracky = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults(),
})

-- permafrost with stones path
minetest.register_node('x_obsidianmese:path_permafrost_with_stones', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_permafrost_base.png^(default_stones.png^[mask:x_obsidianmese_path_overlay_2.png)',
        'x_obsidianmese_path_permafrost_base.png',
        'x_obsidianmese_path_permafrost_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:permafrost_with_stones',
    groups = { cracky = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_gravel_defaults(),
})

-- permafrost with moss path
minetest.register_node('x_obsidianmese:path_permafrost_with_moss', {
    description = 'Rainforest Litter Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_path_permafrost_base.png^(default_moss.png^[mask:x_obsidianmese_path_overlay_2.png)',
        'x_obsidianmese_path_permafrost_base.png',
        'x_obsidianmese_path_permafrost_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:permafrost_with_moss',
    groups = { cracky = 3, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_grass_footstep', gain = 0.25 },
    }),
})

-- sand path
minetest.register_node('x_obsidianmese:path_sand', {
    description = 'Sand Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_sand_path_top.png',
        'x_obsidianmese_sand_path_top.png',
        'x_obsidianmese_sand_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:sand',
    groups = { crumbly = 3, falling_node = 1, not_in_creative_inventory = 1 },
    sounds = default.node_sound_sand_defaults(),
})

-- desert sand path
minetest.register_node('x_obsidianmese:path_desert_sand', {
    description = 'Desert Sand Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_desert_sand_path_top.png',
        'x_obsidianmese_desert_sand_path_top.png',
        'x_obsidianmese_desert_sand_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:desert_sand',
    groups = { crumbly = 3, falling_node = 1, not_in_creative_inventory = 1 },
    sounds = default.node_sound_sand_defaults(),
})

-- silver sand
minetest.register_node('x_obsidianmese:path_silver_sand', {
    description = 'Silver Sand Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_silver_sand_path_top.png',
        'x_obsidianmese_silver_sand_path_top.png',
        'x_obsidianmese_silver_sand_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:silver_sand',
    groups = { crumbly = 3, falling_node = 1, not_in_creative_inventory = 1 },
    sounds = default.node_sound_sand_defaults(),
})

-- snow path
minetest.register_node('x_obsidianmese:path_snowblock', {
    description = 'Snow Path',
    drawtype = 'nodebox',
    tiles = {
        'x_obsidianmese_snow_path_top.png',
        'x_obsidianmese_snow_path_top.png',
        'x_obsidianmese_snow_path_side.png'
    },
    is_ground_content = false,
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    collision_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    selection_box = {
        type = 'fixed',
        fixed = { -1 / 2, -1 / 2, -1 / 2, 1 / 2, 1 / 2 - 1 / 16, 1 / 2 },
    },
    drop = 'default:snowblock',
    groups = { crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1, not_in_creative_inventory = 1 },
    sounds = default.node_sound_dirt_defaults({
        footstep = { name = 'default_snow_footstep', gain = 0.15 },
        dug = { name = 'default_snow_footstep', gain = 0.2 },
        dig = { name = 'default_snow_footstep', gain = 0.2 }
    }),
})
