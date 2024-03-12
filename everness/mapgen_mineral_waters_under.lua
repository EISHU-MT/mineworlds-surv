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
-- Register biomes
--

local y_max = Everness.settings.biomes.everness_mineral_waters_under.y_max
local y_min = Everness.settings.biomes.everness_mineral_waters_under.y_min

-- Mineral Waters

Everness:register_biome({
    name = 'everness:mineral_waters_under',
    node_cave_liquid = 'air',
    node_dungeon = 'everness:mineral_stone_brick',
    node_dungeon_alt = 'everness:mineral_stone_brick_with_growth',
    node_dungeon_stair = 'stairs:stair_mineral_stone_brick',
    y_max = y_max,
    y_min = y_min,
    vertical_blend = 16,
    heat_point = 78,
    humidity_point = 58,
})

--
-- Ores
--

-- Blob ore.
-- These before scatter ores to avoid other ores in blobs.

Everness:register_ore({
    ore_type = 'blob',
    ore = 'everness:mineral_stone',
    wherein = { 'mapgen_stone' },
    clust_scarcity = 16 * 16 * 16,
    clust_size = 5,
    y_max = y_max,
    y_min = y_min,
    noise_threshold = 0.0,
    noise_params = {
        offset = 0.5,
        scale = 0.2,
        spread = { x = 5, y = 5, z = 5 },
        seed = 766,
        octaves = 1,
        persist = 0.0
    },
    biomes = { 'everness:mineral_waters_under' }
})

--
-- Register decorations
--



--
-- On Generated
--
