-- Random Messages
local S = minetest.get_translator(minetest.get_current_modname())

local random_msgs = {
	S("Consider joining at our discord server: https://discord.gg/mineworlds"),
	S("You can make a faction with /faction_make <name> and invite players with /faction_invite_player"),
	S("Invite your friends here!"),
	S("You can suggest something by going to spawn, buying a book ($1) and write whatever you want for the server"),
	S("If you want to build machines theres tubelib2 and technic (Also Digilines and Mesecons!!)"),
	S("Remember to dont spawnkill!"),
	S("Admins are EISHU, Ale_spm"),
	S("Please donate to maintain the server!"),
	S("Server hosted on Edgy1 (Chiwi.net)"),
	S("Theres so much biomes to explore! and some treasures..."),
	S("When more close from spawn, better for shops!"),
	S("Theres a big amount of ores! Go check it on the caves"),
	S("Remember to get the latest version of minetest!"),
	S("This is MineWorlds Survival Server"),
	S("You can change your skin with /skinsdb"),
	S("You can change your name color with /nametag"),
	S("You can annouce a place by doing /announce name"),
	S("If you see a player breaking the rules, report him! with /report playername action"),
	S("Also visit MineWorlds CREATIVE, Blockassault!"),
	S("Has a suggestion for the server? Send it with /report suggestion your-suggestion"),
	S("Remember everything is possible!"),
	S("Dont surrender, you can do it!"),
	S("Do you know you can craft your own flashlight? Go check it on inventory!"),
	S("Theres a block that can mark a waypoint, go check it on inventory!"),
	S("You are able to use offhand!"),
}

local time = 0

core.register_globalstep(function(dt)
	time = time + dt
	if time >= 120 then
		local int = #random_msgs
		local msg = random_msgs[math.random(1, int)]
		if msg then
			core.chat_send_all(core.colorize("lightgrey", "[Server] "..msg))
		end
		time = 0
	end
end)