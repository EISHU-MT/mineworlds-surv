x_obsidianmese = {
    capitator_tree_names = {
        'default:cactus',
    }
}

minetest.register_on_mods_loaded(function()
    for key, value in pairs(minetest.registered_nodes) do
        if minetest.get_item_group(key, 'tree') > 0 then
            table.insert(x_obsidianmese.capitator_tree_names, key)
        end
    end

    x_obsidianmese.register_capitator()
end)

-- save how many bullets owner fired
x_obsidianmese.fired_table = {}
local enable_particles = minetest.settings:get_bool('enable_particles')

local function bound(x, minb, maxb)
    if x < minb then
        return minb
    elseif x > maxb then
        return maxb
    else
        return x
    end
end

--- Punch damage calculator.
-- By default, this just calculates damage in the vanilla way. Switch it out for something else to change the default
-- damage mechanism for mobs.
-- @param ObjectRef player
-- @param ?ObjectRef puncher
-- @param number time_from_last_punch
-- @param table tool_capabilities
-- @param ?vector direction
-- @param ?Id attacker
-- @return number The calculated damage
-- @author raymoo
function x_obsidianmese.damage_calculator(player, puncher, tflp, caps, direction, attacker)
    local a_groups = player:get_armor_groups() or {}
    local full_punch_interval = caps.full_punch_interval or 1.4
    local time_prorate = bound(tflp / full_punch_interval, 0, 1)

    local damage = 0
    for group, damage_rating in pairs(caps.damage_groups or {}) do
        local armor_rating = a_groups[group] or 0
        damage = damage + damage_rating * (armor_rating / 100)
    end

    return math.floor(damage * time_prorate)
end

-- particles
function x_obsidianmese.add_effects(pos)
    if not enable_particles then return end

    return minetest.add_particlespawner({
        amount = 2,
        time = 0,
        minpos = { x = pos.x - 1, y = pos.y + 0.5, z = pos.z - 1 },
        maxpos = { x = pos.x + 1, y = pos.y + 1.5, z = pos.z + 1 },
        minvel = { x = -0.1, y = -0.1, z = -0.1 },
        maxvel = { x = 0.3, y = -0.3, z = 0.3 },
        minacc = vector.new(),
        maxacc = vector.new(),
        minexptime = 1,
        maxexptime = 5,
        minsize = 0.5,
        maxsize = 1.5,
        texture = 'x_obsidianmese_chest_particle.png',
        glow = 7
    })
end

-- check for player near by to activate particles
function x_obsidianmese.check_around_radius(pos)
    local player_near = false

    for _, obj in ipairs(minetest.get_objects_inside_radius(pos, 16)) do
        if obj:is_player() then
            player_near = true
            break
        end
    end

    return player_near
end

-- check if within physical map limits (-30911 to 30927)
function x_obsidianmese.within_limits(pos, radius)
    if (pos.x - radius) > -30913
    and (pos.x + radius) < 30928
    and (pos.y - radius) > -30913
    and (pos.y + radius) < 30928
    and (pos.z - radius) > -30913
    and (pos.z + radius) < 30928 then
        return true -- within limits
    end

    return false -- beyond limits
end

-- remember how many bullets player fired i.e. {SaKeL: 1,...}
function x_obsidianmese.sync_fired_table(owner)
    if x_obsidianmese.fired_table[owner] ~= nil then
        if x_obsidianmese.fired_table[owner] < 0 then
            x_obsidianmese.fired_table[owner] = 0
        else
            x_obsidianmese.fired_table[owner] = x_obsidianmese.fired_table[owner] - 1
        end
    end
end

function x_obsidianmese.fire_sword(itemstack, user, pointed_thing)
    if not user:get_player_control().RMB then return end

    local speed = 8
    local pos = user:getpos()
    local v = user:get_look_dir()
    local player_name = user:get_player_name()

    if not x_obsidianmese.fired_table[player_name] or x_obsidianmese.fired_table[player_name] < 0 then
        x_obsidianmese.fired_table[player_name] = 0
    end

    if x_obsidianmese.fired_table[player_name] >= 1 then
        minetest.chat_send_player(player_name, 'You can shoot 1 shot at the time!')
        return itemstack
    end

    x_obsidianmese.fired_table[player_name] = x_obsidianmese.fired_table[player_name] + 1

    -- adjust position from where the bullet will be fired based on the look direction
    -- prevents hitting the node when looking/shooting down from the edge
    pos.x = pos.x + v.x
    pos.z = pos.z + v.z
    if v.y > 0.4 or v.y < -0.4 then
        pos.y = pos.y + v.y
    else
        pos.y = pos.y + 1
    end

    -- play shoot attack sound
    minetest.sound_play('x_obsidianmese_throwing', {
        pos = pos,
        gain = 1.0, -- default
        max_hear_distance = 10,
    })

    local obj = minetest.add_entity(pos, 'x_obsidianmese:sword_bullet')

    if not obj then
        return
    end

    local ent = obj:get_luaentity()

    if ent then
        ent._owner = player_name

        v.x = v.x * speed
        v.y = v.y * speed
        v.z = v.z * speed

        obj:set_velocity(v)
    end

    -- wear tool
    local wdef = itemstack:get_definition()
    itemstack:add_wear(65535 / (150 - 1), pointed_thing.above)

    -- Tool break sound
    if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
        minetest.sound_play(wdef.sound.breaks, { pos = pointed_thing.above, gain = 0.5 })
    end

    return itemstack
end

function x_obsidianmese.add_wear(itemstack, pos)
    -- wear tool
    local wdef = itemstack:get_definition()
    itemstack:add_wear(65535 / (400 - 1))
    -- Tool break sound
    if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
        minetest.sound_play(wdef.sound.breaks, { pos = pos, gain = 0.5 })
    end

    return itemstack
end

function x_obsidianmese.pick_engraved_place(itemstack, placer, pointed_thing)
    local idx = placer:get_wield_index() + 1 -- item to right of wielded tool
    local inv = placer:get_inventory()
    local stack = inv:get_stack('main', idx) -- stack to right of tool
    local stack_name = stack:get_name()
    local under = pointed_thing.under
    local above = pointed_thing.above
    local temp_stack

    -- handle nodes
    if pointed_thing.type == 'node' then
        local pos = minetest.get_pointed_thing_position(pointed_thing)

        if not pos or stack_name == '' then
            return itemstack
        end

        local pointed_node = minetest.get_node(pos)
        local pointed_node_def = minetest.registered_nodes[pointed_node.name]
	
        
        
        if not pointed_node then
            return itemstack
        end

        if not pointed_node_def then return itemstack end
        
        -- check if we have to use default on_place first
        if pointed_node_def.on_rightclick then
            return pointed_node_def.on_rightclick(pos, pointed_node, placer, itemstack, pointed_thing)
        end

        local udef = minetest.registered_nodes[stack_name] or minetest.registered_items[stack_name]

        if udef and udef.on_place then
            temp_stack = udef.on_place(stack, placer, pointed_thing) or stack
            inv:set_stack('main', idx, temp_stack)

            -- play sound
            if udef.sounds then
                if udef.sounds.place then
                    minetest.sound_play(udef.sounds.place.name, {
                        gain = udef.sounds.place.gain or 1
                    })
                end
            end

            return itemstack
        elseif udef and udef.on_use then
            temp_stack = udef.on_use(stack, placer, pointed_thing) or stack
            inv:set_stack('main', idx, temp_stack)

            return itemstack
        end

        -- handle default torch placement
        if stack_name == 'default:torch' then
            local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
            local fakestack = stack

            if wdir == 0 then
                fakestack:set_name('default:torch_ceiling')
            elseif wdir == 1 then
                fakestack:set_name('default:torch')
            else
                fakestack:set_name('default:torch_wall')
            end

            temp_stack = minetest.item_place(fakestack, placer, pointed_thing, wdir)

            temp_stack:set_name('default:torch')
            inv:set_stack('main', idx, temp_stack)

            -- play sound
            if udef.sounds then
                if udef.sounds.place then
                    minetest.sound_play(udef.sounds.place.name, {
                        gain = udef.sounds.place.gain or 1
                    })
                end
            end

            return itemstack
        end

        -- if everything else fails use default on_place
        stack = minetest.item_place(stack, placer, pointed_thing)
        inv:set_stack('main', idx, stack)

        -- play sound
        if udef.sounds then
            if udef.sounds.place then
                minetest.sound_play(udef.sounds.place.name, {
                    gain = udef.sounds.place.gain or 1
                })
            end
        end

        return itemstack
    end
end

function x_obsidianmese.shovel_place(itemstack, placer, pointed_thing)
    local pt = pointed_thing

    -- check if pointing at a node
    if not pt then
        return itemstack
    end

    if pt.type ~= 'node' then
        return itemstack
    end

    local pos = minetest.get_pointed_thing_position(pointed_thing)

    if not pos then
        return itemstack
    end

    local pointed_node = minetest.get_node(pos)
    local pointed_node_def = minetest.registered_nodes[pointed_node.name]
    if pointed_node_def and pointed_node_def.on_rightclick then
        return pointed_node_def.on_rightclick(pos, pointed_node, placer, itemstack, pointed_thing)
    end

    local under = minetest.get_node(pt.under)
    local p = { x = pt.under.x, y = pt.under.y + 1, z = pt.under.z }
    local above = minetest.get_node(p)

    -- return if any of the nodes is not registered
    if not minetest.registered_nodes[under.name] then
        return itemstack
    end

    if not minetest.registered_nodes[above.name] then
        return itemstack
    end

    -- check if the node above the pointed thing is air
    if above.name ~= 'air' then
        return itemstack
    end

    if minetest.is_protected(pt.under, placer:get_player_name()) then
        minetest.record_protection_violation(pt.under, placer:get_player_name())
        return itemstack
    end

    if (under.name == 'default:dirt' or under.name == 'farming:soil' or under.name == 'farming:soil_wet') and
        -- dirt path
         under.name ~= 'x_obsidianmese:path_dirt' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dirt' })

    elseif (under.name == 'default:dirt_with_grass' or
        -- grass path
            under.name == 'default:dirt_with_grass_footsteps') and
            under.name ~= 'x_obsidianmese:path_grass' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_grass' })

    elseif under.name == 'default:dirt_with_rainforest_litter' and
        -- rainforest litter path
        under.name ~= 'x_obsidianmese:path_dirt_with_rainforest_litter' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dirt_with_rainforest_litter' })

    elseif under.name == 'default:dirt_with_snow' and
        -- dirt with snow path
        under.name ~= 'x_obsidianmese:path_dirt_with_snow' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dirt_with_snow' })

    elseif under.name == 'default:dirt_with_dry_grass' and
        -- dirt with dry grass path
        under.name ~= 'x_obsidianmese:path_dirt_with_dry_grass' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dirt_with_dry_grass' })

    elseif under.name == 'default:dirt_with_coniferous_litter' and
        -- dirt with coniferous litter path
        under.name ~= 'x_obsidianmese:path_dirt_with_coniferous_litter' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dirt_with_coniferous_litter' })

    elseif under.name == 'default:dry_dirt' and
        -- dry dirt path
        under.name ~= 'x_obsidianmese:path_dry_dirt' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dry_dirt' })

    elseif under.name == 'default:dry_dirt_with_dry_grass' and
        -- dry dirt with dry grass path
        under.name ~= 'x_obsidianmese:path_dry_dirt_with_dry_grass' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_dry_dirt_with_dry_grass' })

    elseif under.name == 'default:permafrost' and
        -- permafrost path
        under.name ~= 'x_obsidianmese:path_permafrost' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_permafrost' })

    elseif under.name == 'default:permafrost_with_stones' and
        -- permafrost with stones path
        under.name ~= 'x_obsidianmese:path_permafrost_with_stones' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_permafrost_with_stones' })

    elseif under.name == 'default:permafrost_with_moss' and
        -- permafrost with moss path
        under.name ~= 'x_obsidianmese:path_permafrost_with_moss' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_permafrost_with_moss' })

    elseif under.name == 'default:sand' and
        -- sand path
            under.name ~= 'x_obsidianmese:path_sand' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_sand' })

    elseif under.name == 'default:desert_sand' and
        -- desert sand path
            under.name ~= 'x_obsidianmese:path_desert_sand' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_desert_sand' })

    elseif under.name == 'default:silver_sand' and
        -- silver sand path
            under.name ~= 'x_obsidianmese:path_silver_sand' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_silver_sand' })

    elseif under.name == 'default:snowblock' and
        -- snow path
            under.name ~= 'x_obsidianmese:path_snowblock' then
        minetest.set_node(pt.under, { name = 'x_obsidianmese:path_snowblock' })

    else
        return
    end

    -- play sound
    minetest.sound_play('default_dig_crumbly', {
        pos = pt.under,
        gain = 0.5
    })

    -- add wear
    if not minetest.settings:get_bool('creative_mode')
        or not minetest.check_player_privs(placer:get_player_name(), { creative = true })
    then
        itemstack = x_obsidianmese.add_wear(itemstack)
    end

    return itemstack
end

-- axe dig upwards
function x_obsidianmese.dig_up(pos, node, digger)
    if not digger then
        return
    end

    local wielditemname = digger:get_wielded_item():get_name()
    local whitelist = {
        ['x_obsidianmese:axe'] = true,
        ['x_obsidianmese:enchanted_axe_durable'] = true,
        ['x_obsidianmese:enchanted_axe_fast'] = true
    }

    if not whitelist[wielditemname] then
        return
    end

    local np = { x = pos.x, y = pos.y + 1, z = pos.z }
    local nn = minetest.get_node(np)

    if nn.name == node.name then
        local branches_pos = minetest.find_nodes_in_area(
            { x = np.x - 1, y = np.y, z = np.z - 1 },
            { x = np.x + 1, y = np.y + 1, z = np.z + 1 },
            node.name
        )

        minetest.node_dig(np, nn, digger)

        -- add particles only when not too far
        minetest.add_particlespawner({
            amount = math.random(1, 3),
            time = 0.5,
            minpos = { x = np.x - 0.7, y = np.y, z = np.z - 0.7 },
            maxpos = { x = np.x + 0.7, y = np.y + 0.75, z = np.z + 0.7 },
            minvel = { x = -0.5, y = -4, z = -0.5 },
            maxvel = { x = 0.5, y = -2, z = 0.5 },
            minacc = { x = -0.5, y = -4, z = -0.5 },
            maxacc = { x = 0.5, y = -2, z = 0.5 },
            minexptime = 0.5,
            maxexptime = 1,
            minsize = 0.5,
            maxsize = 2,
            collisiondetection = true,
            node = { name = nn.name }
        })

        if #branches_pos > 0 then
            for i = 1, #branches_pos do
                -- prevent infinite loop when node protected
                if minetest.is_protected(branches_pos[i], digger:get_player_name()) then
                    break
                end

                x_obsidianmese.dig_up(
                    { x = branches_pos[i].x, y = branches_pos[i].y - 1, z = branches_pos[i].z },
                    node,
                    digger
                )
            end
        end
    end
end

function x_obsidianmese.register_capitator()
    local trees = x_obsidianmese.capitator_tree_names

    for i = 1, #trees do
        local ndef = minetest.registered_nodes[trees[i]]
        local prev_after_dig = ndef.after_dig_node
        local func = function(pos, node, metadata, digger)
            x_obsidianmese.dig_up(pos, node, digger)
        end

        if prev_after_dig then
            func = function(pos, node, metadata, digger)
                prev_after_dig(pos, node, metadata, digger)
                x_obsidianmese.dig_up(pos, node, digger)
            end
        end

        minetest.override_item(trees[i], { after_dig_node = func })
    end
end

-- Taken from WorldEdit
-- Determines the axis in which a player is facing, returning an axis ('x', 'y', or 'z') and the sign (1 or -1)
function x_obsidianmese.player_axis(player)
    local dir = player:get_look_dir()
    local x, y, z = math.abs(dir.x), math.abs(dir.y), math.abs(dir.z)
    if x > y then
        if x > z then
            return 'x', dir.x > 0 and 1 or -1
        end
    elseif y > z then
        return 'y', dir.y > 0 and 1 or -1
    end
    return 'z', dir.z > 0 and 1 or -1
end

function x_obsidianmese.hoe_on_use(itemstack, user, pointed_thing)
    local pt = pointed_thing
    -- check if pointing at a node
    if not pt then
        return
    end

    if pt.type ~= 'node' then
        return
    end

    local under = minetest.get_node(pt.under)
    local above = minetest.get_node(pt.above)

    -- return if any of the nodes is not registered
    if not minetest.registered_nodes[under.name] then
        return
    end
    if not minetest.registered_nodes[above.name] then
        return
    end

    -- check if the node above the pointed thing is air
    if above.name ~= 'air' then
        return
    end

    -- check if pointing at soil
    if minetest.get_item_group(under.name, 'soil') ~= 1 then
        return
    end

    -- check if (wet) soil defined
    local regN = minetest.registered_nodes
    if regN[under.name].soil == nil or regN[under.name].soil.wet == nil or regN[under.name].soil.dry == nil then
        return
    end

    -- turn the node into soil and play sound
    minetest.set_node(pt.under, { name = regN[under.name].soil.dry })
    minetest.sound_play('default_dig_crumbly', {
        pos = pt.under,
        gain = 0.5,
    })

    minetest.add_particlespawner({
        amount = 10,
        time = 0.5,
        minpos = { x = pt.above.x - 0.4, y = pt.above.y - 0.4, z = pt.above.z - 0.4 },
        maxpos = { x = pt.above.x + 0.4, y = pt.above.y - 0.5, z = pt.above.z + 0.4 },
        minvel = { x = 0, y = 1, z = 0 },
        maxvel = { x = 0, y = 2, z = 0 },
        minacc = { x = 0, y = -4, z = 0 },
        maxacc = { x = 0, y = -8, z = 0 },
        minexptime = 1,
        maxexptime = 1.5,
        node = { name = regN[under.name].soil.dry },
        collisiondetection = true,
        object_collision = true,
    })
end
