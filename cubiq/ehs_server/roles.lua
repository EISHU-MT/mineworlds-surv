core.register_privilege("admin", {
	description = ehs.S("Admin role"),
	give_to_admin = true,
})
core.register_privilege("moderator", {
	description = ehs.S("Moderator role"),
	give_to_admin = true,
})
core.register_privilege("helper", {
	description = ehs.S("Helper role"),
	give_to_admin = true,
})
core.register_privilege("builder", {
	description = ehs.S("Builder role"),
	give_to_admin = true,
})
roles = {}
function roles.get_max_role(p)
	local name = Name(p)
	local privs = minetest.get_player_privs(name)
	local max_role = ""
	if privs.admin then
		return "Admin", "#FF0000"
	elseif privs.moderator then
		return "Moderator", "#FFA900"
	elseif privs.builder then
		return "Builder", "#00FFA5"
	elseif privs.helper then
		return "Helper", "#FFFF00"
	end
	return "Normal", "#00EDFF"
end
local function get_all_privs()
	local privs = {}
	for priv in pairs(core.registered_privileges) do
		table.insert(privs, priv)
	end
	return privs
end
function roles.grant_to(p, mode, quiet)
	local player = Player(p)
	local name = Name(p)
	if mode == "Admin" then
		local privs_to_grant = {}
		for _, priv in pairs(get_all_privs()) do
			privs_to_grant[priv] = true
		end
		core.set_player_privs(name, privs_to_grant)
		return ehs.S("Done.")
	elseif mode == "Moderator" then
		local privs = {kick = true, ban = true, teleport = true, moderator = true, tp = true, home = true, interact = true, shout = true}
		core.set_player_privs(name, privs)
	elseif mode == "Builder" then
		local privs = {builder = true, fly = true, teleport = true, tp = true, home = true, interact = true, shout = true}
		core.set_player_privs(name, privs)
	elseif mode == "Helper" then
		local privs = {helper = true, help_reveal = true, teleport = true, tp = true, home = true, interact = true, shout = true}
		core.set_player_privs(name, privs)
	elseif mode == "Normal" then
		local privs = {tp = true, home = true, interact = true, shout = true}
		core.set_player_privs(name, privs)
	end
	if player then
		if not quiet then
			core.chat_send_player(core.colorize("", ehs.S("-!- Admin has granted you '@1' role.", mode)))
		end
	end
end
minetest.register_chatcommand("grant_mode", {
	params = "<priv> (player) (quiet)",
	privs = {admin=true},
	description = ehs.S("Grant mode to player or yourself"),
	func = function(name, param)
		local priv, player, quiet = param:split(" ")
		if param ~= "" and priv and player then
			roles.grant_to(player, priv, quiet)
		elseif param == "" then
			roles.grant_to(name, priv, true)
		end
	end,
})













