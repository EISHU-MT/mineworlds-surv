local function init_old_shop(pos, player)
	minetest.remove_node(pos)
	minetest.swap_node(pos, { name = "smartshop:shop" })

	local player_name = player:get_player_name()
	local meta = minetest.get_meta(pos)
	meta:set_int("state", 0)
	meta:set_string("owner", player_name)
	meta:set_string("infotext", "Shop by: " .. player_name)
	meta:set_int("type", 1)
	meta:set_int("sellall", 1)

	local inv = meta:get_inventory()
	inv:set_size("main", 32)
	inv:set_size("give1", 1)
	inv:set_size("pay1", 1)
	inv:set_size("give2", 1)
	inv:set_size("pay2", 1)
	inv:set_size("give3", 1)
	inv:set_size("pay3", 1)
	inv:set_size("give4", 1)
	inv:set_size("pay4", 1)
end

modtest.with_fresh_environment(function(state, env)
	it("simulate refunds in empty shop", function()
		local shop_pos = env.shop_pos
		assert(vector.check(shop_pos), dump(env):gsub("%s+", ""))
		local owner = env.player_owner
		init_old_shop(shop_pos, owner)
		local meta = minetest.get_meta(shop_pos)
		local inv = meta:get_inventory()
		inv:set_stack("give1", 1, "smartshop:node")
		inv:set_stack("give2", 1, "smartshop:node 5")
		inv:set_stack("give3", 1, "smartshop:node 99")
		inv:set_stack("give4", 1, "smartshop:tool")
		inv:set_stack("pay1", 1, "smartshop:gold")
		inv:set_stack("pay2", 1, "smartshop:gold 5")
		inv:set_stack("pay3", 1, "smartshop:gold 99")
		inv:set_stack("pay4", 1, "smartshop:gold 20")

		assert.are.equal("smartshop:node 99", ItemStack("smartshop:node 99"):to_string())

		local mt = meta:to_table()
		assert(mt.fields, "metatable lacks fields?")
		assert(mt.inventory, "metatable lacks inventory?")

		state:activate_mapblock(modtest.util.get_blockpos(shop_pos))

		assert(not inv:is_empty("main"), "main inventory shouldn't still be empty")
		assert.are.equal(105, env.inv_count(inv, "main", "smartshop:node"), "refunded correct amount of nodes")
		assert.are.equal(1, env.inv_count(inv, "main", "smartshop:tool"), "refunded correct amount of tools")
		assert.are.equal(125, env.inv_count(inv, "main", "smartshop:gold"), "refunded correct amount of gold")
	end)
end)
