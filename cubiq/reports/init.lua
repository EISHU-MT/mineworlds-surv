-- Minetest Discord Webhook
-- Version v2.1.1

-- Copyright © 2021-2024 activivan

-- PLEASE READ README.md FOR MORE INFORMATION
-- ------------------------------------------

local S = minetest.get_translator(minetest.get_current_modname())
local http = minetest.request_http_api()
local conf = minetest.settings

if not http then
    minetest.log("error",
        "[Discord Webhook] Can not access HTTP API. Please add this mod to secure.http_mods to grant access.")
    return
end

-- https://discord.com/api/webhooks/1210296284846493766/__JHNSnaaTUOHU-nAPbUzpzBhwBjX7xAsx0fmR2A44WluUjHOaeAMyJkSuiBUJh2Y0ft

function SendToDiscord(data)
    local json = minetest.write_json(data)

    http.fetch({
        url = "https://discord.com/api/webhooks/1210286196618563614/QeRIY4APIAeTxzw6F0A2FfTRtcqjhChHVtb6d-DNsNni1G6aVDdcbagsu-bVYkrVyrB0",
        method = "POST",
        extra_headers = {"Content-Type: application/json"},
        data = json
    }, function()
        -- doin nothin
    end)
end

function SendToDiscordAnnoucement(data)
    local json = minetest.write_json(data)

    http.fetch({
        url = "https://discord.com/api/webhooks/1210296284846493766/__JHNSnaaTUOHU-nAPbUzpzBhwBjX7xAsx0fmR2A44WluUjHOaeAMyJkSuiBUJh2Y0ft",
        method = "POST",
        extra_headers = {"Content-Type: application/json"},
        data = json
    }, function()
        -- doin nothin
    end)
end

-- send_webhook({
   --             content = replace(get.name_wrapper, name) .. "  " .. message
        --    })

core.register_chatcommand("report", {
	description = "Report",
	params = "<player> <reason>",
	func = function(name, param)
		local args = param:split(" ")
		local player = args[1]
		local reason = ""
		for _, r in pairs(args) do
			if _ > 1 then
				reason = reason.." "..r
			end
		end
		if player and reason then
			SendToDiscord({content = "**[Survival]** Player "..name.." reported: \""..player.."\", reason: "..reason})
			return true, S("Report have been sent!")
		else
			return true, S("Invalid usage, usage: /report player reason")
		end
	end
})

core.register_chatcommand("announce", {
	description = "Annouce",
	params = "<str>",
	func = function(name, param)
		if name and param ~= "" then
			SendToDiscordAnnoucement({content = "**[Survival]** Player: "..name.." on "..core.pos_to_string(vector.floor(core.get_player_by_name(name):get_pos())).." annouce: "..param})
			return true, S("Annoucement have been sent!")
		else
			return true, S("Invalid usage, usage: /annouce thing")
		end
	end
})
