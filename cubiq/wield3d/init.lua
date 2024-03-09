--[[

MIT License

Copyright (c) 2019 stujones11, Stuart Jones

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

]]--

wield3d = {}

local bone = "Arm_Right"
local pos = {x=0, y=5.5, z=3}
local scale = {x=0.25, y=0.25}
local rx = -90
local rz = 90

wield3d.location = {
	["default:torch"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["default:sapling"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["flowers:dandelion_white"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["flowers:dandelion_yellow"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["flowers:geranium"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["flowers:rose"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["flowers:tulip"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["flowers:viola"] = {bone, pos, {x=rx, y=180, z=rz}, scale},
	["default:shovel_wood"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["default:shovel_stone"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["default:shovel_steel"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["default:shovel_bronze"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["default:shovel_mese"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["default:shovel_diamond"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["bucket:bucket_empty"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["bucket:bucket_water"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["bucket:bucket_lava"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["screwdriver:screwdriver"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["screwdriver:screwdriver1"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["screwdriver:screwdriver2"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["screwdriver:screwdriver3"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["screwdriver:screwdriver4"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["vessels:glass_bottle"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["vessels:drinking_glass"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
	["vessels:steel_bottle"] = {bone, pos, {x=rx, y=135, z=rz}, scale},
}

local pos
local scale
local bone


player_wielding = {}
local has_wieldview = minetest.get_modpath("wieldview")
local update_time = minetest.settings:get("wield3d_update_time")
local verify_time = minetest.settings:get("wield3d_verify_time")
local wield_scale = minetest.settings:get("wield3d_scale")

update_time = update_time and tonumber(update_time) or 1
verify_time = verify_time and tonumber(verify_time) or 10
wield_scale = wield_scale and tonumber(wield_scale) or 0.25 -- default scale

local location = {
	"Arm_Right",          -- default bone
	{x=0, y=5.5, z=3},    -- default position
	{x=-90, y=225, z=90}, -- default rotation
	{x=wield_scale, y=wield_scale},
}

local function add_wield_entity(player, force)
	if not player or not player:is_player() then
		return
	end
	local name = player:get_player_name()
	local pos = player:get_pos()
	if name and pos then
		pos.y = pos.y + 0.5
		local object = minetest.add_entity(pos, "wield3d:wield_entity")
		if object then
			object:set_attach(player, location[1], location[2], location[3])
			object:set_properties({
				textures = {"wield3d:hand"},
				visual_size = location[4],
			})
			player_wielding[name] = {item="", location=location, object=object}
		end
	end
end

local function sq_dist(a, b)
	local x = a.x - b.x
	local y = a.y - b.y
	local z = a.z - b.z
	return x * x + y * y + z * z
end

local wield_entity = {
	physical = false,
	collisionbox = {-0.125,-0.125,-0.125, 0.125,0.125,0.125},
	visual = "wielditem",
	textures = {"wield3d:hand"},
	pointable = false,
	wielder = nil,
	timer = 0,
	static_save = false,
	wield_hand = true
}

--function wield3d.do_reset_everyone_hand

function wield_entity:on_step(dtime)

	self.timer = self.timer + dtime
	if self.timer < 1 then
		return
	end
	
	local attach = self.object:get_attach()
	if not attach then self.object:remove() return end
	
	local player = attach
	self.wielder = attach:get_player_name()
	
	local wield = player_wielding[self.wielder]
	local stack = player:get_wielded_item()
	local item = stack:get_name() or ""
	if wield and item ~= wield.item then
		player_wielding[self.wielder].item = item
		if item == "" then
			item = "wield3d:hand"
		end
		local loc = wield3d.location[item] or location
		if loc[1] ~= wield.location[1] or not vector.equals(loc[2], wield.location[2]) or not vector.equals(loc[3], wield.location[3]) then
			self.object:set_attach(player, loc[1], loc[2], loc[3])
			player_wielding[self.wielder].location = {loc[1], loc[2], loc[3]}
		end
		self.object:set_properties({
			textures = {item},
			visual_size = loc[4],
		})
	end
	self.timer = 0
end

local function table_iter(t)
	local i = 0
	local n = table.getn(t)
	return function ()
		i = i + 1
		if i <= n then
			return t[i]
		end
	end
end

local player_iter = nil
--
local clock = 0
core.register_globalstep(function(dt)
	clock = clock + dt
	if clock >= 1 then
		print("eeee")
		--for name, data in pairs(player_wielding) do
		for _, p in pairs(core.get_connected_players()) do
			if p:get_player_name() and player_wielding[p:get_player_name()] and not (player_wielding[p:get_player_name()].object or player_wielding[p:get_player_name()].object:get_yaw() == nil) then
				add_wield_entity(Player(name), true)
				core.log("action", "ReAdding player wieldhand for: "..name)
			end
		end
		--end
		clock = 0
	end
end)--

minetest.register_entity("wield3d:wield_entity", wield_entity)

minetest.register_item("wield3d:hand", {
	type = "none",
	wield_image = "blank.png",
})

core.register_on_joinplayer(function(player)
	core.after(1, function(player)
		add_wield_entity(player)
	end, player)
end)
core.register_on_leaveplayer(function(player)
	player_wielding[player:get_player_name()] = nil
end)

