include "scripting/coroutine.lua"
include "scripting/ui.lua"
include "scripting/infrastructure.lua"

-- =======================================================================
--                             PUBLIC FUNCTIONS
-- =======================================================================

-- RST
--    Wait for the given number of milliseconds, then center the
--    interactive player's map view on the given Field.
--
--    This function returns immediately after calling.
--    :arg player: The player to move the view for
--    :type player: :class:`~wl.game.Player`
--    :arg sleeptime: The number of milliseconds to wait
--    :type sleeptime: :class:`integer`
--    :arg field: The field to center the view on
--    :type field: :class:`~wl.map.Field`
--    :returns: :const:`nil`
function sleep_then_goto(player, sleeptime, field)
    run(function()
       sleep(sleeptime)
       if player.number == wl.Game().interactive_player then scroll_to_field(field) end
    end)
end

-- RST
--    Creates some expedition ships in random places with the given additional items on them.
--    If called for the interactive player, centers the view on an arbitrary of these ships.
--    :arg player: The player to use
--    :type player: :class:`~wl.game.Player`
--    :arg items: An :class:`array` of :class:`tables` with `ware_or_worker_name = amount` pairs. As many ships will
--                be created as there are subtables, and the n-th ship created will load the
--                additional wares and workers defined in ``items[n]``. The capacity of each ship will
--                be adjusted to accommodate the build cost of the player's tribe's port building
--                plus one builder plus the number of additional items for this ship.
--    :returns: :const:`nil`

function launch_expeditions(player, items)
    local fields = wl.Game().map:find_ocean_fields(#items)

    local buildcost = 1
    local port = wl.Game():get_building_description(wl.Game():get_tribe_description(player.tribe_name).port)
    for s,i in pairs(port.buildcost) do buildcost = buildcost + i end

    for i,f in pairs(fields) do
       local ship = player:place_ship(f)

       local nr_i = 0
       for s,i in pairs(items[i]) do nr_i = nr_i + i end
       ship.capacity = buildcost + nr_i

       ship:make_expedition(items[i])
    end

    sleep_then_goto(player, 1000, fields[1])
end

function start_expedition(player, items)
    local game = wl.Game()
    local map = game.map
    local tribe_name = player.tribe_name
    local port = game:get_building_description(wl.Game():get_tribe_description(tribe_name).port)
    
    local fields = map:find_ocean_fields(#items)

    local buildcost = 1
    for s,i in pairs(port.buildcost) do 
        buildcost = buildcost + i 
    end

    for i,f in pairs(fields) do
        local ship = player:place_ship(f)
        local nr_i = 0
        for s,i in pairs(items[i]) do 
             nr_i = nr_i + i 
        end
        ship.capacity = buildcost + nr_i
        ship:make_expedition(items[i])
    end
end

function start_expedition_from_port(player)
    local tribe = player.tribe
    local ports = player:get_buildings(tribe.port)
    
    for i, port in ipairs(ports) do
        port:start_expedition()
    end
end

function place_ship(player, startx, starty, capacity)
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    
    local ship = player:place_ship(centerfield)
    ship.capacity = capacity
end

function place_ship_random(player, capacity)
    local game = wl.Game()
    local map = game.map
    local oceanfields = map:find_ocean_fields(1)
    
    local ship = player:place_ship(oceanfields[1])
    ship.capacity = capacity
end

function set_seafaring(OnOff, player)
    local game = wl.Game()
    
    if player then
        if OnOff == true then
             player:allow_buildings{player.tribe.port}
        elseif OnOff == false then
             player:forbid_buildings{player.tribe.port}
        end
    else
        for idx, player in ipairs(game.players) do
             if OnOff == true then
                 player:allow_buildings{player.tribe.port}
             elseif OnOff == false then
                 player:forbid_buildings{player.tribe.port}
             end
        end
    end
end

function set_ship_capacity(player, ship_name, capacity)
    local ships = player:get_ships()
    
    for i, ship in pairs(ships) do
        -- print(i, ship.shipname)
        if (ship.shipname == ship_name) or (ship_name == "") then
             ship.capacity = capacity
        end
    end
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

function place_building(player, startx, starty, radius, buildingname)
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    place_building_in_region(player, buildingname, fields)
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
                     print (i, portfield.x, portfield.y)
                     place_building(player, portfield.x, portfield.y, 0, portname)
                 end
             end
        end
    end
end

function balance_player_warehouse_wares(player)
    local game = wl.Game()
    local map = game.map
    local tribe = player.tribe
    
    local warehouse_types = {}
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
        end
    end
    
    local warehouses = {}
    for i, building_name in ipairs(warehouse_types) do
        warehouses = array_combine(warehouses, player:get_buildings(building_name))
    end
      
    if #warehouses > 1 then
        local remove_threshold = 4 + (#warehouses / 2)
        local dontstock_threshold = 1 + (#warehouses / 2)
        
        local remove_percent = 0.25 + (1 / #warehouses)
        local dontstock_percent = 0.05 + (1 / #warehouses)
        
        for i, ware in ipairs(tribe.wares) do
            local ware_description = game:get_ware_description(ware.name)
            local is_build_material = ware_description:is_construction_material(tribe.name)

            for j, building in ipairs(warehouses) do
                if (building:get_wares(ware.name) > (player:get_wares(ware.name) * remove_percent)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * remove_threshold)) then
                    building:set_warehouse_policies(ware.name, "remove")
                elseif (building:get_wares(ware.name) > (player:get_wares(ware.name) * dontstock_percent)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * dontstock_threshold)) then
                    building:set_warehouse_policies(ware.name, "dontstock")
                else
                    building:set_warehouse_policies(ware.name, "normal")
                end
            end
        end
    end
end

function balance_player_warehouse_workers(player)
    local game = wl.Game()
    local map = game.map
    local tribe = player.tribe
    
    local warehouse_types = {}
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
        end
    end
    
    local warehouses = {}
    for i, building_name in ipairs(warehouse_types) do
        warehouses = array_combine(warehouses, player:get_buildings(building_name))
    end
    
    for i, building_name in ipairs(warehouse_types) do
        warehouses = array_combine(warehouses, player:get_buildings(building_name))
    end
    
    if #warehouses > 1 then
        local remove_threshold = 4 + (#warehouses / 2)
        local dontstock_threshold = 1 + (#warehouses / 2)
        
        local remove_percent = 0.25 + (1 / #warehouses)
        local dontstock_percent = 0.05 + (1 / #warehouses)
        
        for i, worker in ipairs(tribe.workers) do
            for j, building in ipairs(warehouses) do
                if (building:get_workers(worker.name) > (player:get_workers(worker.name) * dontstock_percent)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * dontstock_threshold)) then
                    building:set_warehouse_policies(worker.name, "dontstock")
                else
                    building:set_warehouse_policies(worker.name, "normal")
                end
            end
        end
    end
end

function reset_player_warehouse_policy(player)
    local game = wl.Game()
    local map = game.map
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        for k, building in ipairs(player:get_buildings("lutas_atlanteans_headquarters")) do
            building:set_warehouse_policies(ware.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("lutas_atlanteans_warehouse")) do
            building:set_warehouse_policies(ware.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("lutas_atlanteans_port")) do
            building:set_warehouse_policies(ware.name, "normal")
        end
    end
    for i, worker in ipairs(tribe.workers) do
        for k, building in ipairs(player:get_buildings("lutas_atlanteans_headquarters")) do
            building:set_warehouse_policies(worker.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("lutas_atlanteans_warehouse")) do
            building:set_warehouse_policies(worker.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("lutas_atlanteans_port")) do
            building:set_warehouse_policies(worker.name, "normal")
        end
    end
end

function change_idle_stopped_buildings(player, productivity_percent)
    local game = wl.Game()
    N = (get_build_id():find("1.0") ~= 1)

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and (building.productivity < productivity_percent or building.is_stopped == true) then
             print (tbuilding.name, building.productivity)
             if N then
                 building:enhance(true)
             end
             sleep(5000)
             building:dismantle(true)
             sleep(10000)
          end
       end
    end
end

function set_hero_advanced_militarysites(player)
    local ms3 = player:get_buildings("lutas_atlanteans_guardhall")
    local mt3 = player:get_buildings("lutas_atlanteans_tower_high")
    local mf3 = player:get_buildings("lutas_atlanteans_castle")
    
    for i, building in ipairs(mf3) do
        building.soldier_preference = "any"
        building.soldier_preference = "heroes"
    end
    for i, building in ipairs(mt3) do
        building.soldier_preference = "any"
        building.soldier_preference = "heroes"
    end
    for i, building in ipairs(ms3) do
        building.soldier_preference = "any"
        building.soldier_preference = "heroes"
    end
end


function place_ship_random_ai(player)
    local ships = player:get_ships()
    local ports = player:get_buildings(player.tribe.port)
    
    if #ships < #ports then
        place_ship_random(player, 64)
    end
end
