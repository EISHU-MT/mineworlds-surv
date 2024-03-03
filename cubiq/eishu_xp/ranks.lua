
xp_redo.ranks = {}

xp_redo.register_rank = function(def)
	table.insert(xp_redo.ranks, def)
	if not xp_redo.disable_hover_entity then
		-- register entity only if not disabled
		xp_redo.register_rank_entity(def)
	end
end

xp_redo.register_rank({
	name = "Newbie",
	icon = "default_wood.png", -- Should fit withing the background icon (16x32px)
	color = {r=137, g=158, b=123}, -- Player name tag color
	xp = 0 -- xp threshold
})

xp_redo.register_rank({
	name = "Player",
	icon = "default_cobble.png", -- Should fit withing the background icon (16x32px)
	color = {r=133, g=240, b=64}, -- Player name tag color
	xp = 100 -- xp threshold
})

xp_redo.register_rank({
	name = "Regular",
	icon = "default_stone.png", -- Should fit withing the background icon (16x32px)
	color = {r=67, g=172, b=0}, -- Player name tag color
	xp = 250 -- xp threshold
})

xp_redo.register_rank({
	name = "Aspirant",
	icon = "default_stone_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=181, g=226, b=152}, -- Player name tag color
	xp = 550 -- xp threshold
})

xp_redo.register_rank({
	name = "Freshman",
	icon = "default_tin_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=10, g=255, b=203}, -- Player name tag color
	xp = 900 -- xp threshold
})

xp_redo.register_rank({
	name = "Wayfarer",
	icon = "default_steel_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=122, g=255, b=227}, -- Player name tag color
	xp = 1600 -- xp threshold
})

xp_redo.register_rank({
	name = "Citizen",
	icon = "default_bronze_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=138, g=182, b=173}, -- Player name tag color
	xp = 3000 -- xp threshold
})

xp_redo.register_rank({
	name = "Veteran",
	icon = "default_gold_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=81, g=191, b=212}, -- Player name tag color
	xp = 5200 -- xp threshold
})

xp_redo.register_rank({
	name = "Master",
	icon = "default_mese_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=63, g=144, b=160}, -- Player name tag color
	xp = 10000 -- xp threshold
})

xp_redo.register_rank({
	name = "Legend",
	icon = "default_diamond_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=146, g=237, b=255}, -- Player name tag color
	xp = 15000 -- xp threshold
})

xp_redo.register_rank({
	name = "Mythic",
	icon = "mineral_pack_emerald_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=101, g=118, b=238}, -- Player name tag color
	xp = 20000 -- xp threshold
})

xp_redo.register_rank({
	name = "Supreme Master",
	icon = "mineral_pack_spinel_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=46, g=69, b=234}, -- Player name tag color
	xp = 60000 -- xp threshold
})

xp_redo.register_rank({
	name = "Champion",
	icon = "mineral_pack_spinel_block.png", -- Should fit withing the background icon (16x32px)
	color = {r=0, g=32, b=255}, -- Player name tag color
	xp = 90000 -- xp threshold
})