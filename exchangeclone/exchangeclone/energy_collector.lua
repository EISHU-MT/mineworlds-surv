local S = minetest.get_translator()

local formspec =
    "size["..(exchangeclone.mcl and 9 or 8)..",9]"..
    "label[3,2;"..S("Orb").."]"..
    "list[context;main;4,2;1,1;]"..
    exchangeclone.inventory_formspec(0,5)..
    "listring[current_player;main]"..
    "listring[context;main]"..
    (exchangeclone.mcl and mcl_formspec.get_itemslot_bg(4,2,1,1) or "")

minetest.register_alias("exchangeclone:energy_collector", "exchangeclone:energy_collector_mk1")

local function check_for_furnaces(pos, set_furnace, start)
	local found = false
	for _, check_pos in pairs(exchangeclone.neighbors) do
		local new_pos = vector.add(pos, check_pos)
		local node = minetest.get_node(new_pos)
        local furnace = minetest.get_item_group(node.name, "exchangeclone_furnace")
		if furnace > 0 then
            found = true
            if start then
                local timer = minetest.get_node_timer(new_pos)
                if not timer:is_started() then
                    if furnace == 1 then -- Dark Matter
                        timer:start(0.45)
                    elseif furnace == 2 then -- Red Matter
                        timer:start(0.16)
                    end
                end
            end
			if set_furnace ~= nil then
                local meta = minetest.get_meta(new_pos)
                meta:set_int("using_collector", set_furnace)
			end
		end
	end
	return found
end

local function on_timer(pos, elapsed)
    local meta = minetest.get_meta(pos)

    local inv = meta:get_inventory()

    -- get node above
    local above = vector.add({x=0,y=1,z=0}, pos)

    local using_orb = true
    if inv:is_empty("main") then
        using_orb = false
    end

    local light = minetest.get_natural_light(above)

    if light and light >= 14 then
        if check_for_furnaces(pos, 1, true) then
            -- do nothing, energy is being used for the furnace.
            return true
        end
        local amount = meta:get_int("collector_amount")
        if using_orb then
            local stored = exchangeclone.get_orb_energy(inv, "main", 1)
            if stored + amount <= exchangeclone.orb_max then
                stored = stored + amount
            else
                stored = math.max(stored, exchangeclone.orb_max)
            end
            exchangeclone.set_orb_energy(inv, "main", 1, stored)
        else
            local placer = meta:get_string("exchangeclone_placer")
            if placer and placer ~= "" then
                local player = minetest.get_player_by_name(placer)
                if player then
                    exchangeclone.add_player_energy(player, amount)
                end
            end
        end
    else
        check_for_furnaces(pos, 0)
    end
    return true
end

local function on_construct(pos)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    inv:set_size("main", 1)
    meta:set_string("formspec", formspec)
    minetest.get_node_timer(pos):start(1)
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
    if minetest.is_protected(pos, player:get_player_name()) then
        return 0
    end
    if listname == "main" then
        if stack:get_name() == "exchangeclone:exchange_orb" then
            return stack:get_count()
        else
            return 0
        end
    end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory()
    local stack = inv:get_stack(from_list, from_index)
    return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
    if minetest.is_protected(pos, player:get_player_name()) then
        return 0
    end
    return stack:get_count()
end

function exchangeclone.register_energy_collector(itemstring, name, amount, modifier, recipe)
    if exchangeclone.pipeworks then modifier = modifier.."^pipeworks_tube_connection_stony.png" end
    minetest.register_node(itemstring, {
        description = name.."\nGenerates "..exchangeclone.format_number(amount).." energy/second",
        tiles = {
            "exchangeclone_energy_collector_up.png"..modifier,
            "exchangeclone_energy_collector_down.png"..modifier,
            "exchangeclone_energy_collector_right.png"..modifier,
            "exchangeclone_energy_collector_right.png"..modifier,
            "exchangeclone_energy_collector_right.png"..modifier,
            "exchangeclone_energy_collector_right.png"..modifier
        },
        groups = {cracky = 2, container = 2, pickaxey = 2, energy_collector = amount, tubedevice = 1, tubedevice_receiver = 1},
        _mcl_hardness = 3,
        _mcl_blast_resistance = 6,
        sounds = exchangeclone.sound_mod.node_sound_metal_defaults(),
        is_ground_content = false,
        can_dig = exchangeclone.can_dig,
        on_timer = on_timer,
        on_construct = on_construct,
        after_dig_node = exchangeclone.drop_after_dig({"main"}),
        on_metadata_inventory_move = function(pos)
            minetest.get_node_timer(pos):start(1)
        end,
        on_metadata_inventory_put = function(pos)
            minetest.get_node_timer(pos):start(1)
        end,
        on_metadata_inventory_take = function(pos)
            minetest.get_node_timer(pos):start(1)
        end,
        on_destruct = function(pos, large)
            check_for_furnaces(pos, 0)
        end,
        after_place_node = function(pos, player, itemstack, pointed_thing)
            local player_name = player:get_player_name()
            local meta = minetest.get_meta(pos)
            meta:set_int("collector_amount", amount)
            meta:set_string("exchangeclone_placer", player_name)
            meta:set_string("infotext", name.."\n"..S("Owned by ")..player_name)
            if exchangeclone.pipeworks then
                pipeworks.after_place(pos, player, itemstack, pointed_thing)
            end
        end,
        on_blast = exchangeclone.on_blast({"main"}),
        allow_metadata_inventory_put = allow_metadata_inventory_put,
        allow_metadata_inventory_move = allow_metadata_inventory_move,
        allow_metadata_inventory_take = allow_metadata_inventory_take,
    })
    minetest.register_craft({
        output = itemstring,
        recipe = recipe
    })

    if exchangeclone.pipeworks then
        minetest.override_item(itemstring, {
            tube = {
                input_inventory = "main",
                connect_sides = {left = 1, right = 1, back = 1, front = 1, bottom = 1, top = 1},
                insert_object = function(pos, node, stack, direction)
                    local meta = minetest.get_meta(pos)
                    local inv = meta:get_inventory()
                    return inv:add_item("main", stack)
                end,
                can_insert = function(pos, node, stack, direction)
                    local meta = minetest.get_meta(pos)
                    local inv = meta:get_inventory()
                    if stack:get_name() == "exchangeclone:exchange_orb" then
                        return inv:room_for_item("main", stack)
                    end
                end,
            },
            on_rotate = pipeworks.on_rotate,
        })
    end
end

local iron_block = "default:steelblock"
local glass = "default:glass"
local chest = "default:chest"

if exchangeclone.mcl then
    iron_block = "mcl_core:ironblock"
    glass = "mcl_core:glass"
    chest = "mcl_chests:chest"
end

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk1", S("Energy Collector MK1"), 4, "", {
        {glass, glass, glass},
        {"exchangeclone:exchange_orb", chest, "exchangeclone:exchange_orb"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk2", S("Energy Collector MK2"), 12, "^[multiply:#555555", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk1", "exchangeclone:energy_collector_mk1", "exchangeclone:energy_collector_mk1"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk3", S("Energy Collector MK3"), 40, "^[multiply:#770000", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk2", "exchangeclone:energy_collector_mk2", "exchangeclone:energy_collector_mk2"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk4", S("Energy Collector MK4"), 160, "^[multiply:#aa7700", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk3", "exchangeclone:energy_collector_mk3", "exchangeclone:energy_collector_mk3"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk5", S("Energy Collector MK5"), 640, "^[multiply:#007700", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk4", "exchangeclone:energy_collector_mk4", "exchangeclone:energy_collector_mk4"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk6", S("Energy Collector MK6"), 2560, "^[multiply:#007777", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk5", "exchangeclone:energy_collector_mk5", "exchangeclone:energy_collector_mk5"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk7", S("Energy Collector MK7"), 10240, "^[multiply:#000077", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk6", "exchangeclone:energy_collector_mk6", "exchangeclone:energy_collector_mk6"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk8", S("Energy Collector MK8"), 40960, "^[multiply:#770077", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk7", "exchangeclone:energy_collector_mk7", "exchangeclone:energy_collector_mk7"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk9", S("Energy Collector MK9"), 163840, "^[brighten", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk8", "exchangeclone:energy_collector_mk8", "exchangeclone:energy_collector_mk8"},
        {iron_block, iron_block, iron_block}
    }
)

exchangeclone.register_energy_collector("exchangeclone:energy_collector_mk10", S("Energy Collector MK10"), 655360, "^[invert:rgb", {
        {iron_block, iron_block, iron_block},
        {"exchangeclone:energy_collector_mk9", "exchangeclone:energy_collector_mk9", "exchangeclone:energy_collector_mk9"},
        {iron_block, iron_block, iron_block}
    }
)