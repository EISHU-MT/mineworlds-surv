offhand = {}

local max_offhand_px = 128
local hotbar_size = tonumber(minetest.settings:get("offhand_hotbar_size") or 64)

-- register offhand inventory
minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("offhand", 1)
end)

do
	table.insert(bones.player_inventory_lists, "offhand")
	wielded_light.register_player_lightstep(function(player)
		wielded_light.track_user_entity(player, "offhand", offhand.get_offhand(player):get_name())
	end)
end

local change_handlers = {}
function offhand.register_on_item_change(func)
    table.insert(change_handlers, func)
end

local function update_offhand(player, item_before, item_after)
    for _, func in pairs(change_handlers) do
        func(player, item_before, item_after)
    end
end

-- switch itemstacks between main hand and offhand
local function switch_hands(player)
    local inv = player:get_inventory()
    local mainhand_stack = player:get_wielded_item()
    local offhand_stack = inv:get_stack("offhand", 1)
    inv:set_stack("offhand", 1, mainhand_stack)
    player:set_wielded_item(offhand_stack)
end

local function do_nothing(itemstack) return itemstack end

-- temporarily switches items between hands (for compatibility)
-- and then uses offhand item
local function use_offhand(secondary, mainhand_stack, player, pointed_thing, ...)
    if not offhand[player:get_player_name()] then return ItemStack("") end
    
    switch_hands(player)
    offhand[player:get_player_name()].switched = true
    local offhand_stack = player:get_wielded_item()
    local offhand_def = offhand_stack:get_definition()
    local use = offhand_def.on_place
    if secondary then use = offhand_def.on_secondary_use or do_nothing end
    local modified_stack = use(offhand_stack, player, pointed_thing, ...)
    -- don't change itemstack when handler returns nil
    if modified_stack == nil then modified_stack = offhand_stack end
    player:set_wielded_item(modified_stack)
    switch_hands(player)
    offhand[player:get_player_name()].switched = false
    update_offhand(player, offhand_stack, modified_stack)
    return mainhand_stack
end

local function get_tile_name(tiledef)
    if type(tiledef) == "table" then return tiledef.name end
    return tiledef
end

-- either returns an inventory_image or builds a 3D preview of the node

-- switch items between hands on configured key press
local function register_switchkey()
    controls.register_on_press(function(player, control_name)
        if control_name ~= switch_key then
            return
        elseif switch_key == "zoom" and player:get_wielded_item():get_name() == "binoculars:binoculars" then
            return
        end
        switch_hands(player)
        local item_before = player:get_wielded_item()
        local item_after = offhand.get_offhand(player)
        update_offhand(player, item_before, item_after)
    end)
end
register_switchkey()

-- overwrite item placement to utilize offhand functionality instead
-- special tools will usually not invoke this when they set a custom handler
local item_place = minetest.item_place
minetest.item_place = function(mainhand_stack, player, pointed_thing, ...)
    if not player or not player:is_player() then
        return item_place(mainhand_stack, player, pointed_thing, ...)
    end
    local inv = player:get_inventory()
    local stackname = mainhand_stack:get_name()
    if (offhand[player:get_player_name()] and (not offhand[player:get_player_name()].switched)) and (stackname == "" or minetest.registered_tools[stackname] ~= nil) and not inv:get_stack("offhand", 1):is_empty() then
        return use_offhand(false, mainhand_stack, player, pointed_thing, ...)
    end
    return item_place(mainhand_stack, player, pointed_thing, ...)
end

local function get_pointed_thing(player, itemstack)
    --- determine pointing range
    local itemdef = itemstack:get_definition()
    local range = itemdef.range
    if not itemdef.range then
        -- use empty hand's range
        local hand = minetest.registered_items[""]
        range = hand.range or 5
    end
    -- adjust player position
    local pos1 = player:get_pos()
	if pos1 then
	    --pos1 = pos1 + player:get_eye_offset()
	    pos1.y = pos1.y + (player:get_properties()).eye_height
	    -- cast ray from player's eyes
	    local pos2 = vector.add(pos1, vector.multiply(player:get_look_dir(), range))
	    local ray = Raycast(pos1, pos2, false, false)
	    -- iterate through passed nodes and determine if pointable
	    local result = nil
	    for pointed_thing in ray do
		  if pointed_thing.type == "node" then
		      local node = minetest.get_node(pointed_thing.under)
		      local nodedef = minetest.registered_nodes[node.name]
		      if nodedef and nodedef.pointable ~= false then
		          result = pointed_thing
		          break
		      end
		  else
		      result = nil
		      break
		  end
	    end
	end
    return result
end

-- detect right-click in the air when tool has no on_secondary_use handler
controls.register_on_press(function(player, control_name)
    if control_name ~= "place" then return end
    local mainhand = player:get_wielded_item()
    local stackname = mainhand:get_name() or ""
    -- tool already implements own handler, skip
    if mainhand and mainhand.on_secondary_use then return end
    -- not actually a tool, skip
    if stackname ~= "" and minetest.registered_tools[stackname] == nil then return end
    -- looking at ground -> normal on_use will be called, skip
    if get_pointed_thing(player, mainhand) ~= nil then return end
    return use_offhand(true, mainhand, player, { type = "nothing" })
end)

function offhand.get_offhand(player)
    if is_switched then
        return player:get_wielded_item()
    end
    return player:get_inventory():get_stack("offhand", 1)
end

local function offhand_get_wear(player)
    return offhand.get_offhand(player):get_wear()
end

local function offhand_get_count(player)
    return offhand.get_offhand(player):get_count()
end

minetest.register_on_joinplayer(function(player, last_login)
    offhand[player:get_player_name()] = {
        hud = {},
        last_wear = offhand_get_wear(player),
        last_count = offhand_get_count(player),
        switch = false,
    }
end)



local function rgb_to_hex(r, g, b)
    return string.format("%02x%02x%02x", r, g, b)
end

--[[
minetest.register_globalstep(function(dtime)
    for _, player in pairs(minetest.get_connected_players()) do
        local itemstack = offhand.get_offhand(player)
        local offhand_item = itemstack:get_name()
        if not offhand[player:get_player_name()] then return end
        local offhand_hud = offhand[player:get_player_name()].hud
        local item = minetest.registered_items[offhand_item]

        -- reset hud overlay if hotbar size changed
        local hotbar_count = player:hud_get_hotbar_itemcount()
        if hotbar_count ~= offhand[player:get_player_name()].hotbar_count then
            for index, _ in pairs(offhand[player:get_player_name()].hud) do
                remove_hud(player, index)
            end
        end
        offhand[player:get_player_name()].hotbar_count = hotbar_count

        if offhand_item ~= "" and item then
            local item_texture = build_inventory_icon(item)
            local position = {
                x = 0.5,
                y = 1
            }
            local offset = {
                x = - hotbar_size * (hotbar_count + 1) / 2,
                y = -32
            }
            if not offhand_hud.slot then
                offhand_hud.slot = player:hud_add({
                    hud_elem_type = "image",
                    position = position,
                    offset = offset,
                    scale = {
                        x = 2.75,
                        y = 2.75
                    },
                    text = "offhand_slot.png",
                    z_index = 0
                })
            end
            if not offhand_hud.item then
                offhand_hud.item = player:hud_add({
                    hud_elem_type = "image",
                    position = position,
                    offset = offset,
                    scale = {
                        x = 0.4,
                        y = 0.4
                    },
                    text = item_texture,
                    z_index = 1
                })
            else
                player:hud_change(offhand_hud.item, "text", item_texture)
            end
            if not offhand_hud.wear_bar_bg and minetest.registered_tools[offhand_item] then
                if offhand_get_wear(player) > 0 then
                    local texture = "offhand_wear_bar.png^[colorize:#000000"
                    offhand_hud.wear_bar_bg = player:hud_add({
                        hud_elem_type = "image",
                        position = {
                            x = 0.5,
                            y = 1
                        },
                        offset = {
                            x = offset.x,
                            y = offset.y + 19
                        },
                        scale = {
                            x = 40,
                            y = 3
                        },
                        text = texture,
                        z_index = 2
                    })
                    offhand_hud.wear_bar = player:hud_add({
                        hud_elem_type = "image",
                        position = {
                            x = 0.5,
                            y = 1
                        },
                        offset = {
                            x = offset.x,
                            y = offset.y + 19
                        },
                        scale = {
                            x = 10,
                            y = 3
                        },
                        text = texture,
                        z_index = 3
                    })
                    update_wear_bar(player, itemstack)
                end
            end

            if not offhand_hud.item_count and offhand_get_count(player) > 1 then
                offhand_hud.item_count = player:hud_add({
                    hud_elem_type = "text",
                    position = {
                        x = 0.5,
                        y = 1
                    },
                    offset = {
                        x = offset.x + 22,
                        y = offset.y + 14
                    },
                    scale = {
                        x = 1,
                        y = 1
                    },
                    alignment = {
                        x = -1,
                        y = 0
                    },
                    text = offhand_get_count(player),
                    z_index = 4,
                    number = 0xFFFFFF
                })
            end

            if offhand_hud.wear_bar then
                if offhand_hud.last_wear ~= offhand_get_wear(player) then
                    update_wear_bar(player, itemstack)
                    offhand_hud.last_wear = offhand_get_wear(player)
                end
                if offhand_get_wear(player) <= 0 or not minetest.registered_tools[offhand_item] then
                    remove_hud(player, "wear_bar_bg")
                    remove_hud(player, "wear_bar")
                end
            end

            if offhand_hud.item_count then
                if offhand_hud.last_count ~= offhand_get_count(player) then
                    player:hud_change(offhand_hud.item_count, "text", offhand_get_count(player))
                    offhand_hud.last_count = offhand_get_count(player)
                end
                if offhand_get_count(player) <= 1 then
                    remove_hud(player, "item_count")
                end
            end

        elseif offhand_hud.slot then
            for index, _ in pairs(offhand[player:get_player_name()].hud) do
                remove_hud(player, index)
            end
        end
    end
end)--]]

minetest.register_allow_player_inventory_action(function(player, action, inventory, inventory_info)
    if action == "move" and inventory_info.to_list == "offhand" then
        local itemstack = inventory:get_stack(inventory_info.from_list, inventory_info.from_index)
        return itemstack:get_stack_max()
    end
end)

--if minetest.settings:get_bool("offhand_wieldview", true) then
    --dofile(minetest.get_modpath(minetest.get_current_modname()).."/wield3d_offhand/wield3d.lua")
    --dofile(minetest.get_modpath(minetest.get_current_modname()) .. DIR_DELIM .. "wielditem.lua")
--end























local wield3dd = {}

local bone = "Arm_Left"
local pos = {x=0, y=5.5, z=3}
local scale = {x=0.25, y=0.25}
local rx = -90
local rz = 90

wield3dd.location = {
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


player_wieldingg = {}

update_time = 1
verify_time = 10
wield_scale = 0.25 -- default scale

local location = {
	"Arm_Left",          -- default bone
	{x=0, y=5.5, z=3},    -- default position
	{x=-90, y=225, z=90}, -- default rotation
	{x=0.25, y=0.25},
}

local function add_wield_entity(player, force)
	if not player or not player:is_player() then
		return
	end
	local name = player:get_player_name()
	local pos = player:get_pos()
	if name and pos then
		pos.y = pos.y + 0.5
		local object = minetest.add_entity(pos, "offhand:wield_entity")
		if object then
			object:set_attach(player, location[1], location[2], location[3], true)
			object:set_properties({
				textures = {"offhand:hand"},
				visual_size = location[4],
			})
			player_wieldingg[name] = {item="", location=location, object=object}
		end
	end
end

sttt = add_wield_entity

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
	textures = {"offhand:hand"},
	pointable = false,
	wielder2 = nil,
	timer = 0,
	static_save = false,
}



function wield_entity:on_step(dtime)
	self.timer = self.timer + dtime
	if self.timer < 1 then
		return
	end
	
	local attach = self.object:get_attach()
	if not attach then self.object:remove() return end
	
	local player = attach
	self.wielder2 = attach:get_player_name()
	
	local wield = player_wieldingg[attach:get_player_name()]
	local stack = offhand.get_offhand(player)
	local item = stack:get_name() or ""
	if wield and item ~= wield.item then
		if has_wieldview then
			local def = minetest.registered_items[item] or {}
			if def.inventory_image ~= "" then
				item = ""
			end
		end
		wield.item = item
		if item == "" then
			item = "offhand:hand"
		end
		local loc = wield3dd.location[item] or location
		if loc[1] ~= wield.location[1] or
				not vector.equals(loc[2], wield.location[2]) or
				not vector.equals(loc[3], wield.location[3]) then
			self.object:set_attach(player, loc[1], loc[2], loc[3], true)
			wield.location = {loc[1], loc[2], loc[3]}
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

local clock = 0
core.register_globalstep(function(dt)
	clock = clock + dt
	if clock >= 1 then
		--for name, data in pairs(player_wielding) do
		for _, p in pairs(core.get_connected_players()) do
			if p:get_player_name() and player_wieldingg[p:get_player_name()] and not (player_wieldingg[p:get_player_name()].object or player_wieldingg[p:get_player_name()].object:get_yaw() == nil) then
				add_wield_entity(Player(name), true)
				core.log("action", "[Offhand] ReAdding player wieldhand for: "..name)
			end
		end
		--end
		clock = 0
	end
end)--


minetest.register_entity("offhand:wield_entity", wield_entity)

minetest.register_item("offhand:hand", {
	type = "none",
	wield_image = "blank.png",
})

core.register_on_joinplayer(function(player)
	core.after(1, function(player)
		add_wield_entity(player)
	end, player)
end)
core.register_on_leaveplayer(function(player)
	player_wieldingg[player:get_player_name()] = nil
end)




































