-- =======================================================================
--           Test script for debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)

-- helper function --
function map_distance(startx, starty, targetx, targety)
    local game = wl.Game()
    local map = game.map

    local mapx = math.floor(map.width / 2)
    local mapy = math.floor(map.height / 2)
    
    local diffx = targetx - startx
    local diffy = targety - starty

    if math.abs(diffx) >= mapx then
        diffx = mapx - diffx
    end
    if math.abs(diffy) >= mapy then
        diffy = mapy - diffy
    end
    
    return math.sqrt((diffx * diffx) + (diffy * diffy))
end

-- general map settings --
function place_object(startx, starty, objectname)
    local game = wl.Game()
    local map = game.map

    map:place_immovable(objectname, map:get_field(startx, starty))
end

function rename_object(startx, starty, objectname)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local immovable = field.immovable

    if immovable then
        immovable.warehousename = objectname
    end
end

function place_objects(startx, starty, radius, objectname, objectcount)
    objectcount = objectcount or 1
    
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
    objectcount = objectcount or 1
    
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
    objectcount = objectcount or 1
    
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

-- general player settings --
function switch_player(player_number1, player_number2)
    local game = wl.Game()
    local player = game.players[player_number1]
    player:switchplayer(player_number2)
end

function observer_mode_team(team_number)
    local game = wl.Game()
    for k, tplayer in ipairs(game.players) do
        if tplayer.team == team_number then
            tplayer.see_all = true
        end
    end
end

function observer_mode_player(player_number)
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
    player_number1 = player_number1 or 0
    player_number2 = player_number2 or 0
    
    local game = wl.Game()
    
    if (player_number1 > 0) and (player_number2 > 0) then
        local player1 = game.players[player_number1]
        local player2 = game.players[player_number2]
        
        player1:set_attack_forbidden(player2.number, true)
        player2:set_attack_forbidden(player1.number, true)
    elseif (player_number1 > 0) and (player_number2 == 0) then
        local player1 = game.players[player_number1]
        
        for j, player2 in ipairs(game.players) do
            player1:set_attack_forbidden(player2.number, true)
            player2:set_attack_forbidden(player1.number, true)
        end
    elseif (player_number2 > 0) and (player_number1 == 0) then
        local player1 = game.players[player_number2]
        
        for j, player2 in ipairs(game.players) do
            player1:set_attack_forbidden(player2.number, true)
            player2:set_attack_forbidden(player1.number, true)
        end
    else
        for i, player1 in ipairs(game.players) do
            for j, player2 in ipairs(game.players) do
                player1:set_attack_forbidden(player2.number, true)
                player2:set_attack_forbidden(player1.number, true)
            end
        end
    end
end

function war_mode(player_number1, player_number2)
    player_number1 = player_number1 or 0
    player_number2 = player_number2 or 0
    
    local game = wl.Game()
    
    if (player_number1 > 0) and (player_number2 > 0) then
        local player1 = game.players[player_number1]
        local player2 = game.players[player_number2]
        
        player1:set_attack_forbidden(player2.number, false)
        player2:set_attack_forbidden(player1.number, false)
    elseif (player_number1 > 0) and (player_number2 == 0) then
        local player1 = game.players[player_number1]
        
        for j, player2 in ipairs(game.players) do
            player1:set_attack_forbidden(player2.number, false)
            player2:set_attack_forbidden(player1.number, false)
        end
    elseif (player_number2 > 0) and (player_number1 == 0) then
        local player1 = game.players[player_number2]
        
        for j, player2 in ipairs(game.players) do
            player1:set_attack_forbidden(player2.number, false)
            player2:set_attack_forbidden(player1.number, false)
        end
    else
        for i, player1 in ipairs(game.players) do
            for j, player2 in ipairs(game.players) do
                player1:set_attack_forbidden(player2.number, false)
                player2:set_attack_forbidden(player1.number, false)
            end
        end
    end
end

function conquer_fields(startx, starty, radius, player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    player:conquer(centerfield, radius)
end

function conquer_water_fields(radius, player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map

    -- gather all fields from the map
    for x = 0, (map.width - 1) do
        for y = 0, (map.height - 1) do
            local field = map:get_field(x,y)
            if field:has_caps("swimmable") then
                player:conquer(field, radius)
            end
            if not field:has_max_caps("walkable") then
                player:conquer(field, radius)
            end
        end
    end
end

function conquer_flag_fields(radius)
    radius = radius or 1

    local game = wl.Game()
    local map = game.map

    -- gather all fields from the map
    for x = 0, (map.width - 1) do
        for y = 0, (map.height - 1) do
            local field = map:get_field(x,y)
            immovable = field.immovable
            if immovable then
                player = immovable.owner
            else
                player = field.owner
            end
            if (player) and (immovable) and (immovable.descr.type_name == "flag") then
                player:conquer(field, radius)
            end
            if (player) and (immovable) and (immovable.descr.type_name == "road") then
                player:conquer(field, radius)
            end
        end
    end
end

function conquer_port_fields(radius)
    radius = radius or 1
    
    local game = wl.Game()
    local map = game.map

    -- gather all portfields from the map
    for i, portfield in pairs(map.port_spaces) do
        field = map:get_field(portfield.x,portfield.y)
        player = field.owner
        if player then
            player:conquer(field, radius)
        end
    end
end

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

function place_road(startx, starty, cmd, roadtype)
    roadtype = roadtype or "normal"
    if not roadtype or not (string.find(roadtype, "busy") or string.find(roadtype, "waterway")) then
        roadtype = "normal"
    end
    
    local game = wl.Game()
    local map = game.map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner

    if cmd:sub(-1) ~= "|" then
       cmd = cmd .. "|"
    end

    moves = {}
    for m in cmd:gmatch("%a+[,|]") do
       moves[#moves+1] = m:sub(1,-2)
       if(m:sub(-1) == '|') then
          r = player:place_road(roadtype, startflag, table.unpack(moves))
          startflag = r.end_flag
          moves = {}
       end
    end
end

function force_road(startx, starty, cmd, roadtype, create_carriers)
    roadtype = roadtype or "normal"
    if not roadtype or not (string.find(roadtype, "busy") or string.find(roadtype, "waterway")) then
        roadtype = "normal"
    end
    create_carriers = create_carriers or false
    
    local game = wl.Game()
    local map = game.map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner
   
    if cmd:sub(-1) ~= "|" then
       cmd = cmd .. "|"
    end

    moves = {}
    for m in cmd:gmatch("%a+[,|]") do
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

function force_connection(startx, starty, targetx, targety, roadtype)
    roadtype = roadtype or "normal"
    if not roadtype or not (string.find(roadtype, "busy") or string.find(roadtype, "waterway")) then
        roadtype = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local mapx = math.floor(map.width / 2)
    local mapy = math.floor(map.height / 2)
    
    local startfield = map:get_field(startx, starty)
    local player = startfield.owner

    if not (startfield.immovable) then
        player:place_flag(map:get_field(startx, starty))
    elseif not (startfield.immovable.descr.type_name == "flag") then
        startfield.immovable:remove()
        player:place_flag(map:get_field(startx, starty))
    end

    local startflag = startfield.immovable
    local diffx = targetx - startx
    local diffy = targety - starty

    if math.abs(diffx) >= mapx then
        diffx = diffx * - 1
    end
    if math.abs(diffy) >= mapy then
        diffy = diffy * - 1
    end

    while not ((startfield.x == targetx) and (startfield.y == targety)) do
        startx = startfield.x
        starty = startfield.y
        diffx = targetx - startx
        diffy = targety - starty

        if math.abs(diffx) >= mapx then
            diffx = diffx * - 1
        end
        if math.abs(diffy) >= mapy then
            diffy = diffy * - 1
        end

        -- console output --
        if ((diffx == 1) or (diffx == -1)) and (diffy == 0) then
            print ("can't create road tile with delta-x:", diffx, "and delta-y:", diffy)
            break
        else
            print ("create road tile with delta-x:", diffx, "and delta-y:", diffy)
        end

        -- special end roads (3 tiles, diffy even) --
        if (diffx == -3) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "l", "l", "l", true)
        elseif (diffx == -2) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "l", true)
        elseif (diffx == -2) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "l", true)
        elseif (diffx == 2) and (diffy == -2) then
          road = player:place_road(roadtype, startflag, "tr", "r", "tr", true)
        elseif (diffx == 2) and (diffy == 2) then
          road = player:place_road(roadtype, startflag, "br", "r", "br", true)
        elseif (diffx == 3) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "r", "r", "r", true)
          
        -- special end roads (3 tiles, diffy odd, 1 case) --
        elseif (diffx == -3) and (diffy == -1) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tl", "l", "l", true)
        elseif (diffx == -3) and (diffy == 1) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "bl", "l", "l", true)
        elseif (diffx == -2) and (diffy == -1) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "l", "tl", "l", true)
        elseif (diffx == -2) and (diffy == 1) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "l", "bl", "l", true)
        elseif (diffx == 2) and (diffy == -1) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "r", "tr", "r", true)
        elseif (diffx == 2) and (diffy == 1) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "r", "br", "r", true)
        elseif (diffx == 3) and (diffy == -1) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tr", "r", "r", true)
        elseif (diffx == 3) and (diffy == 1) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "br", "r", "r", true)

        -- special end roads (3 tiles, diffy odd, 2 cases) --
        elseif (diffx == -2) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tl", "l", "tl", true)
        elseif (diffx == -2) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "tl", true)
        elseif (diffx == -2) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "bl", "l", "bl", true)
        elseif (diffx == -2) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "bl", true)
        elseif (diffx == -1) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tl", "tl", "tl", true)
        elseif (diffx == -1) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tl", "tr", "tl", true)
        elseif (diffx == -1) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "bl", "bl", "bl", true)
        elseif (diffx == -1) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "bl", "br", "bl", true)
        elseif (diffx == 0) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tl", "tr", "tl", true)
        elseif (diffx == 0) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tr", "tl", "tr", true)
        elseif (diffx == 0) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "bl", "br", "bl", true)
        elseif (diffx == 0) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "br", "bl", "br", true)
        elseif (diffx == 1) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tr", "tl", "tr", true)
        elseif (diffx == 1) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "tr", true)
        elseif (diffx == 1) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "br", "bl", "br", true)
        elseif (diffx == 1) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "br", "br", "br", true)
        elseif (diffx == 2) and (diffy == -3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "tr", "tr", "tr", true)
        elseif (diffx == 2) and (diffy == -3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "tr", "tl", "tr", true)
        elseif (diffx == 2) and (diffy == 3) and (targety % 2 == 0) then
          road = player:place_road(roadtype, startflag, "br", "br", "br", true)
        elseif (diffx == 2) and (diffy == 3) and (targety % 2 == 1) then
          road = player:place_road(roadtype, startflag, "br", "r", "br", true)

        -- special roads (2 tiles, diffy even)--
        elseif (diffx < 0) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "l", "l", true)
        elseif (diffx > 0) and (diffy == 0) then
          road = player:place_road(roadtype, startflag, "r", "r", true)
                  
        -- special roads (2 tiles, diffy odd)--
        elseif (diffx < 0) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "l", "tl", true)
        elseif (diffx < 0) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "bl", "l", true)
        elseif (diffx > 0) and (diffy == -1) then
          road = player:place_road(roadtype, startflag, "r", "tr", true)
        elseif (diffx > 0) and (diffy == 1) then
          road = player:place_road(roadtype, startflag, "br", "r", true)
          
        -- standard roads (2 tiles) --
        elseif (diffx < 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tl", "tl", true)
        elseif (diffx < 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "bl", "bl", true)
        elseif (diffx == 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tl", "tr", true)
        elseif (diffx == 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "br", "bl", true)
        elseif (diffx > 0) and (diffy < 0) then
          road = player:place_road(roadtype, startflag, "tr", "tr", true)
        elseif (diffx > 0) and (diffy > 0) then
          road = player:place_road(roadtype, startflag, "br", "br", true)
        end

        startflag = road.end_flag
        startfield = startflag.fields[1]
    end
end

-- general seafaring settings --
function set_seafaring(player_number, OnOff)
    OnOff = OnOff or true
    
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

function set_ship_capacity(player_number, ship_name, capacity)
    local game = wl.Game()
    local player = game.players[player_number]
    local ships = player:get_ships()
    
    for i, ship in pairs(ships) do
        -- print(i, ship.shipname)
        if (ship.shipname == ship_name) or (ship_name == "") then
             ship.capacity = capacity
        end
    end
end

function force_expedition(player_number, number_expeditions)
    number_expeditions = number_expeditions or 1
    
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local ports = player:get_buildings(tribe.port)
    
    for i, port in ipairs(ports) do
        if i <= number_expeditions then
            port:start_expedition()
            print (port.warehousename)
        end
    end
end

function force_ship(startx, starty, player_number, capacity)
    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    
    local ship = player:place_ship(centerfield)
    ship.capacity = capacity
end

function force_ship_random(player_number, capacity)
    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local oceanfields = map:find_ocean_fields(1)
    
    local ship = player:place_ship(oceanfields[1])
    ship.capacity = capacity
end

function remove_ship(player_number, ship_name)
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

-- building settings with coordinates --
function force_building(startx, starty, radius, building_name, complete)
    complete = complete or false
    
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)
    local field = fields[math.random(#fields)]
    
    local player = field.owner
    local building = nil
    local found_building = nil

    if player then
        local tribe = player.tribe
        
        for i, tbuilding in ipairs(tribe.buildings) do
            if tbuilding.name == string.lower(building_name) then
                found_building = building_name
                break
            elseif string.find(tbuilding.name, string.lower(building_name)) then
                found_building = tbuilding.name
                break
            end
        end
        
        if (found_building) and (complete == true) then
            if (field.immovable) then
                field.immovable:remove()
            end
            building = player:place_building(found_building, field, false, true)
        elseif (found_building) and (complete == false) then
            if (field.immovable) then
                field.immovable:remove()
            end
            building = player:place_building(found_building, field, true, true)
        end
    end
    
    return building
end

function force_headquarters(startx, starty, radius, complete)
    radius = radius or 0
    complete = complete or false
    
    local headquarters = force_building(startx, starty, radius, "headquarters", complete)
end

function force_warehouse(startx, starty, radius, complete)
    radius = radius or 0
    complete = complete or false
    
    local warehouse = force_building(startx, starty, radius, "warehouse", complete)
end

function force_mine(startx, starty, radius)
    radius = radius or 0
    
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    
    local fields = centerfield:region(radius)
    local mine_field = fields[math.random(#fields)]
    local resource = mine_field.resource
    local amount = mine_field.resource_amount

    local minename = ""
    local suffix = ""
    
    local player = mine_field.owner
    
    if player then
        local tribe = player.tribe
        local tribe_name = tribe.name

        if resource == "resource_water" then
            if tribe_name == "amazons" then
                minename = "water_gatherers_hut"
            else
                minename = "well"
            end
        elseif resource == "resource_coal" then
            minename = "coalmine"
        elseif resource == "resource_iron" then
            minename = "ironmine"
        elseif resource == "resource_gold" then
            if tribe_name == "amazons" then
                minename = "gold_digger_dwelling"
            else
                minename = "goldmine"
            end
        elseif resource == "resource_stone" then
            if tribe_name == "amazons" then
                minename = "stonemine"
            elseif tribe_name == "atlanteans" then
                minename = "crystalmine"
            elseif tribe_name == "barbarians" then
                minename = "granitemine"
            elseif tribe_name == "empire" then
                minename = "marblemine"
            elseif tribe_name == "frisians" then
                minename = "rockmine"
            end
        else
            minename = "well"
        end

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
        elseif tribe_name == "frisians" then
            if amount >= 10 then
                suffix = ""
            else
                suffix = "_deep"
            end
        end
        
        local mine = player:place_building(tribe_name.."_"..minename..suffix, mine_field, true, true)
    end
end

function force_port(startx, starty, radius, player_number, complete)
    complete = complete or false
    
    local game = wl.Game()
    local map = game.map
    
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        if player_number > 0 then
            local player = game.players[player_number]
            local tribe = player.tribe
            
            for i, portfield in pairs(map.port_spaces) do
                if (map_distance(startx, starty, portfield.x, portfield.y) <= radius) then
                    field = map:get_field(portfield.x, portfield.y)
                    if not (field.immovable) then
                        if (complete == true) then
                            local port = player:place_building(player.tribe.port, field, false, true)
                        end
                        if (complete == false) then
                            local port = player:place_building(player.tribe.port, field, true, true)
                        end
                    end
                    if (field.immovable) then
                        if (complete == true) and not (field.immovable.descr.type_name == "warehouse") then
                            local port = player:place_building(player.tribe.port, field, false, true)
                        end
                        if (complete == false) and not (field.immovable.descr.type_name == "warehouse") then
                            local port = player:place_building(player.tribe.port, field, true, true)
                        end
                    end
                end
            end
        else
            for i, portfield in pairs(map.port_spaces) do
                if (map_distance(startx, starty, portfield.x, portfield.y) <= radius) then
                    field = map:get_field(portfield.x, portfield.y)
                    if not (field.immovable) then
                        if (complete == true) then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, false, true)
                            end
                        end
                        if (complete == false) then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, true, true)
                            end
                        end
                    end
                    if (field.immovable) then
                        if (complete == true) and not (field.immovable.descr.type_name == "warehouse") then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, false, true)
                            end
                        end
                        if (complete == false) and not (field.immovable.descr.type_name == "warehouse") then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, true, true)
                            end
                        end
                    end
                end
            end
        end
    end    
end

function force_militarysite(startx, starty, radius, player_number, militarytype)
    militarytype = militarytype or "small0"
    
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)
    local player = game.players[player_number]
    local tribe_name = player.tribe.name
    
    local max_soldier_stats = {0,0,0,0}
    
    if tribe_name == "europeans" then
        max_soldier_stats = {3,3,3,3}
        if militarytype == "small0" then
            building = "europeans_sentry_basic"
        elseif militarytype == "small1" then
            building = "europeans_sentry_level_1"
        elseif militarytype == "small2" then
            building = "europeans_sentry_level_2"
        elseif militarytype == "small3" then
            building = "europeans_sentry_level_3"
        elseif militarytype == "medium0" then
            building = "europeans_barrier_basic"
        elseif militarytype == "medium1" then
            building = "europeans_barrier_level_1"
        elseif militarytype == "medium2" then
            building = "europeans_barrier_level_2"
        elseif militarytype == "medium3" then
            building = "europeans_barrier_level_3"
        elseif militarytype == "medium4" then
            building = "europeans_tower_basic"
        elseif militarytype == "medium5" then
            building = "europeans_tower_level_1"
        elseif militarytype == "medium6" then
            building = "europeans_tower_level_2"
        elseif militarytype == "medium7" then
            building = "europeans_tower_level_3"
        elseif militarytype == "big0" then
            building = "europeans_castle_basic"
        elseif militarytype == "big1" then
            building = "europeans_castle_level_1"
        elseif militarytype == "big2" then
            building = "europeans_castle_level_2"
        elseif militarytype == "big3" then
            building = "europeans_castle_level_3"
        elseif militarytype == "big4" then
            building = "europeans_castle_level_4"
        else
            building = "europeans_sentry_basic"
        end
    elseif tribe_name == "amazons" then
        max_soldier_stats = {3,2,2,3}
        if militarytype == "small1" then
            building = "amazons_treetop_sentry"
        elseif militarytype == "small2" then
            building = "amazons_patrol_post"
        elseif militarytype == "medium1" then
            building = "amazons_warriors_dwelling"
        elseif militarytype == "medium2" then
            building = "amazons_tower"
        elseif militarytype == "medium3" then
            building = "amazons_observation_tower"
        elseif militarytype == "big1" then
            building = "amazons_fortress"
        elseif militarytype == "big2" then
            building = "amazons_fortification"
        else
            building = "amazons_treetop_sentry"
        end
    elseif tribe_name == "atlanteans" then
        max_soldier_stats = {1,4,2,2}
        if militarytype == "small1" then
            building = "atlanteans_guardhouse"
        elseif militarytype == "small2" then
            building = "atlanteans_tower_small"
        elseif militarytype == "medium1" then
            building = "atlanteans_guardhall"
        elseif militarytype == "medium2" then
            building = "atlanteans_tower"
        elseif militarytype == "medium3" then
            building = "atlanteans_tower_high"
        elseif militarytype == "big1" then
            building = "atlanteans_castle"
        else
            building = "atlanteans_guardhouse"
        end
    elseif tribe_name == "barbarians" then
        max_soldier_stats = {3,5,0,2}
        if militarytype == "small1" then
            building = "barbarians_sentry"
        elseif militarytype == "medium1" then
            building = "barbarians_barrier"
        elseif militarytype == "medium2" then
            building = "barbarians_tower"
        elseif militarytype == "big1" then
            building = "barbarians_fortress"
        elseif militarytype == "big2" then
            building = "barbarians_citadel"
        else
            building = "barbarians_sentry"
        end
    elseif tribe_name == "empire" then
        max_soldier_stats = {4,4,0,2}
        if militarytype == "small1" then
            building = "empire_blockhouse"
        elseif militarytype == "small2" then
            building = "empire_sentry"
        elseif militarytype == "medium1" then
            building = "empire_barrier"
        elseif militarytype == "medium2" then
            building = "empire_outpost"
        elseif militarytype == "medium3" then
            building = "empire_tower"
        elseif militarytype == "big1" then
            building = "empire_fortress"
        elseif militarytype == "big2" then
            building = "empire_castle"
        else
            building = "empire_blockhouse"
        end
    elseif tribe_name == "frisians" then
        max_soldier_stats = {2,6,2,0}
        if militarytype == "small1" then
            building = "frisians_wooden_tower"
        elseif militarytype == "small2" then
            building = "frisians_wooden_tower_high"
        elseif militarytype == "small3" then
            building = "frisians_sentinel"
        elseif militarytype == "medium1" then
            building = "frisians_outpost"
        elseif militarytype == "big1" then
            building = "frisians_tower"
        elseif militarytype == "big2" then
            building = "frisians_fortress"
        else
            building = "frisians_wooden_tower"
        end
    end

    local militarysite = player:place_building(building, fields[math.random(#fields)], false, true)
    militarysite:set_soldiers(max_soldier_stats, militarysite.max_soldiers)
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

function block_dismantle_building(startx, starty, yesno)
    yesno = yesno or true

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    building.destruction_blocked = yesno
end

function block_destruction_building(startx, starty, yesno)
    yesno = yesno or true
    
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    building.destruction_blocked = yesno
end

function set_warehouse_worker_policy(startx, starty, workername, policiename)
    policiename = policiename or "normal"
    if not policiename or not (string.find(policiename, "prefer") or string.find(policiename, "dontstock") or string.find(policiename, "remove")) then
        policiename = "normal"
    end
    
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local worker_name = (tribe.name .. "_" .. workername)

    for i, worker in ipairs(tribe.workers) do
        if worker.name == workername then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_warehouse_policies(workername, policiename)
                     end
                end
            end
        end
        if worker.name == worker_name then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_warehouse_policies(worker_name, policiename)
                     end
                end
            end
        end
    end
end

function set_warehouse_ware_policy(startx, starty, warename, policiename)
    policiename = policiename or "normal"
    if not policiename or not (string.find(policiename, "prefer") or string.find(policiename, "dontstock") or string.find(policiename, "remove")) then
        policiename = "normal"
    end
    
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        if ware.name == warename then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_warehouse_policies(warename, policiename)
                     end
                end
            end
        end
    end
end

function set_warehouse_waretype_policy(startx, starty, waretype, policiename)
    policiename = policiename or "normal"
    if not policiename or not (string.find(policiename, "prefer") or string.find(policiename, "dontstock") or string.find(policiename, "remove")) then
        policiename = "normal"
    end
    
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    if waretype == "all" then
        for i, ware in ipairs(tribe.wares) do
            set_warehouse_ware_policy(startx, starty, ware.name, policiename)
        end
    elseif waretype == "build" then
        for i, ware in ipairs(tribe.wares) do
            if (ware:is_construction_material(tribe.name)) then
                set_warehouse_ware_policy(startx, starty, ware.name, policiename)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.buildcost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.enhancement_cost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
    elseif waretype == "tools" then
        for i, tworker in ipairs(tribe.workers) do
            for warecount, warename in pairs(tworker.buildcost) do
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
    elseif waretype == "weapons" then
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
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "trainingsite" then
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
        for i, tbuilding in pairs(tribe.buildings) do
            if string.find(tbuilding.name, "smelting") then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    end
end

function set_warehouse_warecount(startx, starty, warename, warecount)
    warecount = warecount or 1

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        if ware.name == warename then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_wares(warename, warecount)
                     end
                end
            end
        end
    end
end

function set_warehouse_waretype_warecount(startx, starty, waretype, warenumber)
    warenumber = warenumber or 1
    
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    if waretype == "all" then
        for i, ware in ipairs(tribe.wares) do
            set_warehouse_warecount(startx, starty, ware.name, warenumber)
        end
    elseif waretype == "build" then
        for i, ware in ipairs(tribe.wares) do
            if (ware:is_construction_material(tribe.name)) then
                set_warehouse_warecount(startx, starty, ware.name, warenumber)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.buildcost) do
                set_warehouse_warecount(startx, starty, warename, warenumber)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.enhancement_cost) do
                set_warehouse_warecount(startx, starty, warename, warenumber)
            end
        end
    elseif waretype == "tools" then
        for i, tworker in ipairs(tribe.workers) do
            for warecount, warename in pairs(tworker.buildcost) do
                set_warehouse_warecount(startx, starty, warename, warenumber)
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and not string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                        end
                    end
                end
            end
        end
    elseif waretype == "weapons" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "productionsite" and tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                        end
                    end
                end
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "trainingsite" then
                if tbuilding.inputs then
                    for k, waretype, warecount in pairs(tbuilding.inputs) do
                        set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                    end
                end
            end
        end
    elseif waretype == "ore" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.is_mine then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                    end
                end
            end
        end
    elseif waretype == "metals" then
        for i, tbuilding in pairs(tribe.buildings) do
            if string.find(tbuilding.name, "smelting") then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                    end
                end
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

function startstop_building(startx, starty)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    if building.descr.type_name == "productionsite" then
        building:toggle_start_stop()
    elseif building.descr.type_name == "trainingsite" then
        building:toggle_start_stop()
    end
end

function set_militarysite_capacity(startx, starty, capacity)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    if building.descr.type_name == "militarysite" then
        building.capacity = capacity
    elseif building.descr.type_name == "trainingsite" then
        building:set_capacity(capacity)
    elseif building.descr.type_name == "warehouse" then
        building.capacity = capacity
    end
end

function set_militarysite_preference(startx, starty, preference)
    preference = preference or "any"
    if not preference or not (string.find(preference, "rookies") or string.find(preference, "heroes")) then
        preference = "any"
    end
        
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable
        
    if building then
        building.soldier_preference = preference
    end
end

-- building functions without coordinates --
function dismantle_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for k, tplayer in ipairs(game.players) do
        for i, tbuilding in ipairs(tplayer.tribe.buildings) do
            for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                if tbuilding.name == string.lower(building_name) then
                    building:dismantle(true)
                elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. string.lower(building_name)) then
                    building:dismantle(true)
                elseif string.find(tbuilding.name, string.lower(building_name)) then
                    building:dismantle(true)
                elseif tbuilding.type_name == string.lower(building_name) then
                    building:dismantle(true)
                end
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

function upgrade_all_buildings(player_number, building_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.name == string.lower(building_name) then
             building:enhance(true)
          elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. string.lower(building_name)) then
             building:enhance(true)
          elseif string.find(tbuilding.name, string.lower(building_name)) then
             building:enhance(true)
          elseif tbuilding.type_name == string.lower(building_name) then
             building:enhance(true)
          end
       end
    end
end

function upgrade_stopped_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and building.is_stopped == true then
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

function start_all_buildings(player_number, building_name)
    building_name = building_name or "all"
    
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name
    
    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if string.lower(building_name) == "all" then
                if (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif tbuilding.name == string.lower(building_name) then
                if (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. string.lower(building_name)) then
                if (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif string.find(tbuilding.name, string.lower(building_name)) then
                if (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif tbuilding.type_name == string.lower(building_name) then
                if (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            end
        end
    end
end

function stop_all_buildings(player_number, building_name)
    building_name = building_name or "all"
    
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name
    
    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if string.lower(building_name) == "all" then
                if not (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif tbuilding.name == string.lower(building_name) then
                if not (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. string.lower(building_name)) then
                if not (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif string.find(tbuilding.name, string.lower(building_name)) then
                if not (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            elseif tbuilding.type_name == string.lower(building_name) then
                if not (building.is_stopped == true) then
                    building:toggle_start_stop()
                end
            end
        end
    end
end

function set_all_militarysites_preference(player_number, building_name, preference)
    preference = preference or "any"
    if not preference or not (string.find(preference, "rookies") or string.find(preference, "heroes")) then
        preference = "any"
    end
    
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local tribe_name = tribe.name
    
    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if (string.lower(building_name) == "all") and (building.descr.type_name == "militarysite") then
                building.soldier_preference = preference
            elseif (tbuilding.name == string.lower(building_name)) and (building.descr.type_name == "militarysite") then
                building.soldier_preference = preference
            elseif (tbuilding.type_name == tbuilding.name == (tribe_name .. "_" .. string.lower(building_name))) and (tbuilding.type_name == "militarysite") then
                building.soldier_preference = preference
            elseif string.find(tbuilding.name, string.lower(building_name)) and (tbuilding.type_name == "militarysite") then
                building.soldier_preference = preference
            elseif (tbuilding.type_name == string.lower(building_name)) and (tbuilding.type_name == "militarysite") then
                building.soldier_preference = preference
            end
        end
    end
end

pop_textdomain()
