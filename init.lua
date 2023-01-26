local path = minetest.get_modpath("backrooms")

minetest.register_node("backrooms:wall", {
    description = "Backrooms Wall",
    tiles = {"wall.png"},
    groups = {unbreakable = 1},
    param2type = "light"
})
minetest.register_node("backrooms:light", {
    description = "Backrooms Light",
    tiles = {"wall.png", "light.png", "wall.png"},
    groups = {unbreakable = 1},
    light_source = 14
})

dofile(path.."/mapgen.lua")