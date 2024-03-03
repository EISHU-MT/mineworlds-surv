-- EISHU Money System
bank = {
	storage = core.get_mod_storage("emoney"),
	S = minetest.get_translator(minetest.get_current_modname()),
	modpath = minetest.get_modpath("emoney"),
}
dofile(bank.modpath.."/formspecs.lua")
dofile(bank.modpath.."/items.lua")
dofile(bank.modpath.."/function.lua")
dofile(bank.modpath.."/functional_formspec.lua")
dofile(bank.modpath.."/chat.lua")
dofile(bank.modpath.."/node_override.lua")