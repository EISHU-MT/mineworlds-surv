local S = minetest.get_translator()

local function get_level(level)
    if exchangeclone.mcl then
        return nil
    else
        return level
    end
end

minetest.register_craftitem("exchangeclone:alchemical_coal", {
    description = S("Alchemical Coal"),
    wield_image = "exchangeclone_alchemical_coal.png",
    inventory_image = "exchangeclone_alchemical_coal.png",
	groups = { craftitem=1},
})

minetest.register_craftitem("exchangeclone:mobius_fuel", {
    description = S("Mobius Fuel"),
    wield_image = "exchangeclone_mobius_fuel.png",
    inventory_image = "exchangeclone_mobius_fuel.png",
	groups = { craftitem=1},
})

minetest.register_craftitem("exchangeclone:aeternalis_fuel", {
    description = S("Aeternalis Fuel"),
    wield_image = "exchangeclone_aeternalis_fuel.png",
    inventory_image = "exchangeclone_aeternalis_fuel.png",
	groups = { craftitem=1},
})

minetest.register_craft({
    type = "fuel",
    recipe = "exchangeclone:alchemical_coal",
    burntime = 320,
})

minetest.register_craft({
    type = "fuel",
    recipe = "exchangeclone:mobius_fuel",
    burntime = 1280,
})

minetest.register_craft({
    type = "fuel",
    recipe = "exchangeclone:aeternalis_fuel",
    burntime = 5120,
})

minetest.register_craftitem("exchangeclone:dark_matter", {
    description = S("Dark Matter Orb"),
    wield_image = "exchangeclone_dark_matter.png",
    inventory_image = "exchangeclone_dark_matter.png",
    groups = {craftitem = 1}
})

minetest.register_craftitem("exchangeclone:red_matter", {
    description = S("Red Matter Orb"),
    wield_image = "exchangeclone_red_matter.png",
    inventory_image = "exchangeclone_red_matter.png",
    groups = {craftitem = 1},
})

minetest.register_node("exchangeclone:dark_matter_block", {
    description = S("Dark Matter Block"),
    tiles = {"exchangeclone_dark_matter_block.png"},
	is_ground_content = false,
	sounds = exchangeclone.sound_mod.node_sound_stone_defaults(),
	groups = {pickaxey=5, material_stone=1, cracky = 3, level = get_level(4)}, --ridiculous workaround
	_mcl_blast_resistance = 1500,
	_mcl_hardness = 75,
})

minetest.register_node("exchangeclone:red_matter_block", {
    description = S("Red Matter Block"),
    tiles = {"exchangeclone_red_matter_block.png"},
	is_ground_content = false,
	light_source = 14,
	sounds = exchangeclone.sound_mod.node_sound_stone_defaults(),
	groups = {pickaxey=6, material_stone=1, cracky = 3, level = get_level(5)},
	_mcl_blast_resistance = 1500,
	_mcl_hardness = 100,
})
if exchangeclone.mcl then
    minetest.register_craft({
        output = "exchangeclone:dark_matter",
        recipe = {
            {"exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel"},
            {"exchangeclone:aeternalis_fuel", "mcl_core:diamondblock", "exchangeclone:aeternalis_fuel"},
            {"exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel"}
        }
    })
else
    minetest.register_craft({
        output = "exchangeclone:dark_matter",
        recipe = {
            {"exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel"},
            {"exchangeclone:aeternalis_fuel", "default:diamondblock", "exchangeclone:aeternalis_fuel"},
            {"exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel"}
        }
    })
end

minetest.register_craft({
    output = "exchangeclone:red_matter",
    recipe = {
        {"exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel"},
        {"exchangeclone:dark_matter", "exchangeclone:dark_matter", "exchangeclone:dark_matter"},
        {"exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel", "exchangeclone:aeternalis_fuel"}
    }
})

minetest.register_craft({
    output = "exchangeclone:dark_matter_block",
    recipe = {
        {"exchangeclone:dark_matter", "exchangeclone:dark_matter"},
        {"exchangeclone:dark_matter", "exchangeclone:dark_matter"}
    }
})

minetest.register_craft({
    output = "exchangeclone:red_matter_block",
    recipe = {
        {"exchangeclone:red_matter", "exchangeclone:red_matter"},
        {"exchangeclone:red_matter", "exchangeclone:red_matter"}
    }
})

minetest.register_craft({
    output = "exchangeclone:dark_matter 4",
    recipe = {
        {"exchangeclone:dark_matter_block"}
    }
})

minetest.register_craft({
    output = "exchangeclone:red_matter 4",
    recipe = {
        {"exchangeclone:red_matter_block",}
    }
})