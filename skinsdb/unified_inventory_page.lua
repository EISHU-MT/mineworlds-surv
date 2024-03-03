local S = minetest.get_translator("skinsdb")

unified_inventory.register_button("skins", {
	type = "image",
	image = "skins_button.png",
	tooltip = S("Skins"),
	hide_lite=true,
	action = function(player)
		local context = skins.get_formspec_context(player)
		local name = player:get_player_name()
		local skin = skins.get_player_skin(player)
		local formspec = "size[8,8]"..skins.get_skin_info_formspec(skin)
		formspec = formspec..skins.get_skin_selection_formspec(player, context, 3.5)
		minetest.show_formspec(name, 'skinsdb_show_ui', formspec)
	end
})

local function get_formspec(player, perplayer_formspec)
	local context = skins.get_formspec_context(player)
	local formspec = perplayer_formspec.standard_inv_bg..
			skins.get_skin_selection_formspec(player, context, perplayer_formspec)
	return formspec
end



-- click button handlers
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.skins then
		unified_inventory.set_inventory_formspec(player, "craft")
		return
	end

	if formname ~= "" then
		return
	end

	local context = skins.get_formspec_context(player)
	local action = skins.on_skin_selection_receive_fields(player, context, fields)
	if action == 'set' then
		unified_inventory.set_inventory_formspec(player, "skins")
	elseif action == 'page' then
		unified_inventory.set_inventory_formspec(player, "skins_page")
	end
end)
