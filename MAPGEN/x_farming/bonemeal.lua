------------
-- Bonemeal Mod for Minetest by SaKeL
-- @author Juraj Vajda
-- @license GNU LGPL 2.1
----

--- Register craftitem definition - added to minetest.registered_items[name]
-- @function
minetest.register_craftitem("x_farming:bonemeal", {
	description = "Bonemeal - use it as a fertilizer for most plants",
	inventory_image = "x_farming_x_bonemeal_bonemeal.png",
	on_use = function(itemstack, user, pointed_thing)
		local under = pointed_thing.under

		if not under then return end
		if pointed_thing.type ~= "node" then return end
		if minetest.is_protected(under, user:get_player_name()) then return end

		local node = minetest.get_node(under)

		if not node then return end
		if node.name == "ignore" then return end

		local mod = node.name:split(":")[1]

		--
		-- Farming
		--

		if (mod == "farming" or mod == "x_farming") and not string.find(node.name, "_sapling") and not string.find(node.name, "_seedling") then
			x_farming.x_bonemeal.grow_farming(itemstack, user, pointed_thing)

		--
		-- Default (Trees, Bushes, Papyrus)
		--

		-- christmas tree
		elseif node.name == "x_default:christmas_tree_sapling" then
			local chance = math.random(2)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 1 then
				if minetest.find_node_near(under, 1, {"group:snowy"}) then
					x_default.grow_snowy_christmas_tree(under)
				else
					x_default.grow_christmas_tree(under)
				end

				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- apple tree
		elseif node.name == "default:sapling" then
			local chance = math.random(2)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 1 then
				default.grow_new_apple_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- jungle tree
		elseif node.name == "default:junglesapling" then
			local chance = math.random(2)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 1 then
				default.grow_new_jungle_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- emergent jungle tree
		elseif node.name == "default:emergent_jungle_sapling" then
			local chance = math.random(2)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 1 then
				default.grow_new_emergent_jungle_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- acacia tree
		elseif node.name == "default:acacia_sapling" then
			local chance = math.random(2)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 1 then
				default.grow_new_acacia_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- aspen tree
		elseif node.name == "default:aspen_sapling" then
			local chance = math.random(2)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 1 then
				default.grow_new_aspen_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- pine tree
		elseif node.name == "default:pine_sapling" then
			local chance = math.random(4)
			if not x_farming.x_bonemeal.is_on_soil(under) then return end

			if chance == 3 then
				default.grow_new_snowy_pine_tree(under)
			elseif chance == 1 then
				default.grow_new_pine_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Bush
		elseif node.name == "default:bush_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_soil(under) then return end
				default.grow_bush(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Acacia bush
		elseif node.name == "default:acacia_bush_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_soil(under) then return end
				default.grow_acacia_bush(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Pine bush
		elseif node.name == "default:pine_bush_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_soil(under) then return end
				default.grow_pine_bush(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Blueberry bush
		elseif node.name == "default:blueberry_bush_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_soil(under) then return end
				default.grow_blueberry_bush(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Papyrus
		elseif node.name == "default:papyrus" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_soil(under) then return end
				default.grow_papyrus(under, node)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Large Cactus
		elseif node.name == "default:large_cactus_seedling" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_sand(under) then return end
				default.grow_large_cactus(under, node)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Kiwi Tree
		elseif node.name == "x_farming:kiwi_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				x_farming.grow_kiwi_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Cactus Seedling
		elseif node.name == "x_farming:large_cactus_with_fruit_seedling" then
			local chance = math.random(2)

			if chance == 1 then
				if not x_farming.x_bonemeal.is_on_sand(under) then return end
				x_farming.grow_large_cactus(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Jungle Tree with Cocoa
		elseif node.name == "x_farming:jungle_with_cocoa_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				x_farming.grow_jungle_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		-- Pine Nut Tree
		elseif node.name == "x_farming:pine_nut_sapling" then
			local chance = math.random(2)

			if chance == 1 then
				x_farming.grow_pine_nut_tree(under)
				x_farming.x_bonemeal.particle_effect({x = under.x, y = under.y + 1, z = under.z})
			end
			-- take item if not in creative
			if not x_farming.x_bonemeal.is_creative(user:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack

		else
			x_farming.x_bonemeal.grow_grass_and_flowers(itemstack, user, pointed_thing)
		end

		return itemstack
	end,
})

--
-- Crafting
--

minetest.register_craft({
  output = "x_farming:bonemeal 4",
  recipe = {
    {"bones:bones"}
  }
})

minetest.register_craft({
  output = "x_farming:bonemeal 4",
  recipe = {
    {"default:coral_skeleton"}
  }
})
