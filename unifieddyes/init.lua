--[[

Unified Dyes

This mod provides an extension to the Minetest 0.4.x dye system

==============================================================================

Copyright (C) 2012-2013, Vanessa Ezekowitz
Email: vanessaezekowitz@gmail.com

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

==============================================================================

--]]

--=====================================================================

unifieddyes = {}

local creative_mode = minetest.settings:get_bool("creative_mode")

-- Boilerplate to support localized strings if intllib mod is installed.
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end

-- helper functions for other mods that use this one

unifieddyes.HUES = {
	"red",
	"orange",
	"yellow",
	"lime",
	"green",
	"aqua",
	"cyan",
	"skyblue",
	"blue",
	"violet",
	"magenta",
	"redviolet"
}

-- the names of the various colors here came from http://www.procato.com/rgb+index/

unifieddyes.HUES_EXTENDED = {
	{ "red",        0xff, 0x00, 0x00 },
	{ "vermilion",  0xff, 0x40, 0x00 },
	{ "orange",     0xff, 0x80, 0x00 },
	{ "amber",      0xff, 0xbf, 0x00 },
	{ "yellow",     0xff, 0xff, 0x00 },
	{ "lime",       0xbf, 0xff, 0x00 },
	{ "chartreuse", 0x80, 0xff, 0x00 },
	{ "harlequin",  0x40, 0xff, 0x00 },
	{ "green",      0x00, 0xff, 0x00 },
	{ "malachite",  0x00, 0xff, 0x40 },
	{ "spring",     0x00, 0xff, 0x80 },
	{ "turquoise",  0x00, 0xff, 0xbf },
	{ "cyan",       0x00, 0xff, 0xff },
	{ "cerulean",   0x00, 0xbf, 0xff },
	{ "azure",      0x00, 0x80, 0xff },
	{ "sapphire",   0x00, 0x40, 0xff },
	{ "blue",       0x00, 0x00, 0xff },
	{ "indigo",     0x40, 0x00, 0xff },
	{ "violet",     0x80, 0x00, 0xff },
	{ "mulberry",   0xbf, 0x00, 0xff },
	{ "magenta",    0xff, 0x00, 0xff },
	{ "fuchsia",    0xff, 0x00, 0xbf },
	{ "rose",       0xff, 0x00, 0x80 },
	{ "crimson",    0xff, 0x00, 0x40 }
}

unifieddyes.HUES_WALLMOUNTED = {
	"red",
	"orange",
	"yellow",
	"green",
	"cyan",
	"blue",
	"violet",
	"magenta"
}

unifieddyes.SATS = {
	"",
	"_s50"
}

unifieddyes.VALS = {
	"",
	"medium_",
	"dark_"
}

unifieddyes.VALS_EXTENDED = {
	"faint_",
	"pastel_",
	"light_",
	"bright_",
	"",
	"medium_",
	"dark_"
}

unifieddyes.GREYS = {
	"white",
	"light_grey",
	"grey",
	"dark_grey",
	"black"
}

unifieddyes.GREYS_EXTENDED = table.copy(unifieddyes.GREYS)

for i = 1, 14 do
	if i ~= 0 and i ~= 3 and i ~= 7 and i ~= 11 and i ~= 15 then
		table.insert(unifieddyes.GREYS_EXTENDED, "grey_"..i)
	end
end

local default_dyes = {
	"black",
	"blue",
	"brown",
	"cyan",
	"dark_green",
	"dark_grey",
	"green",
	"grey",
	"magenta",
	"orange",
	"pink",
	"red",
	"violet",
	"white",
	"yellow"
}

unifieddyes.player_current_dye = {}
unifieddyes.player_selected_dye = {}

-- if a node with a palette is placed in the world,
-- but the itemstack used to place it has no palette_index (color byte),
-- create something appropriate to make it officially white.

minetest.register_on_placenode(
	function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
		local def = minetest.registered_items[newnode.name]

		if not def
		  or not def.palette
		  or def.after_place_node then
			return false
		end

		if not newnode.param2 then newnode.param2 = 0 end

		if not string.find(itemstack:to_string(), "palette_index") then
			local param2 = 0
			local color = 0

			if def.palette == "unifieddyes_palette_extended.png" then
				param2 = 240
				color = 240
			elseif def.palette == "unifieddyes_palette_colorwallmounted.png" then
				param2 = newnode.param2 % 8
			elseif def.palette ~= "unifieddyes_palette.png" then -- it's a split palette
				param2 = newnode.param2 % 32
			end

			minetest.swap_node(pos, {name = newnode.name, param2 = param2})
			minetest.get_meta(pos):set_int("palette_index", color)
		end
	end
)

-- just stubs to keep old mods from crashing when expecting auto-coloring
-- or getting back the dye on dig.

function unifieddyes.recolor_on_place(foo)
end

function unifieddyes.after_dig_node(foo)
end

-- This helper function creates a colored itemstack

function unifieddyes.make_colored_itemstack(item, palette, color)
	local paletteidx = unifieddyes.getpaletteidx(color, palette)
	local stack = ItemStack(item)
	stack:get_meta():set_int("palette_index", paletteidx)
	return stack:to_string(),paletteidx
end

-- if your node was once 89-color and uses an LBM to convert to the 256-color palette,
-- call this in that node def's on_construct:

function unifieddyes.on_construct(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("palette", "ext")
end

-- these helper functions register all of the recipes needed to create colored
-- nodes with any of the dyes supported by that node's palette.

local function register_c(craft, hue, sat, val)
	local color = ""
	if val then
		if craft.palette ~= "extended" then
			color = val..hue..sat
		else
			color = val..hue[1]..sat
		end
	else
		color = hue -- if val is nil, then it's grey.
	end

	local dye = "dye:"..color
	local recipe = minetest.serialize(craft.recipe)
	recipe = string.gsub(recipe, "MAIN_DYE", dye)
	recipe = string.gsub(recipe, "NEUTRAL_NODE", craft.neutral_node)
	local newrecipe = minetest.deserialize(recipe)

	local output = craft.output
	if craft.output_prefix then
		if craft.palette ~= true then
			output = craft.output_prefix..color..craft.output_suffix
		else
			if hue == "white" or hue == "black" or string.find(hue, "grey") then
				output = craft.output_prefix.."grey"..craft.output_suffix
			elseif hue == "pink" then
				dye = "dye:light_red"
				output = craft.output_prefix.."red"..craft.output_suffix
			else
				output = craft.output_prefix..hue..craft.output_suffix
			end
		end
	end

	local colored_itemstack =
		unifieddyes.make_colored_itemstack(output, craft.palette, dye)

	minetest.register_craft({
		output = colored_itemstack,
		type = craft.type,
		recipe = newrecipe
	})

end

function unifieddyes.register_color_craft(craft)
	local hues_table = unifieddyes.HUES
	local sats_table = unifieddyes.SATS
	local vals_table = unifieddyes.VALS
	local greys_table = unifieddyes.GREYS

	if craft.palette == "wallmounted" then
		register_c(craft, "green", "", "light_")
		register_c(craft, "azure", "", "")
		hues_table = unifieddyes.HUES_WALLMOUNTED
		sats_table = {""}
		vals_table = unifieddyes.VALS
	elseif craft.palette == "extended" then
		hues_table = unifieddyes.HUES_EXTENDED
		vals_table = unifieddyes.VALS_EXTENDED
		greys_table = unifieddyes.GREYS_EXTENDED
	end

	for _, hue in ipairs(hues_table) do
		for _, val in ipairs(vals_table) do
			for _, sat in ipairs(sats_table) do

				if sat == "_s50" and val ~= "" and val ~= "medium_" and val ~= "dark_" then break end
				register_c(craft, hue, sat, val)

			end
		end
	end

	for _, grey in ipairs(greys_table) do
		register_c(craft, grey)
	end

	register_c(craft, "pink")

end

-- code borrowed from homedecor
-- call this function to reset the rotation of a "wallmounted" object on place

function unifieddyes.fix_rotation(pos, placer, itemstack, pointed_thing)
	local node = minetest.get_node(pos)
	local colorbits = node.param2 - (node.param2 % 8)

	local yaw = placer:get_look_horizontal()
	local dir = minetest.yaw_to_dir(yaw) -- -1.5)
	local pitch = placer:get_look_vertical()

	local fdir = minetest.dir_to_wallmounted(dir)

	if pitch < -(math.pi/8) then
		fdir = 0
	elseif pitch > math.pi/8 then
		fdir = 1
	end
	minetest.swap_node(pos, { name = node.name, param2 = fdir+colorbits })
end

-- use this when you have a "wallmounted" node that should never be oriented
-- to floor or ceiling...

function unifieddyes.fix_rotation_nsew(pos, placer, itemstack, pointed_thing)
	local node = minetest.get_node(pos)
	local colorbits = node.param2 - (node.param2 % 8)
	local yaw = placer:get_look_horizontal()
	local dir = minetest.yaw_to_dir(yaw+1.5)
	local fdir = minetest.dir_to_wallmounted(dir)

	minetest.swap_node(pos, { name = node.name, param2 = fdir+colorbits })
end

-- ... and use this one to force that kind of node off of floor/ceiling
-- orientation after the screwdriver rotates it.

function unifieddyes.fix_after_screwdriver_nsew(pos, node, user, mode, new_param2)
	local new_fdir = new_param2 % 8
	local color = new_param2 - new_fdir
	if new_fdir < 2 then
		new_fdir = 2
		minetest.swap_node(pos, { name = node.name, param2 = new_fdir + color })
		return true
	end
end

function unifieddyes.is_buildable_to(placer_name, ...)
	for _, pos in ipairs({...}) do
		local node = minetest.get_node_or_nil(pos)
		local def = node and minetest.registered_nodes[node.name]
		if not (def and def.buildable_to) or minetest.is_protected(pos, placer_name) then
			return false
		end
	end
	return true
end

function unifieddyes.get_hsv(name) -- expects a node/item name
	local hue = ""
	local a,b
	for _, i in ipairs(unifieddyes.HUES) do
		a,b = string.find(name, "_"..i)
		if a and not ( string.find(name, "_redviolet") and i == "red" ) then
			hue = i
			break
		end
	end

	if string.find(name, "_light_grey")     then hue = "light_grey"
	elseif string.find(name, "_lightgrey")  then hue = "light_grey"
	elseif string.find(name, "_dark_grey")  then hue = "dark_grey"
	elseif string.find(name, "_darkgrey")   then hue = "dark_grey"
	elseif string.find(name, "_grey")       then hue = "grey"
	elseif string.find(name, "_white")      then hue = "white"
	elseif string.find(name, "_black")      then hue = "black"
	end

	local sat = ""
	if string.find(name, "_s50")    then sat = "_s50" end

	local val = ""
	if string.find(name, "dark_")   then val = "dark_"   end
	if string.find(name, "medium_") then val = "medium_" end
	if string.find(name, "light_")  then val = "light_"  end

	return hue, sat, val
end

-- code partially borrowed from cheapie's plasticbox mod

-- in the function below, color is just a color string, while
-- palette_type can be:
--
-- false/nil = standard 89 color palette
-- true = 89 color palette split into pieces for colorfacedir
-- "wallmounted" = 32-color abridged palette
-- "extended" = 256 color palette

function unifieddyes.getpaletteidx(color, palette_type)

	local origcolor = color
	local aliases = {
		["pink"] = "light_red",
		["brown"] = "medium_orange",
		["azure"] = "light_blue"
	}

	local grayscale = {
		["white"] = 1,
		["light_grey"] = 2,
		["grey"] = 3,
		["dark_grey"] = 4,
		["black"] = 5,
	}

	local grayscale_extended = {
		["white"] = 0,
		["grey_14"] = 1,
		["grey_13"] = 2,
		["grey_12"] = 3,
		["light_grey"] = 3,
		["grey_11"] = 4,
		["grey_10"] = 5,
		["grey_9"] = 6,
		["grey_8"] = 7,
		["grey"] = 7,
		["grey_7"] = 8,
		["grey_6"] = 9,
		["grey_5"] = 10,
		["grey_4"] = 11,
		["dark_grey"] = 11,
		["grey_3"] = 12,
		["grey_2"] = 13,
		["grey_1"] = 14,
		["black"] = 15,
	}

	local grayscale_wallmounted = {
		["white"] = 0,
		["light_grey"] = 1,
		["grey"] = 2,
		["dark_grey"] = 3,
		["black"] = 4,
	}

	local hues = {
		["red"] = 1,
		["orange"] = 2,
		["yellow"] = 3,
		["lime"] = 4,
		["green"] = 5,
		["aqua"] = 6,
		["spring"] = 6,
		["cyan"] = 7,
		["skyblue"] = 8,
		["azure"] = 8,
		["blue"] = 9,
		["violet"] = 10,
		["magenta"] = 11,
		["redviolet"] = 12,
		["rose"] = 12,
	}

	local hues_extended = {
		["red"] = 0,
		["vermilion"] = 1,
		["orange"] = 2,
		["amber"] = 3,
		["yellow"] = 4,
		["lime"] = 5,
		["chartreuse"] = 6,
		["harlequin"] = 7,
		["green"] = 8,
		["malachite"] = 9,
		["spring"] = 10,
		["aqua"] = 10,
		["turquoise"] = 11,
		["cyan"] = 12,
		["cerulean"] = 13,
		["azure"] = 14,
		["skyblue"] = 14,
		["sapphire"] = 15,
		["blue"] = 16,
		["indigo"] = 17,
		["violet"] = 18,
		["mulberry"] = 19,
		["magenta"] = 20,
		["fuchsia"] = 21,
		["rose"] = 22,
		["redviolet"] = 22,
		["crimson"] = 23,
	}

	local hues_wallmounted = {
		["red"] = 0,
		["orange"] = 1,
		["yellow"] = 2,
		["green"] = 3,
		["cyan"] = 4,
		["blue"] = 5,
		["violet"] = 6,
		["magenta"] = 7
	}

	local shades = {
		[""] = 1,
		["s50"] = 2,
		["light"] = 3,
		["medium"] = 4,
		["mediums50"] = 5,
		["dark"] = 6,
		["darks50"] = 7,
	}

	local shades_extended = {
		["faint"] = 0,
		["pastel"] = 1,
		["light"] = 2,
		["bright"] = 3,
		[""] = 4,
		["s50"] = 5,
		["medium"] = 6,
		["mediums50"] = 7,
		["dark"] = 8,
		["darks50"] = 9
	}

	local shades_wallmounted = {
		[""] = 1,
		["medium"] = 2,
		["dark"] = 3
	}

	if string.sub(color,1,4) == "dye:" then
		color = string.sub(color,5,-1)
	elseif string.sub(color,1,12) == "unifieddyes:" then
		color = string.sub(color,13,-1)
	else
		return
	end

	if palette_type == "wallmounted" then
		if grayscale_wallmounted[color] then
			return (grayscale_wallmounted[color] * 8), 0
		end
	elseif palette_type == true then
		if grayscale[color] then
			return (grayscale[color] * 32), 0
		end
	elseif palette_type == "extended" then
		if grayscale_extended[color] then
			return grayscale_extended[color]+240, 0
		end
	else
		if grayscale[color] then
			return grayscale[color], 0
		end
	end

	local shade = "" -- assume full
	if string.sub(color,1,6) == "faint_" then
		shade = "faint"
		color = string.sub(color,7,-1)
	elseif string.sub(color,1,7) == "pastel_" then
		shade = "pastel"
		color = string.sub(color,8,-1)
	elseif string.sub(color,1,6) == "light_" then
		shade = "light"
		color = string.sub(color,7,-1)
	elseif string.sub(color,1,7) == "bright_" then
		shade = "bright"
		color = string.sub(color,8,-1)
	elseif string.sub(color,1,7) == "medium_" then
		shade = "medium"
		color = string.sub(color,8,-1)
	elseif string.sub(color,1,5) == "dark_" then
		shade = "dark"
		color = string.sub(color,6,-1)
	end
	if string.sub(color,-4,-1) == "_s50" then
		shade = shade.."s50"
		color = string.sub(color,1,-5)
	end

	if palette_type == "wallmounted" then
		if color == "green" and shade == "light" then return 48,3
		elseif color == "brown" then return 17,1
		elseif color == "pink" then return 56,7
		elseif color == "azure" then return 40,5
		elseif hues_wallmounted[color] and shades_wallmounted[shade] then
			return (shades_wallmounted[shade] * 64 + hues_wallmounted[color] * 8), hues_wallmounted[color]
		end
	else
		if color == "brown" then
			color = "orange"
			shade = "medium"
		elseif color == "pink" then
			color = "red"
			shade = "light"
		end
		if palette_type == true then -- it's colorfacedir, so "split" 89-color palette

			-- If using this palette, translate new color names back to old.

			if color == "spring" then
				color = "aqua"
			elseif color == "azure" then
				color = "skyblue"
			elseif color == "rose" then
				color = "redviolet"
			end

			if hues[color] and shades[shade] then
				return (shades[shade] * 32), hues[color]
			end
		elseif palette_type == "extended" then
			if hues_extended[color] and shades_extended[shade] then
				return (hues_extended[color] + shades_extended[shade]*24), hues_extended[color]
			end
		else -- it's the regular 89-color palette, do the same translation if needed
			if color == "spring" then
				color = "aqua"
			elseif color == "azure" then
				color = "skyblue"
			elseif color == "rose" then
				color = "redviolet"
			end
			if hues[color] and shades[shade] then
				return (hues[color] * 8 + shades[shade]), hues[color]
			end
		end
	end
end

-- punch-to-recolor using the airbrush

function unifieddyes.on_airbrush(itemstack, player, pointed_thing)
	local player_name = player:get_player_name()
	local painting_with = nil

	if unifieddyes.player_current_dye[player_name] then
		painting_with = unifieddyes.player_current_dye[player_name]
	end

	local pos = minetest.get_pointed_thing_position(pointed_thing)
	if not pos then return end

	local node = minetest.get_node(pos)
	local def = minetest.registered_items[node.name]
	if not def then return end

	if minetest.is_protected(pos, player_name) then
		minetest.chat_send_player(player_name, "*** Sorry, someone else owns that node.")
		return
	end

	if not painting_with then
		minetest.chat_send_player(player_name, "*** You need to set a color first.")
		minetest.chat_send_player(player_name, "*** Right-click any random node to open the color selector,")
		minetest.chat_send_player(player_name, "*** or shift+right-click a colorized node to use its color.")
		minetest.chat_send_player(player_name, "*** Be sure to click \"Accept\", or the color you select will be ignored.")
		return
	end

	if not def.palette or not (def.groups and def.groups.ud_param2_colorable > 0) then
		minetest.chat_send_player(player_name, "*** That node can't be colored.")
		return
	end

	local palette = nil
	local fdir = 0
	if def.palette == "unifieddyes_palette_extended.png" then
		palette = "extended"
	elseif def.palette == "unifieddyes_palette_colorwallmounted.png" then
		palette = "wallmounted"
		fdir = node.param2 % 8
	elseif def.palette ~= "unifieddyes_palette.png" then
		palette = true
		fdir = node.param2 % 32
	end

	local idx, hue = unifieddyes.getpaletteidx(painting_with, palette)
	local inv = player:get_inventory()
	if (not creative or not creative.is_enabled_for(player_name)) and not inv:contains_item("main", painting_with) then
		local suff = ""
		if not idx then
			suff = "  Besides, "..string.sub(painting_with, 5).." can't be applied to that node."
		end
		minetest.chat_send_player(player_name, "*** You're in survival mode, and you're out of "..string.sub(painting_with, 5).."."..suff)
		return
	end

	if not idx then
		minetest.chat_send_player(player_name, "*** "..string.sub(painting_with, 5).." can't be applied to that node.")
		return
	end

	local oldidx = node.param2 - fdir
	local name = def.airbrush_replacement_node or node.name

	if palette == true then
		local modname = string.sub(name, 1, string.find(name, ":")-1)
		local nodename2 = string.sub(name, string.find(name, ":")+1)
		local oldcolor = "snozzberry"
		local newcolor = "razzberry" -- intentionally misspelled ;-)

		if def.ud_color_start and def.ud_color_end then
			oldcolor = string.sub(node.name, def.ud_color_start, def.ud_color_end)
			newcolor = string.sub(painting_with, 5)
		else
			if hue ~= 0 then
				newcolor = unifieddyes.HUES[hue]
			else
				newcolor = "grey"
			end

			local s = string.sub(def.palette, 21)
			oldcolor = string.sub(s, 1, string.find(s, "s.png")-1)
		end

		if newcolor == "spring" then newcolor = "aqua"
		elseif newcolor == "azure" then newcolor = "skyblue"
		elseif newcolor == "rose" then newcolor = "redviolet"
		end

		name = modname..":"..string.gsub(nodename2, oldcolor, newcolor)
		if not minetest.registered_items[name] then
			minetest.chat_send_player(player_name, "*** "..string.sub(painting_with, 5).." can't be applied to that node.")
			return
		end
	elseif idx == oldidx then
		return
	end
	minetest.swap_node(pos, {name = name, param2 = fdir + idx})
	if not creative or not creative.is_enabled_for(player_name) then
		inv:remove_item("main", painting_with)
		return
	end
end

-- get a node's dye color based on its palette and param2

function unifieddyes.color_to_name(param2, def)
	if not param2 or not def or not def.palette then return end

	if def.palette == "unifieddyes_palette_extended.png" then
		local color = param2

		local v = 0
		local s = 1 
		if color < 24 then v = 1
		elseif color > 23  and color < 48  then v = 2
		elseif color > 47  and color < 72  then v = 3
		elseif color > 71  and color < 96  then v = 4
		elseif color > 95  and color < 120 then v = 5
		elseif color > 119 and color < 144 then v = 5 s = 2
		elseif color > 143 and color < 168 then v = 6
		elseif color > 167 and color < 192 then v = 6 s = 2
		elseif color > 191 and color < 216 then v = 7
		elseif color > 215 and color < 240 then v = 7 s = 2
		end

		if color > 239 then
			if color == 240 then return "white"
			elseif color == 244 then return "light_grey"
			elseif color == 247 then return "grey"
			elseif color == 251 then return "dark_grey"
			elseif color == 255 then return "black" 
			else return "grey_"..15-(color-240)
			end
		else
			local h = color - math.floor(color/24)*24
			return unifieddyes.VALS_EXTENDED[v]..unifieddyes.HUES_EXTENDED[h+1][1]..unifieddyes.SATS[s]
		end

	elseif def.palette == "unifieddyes_palette.png" then
		local color = param2
		local h = math.floor(color/8)
		local s = 1
		local val = ""
		if color == 1 or color == h or color > 103 or color == 6 or color == 7 then return "white"
		elseif color == 2 then return "light_grey"
		elseif color == 3 then return "grey"
		elseif color == 4 then return "dark_grey"
		elseif color == 5 then return "black"
		end
		local c = color - h*8
		if c == 2 then s = 2
		elseif c == 3 then val = "light_"
		elseif c == 4 then val = "medium_"
		elseif c == 5 then val = "medium_" s = 2
		elseif c == 6 then val = "dark_"
		else val = "dark_" s = 2
		end

		return val..unifieddyes.HUES[h+1]..unifieddyes.SATS[s]
 
	elseif def.palette == "unifieddyes_palette_colorwallmounted.png" then
		local color = math.floor(param2 / 8)
		if color == 0 then return "white"
		elseif color == 1 then return "light_grey"
		elseif color == 2 then return "grey"
		elseif color == 3 then return "dark_grey"
		elseif color == 4 then return "black"
		elseif color == 5 then return "light_blue"
		elseif color == 6 then return "light_green"
		elseif color == 7 then return "pink"
		end
		local v = math.floor(color/8)
		local h = color - v * 8
		return unifieddyes.VALS[v]..unifieddyes.HUES_WALLMOUNTED[h+1]

	elseif string.find(def.palette, "unifieddyes_palette") then -- it's the "split" 89-color palette
		-- palette names in this mode are always "unifieddyes_palette_COLORs.png"

		local s = string.sub(def.palette, 21)
		local color = string.sub(s, 1, string.find(s, "s.png")-1)

		local v = math.floor(param2/32)
		if v == 0 then return "white" end
		if color ~= "grey" then
			if v == 1 then return color
			elseif v == 2 then return color.."_s50"
			elseif v == 3 then return "light_"..color
			elseif v == 4 then return "medium_"..color
			elseif v == 5 then return "medium_"..color.."_s50"
			elseif v == 6 then return "dark_"..color
			elseif v == 7 then return "dark_"..color.."_s50"
			end
		else
			if v > 0 and v < 6 then return unifieddyes.GREYS[v]
			else return "white"
			end
		end
	end
end

function unifieddyes.show_airbrush_form(player)
	if not player then return end
	local player_name = player:get_player_name()
	local painting_with = unifieddyes.player_selected_dye[player_name] or unifieddyes.player_current_dye[player_name]
	local creative = creative and creative.is_enabled_for(player_name)
	local inv = player:get_inventory()

	local base_form = "size[15,8.5]label[7,-0.25;Select a color:]"
	local selindic = "unifieddyes_select_overlay.png^unifieddyes_question.png]"

	local size="0.75,0.75;"
	local hps=0.6
	local vps=1.3
	local vs=0.3

	for v = 0, 6 do
		local val = unifieddyes.VALS_EXTENDED[v+1]

		local sat = ""
		local v2=(v/2)

		for hi, h in ipairs(unifieddyes.HUES_EXTENDED) do
			local hue = h[1]
			local hp=hi-0.5

			local r = h[2]
			local g = h[3]
			local b = h[4]

			local factor = 40
			if v > 3 then
				factor = 75
				v2 = (v-2)
			end

			local r2 = math.max(math.min(r + (4-v)*factor, 255), 0)
			local g2 = math.max(math.min(g + (4-v)*factor, 255), 0)
			local b2 = math.max(math.min(b + (4-v)*factor, 255), 0)

			local color = string.format("%02x", r2)..string.format("%02x", g2)..string.format("%02x", b2)
			local dye = "dye:"..val..hue..sat

			local overlay = ""
			local colorize = minetest.formspec_escape("^[colorize:#"..color..":255")

			if not creative and inv:contains_item("main", dye) then
				overlay = "^unifieddyes_available_overlay.png"
			end

			if dye == painting_with then
				overlay = "^unifieddyes_select_overlay.png"
				selindic = "unifieddyes_white_square.png"..colorize..overlay.."]"..
							"tooltip["..val..hue..sat..";"..val..hue..sat.."]"
			end

			base_form = base_form.."image_button["..
									(hp*hps)..","..(v2*vps+vs)..";"..
									size..
									"unifieddyes_white_square.png"..colorize..overlay..";"..
									val..hue..sat..";]"..
									"tooltip["..val..hue..sat..";"..val..hue..sat.."]"

		end

		if v > 3 then
			sat = "_s50"
			v2 = (v-1.5)

			for hi, h in ipairs(unifieddyes.HUES_EXTENDED) do
				local hue = h[1]
				local hp=hi-0.5

				local r = h[2]
				local g = h[3]
				local b = h[4]

				local factor = 75

				local pr = 0.299
				local pg = 0.587
				local pb = 0.114

				local r2 = math.max(math.min(r + (4-v)*factor, 255), 0)
				local g2 = math.max(math.min(g + (4-v)*factor, 255), 0)
				local b2 = math.max(math.min(b + (4-v)*factor, 255), 0)

				local p = math.sqrt(r2*r2*pr + g2*g2*pg + b2*b2*pb)
				local r3 = math.floor(p+(r2-p)*0.5)
				local g3 = math.floor(p+(g2-p)*0.5)
				local b3 = math.floor(p+(b2-p)*0.5)

				local color = string.format("%02x", r3)..string.format("%02x", g3)..string.format("%02x", b3)
				local dye = "dye:"..val..hue..sat

				local overlay = ""
				local colorize = minetest.formspec_escape("^[colorize:#"..color..":255")

				if not creative and inv:contains_item("main", dye) then
					overlay = "^unifieddyes_available_overlay.png"
				end

				if dye == painting_with then
					overlay = "^unifieddyes_select_overlay.png"
					selindic = "unifieddyes_white_square.png"..colorize..overlay.."]"..
								"tooltip["..val..hue..sat..";"..val..hue..sat.."]"
				end

				base_form = base_form.."image_button["..
										(hp*hps)..","..(v2*vps+vs)..";"..
										size..
										"unifieddyes_white_square.png"..colorize..overlay..";"..
										val..hue..sat..";]"..
										"tooltip["..val..hue..sat..";"..val..hue..sat.."]"
			end
		end
	end

	local v2=5
	for y = 0, 15 do

		local hp=(15-y)+0.5

		local grey = string.format("%02x", y*17)..string.format("%02x", y*17)..string.format("%02x", y*17)
		local grey2 = "grey_"..y

		if y == 0 then grey2 = "black" 
		elseif y == 4 then grey2 = "dark_grey"
		elseif y == 8 then grey2 = "grey"
		elseif y == 11 then grey2 = "light_grey"
		elseif y == 15 then grey2 = "white"
		end

		local dye = "dye:"..grey2

		local overlay = ""
		local colorize = minetest.formspec_escape("^[colorize:#"..grey..":255")

		if not creative and inv:contains_item("main", dye) then
			overlay = "^unifieddyes_available_overlay.png"
		end

		if dye == painting_with then
			overlay = "^unifieddyes_select_overlay.png"
			selindic = "unifieddyes_white_square.png"..colorize..overlay.."]"..
						"tooltip["..grey2..";"..grey2.."]"
		end

		base_form = base_form.."image_button["..
								(hp*hps)..","..(v2*vps+vs)..";"..
								size..
								"unifieddyes_white_square.png"..colorize..overlay..";"..
								grey2..";]tooltip["..grey2..";"..grey2.."]"

	end

	if not creative then
		base_form = base_form..
				"image[10.3,"..(vps*5+vs)..";"..size..
				"unifieddyes_available_overlay.png]"..
				"label[11.0,"..(vps*5.1+vs)..";Dyes on hand]"
	end
		base_form = base_form..
				"image[12.5,"..(vps*5+vs)..";"..size..
				selindic..
				"label[13.2,"..(vps*5.1+vs)..";Your selection]"

	base_form = base_form..
				"button_exit[11,8;2,1;cancel;Cancel]"..
				"button_exit[13,8;2,1;accept;Accept]"

	if painting_with then
		base_form = base_form..
					"label[1,"..(7.5+vs)..";Selected dye:  "..
					painting_with.."]"
	end

	minetest.show_formspec(player_name, "unifieddyes:dye_select_form", base_form)
end

minetest.register_tool("unifieddyes:airbrush", {
	description = S("Dye Airbrush"),
	inventory_image = "unifieddyes_airbrush.png",
	use_texture_alpha = true,
	tool_capabilities = {
		full_punch_interval=0.1,
	},
	range = 12,
	on_use = unifieddyes.on_airbrush,
	on_place = function(itemstack, placer, pointed_thing)
		local keys = placer:get_player_control()
		if not keys.sneak then
			unifieddyes.show_airbrush_form(placer)
		elseif keys.sneak then
			local player_name = placer:get_player_name()
			local pos = minetest.get_pointed_thing_position(pointed_thing)
			if not pos then return end
			local node = minetest.get_node(pos)
			local def = minetest.registered_items[node.name]
			if not def then return end
			local newcolor = unifieddyes.color_to_name(node.param2, def)

			if not newcolor then
				minetest.chat_send_player(player_name, "*** That node is uncolored.")
				return
			end
			minetest.chat_send_player(player_name, "*** Switching to "..newcolor.." for the airbrush, to match that node.")
			unifieddyes.player_current_dye[player_name] = "dye:"..newcolor 
		end
	end
})

minetest.register_craft( {
	output = "unifieddyes:airbrush",
	recipe = {
		{ "default:gold_ingot", "",                    "bucket:bucket_empty" },
		{ "",                   "default:steel_ingot", ""                    },
		{ "",                   "",                    "default:steel_ingot" }
	},
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "unifieddyes:dye_select_form" then
		local player_name = player:get_player_name()
		if fields.quit then
			if not fields.accept then
				unifieddyes.player_selected_dye[player_name] = nil
				return
			else
				local dye = unifieddyes.player_selected_dye[player_name]
				if not dye then
					minetest.chat_send_player(player_name, "*** Clicked \"Accept\", but no color was selected!")
					return
				end
				unifieddyes.player_current_dye[player_name] = dye
				unifieddyes.player_selected_dye[player_name] = nil
					minetest.chat_send_player(player_name, "*** Selected "..string.sub(dye, 5).." for the airbrush.")
				return
			end
		else
			local s1 = string.sub(minetest.serialize(fields), 11)
			local s3 = string.sub(s1,1, string.find(s1, '"')-1)

			local inv = player:get_inventory()
			local creative = creative and creative.is_enabled_for(player_name)
			local dye = "dye:"..s3
			if minetest.registered_items[dye] and (creative or inv:contains_item("main", dye)) then
				unifieddyes.player_selected_dye[player_name] = dye 
				unifieddyes.show_airbrush_form(player)
			end
		end
	end
end)

-- build a table to convert from classic/89-color palette to extended palette

-- the first five entries are for the old greyscale - white, light, grey, dark, black
unifieddyes.convert_classic_palette = {
	240,
	244,
	247,
	251,
	253
}

for hue = 0, 11 do
	-- light
	local paletteidx = unifieddyes.getpaletteidx("dye:light_"..unifieddyes.HUES[hue+1], false)
	unifieddyes.convert_classic_palette[paletteidx] = hue*2 + 48
	for sat = 0, 1 do
		for val = 0, 2 do
			-- all other shades
			local paletteidx = unifieddyes.getpaletteidx("dye:"..unifieddyes.VALS[val+1]..unifieddyes.HUES[hue+1]..unifieddyes.SATS[sat+1], false)
			unifieddyes.convert_classic_palette[paletteidx] = hue*2 + sat*24 + (val*48+96)
		end
	end
end

-- Generate all dyes that are not part of the default minetest_game dyes mod

for _, h in ipairs(unifieddyes.HUES_EXTENDED) do
	local hue = h[1]
	local r = h[2]
	local g = h[3]
	local b = h[4]

	for v = 0, 6 do
		local val = unifieddyes.VALS_EXTENDED[v+1]

		local factor = 40
		if v > 3 then factor = 75 end

		local r2 = math.max(math.min(r + (4-v)*factor, 255), 0)
		local g2 = math.max(math.min(g + (4-v)*factor, 255), 0)
		local b2 = math.max(math.min(b + (4-v)*factor, 255), 0)

		-- full-sat color

		local desc = hue:gsub("%a", string.upper, 1).." Dye"

		if val ~= "" then
			desc = val:sub(1, -2):gsub("%a", string.upper, 1) .." "..desc
		end

		local color = string.format("%02x", r2)..string.format("%02x", g2)..string.format("%02x", b2)
		if minetest.registered_items["dye:"..val..hue] then
			minetest.override_item("dye:"..val..hue, {
				inventory_image = "unifieddyes_dye.png^[colorize:#"..color..":200",
			})
		else
			if (val..hue) ~= "medium_orange"
			  and (val..hue) ~= "light_red" then
				minetest.register_craftitem(":dye:"..val..hue, {
					description = S(desc),
					inventory_image = "unifieddyes_dye.png^[colorize:#"..color..":200",
					groups = { dye=1, not_in_creative_inventory=1 },
				})
			end
		end
		minetest.register_alias("unifieddyes:"..val..hue, "dye:"..val..hue)
		if h[1] == "spring" then
			minetest.register_alias("unifieddyes:"..val.."aqua", "dye:"..val.."spring")
		elseif h[1] == "azure" then
			minetest.register_alias("unifieddyes:"..val.."skyblue", "dye:"..val.."azure")
		elseif h[1] == "rose" then
			minetest.register_alias("unifieddyes:"..val.."redviolet", "dye:"..val.."rose")
		end


		if v > 3 then -- also register the low-sat version

			local pr = 0.299
			local pg = 0.587
			local pb = 0.114

			local p = math.sqrt(r2*r2*pr + g2*g2*pg + b2*b2*pb)
			local r3 = math.floor(p+(r2-p)*0.5)
			local g3 = math.floor(p+(g2-p)*0.5)
			local b3 = math.floor(p+(b2-p)*0.5)

			local color = string.format("%02x", r3)..string.format("%02x", g3)..string.format("%02x", b3)

			minetest.register_craftitem(":dye:"..val..hue.."_s50", {
				description = S(desc.." (low saturation)"),
				inventory_image = "unifieddyes_dye.png^[colorize:#"..color..":200",
				groups = { dye=1, not_in_creative_inventory=1 },
			})
			minetest.register_alias("unifieddyes:"..val..hue.."_s50", "dye:"..val..hue.."_s50")
			if h[1] == "spring" then
				minetest.register_alias("unifieddyes:"..val.."aqua_s50", "dye:"..val.."spring_s50")
			elseif h[1] == "azure" then
				minetest.register_alias("unifieddyes:"..val.."skyblue_s50", "dye:"..val.."azure_s50")
			elseif h[1] == "rose" then
				minetest.register_alias("unifieddyes:"..val.."redviolet_s50", "dye:"..val.."rose_s50")
			end
		end
	end
end

-- register the greyscales too :P

for y = 1, 14 do -- colors 0 and 15 are black and white, default dyes

	if y ~= 4 and y ~= 8 and y~= 11 then -- don't register the three greys, they're done separately.

		local rgb = string.format("%02x", y*17)..string.format("%02x", y*17)..string.format("%02x", y*17)
		local name = "grey_"..y
		local desc = "Grey Dye #"..y

		minetest.register_craftitem(":dye:"..name, {
			description = S(desc),
			inventory_image = "unifieddyes_dye.png^[colorize:#"..rgb..":200",
			groups = { dye=1, not_in_creative_inventory=1 },
		})
		minetest.register_alias("unifieddyes:"..name, "dye:"..name)
	end
end

minetest.override_item("dye:grey", {
	inventory_image = "unifieddyes_dye.png^[colorize:#888888:200",
})

minetest.override_item("dye:dark_grey", {
	inventory_image = "unifieddyes_dye.png^[colorize:#444444:200",
})

minetest.register_craftitem(":dye:light_grey", {
	description = S("Light grey Dye"),
	inventory_image = "unifieddyes_dye.png^[colorize:#cccccc:200",
	groups = { dye=1, not_in_creative_inventory=1 },
})

unifieddyes.base_color_crafts = {
	{ "red",		"flowers:rose",				nil,				nil,			nil,			nil,		4 },
	{ "vermilion",	"dye:red",					"dye:orange",		nil,			nil,			nil,		3 },
	{ "orange",		"flowers:tulip",			nil,				nil,			nil,			nil,		4 },
	{ "orange",		"dye:red",					"dye:yellow",		nil,			nil,			nil,		2 },
	{ "amber",		"dye:orange",				"dye:yellow",		nil,			nil,			nil,		2 },
	{ "yellow",		"flowers:dandelion_yellow",	nil,				nil,			nil,			nil,		4 },
	{ "lime",		"dye:yellow",				"dye:chartreuse",	nil,			nil,			nil,		2 },
	{ "lime",		"dye:yellow",				"dye:yellow",		"dye:green",	nil,			nil,		3 },
	{ "chartreuse",	"dye:yellow",				"dye:green",		nil,			nil,			nil,		2 },
	{ "harlequin",	"dye:chartreuse",			"dye:green",		nil,			nil,			nil,		2 },
	{ "harlequin",	"dye:yellow",				"dye:green",		"dye:green",	nil,			nil,		3 },
	{ "green", 		"default:cactus",			nil,				nil,			nil,			nil,		4 },
	{ "green", 		"dye:yellow",				"dye:blue",			nil,			nil,			nil,		2 },
	{ "malachite",	"dye:green",				"dye:spring",		nil,			nil,			nil,		2 },
	{ "malachite",	"dye:green",				"dye:green",		"dye:cyan",		nil,			nil,		3 },
	{ "malachite",	"dye:green",				"dye:green",		"dye:green",	"dye:blue",		nil,		4 },
	{ "spring",		"dye:green",				"dye:cyan",			nil,			nil,			nil,		2 },
	{ "spring",		"dye:green",				"dye:green",		"dye:blue",		nil,			nil,		3 },
	{ "turquoise",	"dye:spring",				"dye:cyan",			nil,			nil,			nil,		2 },
	{ "turquoise",	"dye:green",				"dye:cyan",			"dye:cyan",		nil,			nil,		3 },
	{ "turquoise",	"dye:green",				"dye:green",		"dye:green",	"dye:blue",		"dye:blue",	5 },
	{ "cyan",		"dye:green",				"dye:blue",			nil,			nil,			nil,		2 },
	{ "cerulean",	"dye:cyan",					"dye:azure",		nil,			nil,			nil,		2 },
	{ "cerulean",	"dye:cyan",					"dye:cyan",			"dye:blue",		nil,			nil,		3 },
	{ "cerulean",	"dye:green",				"dye:green",		"dye:blue",		"dye:blue",		"dye:blue",	5 },
	{ "azure",		"dye:cyan",					"dye:blue",			nil,			nil,			nil,		2 },
	{ "azure",		"dye:green",				"dye:blue",			"dye:blue",		nil,			nil,		3 },
	{ "sapphire",	"dye:azure",				"dye:blue",			nil,			nil,			nil,		2 },
	{ "sapphire",	"dye:cyan",					"dye:blue",			"dye:blue",		nil,			nil,		3 },
	{ "sapphire",	"dye:green",				"dye:blue",			"dye:blue",		"dye:blue",		nil,		4 },
	{ "blue",		"flowers:geranium",			nil,				nil,			nil,			nil,		4 },
	{ "indigo",		"dye:blue",					"dye:violet",		nil,			nil,			nil,		2 },
	{ "violet",		"flowers:viola",			nil,				nil,			nil,			nil,		4 },
	{ "violet",		"dye:blue",					"dye:magenta",		nil,			nil,			nil,		2 },
	{ "mulberry",	"dye:violet",				"dye:magenta",		nil,			nil,			nil,		2 },
	{ "mulberry",	"dye:violet",				"dye:blue",			"dye:red",		nil,			nil,		3 },
	{ "magenta",	"dye:blue",					"dye:red",			nil,			nil,			nil,		2 },
	{ "fuchsia",	"dye:magenta",				"dye:rose",			nil,			nil,			nil,		2 },
	{ "fuchsia",	"dye:blue",					"dye:red",			"dye:rose",		nil,			nil,		3 },
	{ "fuchsia",	"dye:red",					"dye:violet",		nil,			nil,			nil,		2 },
	{ "rose",		"dye:magenta",				"dye:red",			nil,			nil,			nil,		2 },
	{ "rose",		"dye:red",					"dye:red",			"dye:blue",		nil,			nil,		3 },
	{ "crimson",	"dye:rose",					"dye:red",			nil,			nil,			nil,		2 },
	{ "crimson",	"dye:magenta",				"dye:red",			"dye:red",		nil,			nil,		3 },
	{ "crimson",	"dye:red",					"dye:red",			"dye:red",		"dye:blue",		nil,		4 },

	{ "black",		"default:coal_lump",		nil,				nil,			nil,			nil,		4 },
	{ "white",		"flowers:dandelion_white",	nil,				nil,			nil,			nil,		4 },
}

unifieddyes.shade_crafts = {
	{ "faint_",		"",			"dye:white",		"dye:white",	"dye:white",	4 },
	{ "pastel_",	"",			"dye:white",		"dye:white",	nil,			3 },
	{ "light_",		"",			"dye:white",		nil,			nil,			2 },
	{ "bright_",	"",			"color",			"dye:white",	nil,			3 },
	{ "",			"_s50",		"dye:light_grey",	nil,			nil,			2 },
	{ "",			"_s50",		"dye:black",		"dye:white",	"dye:white",	3 },
	{ "medium_",	"",			"dye:black",		nil,			nil,			2 },
	{ "medium_",	"_s50",		"dye:grey",			nil,			nil,			2 },
	{ "medium_",	"_s50",		"dye:black",		"dye:white",	nil,			3 },
	{ "dark_",		"",			"dye:black",		"dye:black",	nil,			3 },
	{ "dark_",		"_s50",		"dye:dark_grey",	nil,			nil,			2 },
	{ "dark_",		"_s50",		"dye:black",		"dye:black",	"dye:white",	4 },
}

for _,i in ipairs(unifieddyes.base_color_crafts) do
	local color = i[1]
	local yield = i[7]

	minetest.register_craft( {
		type = "shapeless",
		output = "dye:"..color.." "..yield,
		recipe = {
			i[2],
			i[3],
			i[4],
			i[5],
			i[6],
		},
	})

	for _,j in ipairs(unifieddyes.shade_crafts) do
		local firstdye = j[3]
		if firstdye == "color" then firstdye = "dye:"..color end

		-- ignore black, white, anything containing the word "grey"

		if color ~= "black" and color ~= "white" and not string.find(color, "grey") then

			minetest.register_craft( {
				type = "shapeless",
				output = "dye:"..j[1]..color..j[2].." "..yield,
				recipe = {
					"dye:"..color,
					firstdye,
					j[4],
					j[5]
				},
			})
		end
	end
end

-- greys

unifieddyes.greymixes = {
	{ 1,	"dye:black",			"dye:black",		"dye:black",		"dye:dark_grey",	4 },
	{ 2,	"dye:black",			"dye:black",		"dye:dark_grey",	nil,				3 },
	{ 3,	"dye:black",			"dye:dark_grey",	nil,				nil,				2 },
	{ 4,	"dye:white",			"dye:black",		"dye:black",		nil,				3 },
	{ 5,	"dye:dark_grey",		"dye:dark_grey",	"dye:grey",			nil,				3 },
	{ 6,	"dye:dark_grey",		"dye:grey",			nil,				nil,				2 },
	{ 7,	"dye:dark_grey",		"dye:grey",			"dye:grey",			nil,				3 },
	{ 8,	"dye:white",			"dye:black",		nil,				nil,				2 },
	{ 9,	"dye:grey", 			"dye:grey",			"dye:light_grey",	nil,				3 },
	{ 10,	"dye:grey",				"dye:light_grey",	"dye:light_grey",	nil,				3 },
	{ 11,	"dye:white",			"dye:white",		"dye:black",		nil,				3 },
	{ 12,	"dye:light_grey",		"dye:light_grey",	"dye:white",		nil,				3 },
	{ 13,	"dye:light_grey",		"dye:white",		nil,				nil,				2 },
	{ 14,	"dye:white", 			"dye:white",		"dye:light_grey",	nil,				3 },
}

for _, i in ipairs(unifieddyes.greymixes) do
	local shade = i[1]
	local dye1 = i[2]
	local dye2 = i[3]
	local dye3 = i[4]
	local dye4 = i[5]
	local yield = i[6]
	local color = "grey_"..shade
	if shade == 4 then
		color = "dark_grey"
	elseif shade == 8 then
		color = "grey"
	elseif shade == 11 then
		color = "light_grey"
	end

	minetest.register_craft( {
		type = "shapeless",
		output = "dye:"..color.." "..yield,
		recipe = {
			dye1,
			dye2,
			dye3,
			dye4,
		},
	})
end

-- we can't make dark orange anymore because brown/medium orange conflicts

minetest.register_craft( {
	type = "shapeless",
	output = "dye:dark_orange",
	recipe = {
		"dye:brown",
		"dye:brown"
	},
})

-- aliases

minetest.register_alias("dye:light_red",  "dye:pink")
minetest.register_alias("dye:medium_orange", "dye:brown")

minetest.register_alias("unifieddyes:black",      "dye:black")
minetest.register_alias("unifieddyes:dark_grey",  "dye:dark_grey")
minetest.register_alias("unifieddyes:grey", 	  "dye:grey")
minetest.register_alias("unifieddyes:light_grey", "dye:light_grey")
minetest.register_alias("unifieddyes:white",      "dye:white")

minetest.register_alias("unifieddyes:grey_0",     "dye:black")
minetest.register_alias("unifieddyes:grey_4",     "dye:dark_grey")
minetest.register_alias("unifieddyes:grey_8",     "dye:grey")
minetest.register_alias("unifieddyes:grey_11",    "dye:light_grey")
minetest.register_alias("unifieddyes:grey_15",    "dye:white")

minetest.register_alias("unifieddyes:white_paint", "dye:white")
minetest.register_alias("unifieddyes:titanium_dioxide", "dye:white")
minetest.register_alias("unifieddyes:lightgrey_paint", "dye:light_grey")
minetest.register_alias("unifieddyes:grey_paint", "dye:grey")
minetest.register_alias("unifieddyes:darkgrey_paint", "dye:dark_grey")
minetest.register_alias("unifieddyes:carbon_black", "dye:black")

minetest.register_alias("unifieddyes:brown", "dye:brown")

print(S("[UnifiedDyes] Loaded!"))

