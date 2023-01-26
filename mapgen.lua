local top = -994
local bottom = -1000
local random = math.random

local path = minetest.get_modpath("backrooms")

local topbottom = function(minp, maxp)
    if minp.y >= top or maxp.y <= bottom then
		return
	end
    for x = minp.x, maxp.x do
    for y = minp.y, maxp.y do
    for z = minp.z, maxp.z do
        pos = {x=x, y=y, z=z}
        if y == (top - 1) then
            if x % 3 == 0 and z % 3 == 0 then
                minetest.env:add_node(pos, {name = "backrooms:light"})
            else
                minetest.env:add_node(pos, {name="backrooms:wall"})
            end
        elseif y < (top - 1) and y > (bottom + 1) then
            minetest.env:remove_node(pos)
        elseif y == (bottom + 1) then
            minetest.env:add_node(pos, {name="backrooms:wall"})
        end
    end
    end
    end
end

local walls = function(minp, maxp, seed)
    if minp.y >= top or maxp.y <= bottom then
		return
	end
    for x = minp.x, maxp.x, 2 do
    for y = minp.y, maxp.y do
    for z = minp.z, maxp.z, 2 do
        pos = {x=x, y=y, z=z}
        if y == (bottom + 2) and random(3) > 2 then
            minetest.place_schematic(pos, path.."/schems/wall.mts", "random", {}, true)
        end
    end
    end
    end
end

minetest.register_on_generated(topbottom)
minetest.register_on_generated(walls)