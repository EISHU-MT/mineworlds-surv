-- spawn snow golem
local function pumpkin_on_construct(pos)
	if not minetest.get_modpath("mobs_npc") then return end

	for i = 1,2 do
		if minetest.get_node({x=pos.x,y=pos.y-i,z=pos.z}).name ~= "default:snowblock" then
			return
		end
	end

	--if 3 snow block are placed, this will make snow golem
	for i = 0,2 do
		minetest.remove_node({x=pos.x,y=pos.y-i,z=pos.z})
	end

	minetest.add_entity({x=pos.x,y=pos.y-1,z=pos.z}, "mobs_npc:snow_golem")
end

-- PUMPKIN
farming.register_plant("x_farming:pumpkin", {
	description = "Pumpkin Seed",
	inventory_image = "x_farming_pumpkin_seed.png",
	steps = 8,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland", "desert"},
	groups = {flammable = 4},
	place_param2 = 3,
})

-- PUMPKIN FRUIT - HARVEST
minetest.register_node("x_farming:pumpkin_fruit", {
	description = "Pumpkin Fruit",
	tiles = {"x_farming_pumpkin_fruit_top.png", "x_farming_pumpkin_fruit_top.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side_off.png"},
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30, not_in_creative_inventory=1},
	drop = {
		max_items = 4,  -- Maximum number of items to drop.
		items = { -- Choose max_items randomly from this list.
			{
				items = {"x_farming:pumpkin"},  -- Items to drop.
				rarity = 1,  -- Probability of dropping is 1 / rarity.
			},
			{
				items = {"x_farming:pumpkin"},  -- Items to drop.
				rarity = 2,  -- Probability of dropping is 1 / rarity.
			}
		},
	},
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local parent = oldmetadata.fields.parent
		local parent_pos_from_child = minetest.string_to_pos(parent)
		local parent_node = nil

		-- make sure we have position
		if parent_pos_from_child
			and parent_pos_from_child ~= nil then

			parent_node = minetest.get_node(parent_pos_from_child)
		end

		-- tick parent if parent stem still exists
		if parent_node
			and parent_node ~= nil
			and parent_node.name == "x_farming:pumpkin_8" then

			x_farming.tick(parent_pos_from_child)
		end
	end
})

-- PUMPKIN BLOCK - HARVEST from crops
minetest.register_node("x_farming:pumpkin_block", {
	description = "Pumpkin Block",
	tiles = {"x_farming_pumpkin_fruit_top.png", "x_farming_pumpkin_fruit_top.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side_off.png"},
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	on_construct = pumpkin_on_construct
})

-- PUMPKIN LANTERN -- from recipe
minetest.register_node("x_farming:pumpkin_lantern", {
	description = "Pumpkin Lantern",
	tiles = {"x_farming_pumpkin_fruit_top.png", "x_farming_pumpkin_fruit_top.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side.png", "x_farming_pumpkin_fruit_side_on.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	light_source = 12,
	drop = "x_farming:pumpkin_lantern",
	groups = {snappy=3, flammable=4, fall_damage_add_percent=-30},
	on_construct = pumpkin_on_construct
})

-- drop blocks instead of items
minetest.register_alias_force("x_farming:pumpkin", "x_farming:pumpkin_block")

-- take over the growth from minetest_game farming from here
minetest.override_item("x_farming:pumpkin_8", {
	next_plant = "x_farming:pumpkin_fruit",
	on_timer = x_farming.grow_block
})

-- replacement LBM for pre-nodetimer plants
minetest.register_lbm({
	name = "x_farming:start_nodetimer_pumpkin",
	nodenames = {"x_farming:pumpkin_8"},
	action = function(pos, node)
		x_farming.tick_short(pos)
	end,
})

minetest.register_decoration({
	name = "x_farming:pumpkin_8",
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.1,
		scale = 0.1,
		spread = {x = 50, y = 50, z = 50},
		seed = 4242,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"sandstone_desert"},
	y_max = 31000,
	y_min = 1,
	decoration = "x_farming:pumpkin_8",
	param2 = 3,
})
