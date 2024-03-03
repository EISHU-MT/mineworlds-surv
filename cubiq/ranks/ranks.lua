-- ranks/ranks.lua

ranks.register("miembro", {
        prefix = rs("Member"),
        colour = {a=255, r=0, g=255, b=225},
    })

ranks.register("helper", {
	prefix = rs("Helper"),
	colour = {a = 255, r = 148, g = 255, b = 0},
	staff = true,
})

ranks.register("admin", {
	prefix = rs("Admin"),
	colour = {a = 255, r = 230, g = 33, b = 23},
	staff = true,
})

ranks.register("moderator", {
	prefix = rs("Moderator"),
	colour = {a = 255, r = 255, g = 83, b = 37},
	staff = true,
})

ranks.register("contributor", {
	prefix = rs("Contributor"),
	colour = {a = 255, r = 119, g = 146, b = 194},
	staff = true,
})

ranks.register("guardian", {
	prefix = rs("Guardian"),
	colour = {a = 255, r = 255, g = 132, b = 0},
	staff = true,
})

ranks.register("youtube", {
	prefix = rs("YouTube"),
	colour = {a = 255, r = 255, g = 80, b = 71},
	staff = true,
})

ranks.register("staffbuilder", {prefix = "Constructor", colour = {a = 255, r = 246, g = 129, b = 3}})

-- shop

ranks.register("vip", {
	prefix = "VIP",
	colour = {a = 255, r = 255, g = 205, b = 0},
	privs = {fly=true},
	grant_missing = true,
})

ranks.register("ninja", {
	prefix = "NINJA",
	colour = {a = 255, r = 32, g = 32, b = 32},
	privs = {teleport=true},
	grant_missing = true,
})

ranks.register("shadow", {
	prefix = "Shadow",
	colour = {a = 255, r = 1, g = 171, b = 253},
	privs = {fly=true,fast=true,noclip=true},
	grant_missing = true,
})

ranks.register("cazador", {
	prefix = "CAZADOR",
	colour = {a = 255, r = 0, g = 0, b = 0},
	privs = {fast=true,teleport=true,vanish=true},
	grant_missing = true,
})

ranks.register("creative_man", {
	prefix = "Creative",
	colour = {a = 255, r = 0, g = 0, b = 0},
	privs = {fast=true,teleport=true,vanish=true},
	grant_missing = true,
})

-- builders

ranks.register("good_builder", {
	prefix = "Good Builder",
	colour = {a = 255, r = 4, g = 250, b = 2},
})

ranks.register("mega_builder", {
	prefix = "Mega Builder",
	colour = {a = 255, r = 246, g = 129, b = 3},
})

ranks.register("profeccional_builder", {
	prefix = "Profeccional Builder",
	colour = {a = 255, r = 250, g = 67, b = 8},
})

ranks.register("extreme_builder", {
	prefix = "Extreme Builder",
	colour = {a = 255, r = 253, g = 22, b = 5},
})

ranks.register("legendary_builder", {
	prefix = "Legendary Builder",
	colour = {a = 255, r = 156, g = 1, b = 255},
})

ranks.register("god_builder", {
	prefix = "God Builder",
	colour = {a = 255, r = 253, g = 249, b = 5},
})

ranks.register("supreme_builder", {
	prefix = "Supreme Builder",
	colour = {a = 255, r = 41, g = 39, b = 39},
})

