-- =======================================================================
--           Test script for debugging flags and roads
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"

-- general flag/road/street settings --
function force_flag(startx, starty, player_number)
    player_number = player_number or 0

    local game = wl.Game()
    local map = game.map

    if player_number > 0 then
        local player = game.players[player_number]
    else
        local player = map:get_field(startx, starty).owner
    end

    if player then
        player:place_flag(map:get_field(startx, starty))
    end
end

function remove_flag(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "flag") then
       remove_object(startx, starty)
    end
end

function remove_all_flags(startx, starty, radius)
    radius = radius or 0

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        if (field.immovable) and (field.immovable.descr.type_name == "flag") and not (field.immovable.building) then
           field.immovable:remove()
        end
    end
end

function place_road(startx, starty, road_command, roadtype)
    roadtype = roadtype or "normal"
    if not roadtype or not (string.find(roadtype, "busy") or string.find(roadtype, "waterway")) then
        roadtype = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner

    if road_command:sub(-1) ~= "|" then
       road_command = road_command .. "|"
    end

    moves = {}
    for m in road_command:gmatch("%a+[,|]") do
       moves[#moves+1] = m:sub(1,-2)
       if(m:sub(-1) == '|') then
          r = player:place_road(roadtype, startflag, table.unpack(moves))
          startflag = r.end_flag
          moves = {}
       end
    end
end

function force_road(startx, starty, road_command, roadtype, create_carriers)
    roadtype = roadtype or "normal"
    if not roadtype or not (string.find(roadtype, "busy") or string.find(roadtype, "waterway")) then
        roadtype = "normal"
    end
    create_carriers = create_carriers or false

    local game = wl.Game()
    local map = game.map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner

    if road_command:sub(-1) ~= "|" then
       road_command = road_command .. "|"
    end

    moves = {}
    for m in road_command:gmatch("%a+[,|]") do
       moves[#moves+1] = m:sub(1,-2)
       if(m:sub(-1) == '|') then
          moves[#moves+1] = true -- Force the road
          r = player:place_road(roadtype, startflag, table.unpack(moves))
          startflag = r.end_flag
          if create_carriers then
              r:set_workers(r.valid_workers)
          end
          moves = {}
       end
    end

    if r then
        return r
    end
end

function remove_road(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "road") then
       remove_object(startx, starty)
    end
end

function remove_all_roads(startx, starty, radius)
    radius = radius or 0

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        if (field.immovable) and (field.immovable.descr.type_name == "road") then
           field.immovable:remove()
        end
    end
end

function force_connection(startx, starty, targetx, targety, roadtype, create_carriers)
    roadtype = roadtype or "normal"
    if not roadtype or not (string.find(roadtype, "busy") or string.find(roadtype, "waterway")) then
        roadtype = "normal"
    end

    create_carriers = create_carriers or false

    local road_command = nil
    local road_field = nil
    local road_endfield = nil

    local road_distance = map_distance(startx, starty, targetx, targety)
    local road_direction = map_direction(startx, starty, targetx, targety)

    local game = wl.Game()
    local map = game.map
    local startfield = map:get_field(startx, starty)
    local startflag = startfield.immovable
    local targetfield = map:get_field(targetx, targety)
    local player = startfield.owner

    if not (startfield.immovable) then
        startflag = player:place_flag(map:get_field(startx, starty))
    elseif not (startfield.immovable.descr.type_name == "flag") then
        startfield.immovable:remove()
        startflag = player:place_flag(map:get_field(startx, starty))
    end

    road_field = startfield
    while not (road_endfield == targetfield) do
        if (road_direction == "") then
            road_endfield = road_field
        elseif (road_direction == "l") then
            road_endfield = road_field.ln
        elseif (road_direction == "bl") then
            road_endfield = road_field.bln
        elseif (road_direction == "br") then
            road_endfield = road_field.brn
        elseif (road_direction == "r") then
            road_endfield = road_field.rn
        elseif (road_direction == "tr") then
            road_endfield = road_field.trn
        elseif (road_direction == "tl") then
            road_endfield = road_field.tln
        end

        if road_command and road_direction then
            road_command = road_command .. "," .. road_direction
        elseif road_direction then
            road_command = road_direction
        end

        if (road_endfield == targetfield) then
            break
        else
            road_direction = map_direction(road_endfield.x, road_endfield.y, targetfield.x, targetfield.y)
            road_field = road_endfield
        end
    end
    if road_command then
        print ("created road: ", road_command)
        road = force_road(startfield.x, startfield.y, road_command, roadtype, create_carriers)
    end
end

pop_textdomain()
