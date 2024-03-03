-- X Obsidianmese
-- by SaKeL

minetest = minetest.global_exists('minetest') and minetest --[[@as Minetest]]
ItemStack = minetest.global_exists('ItemStack') and ItemStack --[[@as ItemStack]]
vector = minetest.global_exists('vector') and vector --[[@as Vector]]
default = minetest.global_exists('default') and default --[[@as MtgDefault]]
creative = minetest.global_exists('creative') and creative --[[@as MtgCreative]]
farming = minetest.global_exists('farming') and farming --[[@as MtgFarming]]

local mod_start_time = minetest.get_us_time()
local path = minetest.get_modpath('x_obsidianmese')

dofile(path .. '/api.lua')
dofile(path .. '/tools.lua')
dofile(path .. '/nodes.lua')
dofile(path .. '/obsidianmese_chest.lua')
dofile(path .. '/crafting.lua')

local mod_end_time = (minetest.get_us_time() - mod_start_time) / 1000000

print('[Mod] x_obsidianmese loaded.. [' .. mod_end_time .. 's]')
