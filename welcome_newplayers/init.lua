local welcome_msg = minetest.settings:get("welcome_newplayers.msg") or "Welcome to the server!"
local welcome_pos = minetest.settings:get("welcome_newplayers.msg_pos") or "hud"

welcome = {
	mode = welcome_pos or "hud",
	msg = welcome_msg or "msg",
	huds = {}
}

minetest.register_chatcommand("welcome_msg", {
	description = "Edit welcome message",
	privs = {server = true},
	func = function(name)
		local formspec = {
			"formspec_version[4]" ..
			"size[9,7]" ..
			"label[2.1,0.6;Welcome Messages Editor]" ..
			"label[0.8,1.8;Change Welcome Message Position (optional)]" ..
			"button[0.8,2.4;3,0.9;welcome_msg_chat_button;Chat]" ..
			"button[4.6,2.4;3,0.9;welcome_msg_hud_button;HUD]" ..
			"label[2.4,4.1;Edit Welcome Message]" ..
			"field[0.2,4.5;8.5,0.8;welcome_msg_field;;]" ..
			"button_exit[4.7,5.7;3,0.9;save_button;Save]" ..
			"button_exit[0.7,5.7;3,0.9;cancel_button_exit;Cancel]"
		}
		minetest.show_formspec(name, "welcome_newplayers:editor", table.concat(formspec, ""))
	end
})

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	minetest.after(2.5, function()
		if welcome.mode == "hud" then
			welcome.huds[player:get_player_name()] = player:hud_add({
				hud_elem_type = "text",
				position = {x = 0.5, y = 0.5},
				text = welcome.msg,
				number = 0x4bd12a,
				size = {x = 3, y = 3}
			})
			minetest.after(2, function(player)
				player:hud_remove(welcome.huds[player:get_player_name()])
				welcome.huds[player:get_player_name()] = nil
			end, player)
		elseif welcome.mode == "chat" then
			minetest.chat_send_player(name, minetest.colorize("#4bd12a", welcome.msg))
		end
	end)
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local name = player:get_player_name()
	if formname == "welcome_newplayers:editor" then
		if fields.welcome_msg_chat_button then
			minetest.settings:set("welcome_newplayers.msg_pos", "chat")
			minetest.chat_send_player(name, "Changed welcome message position to chat")
			core.settings:write()
			welcome.mode = "chat"
		elseif fields.welcome_msg_hud_button then
			minetest.settings:set("welcome_newplayers.msg_pos", "hud")
			minetest.chat_send_player(name, "Changed welcome message position to HUD")
			core.settings:write()
			welcome.mode = "hud"
		end

		if fields.save_button then
			if fields.welcome_msg_field == ""  then
				minetest.chat_send_player(name, "Nothing to edit, the field is empty")
			else
				minetest.settings:set("welcome_newplayers.msg", fields.welcome_msg_field)
				minetest.chat_send_player(name, "Edited welcome message!")
				core.settings:write()
				welcome.msg = fields.welcome_msg_field
			end
		end
	end
end)
