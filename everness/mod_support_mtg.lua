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

local S = minetest.get_translator(minetest.get_current_modname())

--
-- Buckets
--

if minetest.get_modpath('bucket') then
    bucket.register_liquid(
        'everness:mineral_water_source',
        'everness:mineral_water_flowing',
        'everness:bucket_mineral_water',
        'everness_mtg_bucket_mineral_water.png',
        S('Mineral') .. ' ' .. S('Water') .. ' ' .. S('Bucket'),
        { tool = 1, water_bucket = 1 }
    )
end
