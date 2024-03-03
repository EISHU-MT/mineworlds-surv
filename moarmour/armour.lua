--------------------------------------------------------------------------------
--
--  Minetest -- moarmour -- Adds many new armours types
--  Copyright (C) 2020-2022  Olivier Dragon
--  Copyright (C) 2017-2018  ChemGuy99 aka Chem871
--  And contributers (see Git logs)
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------

local S = moarmour.get_translator

-- Armours --
  minetest.register_tool("moarmour:helmet_obsidian", {
    description = S("Obsidian Helmet"),
    inventory_image = "moarmour_inv_helmet_obsidian.png",
    groups = {armor_head=22.5, armor_heal=18, armor_use=300},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_obsidian", {
    description = S("Obsidian Chestplate"),
    inventory_image = "moarmour_inv_chestplate_obsidian.png",
    groups = {armor_torso=30, armor_heal=18, armor_use=300},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_obsidian", {
    description = S("Obsidian Leggings"),
    inventory_image = "moarmour_inv_leggings_obsidian.png",
    groups = {armor_legs=30, armor_heal=18, armor_use=300},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_obsidian", {
    description = S("Obsidian Boots"),
    inventory_image = "moarmour_inv_boots_obsidian.png",
    groups = {armor_feet=22.5, armor_heal=18, armor_use=300},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_obsidian", {
    description = S("Obsidian Shield"),
    inventory_image = "moarmour_inv_shield_obsidian.png",
    groups = {armor_shield=22.5, armor_heal=18, armor_use=300},
    wear = 0,
  })

  minetest.register_tool("moarmour:helmet_tin", {
    description = S("Tin Helmet"),
    inventory_image = "moarmour_inv_helmet_tin.png",
    groups = {armor_head=6, armor_heal=0, armor_use=800},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_tin", {
    description = S("Tin Chestplate"),
    inventory_image = "moarmour_inv_chestplate_tin.png",
    groups = {armor_torso=12, armor_heal=0, armor_use=800},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_tin", {
    description = S("Tin Leggings"),
    inventory_image = "moarmour_inv_leggings_tin.png",
    groups = {armor_legs=12, armor_heal=0, armor_use=800},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_tin", {
    description = S("Tin Boots"),
    inventory_image = "moarmour_inv_boots_tin.png",
    groups = {armor_feet=6, armor_heal=0, armor_use=800},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_tin", {
    description = S("Tin Shield"),
    inventory_image = "moarmour_inv_shield_tin.png",
    groups = {armor_shield=6, armor_heal=0, armor_use=800},
    wear = 0,
  })

  minetest.register_tool("moarmour:helmet_brick", {
    description = S("Brick Helmet"),
    inventory_image = "moarmour_inv_helmet_brick.png",
    groups = {armor_head=12, armor_heal=4, armor_use=1100, physics_speed=-0.10, physics_jump=-0.05},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_brick", {
    description = S("Brick Chestplate"),
    inventory_image = "moarmour_inv_chestplate_brick.png",
    groups = {armor_torso=15, armor_heal=4, armor_use=1100, physics_speed=-0.10, physics_jump=-0.05},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_brick", {
    description = S("Brick Leggings"),
    inventory_image = "moarmour_inv_leggings_brick.png",
    groups = {armor_legs=15, armor_heal=4, armor_use=1100, physics_speed=-0.10, physics_jump=-0.05},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_brick", {
    description = S("Brick Boots"),
    inventory_image = "moarmour_inv_boots_brick.png",
    groups = {armor_feet=12, armor_heal=4, armor_use=1100, physics_speed=-0.10, physics_jump=-0.05},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_brick", {
    description = S("Brick Shield"),
    inventory_image = "moarmour_inv_shield_brick.png",
    groups = {armor_shield=12, armor_heal=4, armor_use=1100, physics_speed=-0.10, physics_jump=-0.05},
    wear = 0,
  })

if minetest.get_modpath("moreores") then

  minetest.register_tool("moarmour:helmet_silver", {
    description = S("Silver Helmet"),
    inventory_image = "moarmour_inv_helmet_silver.png",
    groups = {armor_head=10, armor_heal=5, armor_use=700},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_silver", {
    description = S("Silver Chestplate"),
    inventory_image = "moarmour_inv_chestplate_silver.png",
    groups = {armor_torso=15, armor_heal=5, armor_use=700},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_silver", {
    description = S("Silver Leggings"),
    inventory_image = "moarmour_inv_leggings_silver.png",
    groups = {armor_legs=15, armor_heal=5, armor_use=700},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_silver", {
    description = S("Silver Boots"),
    inventory_image = "moarmour_inv_boots_silver.png",
    groups = {armor_feet=10, armor_heal=5, armor_use=700},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_silver", {
    description = S("Silver Shield"),
    inventory_image = "moarmour_inv_shield_silver.png",
    groups = {armor_shield=10, armor_heal=5, armor_use=700},
    wear = 0,
  })

end


if minetest.get_modpath("terumet") then

  minetest.register_tool("moarmour:helmet_cgls", {
    description = S("Coreglass Helmet"),
    inventory_image = "moarmour_inv_helmet_cgls.png",
    groups = {armor_head=19, armor_heal=2, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_cgls", {
    description = S("Coreglass Chestplate"),
    inventory_image = "moarmour_inv_chestplate_cgls.png",
    groups = {armor_torso=25, armor_heal=2, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_cgls", {
    description = S("Coreglass Leggings"),
    inventory_image = "moarmour_inv_leggings_cgls.png",
    groups = {armor_legs=25, armor_heal=2, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_cgls", {
    description = S("Coreglass Boots"),
    inventory_image = "moarmour_inv_boots_cgls.png",
    groups = {armor_feet=19, armor_heal=2, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_cgls", {
    description = S("Coreglass Shield"),
    inventory_image = "moarmour_inv_shield_cgls.png",
    groups = {armor_shield=19, armor_heal=2, armor_use=20},
    wear = 0,
  })

  minetest.register_tool("moarmour:helmet_tcop", {
    description = S("Terucopper Helmet"),
    inventory_image = "moarmour_inv_helmet_tcop.png",
    groups = {armor_head=13, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_tcop", {
    description = S("Terucopper Chestplate"),
    inventory_image = "moarmour_inv_chestplate_tcop.png",
    groups = {armor_torso=17.5, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_tcop", {
    description = S("Terucopper Leggings"),
    inventory_image = "moarmour_inv_leggings_tcop.png",
    groups = {armor_legs=17.5, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_tcop", {
    description = S("Terucopper Boots"),
    inventory_image = "moarmour_inv_boots_tcop.png",
    groups = {armor_feet=13, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_tcop", {
    description = S("Terucopper Shield"),
    inventory_image = "moarmour_inv_shield_tcop.png",
    groups = {armor_shield=13, armor_heal=1, armor_use=20},
    wear = 0,
  })

  minetest.register_tool("moarmour:helmet_tcha", {
    description = S("Teruchalcum Helmet"),
    inventory_image = "moarmour_inv_helmet_tcha.png",
    groups = {armor_head=16.5, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_tcha", {
    description = S("Teruchalcum Chestplate"),
    inventory_image = "moarmour_inv_chestplate_tcha.png",
    groups = {armor_torso=22, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_tcha", {
    description = S("Teruchalcum Leggings"),
    inventory_image = "moarmour_inv_leggings_tcha.png",
    groups = {armor_legs=22, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_tcha", {
    description = S("Teruchalcum Boots"),
    inventory_image = "moarmour_inv_boots_tcha.png",
    groups = {armor_feet=16.5, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_tcha", {
    description = S("Teruchalcum Shield"),
    inventory_image = "moarmour_inv_shield_tcha.png",
    groups = {armor_shield=16.5, armor_heal=1, armor_use=20},
    wear = 0,
  })

  minetest.register_tool("moarmour:helmet_tgol", {
    description = S("Terugold Helmet"),
    inventory_image = "moarmour_inv_helmet_tgol.png",
    groups = {armor_head=16.5, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_tgol", {
    description = S("Terugold Chestplate"),
    inventory_image = "moarmour_inv_chestplate_tgol.png",
    groups = {armor_torso=22, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_tgol", {
    description = S("Terugold Leggings"),
    inventory_image = "moarmour_inv_leggings_tgol.png",
    groups = {armor_legs=22, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_tgol", {
    description = S("Terugold Boots"),
    inventory_image = "moarmour_inv_boots_tgol.png",
    groups = {armor_feet=16.5, armor_heal=1, armor_use=20},
    wear = 0,
        })
        minetest.register_tool("moarmour:shield_tgol", {
    description = S("Terugold Shield"),
    inventory_image = "moarmour_inv_shield_tgol.png",
    groups = {armor_shield=16.5, armor_heal=1, armor_use=20},
    wear = 0,
  })

  minetest.register_tool("moarmour:helmet_tste", {
    description = S("Terusteel Helmet"),
    inventory_image = "moarmour_inv_helmet_tste.png",
    groups = {armor_head=15, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:chestplate_tste", {
    description = S("Terusteel Chestplate"),
    inventory_image = "moarmour_inv_chestplate_tste.png",
    groups = {armor_torso=20, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:leggings_tste", {
    description = S("Terusteel Leggings"),
    inventory_image = "moarmour_inv_leggings_tste.png",
    groups = {armor_legs=20, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:boots_tste", {
    description = S("Terusteel Boots"),
    inventory_image = "moarmour_inv_boots_tste.png",
    groups = {armor_feet=15, armor_heal=1, armor_use=20},
    wear = 0,
  })
  minetest.register_tool("moarmour:shield_tste", {
    description = S("Terusteel Shield"),
    inventory_image = "moarmour_inv_shield_tste.png",
    groups = {armor_shield=15, armor_heal=1, armor_use=20},
    wear = 0,
  })


end