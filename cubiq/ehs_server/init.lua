ehs = {
	modpath = core.get_modpath(core.get_current_modname()),
	storage = core.get_mod_storage("ehs_server"),
	S = core.get_translator("ehs_server"),
}
dofile(ehs.modpath.."/helpers.lua")
dofile(ehs.modpath.."/users.lua")
dofile(ehs.modpath.."/roles.lua")
dofile(ehs.modpath.."/fanctions.lua")

