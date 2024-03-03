local C = core.colorize
bank.ff = {
	["economy:transfer"] = bank.formspec.return_transfer_formspec,
	["economy:withdraw"] = bank.formspec.return_withdraw_formspec,
	["economy:deposit"] = bank.formspec.return_deposit_formspec,
	["economy:ignore_formspec"] = function() end,
}
core.register_on_player_receive_fields(function(player, formname, fields)
	local p = Name(player)
	if formname == "economy:main_menu" then
		if fields.transfer then
			core.show_formspec(Name(player), "economy:transfer", bank.formspec.return_transfer_formspec(bank.get_valueC(Name(player))))
		elseif fields.withdraw then
			core.show_formspec(Name(player), "economy:withdraw", bank.formspec.return_withdraw_formspec(bank.get_valueC(Name(player))))
		elseif fields.entries then
			core.show_formspec(Name(player), "economy:ignore_formspec", bank.formspec.return_income_log_formspec(bank.get_transformed_log(Name(player))))
		elseif fields.transfer_log then
			core.show_formspec(Name(player), "economy:ignore_formspec", bank.formspec.return_transfer_log_formspec(bank.get_transformed_tlog(Name(player))))
		elseif fields.deposit then
			core.show_formspec(Name(player), "economy:deposit", bank.formspec.return_deposit_formspec(bank.get_valueC(Name(player))))
		end
	elseif formname == "economy:transfer" then
		if fields.transfer then
			if (fields.transfer_to ~= "" and core.player_exists(fields.transfer_to)) and (fields.amount ~= "" and (tonumber(fields.amount) and tonumber(fields.amount) > 0)) then
				bank.transfer(Name(player), fields.transfer_to, tonumber(fields.amount))
				bank.send_annouce(Name(player), -tonumber(fields.amount))
				bank.send_annouce(fields.transfer_to, tonumber(fields.amount))
			else
				core.chat_send_player(p, C("orange", "[Bank] "..bank.S("Could not understand your request, did you type correctly the player name and the amount?")))
			end
		end
	elseif formname == "economy:deposit" then
		if fields.w_one then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$1"] then
							found_item = true
							if item:get_count() > 1 then
								item:set_count(item:get_count() - 1)
							else
								item:clear()
							end
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 1)
					bank.send_annouce(Name(player), 1)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_five then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$5"] then
							found_item = true
							if item:get_count() > 1 then
								item:set_count(item:get_count() - 1)
							else
								item:clear()
							end
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 5)
					bank.send_annouce(Name(player), 5)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_eleven then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$10"] then
							found_item = true
							if item:get_count() > 1 then
								item:set_count(item:get_count() - 1)
							else
								item:clear()
							end
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 10)
					bank.send_annouce(Name(player), 10)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_veinticinco then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$25"] then
							found_item = true
							if item:get_count() > 1 then
								item:set_count(item:get_count() - 1)
							else
								item:clear()
							end
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 25)
					bank.send_annouce(Name(player), 25)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_cincuenta then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$50"] then
							found_item = true
							if item:get_count() > 1 then
								item:set_count(item:get_count() - 1)
							else
								item:clear()
							end
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 50)
					bank.send_annouce(Name(player), 50)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_cien then
			local inv = player:get_inventory()
			if inv then
				--if inv:contains_item("main", ItemStack(bank.minegeld_types["$1"]).." 1") then
				--	
				--end
				local found_item = false
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$100"] then
							found_item = true
							if item:get_count() > 1 then
								item:set_count(item:get_count() - 1)
							else
								item:clear()
							end
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 100)
					bank.send_annouce(Name(player), 100)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		-- MAX
		if fields.w_one_max then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local item_count = 1
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$1"] then
							found_item = true
							item_count = item:get_count()
							item:clear()
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 1 * item_count)
					bank.send_annouce(Name(player), 1 * item_count)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_five_max then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local item_count = 1
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$5"] then
							found_item = true
							item_count = item:get_count()
							item:clear()
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 5 * item_count)
					bank.send_annouce(Name(player), 5 * item_count)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_eleven_max then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local item_count = 1
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$10"] then
							found_item = true
							item_count = item:get_count()
							item:clear()
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 10 * item_count)
					bank.send_annouce(Name(player), 10 * item_count)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_veinticinco_max then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local item_count = 1
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$25"] then
							found_item = true
							item_count = item:get_count()
							item:clear()
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 25 * item_count)
					bank.send_annouce(Name(player), 25 * item_count)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_cien_max then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local item_count = 1
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if not found_item then
						if item:get_name() == bank.minegeld_types["$100"] then
							found_item = true
							item_count = item:get_count()
							item:clear()
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 100 * item_count)
					bank.send_annouce(Name(player), 100 * item_count)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
		if fields.w_cincuenta_max then
			local inv = player:get_inventory()
			if inv then
				local found_item = false
				local item_count = 1
				local list = inv:get_list("main")
				for _, item in pairs(list) do -- lua_api.md line 7116
					if item:get_name() == bank.minegeld_types["$50"] then
						if not found_item then
							found_item = true
							item_count = item:get_count()
							item:clear()
							list[_] = item
						end
					end
				end
				if found_item then
					inv:set_list("main", list)
					bank.add_value(Name(player), 50 * item_count)
					bank.send_annouce(Name(player), 50 * item_count)
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money found in your inventory")))
				end
			end
		end
	elseif formname == "economy:withdraw" then
		if fields.w_one then
			local data = bank.get_data()
			if data[Name(player)] then
				if data[Name(player)] >= 1 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", ItemStack(bank.minegeld_types["$1"])) then
						inv:add_item("main", ItemStack(bank.minegeld_types["$1"]))
						bank.send_annouce(Name(player), -1)
						bank.rmv_value(Name(player), 1)
					else
						core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough space left in your inventory!")))
					end
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money left in your bank account!")))
				end
			end
		end
		if fields.w_five then
			local data = bank.get_data()
			if data[Name(player)] then
				if data[Name(player)] >= 5 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", ItemStack(bank.minegeld_types["$5"])) then
						inv:add_item("main", ItemStack(bank.minegeld_types["$5"]))
						bank.send_annouce(Name(player), -5)
						bank.rmv_value(Name(player), 5)
					else
						core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough space left in your inventory!")))
					end
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money left in your bank account!")))
				end
			end
		end
		if fields.w_eleven then
			local data = bank.get_data()
			if data[Name(player)] then
				if data[Name(player)] >= 10 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", ItemStack(bank.minegeld_types["$10"])) then
						inv:add_item("main", ItemStack(bank.minegeld_types["$10"]))
						bank.send_annouce(Name(player), -10)
						bank.rmv_value(Name(player), 10)
					else
						core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough space left in your inventory!")))
					end
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money left in your bank account!")))
				end
			end
		end
		if fields.w_veinticinco then
			local data = bank.get_data()
			if data[Name(player)] then
				if data[Name(player)] >= 25 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", ItemStack(bank.minegeld_types["$25"])) then
						inv:add_item("main", ItemStack(bank.minegeld_types["$25"]))
						bank.send_annouce(Name(player), -25)
						bank.rmv_value(Name(player), 25)
					else
						core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough space left in your inventory!")))
					end
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money left in your bank account!")))
				end
			end
		end
		if fields.w_cincuenta then
			local data = bank.get_data()
			if data[Name(player)] then
				if data[Name(player)] >= 50 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", ItemStack(bank.minegeld_types["$50"])) then
						inv:add_item("main", ItemStack(bank.minegeld_types["$50"]))
						bank.send_annouce(Name(player), -50)
						bank.rmv_value(Name(player), 50)
					else
						core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough space left in your inventory!")))
					end
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money left in your bank account!")))
				end
			end
		end
		if fields.w_cien then
			local data = bank.get_data()
			if data[Name(player)] then
				if data[Name(player)] >= 100 then
					local inv = player:get_inventory()
					if inv:room_for_item("main", ItemStack(bank.minegeld_types["$100"])) then
						inv:add_item("main", ItemStack(bank.minegeld_types["$100"]))
						bank.send_annouce(Name(player), -100)
						bank.rmv_value(Name(player), 100)
					else
						core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough space left in your inventory!")))
					end
				else
					core.chat_send_player(p, C("orange", "[Bank] "..bank.S("No enough money left in your bank account!")))
				end
			end
		end
		
		if fields.w_one_max or fields.w_five_max or fields.w_cien_max or fields.w_cincuenta_max or fields.w_veinticinco_max or fields.w_eleven_max then
			core.chat_send_player(p, C("orange", "[Bank] "..bank.S("This function is disabled [MAX]")))
		end
	end
	if (formname ~= "economy:ignore_formspec") and (formname ~= "economy:main_menu") then
		if (not fields.quit) and (not fields.exit) then
			if bank.ff[formname] then
				core.after(0.01, function(player, formname)
					core.show_formspec(Name(player), formname, bank.ff[formname](bank.get_valueC(Name(player))))
				end, player, formname)
			end
		end
	end
end)















