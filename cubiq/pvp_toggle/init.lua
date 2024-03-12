pvp_choice = {}
pvp_players = {}

-- Function to remove nearby mcl_bows:arrow_entity around a player
local function remove_nearby_arrows(player, radius)
    if not player or not player:is_player() then
        return
    end

    local pos = player:get_pos()
    local radius = radius or 5 -- default radius of 5 units

    -- Get all objects within the radius
    local objects = minetest.get_objects_inside_radius(pos, radius)
    for _, obj in ipairs(objects) do
        local luaentity = obj:get_luaentity()
        -- Check if the object is the specific arrow entity
        if luaentity and luaentity.name == "mcl_bows:arrow_entity" then
            obj:remove() -- Remove the arrow entity
        end
    end
end



-- Function to toggle PvP for a player
function toggle_pvp(player)
    local pvp_setting = player:get_meta():get_string("pvp_enabled")

    if pvp_setting == "" or pvp_setting == "false" then
        player:get_meta():set_string("pvp_enabled", "true")
        minetest.chat_send_player(player:get_player_name(), "PvP is now enabled for you.")
        pvp_players[player:get_player_name()] = true
    else
        player:get_meta():set_string("pvp_enabled", "false")
        minetest.chat_send_player(player:get_player_name(), "PvP is now disabled for you.")
        pvp_players[player:get_player_name()] = false
    end
end

-- Function to check if PvP is enabled for a player
local function is_pvp_enabled(player)
    local pvp_setting = player:get_meta():get_string("pvp_enabled")
    return pvp_setting ~= "false"
end

-- Registering the /toggle_pvp command
minetest.register_chatcommand("toggle_pvp", {
    description = "Toggle PvP on or off",
    privs = {interact = true},
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if player then
            toggle_pvp(player)
        end
    end,
})

-- Register the on punch player event
minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
    -- Check if both player and hitter are valid and are players
    if not player or not hitter or not player:is_player() or not hitter:is_player() then
        return
    end

    local player_pvp_setting = player:get_meta():get_string("pvp_enabled")
    local hitter_pvp_setting = hitter:get_meta():get_string("pvp_enabled")

    -- Check if PvP is disabled for either player
    if player_pvp_setting == "false" or hitter_pvp_setting == "false" then
        return true  -- Cancel the punch event
    end
end)


-- Initialize PvP setting for each player as they join
minetest.register_on_joinplayer(function(player)
    -- Default to PvP off if not already set
    if player:get_meta():get_string("pvp_enabled") == "" then
        player:get_meta():set_string("pvp_enabled", "false")
        
    end
    if player:get_meta():get_string("pvp_enabled") == "true" then
        pvp_players[player:get_player_name()] = true
    else
        pvp_players[player:get_player_name()] = false
    end
end)

if unidied_inventory then
	unified_inventory.register_button("pvp", {
		type = "image",
		image = "default_tool_steelsword.png",
		tooltip = S("PvP"),
		hide_lite=true,
		action = function(p)
			toggle_pvp(p)
		end
	})
end