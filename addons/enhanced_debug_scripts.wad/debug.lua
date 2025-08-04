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

function map_direction(startx, starty, targetx, targety)
    local game = wl.Game()
    local map = game.map
    local mapx = math.floor(map.width / 2)
    local mapy = math.floor(map.height / 2)

    local direction = ""
    local diffx = targetx - startx
    local diffy = targety - starty

    if math.abs(diffx) >= mapx then
        diffx = diffx * - 1
    end
    if math.abs(diffy) >= mapy then
        diffy = diffy * - 1
    end

    if (diffx == 0) and (diffy == 0) then
        direction = ""
    elseif (diffx == 0) and (diffy < 0) and (targety % 2 == 0) then
        direction = "tl"
    elseif (diffx == 0) and (diffy < 0) and (targety % 2 == 1) then
        direction = "tr"
    elseif (diffx == 0) and (diffy > 0) and (targety % 2 == 0) then
        direction = "bl"
    elseif (diffx == 0) and (diffy > 0) and (targety % 2 == 1) then
        direction = "br"
    elseif (diffx < 0) and (diffy < 0) then
        direction = "tl"
    elseif (diffx < 0) and (diffy == 0) then
        direction = "l"
    elseif (diffx < 0) and (diffy > 0) then
        direction = "bl"
    elseif (diffx > 0) and (diffy < 0) then
        direction = "tr"
    elseif (diffx > 0) and (diffy == 0) then
        direction = "r"
    elseif (diffx > 0) and (diffy > 0) then
        direction = "br"
    end

    return direction
end

-- general map settings --
function change_terrain(startx, starty, radius, terrainname)
    radius = radius or 1
    terrainname = terrainname or "summer_water"

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        field.terr = terrainname
        field.terd = terrainname
    end
end

function place_resource(startx, starty, radius, resourcename, resourceamount)
    radius = radius or 1
    resourceamount = resourceamount or 1
    resourcename = resourcename or "none"

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        field.resource = resourcename
        field.resource_amount = resourceamount
    end
end

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
    local treelist_desert = {
        "palm_borassus_desert_mature",
        "palm_coconut_desert_mature",
        "palm_date_desert_mature",
        "palm_oil_desert_mature",
        "palm_roystonea_desert_mature"
    }

    local treelist_summer = {
        "alder_summer_mature", -- Erle
        "aspen_summer_mature", -- Espe
        "beech_summer_mature", -- Buche
        "birch_summer_mature", -- Birke
        "larch_summer_mature", -- Lärche
        "oak_summer_mature", -- Eiche
        "rowan_summer_mature", -- Eberesche
        "spruce_summer_mature" -- Fichte
    }
    local treelist_wasteland = {
        "cirrus_wasteland_mature",
        "liana_wasteland_mature",
        "mushroom_dark_wasteland_mature",
        "mushroom_green_wasteland_mature",
        "mushroom_red_wasteland_mature",
        "twine_wasteland_mature",
        "umbrella_green_wasteland_mature",
        "umbrella_red_wasteland_mature"
    }
    local treelist_winter = {
        "maple_winter_mature", -- Ahorn
    }

    local treelist = treelist_summer

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

    local rocklist_blackland = {
        "blackland_rocks1", "blackland_rocks2", "blackland_rocks3", "blackland_rocks4", "blackland_rocks5", "blackland_rocks6",
    }
    local rocklist_desert = {
        "desert_rocks1", "desert_rocks2", "desert_rocks3", "desert_rocks4", "desert_rocks5", "desert_rocks6",
    }
    local rocklist_greenland = {
        "greenland_rocks1", "greenland_rocks2", "greenland_rocks3", "greenland_rocks4", "greenland_rocks5", "greenland_rocks6",
    }
    local rocklist_winterland = {
        "winterland_rocks1", "winterland_rocks2", "winterland_rocks3", "winterland_rocks4", "winterland_rocks5", "winterland_rocks6"
    }

    local rocklist = rocklist_greenland

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

    if map:get_field(startx, starty).immovable then
        map:get_field(startx, starty).immovable:remove()
    end
end

function remove_all_objects(startx, starty, radius)
    radius = radius or 0

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        if (field.immovable) then
           field.immovable:remove()
        end
    end
end

function destroy_object(startx, starty)
    local game = wl.Game()
    local map = game.map

    if map:get_field(startx, starty).immovable then
        map:get_field(startx, starty).immovable:destroy()
    end
end

function destroy_all_objects(startx, starty, radius)
    radius = radius or 0

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        if (field.immovable) then
           field.immovable:destroy()
        end
    end
end

function force_object(startx, starty, objectname)
    local game = wl.Game()
    local map = game.map
    
    if map:get_field(startx, starty).immovable then
        remove_object(startx, starty)
    end
    place_object(startx, starty, objectname)
end

function force_trade_pole(startx, starty)
    force_object(startx, starty, "europeans_trade_pole")
end

-- general player settings --
function switch_player(player_number1, player_number2)
    local game = wl.Game()
    local player = game.players[player_number1]
    player:switchplayer(player_number2)
end

function observer_mode_team(team_number, observer)
    observer = observer or true

    local game = wl.Game()
    for k, tplayer in ipairs(game.players) do
        if tplayer.team == team_number then
            tplayer.see_all = observer
        end
    end
end

function observer_mode_player(player_number, observer)
    observer = observer or true

    local game = wl.Game()
    local player = game.players[player_number]
    player.see_all = observer
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

function conquer_water_fields(startx, starty, radius, player_number)
    radius = radius or 0

    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    -- gather all portfields from the map
    for i, field in pairs(fields) do
        if field:has_caps("swimmable") then
            player:conquer(field, 0)
        end
    end
end

function conquer_all_water_fields(player_number, radius)
    radius = radius or 0

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

function transfer_fields(player_number1, player_number2)
    player_number1 = player_number1 or 0
    player_number2 = player_number2 or 0

    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map

    if (player_number1 > 0) and (player_number2 > 0) then
        local player1 = game.players[player_number1]
        local player2 = game.players[player_number2]
        
        -- gather all fields from the map
        for x = 0, (map.width - 1) do
            for y = 0, (map.height - 1) do
                local field = map:get_field(x,y)
                if (field.owner == player1) and not field.immovable then
                    player2:conquer(field, 0)
                end
            end
        end

    elseif (player_number1 > 0) and (player_number2 == 0) then
        local player1 = game.players[player_number1]

        -- gather all fields from the map
        for x = 0, (map.width - 1) do
            for y = 0, (map.height - 1) do
                local field = map:get_field(x,y)
                if (field.owner == player1) and not field.immovable then
                    -- player1:conquer(field, 0)
                end
            end
        end
    elseif (player_number2 > 0) and (player_number1 == 0) then
        local player2 = game.players[player_number2]

        -- gather all fields from the map
        for x = 0, (map.width - 1) do
            for y = 0, (map.height - 1) do
                local field = map:get_field(x,y)
                if field.owner and not (field.owner == player2) and not field.immovable then
                    player2:conquer(field, 0)
                end
            end
        end
    else
        -- gather all fields from the map
        for x = 0, (map.width - 1) do
            for y = 0, (map.height - 1) do
                local field = map:get_field(x,y)
                if not field.immovable then
                    -- player1:conquer(field, 0)
                end
            end
        end
    end
end


pop_textdomain()
