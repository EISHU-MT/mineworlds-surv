--[[

	Tubelib Addons 2
	================

	Copyright (C) 2017-2020 Joachim Stolberg

	AGPL v3
	See LICENSE.txt for more information

	timer.lua:

]]--

-- Load support for I18n
local S = tubelib_addons2.S

local CYCLE_TIME = 8

local tTime = {
	["00:00"] = 1, ["02:00"] = 2, ["04:00"] = 3,
	["06:00"] = 4, ["08:00"] = 5, ["10:00"] = 6,
	["12:00"] = 7, ["14:00"] = 8, ["16:00"] = 9,
	["18:00"] =10, ["20:00"] =11, ["22:00"] =12,
}

local sTime = "00:00,02:00,04:00,06:00,08:00,10:00,12:00,14:00,16:00,18:00,20:00,22:00"

local tAction = {
	[""] = 1,
	["on"] = 2,
	["off"] = 3,
}

local sAction = ",on,off"

local function formspec(events, numbers, actions)
	return "size[8,8]"..
		default.gui_bg..
		default.gui_bg_img..
		default.gui_slots..

		"label[0,0;"..S("Time").."]label[2.3,0;"..S("Number(s)").."]label[4.5,0;"..S("Command").."]"..
		"dropdown[0,1;2,1;e1;"..sTime..";"..events[1].."]"..
		"field[2.3,1.2;2,1;n1;;"..numbers[1].."]" ..
		"dropdown[4.5,1;3,1;a1;"..sAction..";"..tAction[actions[1]].."]"..

		"dropdown[0,2;2,1;e2;"..sTime..";"..events[2].."]"..
		"field[2.3,2.2;2,1;n2;;"..numbers[2].."]" ..
		"dropdown[4.5,2;3,1;a2;"..sAction..";"..tAction[actions[2]].."]"..

		"dropdown[0,3;2,1;e3;"..sTime..";"..events[3].."]"..
		"field[2.3,3.2;2,1;n3;;"..numbers[3].."]" ..
		"dropdown[4.5,3;3,1;a3;"..sAction..";"..tAction[actions[3]].."]"..

		"dropdown[0,4;2,1;e4;"..sTime..";"..events[4].."]"..
		"field[2.3,4.2;2,1;n4;;"..numbers[4].."]" ..
		"dropdown[4.5,4;3,1;a4;"..sAction..";"..tAction[actions[4]].."]"..

		"dropdown[0,5;2,1;e5;"..sTime..";"..events[5].."]"..
		"field[2.3,5.2;2,1;n5;;"..numbers[5].."]" ..
		"dropdown[4.5,5;3,1;a5;"..sAction..";"..tAction[actions[5]].."]"..

		"dropdown[0,6;2,1;e6;"..sTime..";"..events[6].."]"..
		"field[2.3,6.2;2,1;n6;;"..numbers[6].."]" ..
		"dropdown[4.5,6;3,1;a6;"..sAction..";"..tAction[actions[6]].."]"..

		"button_exit[3,7;2,1;exit;close]"
end


local function check_rules(pos,elapsed)
	if tubelib.data_not_corrupted(pos) then
		local hour = math.floor(minetest.get_timeofday() * 24)
		local meta = minetest.get_meta(pos)
		local events = minetest.deserialize(meta:get_string("events"))
		local numbers = minetest.deserialize(meta:get_string("numbers"))
		local actions = minetest.deserialize(meta:get_string("actions"))
		local done = minetest.deserialize(meta:get_string("done"))
		local placer_name = meta:get_string("placer_name")
		local number = meta:get_string("number")

		-- check all rules
		for idx,act in ipairs(actions) do
			if act ~= "" and numbers[idx] ~= "" then
				local hr = (events[idx] - 1) * 2
				if ((hour - hr) % 24) <= 4 then  -- last 4 hours?
					if done[idx] == false then  -- not already executed?
						tubelib.send_message(numbers[idx], placer_name, nil, act, number)
						done[idx] = true
					end
				else
					done[idx] = false
				end
			end
		end

		-- prepare for the next day
		if hour == 23 then
			done = {false,false,false,false,false,false}
		end
		meta:set_string("done",  minetest.serialize(done))
		meta:set_string("infotext", S("Tubelib Timer").." "..hour..":00")
		return true
	end
	return false
end


minetest.register_node("tubelib_addons2:timer", {
	description = S("Tubelib Timer"),
	tiles = {
		-- up, down, right, left, back, front
		'tubelib_front.png',
		'tubelib_front.png',
		'tubelib_front.png^tubelib_addon2_timer.png',
	},

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		local number = tubelib.add_node(pos, "tubelib_addons2:timer")
		meta:set_string("number", number)
		local events = {1,1,1,1,1,1}
		local numbers = {"0000","","","","",""}
		local actions = {"","","","","",""}
		local done = {false,false,false,false,false,false}
		meta:set_string("placer_name", placer:get_player_name())
		meta:set_string("events",  minetest.serialize(events))
		meta:set_string("numbers", minetest.serialize(numbers))
		meta:set_string("actions", minetest.serialize(actions))
		meta:set_string("done",  minetest.serialize(done))
		meta:set_string("formspec", formspec(events, numbers, actions))
		minetest.get_node_timer(pos):start(CYCLE_TIME)
	end,

	on_receive_fields = function(pos, formname, fields, player)
		local meta = minetest.get_meta(pos)
		if minetest.is_protected(pos, player:get_player_name()) then
			return
		end

		local events = minetest.deserialize(meta:get_string("events"))
		for idx, evt in ipairs({fields.e1, fields.e2, fields.e3, fields.e4, fields.e5, fields.e6}) do
			if evt ~= nil then
				events[idx] = tTime[evt]
			end
		end
		meta:set_string("events", minetest.serialize(events))

		local numbers = minetest.deserialize(meta:get_string("numbers"))
		for idx, num in ipairs({fields.n1, fields.n2, fields.n3, fields.n4, fields.n5, fields.n6}) do
			if num ~= nil and tubelib.check_numbers(num)then
				numbers[idx] = num
			end
		end
		meta:set_string("numbers", minetest.serialize(numbers))

		local actions = minetest.deserialize(meta:get_string("actions"))
		for idx, act in ipairs({fields.a1, fields.a2, fields.a3, fields.a4, fields.a5, fields.a6}) do
			if act ~= nil then
				actions[idx] = act
			end
		end
		meta:set_string("actions", minetest.serialize(actions))

		meta:set_string("formspec", formspec(events, numbers, actions))
		local done = {false,false,false,false,false,false}
		meta:set_string("done",  minetest.serialize(done))
	end,

	on_timer = check_rules,

	after_dig_node = function(pos)
		tubelib.remove_node(pos)
	end,

	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {choppy=2, cracky=2, crumbly=2},
	is_ground_content = false,
	on_blast = function() end,
})


minetest.register_craft({
	output = "tubelib_addons2:timer",
	recipe = {
		{"group:wood", "group:wood", ""},
		{"default:gold_ingot", "tubelib:wlanchip", ""},
		{"group:wood", "group:wood", ""},
	},
})

tubelib.register_node("tubelib_addons2:timer", {}, {
	on_node_load = function(pos)
		local meta = minetest.get_meta(pos)
		minetest.get_node_timer(pos):start(CYCLE_TIME)
		-- check rules for just loaded areas
		local done = {false,false,false,false,false,false}
		meta:set_string("done",  minetest.serialize(done))
		check_rules(pos,0)
	end,
})
