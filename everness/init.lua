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

minetest = minetest.global_exists('minetest') and minetest --[[@as Minetest]]

local path = minetest.get_modpath('everness')
local mod_start_time = minetest.get_us_time()

-- Legacy backwards compatibility
minetest.register_alias('everness:dirt_with_grass_2', 'everness:dirt_with_grass_1')
minetest.register_alias('everness:path_dirt_with_grass_2', 'everness:path_dirt_with_grass_1')



dofile(path .. '/api.lua')
dofile(path .. '/nodes.lua')
dofile(path .. '/nodes_farming.lua')
dofile(path .. '/bamboo.lua')
dofile(path .. '/functions.lua')
dofile(path .. '/trees.lua')
dofile(path .. '/vines.lua')
dofile(path .. '/torches.lua')




dofile(path .. '/mapgen_after.lua')

if minetest.get_modpath('xpanes') and minetest.global_exists('xpanes') then
    dofile(path .. '/panes.lua')
end

if minetest.get_modpath('stairs') and minetest.global_exists('stairs') then
    dofile(path .. '/stairs.lua')
end

if minetest.get_modpath('walls') and minetest.global_exists('walls') then
    dofile(path .. '/walls.lua')
end

if minetest.get_modpath('default') or minetest.global_exists('default') then
    if default.register_fence
        and default.register_fence_rail
        and default.register_mesepost
    then
        dofile(path .. '/fences.lua')
    end
end

if minetest.get_modpath('doors') and minetest.global_exists('doors') then
    dofile(path .. '/doors.lua')
end


dofile(path .. '/tools.lua')
dofile(path .. '/craftitems.lua')
dofile(path .. '/crafting.lua')

dofile(path .. '/env_sounds.lua')

dofile(path .. '/privileges.lua')
dofile(path .. '/chat_commands.lua')


--
-- Mod Support
--

if minetest.get_modpath('x_farming') and minetest.global_exists('x_farming') then
    dofile(path .. '/mod_support_x_farming.lua')
end

if minetest.get_modpath('x_obsidianmese')
    and minetest.global_exists('x_obsidianmese')
    -- backwards compatibility check
    and x_obsidianmese.register_path_node
then
    dofile(path .. '/mod_support_x_obsidianmese.lua')
end

-- MineClone2
if minetest.get_modpath('mcl_core') and minetest.global_exists('mcl_core') then
    dofile(path .. '/mod_support_mcl.lua')
end

-- Minetest Game
dofile(path .. '/mod_support_mtg.lua')

local mod_end_time = (minetest.get_us_time() - mod_start_time) / 1000000

print('[Mod] everness loaded.. [' .. mod_end_time .. 's]')
