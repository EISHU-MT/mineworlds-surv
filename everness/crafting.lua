--[[
    Everness. Never ending discovery in Everness mapgen.
    Copyright (C) 2024 SaKeL

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

--]]

--
-- Blocks
--

if minetest.get_modpath('default') then
    minetest.register_craft({
        output = 'everness:snowcobble 9',
        recipe = {
            { 'default:snowblock', 'default:snowblock', 'default:snowblock' },
            { 'default:snowblock', 'default:snowblock', 'default:snowblock' },
            { 'default:snowblock', 'default:snowblock', 'default:snowblock' },
        }
    })

    minetest.register_craft({
        output = 'everness:icecobble 9',
        recipe = {
            { 'default:ice', 'default:ice', 'default:ice' },
            { 'default:ice', 'default:ice', 'default:ice' },
            { 'default:ice', 'default:ice', 'default:ice' },
        }
    })
end

minetest.register_craft({
    output = 'everness:pyriteblock',
    recipe = {
        { 'everness:pyrite_ingot', 'everness:pyrite_ingot', 'everness:pyrite_ingot' },
        { 'everness:pyrite_ingot', 'everness:pyrite_ingot', 'everness:pyrite_ingot' },
        { 'everness:pyrite_ingot', 'everness:pyrite_ingot', 'everness:pyrite_ingot' },
    }
})

minetest.register_craft({
    output = 'everness:pyriteblock_forged',
    recipe = {
        { 'default:steel_ingot', 'everness:pyriteblock', 'default:steel_ingot' },
        { 'everness:pyriteblock', 'everness:pyriteblock', 'everness:pyriteblock' },
        { 'default:steel_ingot', 'everness:pyriteblock', 'default:steel_ingot' },
    }
})

minetest.register_craft({
    output = 'everness:pyrite_glass',
    recipe = {
        { 'group:glass' },
        { 'everness:pyrite_ingot' },
    }
})

if minetest.get_modpath('default') then
    minetest.register_craft({
        output = 'everness:pyrite_glass',
        recipe = {
            { 'default:glass' },
            { 'everness:pyrite_ingot' },
        }
    })
end

minetest.register_craft({
    output = 'everness:pyrite_lantern',
    recipe = {
        { 'everness:pyrite_glass' },
        { 'everness:pyrite_ingot' },
    }
})



minetest.register_craft({
    output = 'everness:pyriteblock_brick 4',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})

minetest.register_craft({
    output = 'everness:pyriteblock_slab_brick 2',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})

minetest.register_craft({
    output = 'everness:pyriteblock_spiral 8',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', '', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})

minetest.register_craft({
    output = 'everness:pyrite_roof_tile 6',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})

minetest.register_craft({
    output = 'everness:pyrite_pillar_bottom 5',
    recipe = {
        { '', 'everness:pyriteblock_forged', '' },
        { '', 'everness:pyriteblock_forged', '' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})

minetest.register_craft({
    output = 'everness:pyrite_pillar_middle 3',
    recipe = {
        { '', 'everness:pyriteblock_forged', '' },
        { '', 'everness:pyriteblock_forged', '' },
        { '', 'everness:pyriteblock_forged', '' },
    }
})

minetest.register_craft({
    output = 'everness:pyrite_pillar_top 5',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { '', 'everness:pyriteblock_forged', '' },
        { '', 'everness:pyriteblock_forged', '' },
    }
})

minetest.register_craft({
    output = 'everness:pyrite_pillar_small 7',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { '', 'everness:pyriteblock_forged', '' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})

minetest.register_craft({
    output = 'everness:pyriteblock_polished 9',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
    }
})



minetest.register_craft({
    output = 'everness:quartz_block 4',
    recipe = {
        { 'everness:quartz_crystal', 'everness:quartz_crystal' },
        { 'everness:quartz_crystal', 'everness:quartz_crystal' },
    }
})

minetest.register_craft({
    output = 'everness:quartz_chiseled 4',
    recipe = {
        { 'everness:quartz_block', 'everness:quartz_block' },
        { 'everness:quartz_block', 'everness:quartz_block' },
    }
})

minetest.register_craft({
    output = 'everness:quartz_pillar 3',
    recipe = {
        { '', 'everness:quartz_block', '' },
        { '', 'everness:quartz_block', '' },
        { '', 'everness:quartz_block', '' },
    }
})



--
-- Tools
--

minetest.register_craft({
    output = 'everness:vine_shears',
    recipe = {
        { '', 'everness:pyrite_ingot', '' },
        { 'group:stick', 'group:wood', 'everness:pyrite_ingot' },
        { '', '', 'group:stick' }
    }
})

minetest.register_craft({
    output = 'everness:pick_illuminating',
    recipe = {
        { 'default:mese_crystal', 'ethereal:crystal_spike', 'default:mese_crystal' },
        { '', 'group:stick', '' },
        { '', 'group:stick', '' }
    }
})

minetest.register_craft({
    output = 'everness:hammer',
    recipe = {
        { 'default:obsidian', 'default:obsidian', 'default:obsidian' },
        { 'default:obsidian', 'everness:pyriteblock_forged', 'default:obsidian' },
        { '', 'group:stick', '' }
    }
})

minetest.register_craft({
    output = 'everness:hammer_sharp',
    recipe = {
        { 'everness:pyriteblock_forged', 'everness:pyriteblock_forged', 'everness:pyriteblock_forged' },
        { 'everness:pyriteblock_forged', 'everness:hammer', 'everness:pyriteblock_forged' },
        { '', 'everness:hammer', '' }
    }
})

minetest.register_craft({
    output = 'everness:pick_archeological',
    recipe = {
        { 'group:stone', 'group:stone', 'group:stone' },
        { '', 'group:stick', '' },
        { 'group:stick', '', '' }
    }
})


