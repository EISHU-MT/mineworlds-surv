-- Physical msg

physical_msg = {
	players = {}
}

minetest.register_entity("physical_msg:obj", {
	initial_properties = {
		visual = "sprite",
		visual_size = {x=2.16, y=0.18, z=2.16},
		textures = {"invisible.png"},
		pointable = false,
		on_punch = function() return true end,
		physical = false,
		is_visible = true,
		backface_culling = false,
		makes_footstep_sound = false,
		static_save = false,
		glow = 10,
	},
	timer = 0,
	on_step = function(self, dt)
		self.timer = self.timer + dt
		if self.timer >= 5 then
			self.object:remove()
		end
		if self.object then
			local obj = self.object:get_attach()
			if not obj then
				self.object:remove()
				return
			end
			if obj:is_player() then
				local n = obj:get_player_name()
				if ehs.vanish[n] then
					self.object:remove()
				end
			end
		end
	end,
})

minetest.register_on_joinplayer(function(player, last_login)
	physical_msg[player:get_player_name()] = {
		primary = {},
		secondary = {},
	}
end)

function physical_msg.put_up(obj, player)
	if obj:get_yaw() and player then
		if physical_msg[player:get_player_name()].secondary and type(physical_msg[player:get_player_name()].secondary) == "userdata" then
			physical_msg[player:get_player_name()].secondary:remove()
		end
		obj:set_attach(player, "", {x=0, y=22, z=0}, {x=0, y=0, z=0})
		physical_msg[player:get_player_name()].secondary = obj
	end
end

local function char_escape(char)
	if char == "/" then return "slash" end
	if char == "(" then return "pleft" end
	if char == ":" then return "equal" end
	if char == "<" then return "arrow" end
	if char == ")" then return "pright" end
	if char == "^" then return "up_point" end
	return char
end

function physical_msg.do_msg(player, text) --21
	if player then
		local pn = player:get_player_name()
		
		if not pn then return end
		
		if ehs.vanish[pn] then return end
		
		if physical_msg[player:get_player_name()].primary and type(physical_msg[player:get_player_name()].primary) == "userdata" then physical_msg.put_up(physical_msg[player:get_player_name()].primary, player) end
		local entity = core.add_entity(player:get_pos(), "physical_msg:obj") -- Classic
		local texture = "tag_bg.png"
		local x = math.floor(134 - ((text:len() * 11) / 2))
		local i = 0
		local letter_count = 0
		text:gsub(".", function(char)
			local n = "blank"
			if (char:byte() > 96 and char:byte() < 123 or char:byte() > 47 and char:byte() < 58) or (char == "<" or char == "-" or char == ":" or char == "/" or char == "(" or char == ")") then
				n = "W_"..char_escape(char)
			elseif char:byte() > 64 and char:byte() < 91 then
				n = "W_U" .. char
			end
			texture = texture.."^[combine:84x14:"..(x+i)..",0=".. n ..".png"
			i = i + 11
		end)
		texture = "(globo.png)".."^"..texture
		entity:set_properties({ textures={texture} })
		entity:set_attach(player, "", {x=0, y=20, z=0}, {x=0, y=0, z=0})
		local luaent = entity:get_luaentity()
		luaent.attachedto = player:get_player_name()
		physical_msg[player:get_player_name()].primary = entity
	end
end





minetest.register_on_leaveplayer(function(player)
	if physical_msg[player:get_player_name()] then
		for s, obj in pairs(physical_msg[player:get_player_name()]) do
			if type(obj) == "userdata" then
				obj:remove()
			end
		end
		physical_msg[player:get_player_name()] = nil
	end
end)








