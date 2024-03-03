-- Functions
local C = core.colorize
local storage = bank.storage
local S = bank.S

bank.minegeld_types = {
	["$1"] = "currency:minegeld",
	["$5"] = "currency:minegeld_5",
	["$10"] = "currency:minegeld_10",
	["$25"] = "currency:minegeld_25",
	["$50"] = "currency:minegeld_50",
	["$100"] = "currency:minegeld_100",
}

function Name(t)
	if type(t) == "string" then
		return t
	elseif type(t) == "userdata" then
		return t:get_player_name()
	end
end
function Player(t)
	if type(t) == "userdata" then
		return t
	elseif type(t) == "string" then
		return core.get_player_by_name(t)
	end
end

function bank.return_balance_from_raw(balance)
	local b = tonumber(balance)
	local color = "white"
	if b then
		if b < 70 then
			color = "red"
		elseif b < 130 then
			color = "orange"
		elseif b < 250 then
			color = "yellow"
		elseif b < 360 then
			color = "#7CFF00"
		elseif b > 360 then
			color = "green"
		end
		return C(color, "$"..tostring(b))
	end
	return C(color, "$0")
end

do
	local strs = storage:get_string("money")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					__null = 0
				}
		local sr = core.serialize(newtable)
		storage:set_string("money", sr)
	end
	local strs = storage:get_string("money_entry_log")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					__null = {[1] = -100, [2] = 40}
				}
		local sr = core.serialize(newtable)
		storage:set_string("money_entry_log", sr)
	end
	local strs = storage:get_string("money_transfer_log")
	if strs == "" or strs == " " or strs == nil then
		local newtable = {
					__null = {[1] = -100, [2] = 40}
				}
		local sr = core.serialize(newtable)
		storage:set_string("money_transfer_log", sr)
	end
end

function bank.get_data()
	return core.deserialize(storage:get_string("money"))
end
function bank.save_data(data)
	return storage:set_string("money", core.serialize(data))
end

function bank.log_get_data()
	return core.deserialize(storage:get_string("money_entry_log"))
end
function bank.log_save_data(data)
	return storage:set_string("money_entry_log", core.serialize(data))
end

function bank.tlog_get_data()
	return core.deserialize(storage:get_string("money_transfer_log"))
end
function bank.tlog_save_data(data)
	return storage:set_string("money_transfer_log", core.serialize(data))
end

function bank.raw_add_value(pname, v)
	local data = bank.get_data()
	data[pname] = v
	bank.save_data(data)
end

function return_real(v)
	if not v then
		return 0
	end
	local a1 = tostring(v)
	if not a1:find("-") then
		return 0
	end
	local a2 = string.sub(a1, 2)
	local a3 = tonumber(a2)
	return a3
end

function bank.log_add_entry(pname, val)
	local data = bank.log_get_data()
	table.insert(data[pname], 1, val)
	bank.log_save_data(data)
end
function bank.get_raw_log(pname)
	local data = bank.log_get_data()
	return data[pname]
end
function bank.get_transformed_log(pname, is_form)
	local data = bank.get_raw_log(pname)
	--print(dump(data))
	if data then
		local values = {}
		for _, val in pairs(data) do
			if val < 0 then
				table.insert(values, "#DB0000-$"..tostring(return_real(val)))
			elseif val > 0 then
				table.insert(values, "#00DB00+$"..tostring(val))
			else
				table.insert(values, C("white", "~ $"..tostring(val)))
			end
		end
		--print(dump(values))
		return values
	end
	return {C("orange", "Empty")}
end

function bank.tlog_add_entry(pname, val) -- val = {player = "cat|out", amount = -80}
	local data = bank.log_get_data()
	table.insert(data[pname], 1, val)
	bank.tlog_save_data(data)
end
function bank.get_raw_tlog(pname)
	local data = bank.tlog_get_data()
	return data[pname]
end
function bank.get_transformed_tlog(pname, is_form)
	local data = bank.get_raw_tlog(pname)
	if data then
		local values = {}
		--print(dump(data))
		for _, val in pairs(data) do
			if type(val) == "table" then
				if val.amount < 0 then
					table.insert(values, "#DB0000< "..val.player..": -$"..tostring(val.amount))
				elseif val.amount > 0 then
					table.insert(values, "#00DB00> "..val.player..": +$"..tostring(val.amount))
				else
					table.insert(values, C("white", "~ $"..tostring(val.amount)))
				end
			end
		end
		return values
	end
	return {C("orange", "Empty")}
end

function bank.add_value(pname, v)
	local data = bank.get_data()
	if not data[pname] then data[pname] = 0 end
	if data[pname] then
		bank.raw_add_value(pname, data[pname] + v)
		bank.log_add_entry(pname, v)
	end
end
function bank.rmv_value(pname, v)
	local data = bank.get_data()
	if not data[pname] then data[pname] = 0 end
	if data[pname] then
		bank.raw_add_value(pname, data[pname] - v)
		bank.log_add_entry(pname, -v)
	end
end
function bank.get_value(pname)
	local data = bank.get_data()
	if not data[pname] then data[pname] = 0 end
	if data[pname] then
		return data[pname]
	end
end
function bank.transfer(pname, to_transfer, amount)
	local data = bank.get_data()
	if data[pname] and data[to_transfer] then
		if data[pname] >= amount then
			bank.add_value(to_transfer, amount)
			bank.rmv_value(pname, amount)
			bank.tlog_add_entry(pname, {player = to_transfer.."|out", amount = -amount})
			bank.tlog_add_entry(to_transfer, {player = pname.."|in", amount = amount})
			return true
		end
	end
end
function bank.get_valueC(pname)
	local data = bank.get_data()
	if not data[pname] then data[pname] = 0 end
	if data[pname] then
		return bank.return_balance_from_raw(data[pname])
	end
end



function bank.send_annouce(pname, val)
	if pname and val then
		if val > 0 then
			core.chat_send_player(pname, "[Bank] "..S("You received: ")..C("green", "+$"..tostring(val)))
			return
		elseif val < 0 then
			core.chat_send_player(pname, "[Bank] "..S("You had a expense,: ")..C("red", "-$"..tostring(return_real(val))))
			return
		end
	end
end

minetest.register_on_joinplayer(function(player, last_login)
	local data = bank.get_data()
	if not data[Name(player)] then
		data[Name(player)] = 0
		core.log("action", "[Value] Setting new bank position for player:"..Name(player))
	end
	bank.save_data(data)
	local data = bank.log_get_data()
	if not data[Name(player)] then
		data[Name(player)] = {}
		core.log("action", "[ILog] Setting new bank position for player:"..Name(player))
	end
	bank.log_save_data(data)
	local data = bank.tlog_get_data()
	if not data[Name(player)] then
		data[Name(player)] = {}
		core.log("action", "[TLog] Setting new bank position for player:"..Name(player))
	end
	bank.tlog_save_data(data)
	local data = bank.get_mining_data()
	if not data[Name(player)] then
		data[Name(player)] = 0
		core.log("action", "[MLog] Setting new bank position for player:"..Name(player))
	end
	bank.save_mining_data(data)
end)










