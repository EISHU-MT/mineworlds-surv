

local webhook_url = minetest.settings:get("xp_redo.discord.webhook_url")
local texture_baseurl = minetest.settings:get("xp_redo.discord.texture_baseurl")


xp_redo.register_hook({
    rank_change = function(playername, xp, rank)

      if not playername or not rank or not rank.name or not xp then
        return
      end

      local data = {
        content = "Player __" .. playername .. "__ leveled up to **" ..
          rank.name .. "** with an xp of " .. xp_redo.format_thousand(xp) .. "!"
      }

	core.chat_send_all(core.colorize("#89EC68", "Player ".. playername .. " leveled up to "..rank.name.." with an xp of "..xp_redo.format_thousand(xp).."!"))

    end
  })