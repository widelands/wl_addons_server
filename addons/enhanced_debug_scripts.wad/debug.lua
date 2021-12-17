-- =======================================================================
--           Test script for debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)

-- general game settings --
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

function set_seafaring(player_number, OnOff)
    local game = wl.Game()
    local suffix = ""    
    
    if player_number > 0 then
        local player = game.players[player_number]
        
        if player.tribe.name == "europeans" then
            suffix = "_basic"
        else
            suffix = ""
        end
    
        if OnOff == true then
            player:allow_buildings{player.tribe.port, (player.tribe.name .. "_shipyard" .. suffix)}
        elseif OnOff == false then
            player:forbid_buildings{player.tribe.port, (player.tribe.name .. "_shipyard" .. suffix)}
        end
    else
        for idx, player in ipairs(game.players) do
            if player.tribe.name == "europeans" then
                suffix = "_basic"
            else
                suffix = ""
            end
            if OnOff == true then
                player:allow_buildings{player.tribe.port, (player.tribe.name .. "_shipyard" .. suffix)}
            elseif OnOff == false then
                player:forbid_buildings{player.tribe.port, (player.tribe.name .. "_shipyard" .. suffix)}
            end
        end
    end
end

-- general field/object settings --
function conquer_fields(player_number, startx, starty, radius)
    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    player:conquer(centerfield, radius)    
end

function place_object(startx, starty, objectname)
    local game = wl.Game()
    local map = game.map

    map:place_immovable(objectname, map:get_field(startx, starty))
end

function place_objects(startx, starty, radius, objectname, objectcount)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local fields = field:region(radius)
    local idx
    
    while #fields > 0 and objectcount > 0 do
       local idx = math.random(#fields)
       local f = fields[idx]
       if not f.immovable then
          place_object(f.x, f.y, objectname)
          objectcount = objectcount - 1
       end
       table.remove(fields, idx)
    end
end

function place_random_trees(startx, starty, radius, objectcount)
    -- apple tree = Apfelbaum, cherry tree = Kirschbaum, pear tree = Birnbaum, walnut tree = Walnussbaum
    -- ash = Esche, chestnut = Kastanie, elm = Ulme, fir = Tanne, hornbeam = Hainbuche, linden tree = Linde, pine = Kiefer, poplar = Pappel, willow = Weide
    
    local treelist = {
    "alder_summer_mature", -- Erle
    "aspen_summer_mature", -- Espe
    "beech_summer_mature", -- Buche
    "birch_summer_mature", -- Birke
    "larch_summer_mature", -- Lärche
    "maple_winter_mature", -- Ahorn
    "oak_summer_mature", -- Eiche
    "rowan_summer_mature", -- Eberesche
    "spruce_summer_mature" -- Fichte
    } 
    local randomtree = treelist[math.random(#treelist)]

    local rcount = 1
    while objectcount > 0 do
        randomtree = treelist[math.random(#treelist)]
        rcount = math.random(objectcount)
        place_objects(startx, starty, radius, randomtree, rcount)
        objectcount = objectcount - rcount
    end
end

function place_random_rocks(startx, starty, radius, objectcount)
    local rocklist = {
    "blackland_rocks1", "blackland_rocks2", "blackland_rocks3", "blackland_rocks4", "blackland_rocks5", "blackland_rocks6", 
    "desert_rocks1", "desert_rocks2", "desert_rocks3", "desert_rocks4", "desert_rocks5", "desert_rocks6", 
    "greenland_rocks1", "greenland_rocks2", "greenland_rocks3", "greenland_rocks4", "greenland_rocks5", "greenland_rocks6", 
    "winterland_rocks1", "winterland_rocks2", "winterland_rocks3", "winterland_rocks4", "winterland_rocks5", "winterland_rocks6" 
    }
    local randomrock = rocklist[math.random(#rocklist)]

    local rcount = 1
    while objectcount > 0 do
        randomrock = rocklist[math.random(#rocklist)]
        rcount = math.random(objectcount)
        place_objects(startx, starty, radius, randomrock, rcount)
        objectcount = objectcount - rcount
    end
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

function remove_ship(player, ship_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local ships = player:get_ships()
    
    for i, ship in pairs(ships) do
        -- print(i, ship.shipname)
        if (ship.shipname == ship_name) or (ship_name == "") then
            ship:remove()
        end
    end
end

-- general flag/road/street settings --
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
    local roadtype = "normal"
    
    local game = wl.Game()
    local map = game.map
    local startfield = map:get_field(startx, starty)
    local player = startfield.owner
    
    if not (startfield.immovable) then
        player:place_flag(map:get_field(startx, starty))
    end

    local startflag = startfield.immovable
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
        print ("create road tile with delta-x:", diffx, "and delta-y:", diffy)

        -- impossible road, change target --
        if ((diffx == 1) or (diffx == -1)) and (diffy == 0) then
            targetx = targetx + 1
        end
        if ((diffy == 1) or (diffy == -1)) and (diffx == 0) then
            targety = targety - 1
        end
        
        -- special end roads (3 tiles)-- 
        if (diffx == 3) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "r", "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 3) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "br", "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 2) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "br", "br", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 2) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "br", "br", "br", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 1) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "br", "br", "br", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "br", "bl", "br", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "bl", "br", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -1) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "bl,", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -2) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "bl,", true)
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
        elseif (diffx == -3) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "l", "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -3) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "tl", "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -2) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -2) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == -1) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tl", "tr", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tr", "tl", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 1) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 2) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 2) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 3) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "tr", "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]

        -- special roads (2 tiles)-- 
        elseif (diffx > 0) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "br", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "bl", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "l", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "r", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]

        -- standard roads (2 tiles) --
        elseif (diffx > 0) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "r", "r", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "br", "br", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "br", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "bl", "bl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "l", "l", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx < 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tl", "tl", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx == 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tl", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        elseif (diffx > 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tr", "tr", true)
          startflag = road.end_flag
          startfield = startflag.fields[1]
        end
    end
end

-- general building settings --
function place_building(player, startx, starty, radius, building_name)
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    place_building_in_region(player, building_name, fields)
end

function place_port(player, startx, starty, radius)
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    local tribe = player.tribe
    local portname = tribe.port
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        for i, portfield in pairs(map.port_spaces) do
            for j, field in pairs(fields) do
                if (portfield.x == field.x) and (portfield.y == field.y) then
                    print (i, portfield.x , portfield.y)
                    place_building(player, portfield.x, portfield.y, 0, portname)
                end
            end
        end
    end
end

function force_building(player_number, startx, starty, radius, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name
    
    place_building(player, startx, starty, radius, tribe_name .. "_" .. building_name)
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

function place_mine(player, startx, starty)
    local game = wl.Game()
    local map = game.map
    local mine_field = map:get_field(startx, starty)
    local resource = mine_field.resource
    local amount = mine_field.resource_amount

    local tribe = player.tribe
    local tribe_name = tribe.name
    
    local minename = ""
    local suffix = ""
    
    print (resource, amount)
    
    if tribe_name == "europeans" then
        if amount >= 20 then
            suffix = "_basic"
        elseif amount > 16 then
            suffix = "_level_1"
        elseif amount > 12 then
            suffix = "_level_2"
        elseif amount > 8 then
            suffix = "_level_3"
        elseif amount > 4 then
            suffix = "_level_4"
        else
            suffix = "_level_5"
        end
    elseif tribe_name == "barbarians" then
        if amount >= 15 then
            suffix = ""
        elseif amount >= 8 then
            suffix = "_deep"
        else
            suffix = "_deeper"
        end
    elseif tribe_name == "empire" then
        if amount >= 10 then
            suffix = ""
        else
            suffix = "_deep"
        end
    end
    
    if tribe_name == "europeans" then
        if resource == "resource_coal" then
            minename = "europeans_coalmine"
        elseif resource == "resource_iron" then
            minename = "europeans_ironmine"
        elseif resource == "resource_gold" then
            minename = "europeans_goldmine"
        else
            minename = "europeans_well_basic"
            suffix = ""
        end
    elseif tribe_name == "atlanteans" then
        if resource == "resource_coal" then
            minename = "atlanteans_coalmine"
        elseif resource == "resource_iron" then
            minename = "atlanteans_ironmine"
        elseif resource == "resource_gold" then
            minename = "atlanteans_goldmine"
        elseif resource == "resource_stone" then
            minename = "atlanteans_crystalmine"
        elseif resource == "resource_water" then
            minename = "atlanteans_well"
            suffix = ""
        end
    elseif tribe_name == "barbarians" then
        if resource == "resource_coal" then
            minename = "barbarians_coalmine"
        elseif resource == "resource_iron" then
            minename = "barbarians_ironmine"
        elseif resource == "resource_gold" then
            minename = "barbarians_goldmine"
        elseif resource == "resource_stone" then
            minename = "barbarians_granitemine"
            suffix = ""
        elseif resource == "resource_water" then
            minename = "barbarians_well"
            suffix = ""
        end
    elseif tribe_name == "empire" then
        if resource == "resource_coal" then
            minename = "empire_coalmine"
        elseif resource == "resource_iron" then
            minename = "empire_ironmine"
        elseif resource == "resource_gold" then
            minename = "empire_goldmine"
        elseif resource == "resource_stone" then 
            minename = "empire_marblemine"
        elseif resource == "resource_water" then 
            minename = "empire_well"
            suffix = ""
        end
    end
    
    place_building_in_region(player, minename..suffix, map:get_field(startx, starty):region(2))
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

function dismantle_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for k, tplayer in ipairs(game.players) do
        for i, tbuilding in ipairs(tplayer.tribe.buildings) do
            for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                if tbuilding.name == building_name then
                    building:dismantle(true)
                elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. building_name) then
                    building:dismantle(true)
                elseif string.find(tbuilding.name, building_name) then
                    building:dismantle(true)
                elseif tbuilding.type_name == building_name then
                    building:dismantle(true)
                end
           end
        end
    end
end

function dismantle_idle_buildings(player_number, productivity_threshold)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and building.productivity < productivity_threshold then
             building:dismantle(true)
          end
       end
    end
end

function dismantle_stopped_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and building.is_stopped == true then
             building:dismantle(true)
          end
       end
    end
end

function enhance_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
end

function upgrade_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
end

function enhance_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.name == building_name then
             building:enhance(true)
          elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. building_name) then
             building:enhance(true)
          elseif string.find(tbuilding.name, building_name) then
             building:enhance(true)
          elseif tbuilding.type_name == building_name then
             building:enhance(true)
          end
       end
    end
end

function upgrade_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.name == building_name then
             building:enhance(true)
          elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. building_name) then
             building:enhance(true)
          elseif string.find(tbuilding.name, building_name) then
             building:enhance(true)
          elseif tbuilding.type_name == building_name then
             building:enhance(true)
          end
       end
    end
end

function enhance_idle_buildings(player_number, productivity_threshold)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and building.productivity < productivity_threshold then
             building:enhance(true)
          end
       end
    end
end

function upgrade_idle_buildings(player_number, productivity_threshold)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and building.productivity < productivity_threshold then
             building:enhance(true)
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

function start_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          print (tbuilding.name, string.find(tbuilding.name, building_name))
          if tbuilding.name == building_name then
             if (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. building_name) then
             if (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          elseif string.find(tbuilding.name, building_name) then
             if (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          elseif tbuilding.type_name == building_name then
             if (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          end
       end
    end
end

function stop_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.name == building_name then
             if not (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. building_name) then
             if not (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          elseif string.find(tbuilding.name, building_name) then
             if not (building.is_stopped == true) then
                 building:toggle_start_stop()
             end
          elseif tbuilding.type_name == building_name then
             if not (building.is_stopped == true) then
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

-- warehouse settings --
function set_warehouse_worker_policy(startx, starty, workername, policiename)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    for j, tbuilding in ipairs(tribe.buildings) do
        for k, building in ipairs(player:get_buildings(tbuilding.name)) do
             if building.descr.type_name == "warehouse" and building == field then
                 building:set_warehouse_policies(workername, policiename)
             end
        end
    end
end

function set_warehouse_ware_policy(startx, starty, warename, policiename)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    for j, tbuilding in ipairs(tribe.buildings) do
        for k, building in ipairs(player:get_buildings(tbuilding.name)) do
             if building.descr.type_name == "warehouse" and building == field then
                 building:set_warehouse_policies(warename, policiename)
             end
        end
    end
end

function set_warehouse_waretype_policy(startx, starty, waretype, policiename)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    if waretype == "build" then
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.buildcost) do
                warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.enhancement_cost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
    elseif waretype == "tools" then
        for i, tworker in ipairs(tribe.workers) do
            for warename, warecount in pairs(tworker.buildcost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and not string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                        end
                    end
                end
            end
        end
    elseif waretype == "armor" then
        for i, tworker in ipairs(tribe.workers) do
            for warename, warecount in pairs(tworker.buildcost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "productionsite" and tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                        end
                    end
                end
            end
        end
    elseif waretype == "weapons" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "trainingsite" then
                if tbuilding.inputs then
                    for k, waretype, warecount in pairs(tbuilding.inputs) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    elseif waretype == "food" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.is_mine then
                if tbuilding.inputs then
                    for k, waretype, warecount in pairs(tbuilding.inputs) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    elseif waretype == "ore" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.is_mine then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    elseif waretype == "metals" then
    end
end

function set_warehouse_ware_count(startx, starty, warename, warecount)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    for j, tbuilding in ipairs(tribe.buildings) do
        for k, building in ipairs(player:get_buildings(tbuilding.name)) do
             if building.descr.type_name == "warehouse" and building == field then
                 building:set_wares(warename, warecount)
             end
        end
    end
end

function set_warehouse_remove_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "remove")
    end
end

function set_warehouse_dontstock_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "dontstock")
    end
end

function set_warehouse_prefer_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "prefer")
    end
end

function reset_warehouse_policy(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "normal")
    end
end

pop_textdomain()
