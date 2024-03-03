function Player(p)
	if type(p) == "userdata" then
		return p
	elseif type(p) == "string" then
		return core.get_player_by_name(p)
	end
end
function Name(p)
	if type(p) == "string" then
		return p
	elseif type(p) == "userdata" then
		if p:is_player() then
			return p:get_player_name()
		else
			return nil
		end
	end
end
function Inv(p)
	return Player(p):get_inventory()
end



local positions = {
	vector.new(1, 0, 0),
	vector.new(0, 0, 1),
	vector.new(0, 1, 0),
	vector.new(1, 0, 1),
	vector.new(1, 1, 0),
	vector.new(1, 1, 1),
	vector.new(0, 1, 1),
	vector.new(0, 0, 0)
}

local function sum(p1, p2)
	return vector.add(p1, p2)
end

function CheckPos(pos)
	local node = core.get_node(pos)
	if node.name ~= "air" then
		for _, position in pairs(positions) do
			local vector_to_use = sum(pos, position)
			local Cnode = core.get_node(vector_to_use)
			if Cnode.name == "air" then
				return vector_to_use
			end
		end
		return vector.new(pos.x, pos.y + 2, pos.z)
	else
		return pos
	end
end

letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "p", "q", "z", "x", "y", "v", "o", "s", "w", "t", "r", "u", "p"}
numbers = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}

function FormRandomString(lengh)
	local string = {}
	if not lengh then
		return
	end
	local ln = #letters
	local nn = #numbers
	for i = 1, lengh do
		local n = math.random(ln)
		table.insert(string, letters[n])
		local n = math.random(nn)
		table.insert(string, numbers[n])
	end
	return table.concat(string, "")
end