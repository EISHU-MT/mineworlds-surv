-- items
minetest.register_craftitem(":currency:minegeld", {
	description = "$1",
	inventory_image = "minegeld.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem(":currency:minegeld_5", {
	description = "$5",
	inventory_image = "minegeld_5.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem(":currency:minegeld_10", {
	description = "$10",
	inventory_image = "minegeld_10.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem(":currency:minegeld_25", {
	description = "$25",
	inventory_image = "minegeld_25.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem(":currency:minegeld_50", {
	description = "$50",
	inventory_image = "minegeld_50.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_craftitem(":currency:minegeld_100", {
	description = "$100",
	inventory_image = "minegeld_100.png",
		stack_max = 65535,
		groups = {minegeld = 1, minegeld_note = 1}
})

minetest.register_node("emoney:atm", {
	description = "ATM",
	tiles = {
		"atm_top.png", "atm_top.png",
		"atm_side.png", "atm_side.png",
		"atm_side.png", "atm_front.png"
	},
	paramtype2 = "facedir",
	groups = {cracky=2, bank_equipment = 3},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),

	on_rightclick = function(_, _, player)
		core.show_formspec(Name(player), "economy:main_menu", bank.formspec.return_main_formspec(bank.get_valueC(Name(player)), Name(player)))
	end,
})