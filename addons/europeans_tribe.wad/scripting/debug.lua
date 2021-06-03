-- =======================================================================
--           Test script for debugging.
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

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

function place_mine(player_number, startx, starty, minetype)
    local game = wl.Game()
    local map = game.map
    local player = game.players[player_number]
    local tribe = player.tribe
    
    local minename = ""
    
    if tribe.name == "europeans" then
        if minetype == "coal" then
            minename = "europeans_coalmine_basic"
        elseif minetype == "iron" then
            minename = "europeans_ironmine_basic"
        elseif minetype == "gold" then
            minename = "europeans_goldmine_basic"
        end
    end
    
    place_building_in_region(player, minename, map:get_field(startx, starty):region(2))
end

function replace_building(startx, starty, buildingname)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner

    if (map:get_field(startx, starty).immovable.descr.type_name == "flag") then
       remove_object(startx, starty-1) -- Remove existing building
       remove_object(startx-1, starty-1) -- Remove existing building
    else
       remove_object(startx, starty) -- Remove existing building
    end
    place_building_in_region(player, buildingname, map:get_field(startx, starty):region(1)) -- Place new one
end

function replace_all_buildings(player_number, buildingname, buildingname2)
    local game = wl.Game()
    local map = game.map
    local player = game.players[player_number]

    for startx = 0, map.width - 1 do
       for starty = 0, map.height - 1 do
          if map:get_field(startx, starty).immovable and map:get_field(startx, starty).immovable.owner == player then
             if map:get_field(startx, starty).immovable.descr.type_name == buildingname or map:get_field(startx, starty).immovable.descr.name == buildingname then
                replace_building(startx, starty, buildingname2)
             end
          end
       end
    end 
end

function remove_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       remove_object(startx, starty)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       remove_object(startx, starty)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       remove_object(startx, starty)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       remove_object(startx, starty)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       remove_object(startx, starty)
    end
end

function remove_all_buildings(player_number, buildingname)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, player in ipairs(game.players) do
        for j, tbuilding in ipairs(player.tribe.buildings) do
           for k, building in ipairs(player:get_buildings(tbuilding.name)) do
              if tbuilding.type_name == buildingname or tbuilding.name == buildingname or player.tribe.name == buildingname then
                 building:remove()
              end
           end
        end
    end 
end

function cheat_wares(player_number)
    local MAX_UNDEFINED_WARES = 16

    local player = wl.Game().players[player_number]
    local tribe = player.tribe

    for i, building in ipairs(tribe.buildings) do
       -- restock warehouses
       if building.type_name == "warehouse" then
        for i, building in ipairs(player:get_buildings(building.name)) do
          for i, ware in ipairs(tribe.wares) do
             if building:get_wares(ware.name) < MAX_UNDEFINED_WARES then
                building:set_wares(ware.name, MAX_UNDEFINED_WARES)
             end
          end
        end
       end
    end
end

-- following functions are only for debugging europeans tribe --
function allow_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_guardhouse", "europeans_tower_small", "europeans_blockhouse", "europeans_sentry"}
        player:allow_buildings{"europeans_barrier", "europeans_outpost", "europeans_advanced_barrier"}
        player:allow_buildings{"europeans_tower", "europeans_tower_high", "europeans_advanced_tower"}
        player:allow_buildings{"europeans_castle", "europeans_fortress", "europeans_advanced_castle"}
    end
end

function forbid_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_guardhouse", "europeans_tower_small", "europeans_blockhouse", "europeans_sentry"}
        player:forbid_buildings{"europeans_barrier", "europeans_outpost", "europeans_advanced_barrier"}
        player:forbid_buildings{"europeans_tower", "europeans_tower_high", "europeans_advanced_tower"}
        player:forbid_buildings{"europeans_castle", "europeans_fortress", "europeans_advanced_castle"}
    end
end

function allow_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_guardhall", "europeans_dungeon"}
        player:allow_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_normal", "europeans_trainingscamp_advanced"}
        player:allow_buildings{"europeans_labyrinth", "europeans_arena", "europeans_colosseum"}
    end
end

function forbid_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_guardhall", "europeans_dungeon"}
        player:forbid_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_normal", "europeans_trainingscamp_advanced"}
        player:forbid_buildings{"europeans_labyrinth", "europeans_arena", "europeans_colosseum"}
    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_normal", "europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_quarry_normal", "europeans_fishers_house_normal", "europeans_hunters_house_normal", "europeans_scouts_house_normal"}
        player:allow_buildings{"europeans_sawmill_normal", "europeans_lumberjacks_house_normal", "europeans_charcoal_kiln_normal", "europeans_stonemasons_house", "europeans_mill_normal", "europeans_tavern_level_3", "europeans_brewery_normal", "europeans_smelting_works_normal", "europeans_smithy_level_4"}
        player:allow_buildings{"europeans_recruitement_center_normal", "europeans_farm_level_2", "europeans_sheepfarm", "europeans_weaving_mill_normal", "europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_normal", "europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_quarry_normal", "europeans_fishers_house_normal", "europeans_hunters_house_normal", "europeans_scouts_house_normal"}
        player:forbid_buildings{"europeans_sawmill_normal", "europeans_lumberjacks_house_normal", "europeans_charcoal_kiln_normal", "europeans_stonemasons_house", "europeans_mill_normal", "europeans_tavern_level_3", "europeans_brewery_normal", "europeans_smelting_works_normal", "europeans_smithy_level_4"}
        player:forbid_buildings{"europeans_recruitement_center_normal", "europeans_farm_level_2", "europeans_sheepfarm", "europeans_weaving_mill_normal", "europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_advanced", "europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_quarry_advanced", "europeans_fishers_house_advanced", "europeans_hunters_house_advanced", "europeans_scouts_house_advanced"}
        player:allow_buildings{"europeans_sawmill_advanced", "europeans_lumberjacks_house_advanced", "europeans_charcoal_kiln_advanced", "europeans_stonemasons_house", "europeans_mill_advanced", "europeans_inn_basic", "europeans_brewery_advanced", "europeans_smelting_works_advanced", "europeans_smithy_level_7"}
        player:allow_buildings{"europeans_recruitement_center_advanced", "europeans_farm_level_3", "europeans_sheepfarm", "europeans_weaving_mill_advanced", "europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_advanced", "europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_quarry_advanced", "europeans_fishers_house_advanced", "europeans_hunters_house_advanced", "europeans_scouts_house_advanced"}
        player:forbid_buildings{"europeans_sawmill_advanced", "europeans_lumberjacks_house_advanced", "europeans_charcoal_kiln_advanced", "europeans_stonemasons_house", "europeans_mill_advanced", "europeans_inn_basic", "europeans_brewery_advanced", "europeans_smelting_works_advanced", "europeans_smithy_level_7"}
        player:forbid_buildings{"europeans_recruitement_center_advanced", "europeans_farm_level_3", "europeans_sheepfarm", "europeans_weaving_mill_advanced", "europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5"}
    end
end

-- following functions could produce memory leak - dont use it, if not necessary! --
function cheat_soldiers(player_number)
    local MAX_UNDEFINED_SOLDIERS = 8
    local SOLDIER_STATS_NOVICE = { 0, 0, 0, 0 }

    local player = wl.Game().players[player_number]
    local tribe = player.tribe

    -- retrieve best soldier stats
    local soldier_stats = SOLDIER_STATS_NOVICE
    for i, worker in ipairs(tribe.workers) do
       if worker.type_name == "soldier" then
        soldier_stats = { worker.max_health_level, worker.max_attack_level, worker.max_defense_level, worker.max_evade_level }
       end
    end

    for i, building in ipairs(tribe.buildings) do
       -- restaff warehouses
       if building.type_name == "warehouse" then
        for i, building in ipairs(player:get_buildings(building.name)) do
          for i, worker in ipairs(tribe.workers) do
             if worker.type_name == "soldier" then
                building:set_soldiers(soldier_stats, MAX_UNDEFINED_SOLDIERS)
             else
                building:set_workers(worker.name, MAX_UNDEFINED_SOLDIERS)
             end
          end
        end
       end
    end
end

pop_textdomain()
