-- =======================================================================
--           Test script for debugging.
-- =======================================================================

include "addons/enhanced_debug_scripts.wad/starting_conditions.lua"

push_textdomain("enhanced_debug_scripts.wad", true)

function switch_player(player_number1, player_number2)
    local game = wl.Game()
    local player = game.players[player_number1]
    player:switchplayer(player_number2)
end

function observer_mode(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    player.see_all = true
end

function play_mode(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    player.see_all = false
end

function peace_mode(player_number1, player_number2)
    local game = wl.Game()
    local player1 = game.players[player_number1]
    local player2 = game.players[player_number2]
    player1:set_attack_forbidden(player_number2, true)
    player2:set_attack_forbidden(player_number1, true)
    player1.team = player_number1
    player2.team = player_number1
end

function war_mode(player_number1, player_number2)
    local game = wl.Game()
    local player1 = game.players[player_number1]
    local player2 = game.players[player_number2]
    player1:set_attack_forbidden(player_number2, false)
    player2:set_attack_forbidden(player_number1, false)
    player1.team = player_number1
    player2.team = player_number2
end

function conquer_fields(player_number, startx, starty, radius)
    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    player:conquer(centerfield, radius)    
end

function remove_object(startx, starty)
    local game = wl.Game()
    local map = game.map

    map:get_field(startx, starty).immovable:remove()
end

function destroy_object(startx, starty)
    local game = wl.Game()
    local map = game.map

    map:get_field(startx, starty).immovable:destroy()
end

function place_flag(player_number, startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = game.players[player_number]

    player:place_flag(map:get_field(startx, starty))
end

function remove_flag(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "flag") then
       remove_object(startx, starty)
    end
end

function place_road(startx, starty, cmd)
    local game = wl.Game()
    local map = game.map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner
    local roadtype = "normal"

    if cmd:sub(-1) ~= "|" then
       cmd = cmd .. "|"
    end

    moves = {}
    for m in cmd:gmatch("%a+[,|]") do
       moves[#moves+1] = m:sub(1,-2)
       if(m:sub(-1) == '|') then
          --moves[#moves+1] = true -- Force the road
          r = player:place_road(roadtype, startflag, table.unpack(moves))
          startflag = r.end_flag
          moves = {}
       end
    end
end

function remove_road(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "road") then
       remove_object(startx, starty)
    end
end

function connect_road(startx, starty, targetx, targety)
    local game = wl.Game()
    local map = game.map
    local startfield = map:get_field(startx, starty)
    local startflag = startfield.immovable
    local player = startflag.owner
    local roadtype = "normal"

    local mapx = math.floor(map.width / 2)
    local mapy = math.floor(map.height / 2)
    local diffx = targetx - startx
    local diffy = targety - starty
    
    if math.abs(diffx) > mapx then
        diffx = diffx * - 1
    end
    if math.abs(diffy) > mapy then
        diffy = diffy * - 1
    end
    
    while not ((startfield.x == targetx) and (startfield.y == targety)) do
        startx = startfield.x
        starty = startfield.y
        diffx = targetx - startx
        diffy = targety - starty

        if math.abs(diffx) > mapx then
            diffx = diffx * - 1
        end
        if math.abs(diffy) > mapy then
            diffy = diffy * - 1
        end
        --print ("x:", diffx, "y:", diffy)

        -- impossible road, change target --
        if ((diffx == 1) or (diffx == -1)) and (diffy == 0) then
            targetx = targetx + 1
        end
        if ((diffy == 1) or (diffy == -1)) and (diffx == 0) then
            targety = targety + 1
        end

        -- horizontal road --
        if (diffx == 3) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "r", "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end
        if (diffx == -3) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "l", "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end

        -- vertical road --
        if (diffx == 0) and (diffy == 3) then
          road = player:place_road(roadtype, startflag, "bl", "br", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "br", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end
        if (diffx == 0) and (diffy == -3) then
          road = player:place_road(roadtype, startflag, "tl", "tr", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tl", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end

        -- diagonal road --
        if (diffx == 3) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "br", "br", "br", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 2) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "br", "br", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 3) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "br", "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "br", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy > 1) then
          road = player:place_road(roadtype, startflag, "br", "br", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end

        if (diffx == -3) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tl", "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -2) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -3) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "tl", "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "tl", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy < -1) then
          road = player:place_road(roadtype, startflag, "tl", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end

        if (diffx == 3) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 2) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 3) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "tr", "r", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "tr", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy < -1) then
          road = player:place_road(roadtype, startflag, "tr", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end

        if (diffx == -3) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -2) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -3) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "bl", "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "bl", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy > 1) then
          road = player:place_road(roadtype, startflag, "bl", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end
    end
end

function force_building(player_number, startx, starty, radius, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    
    place_building(player, startx, starty, radius, building_name)
end

function force_headquarters(player_number, startx, starty, radius)
    local game = wl.Game()
    local player = game.players[player_number]
    
    place_headquarters(player, startx, starty, radius)
end

function force_port(player_number, startx, starty, radius)
    local game = wl.Game()
    local player = game.players[player_number]
    
    place_port(player, startx, starty, radius)
end

function force_mine(player_number, startx, starty)
    local game = wl.Game()
    local player = game.players[player_number]
    
    place_mine(player, startx, starty)
end

function dismantle_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
end

function dismantle_all_buildings(player_number, buildingname)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == buildingname or tbuilding.name == buildingname or player.tribe.name == buildingname then
             building:dismantle(true)
          end
       end
    end
end

function dismantle_idle_buildings(player_number, producitiy_threshold)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and building.productivity < producitiy_threshold then
             building:dismantle(true)
          end
       end
    end
end

function upgrade_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       map:get_field(startx, starty).immovable:upgrade(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       map:get_field(startx, starty).immovable:upgrade(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       map:get_field(startx, starty).immovable:upgrade(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       map:get_field(startx, starty).immovable:upgrade(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       map:get_field(startx, starty).immovable:upgrade(true)
    end
end

function upgrade_all_buildings(player_number, buildingname)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == buildingname or tbuilding.name == buildingname or player.tribe.name == buildingname then
             building:upgrade(true)
          end
       end
    end
end

function startstop_building(startx, starty)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable
    
    building:toggle_start_stop()
end

function stop_all_buildings(player_number, building_name, stop)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == building_name or tbuilding.name == building_name or player.tribe.name == building_name then
             if not (building.is_stopped == stop) then
                 building:toggle_start_stop()
             end
          end
       end
    end
end

function block_dismantle_building(startx, starty, yesno)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable
    
    building.destruction_blocked = yesno
end

function block_destruction_building(startx, starty, yesno)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable
    
    building.destruction_blocked = yesno
end

pop_textdomain()
