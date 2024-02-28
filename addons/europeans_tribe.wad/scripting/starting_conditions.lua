include "scripting/coroutine.lua"
include "scripting/ui.lua"
include "scripting/infrastructure.lua"

-- RST
-- starting_conditions.lua
-- -----------------------
--
-- This script contains some convenience functions intended mainly for use
-- in the Discovery and AI starting conditions.
--
-- To make these functions available include this file at the beginning
-- of a script via:
--
-- .. code-block:: lua
--
--    include "scripting/starting_condition.lua"
--

-- =======================================================================
--                             PUBLIC FUNCTIONS
-- =======================================================================

-- RST
-- .. function:: sleep_then_goto(player, sleeptime, field)
--
--    Wait for the given number of milliseconds, then center the
--    interactive player's map view on the given Field.
--
--    This function returns immediately after calling.
--
--    :arg player: The player to move the view for
--    :type player: :class:`~wl.game.Player`
--    :arg sleeptime: The number of milliseconds to wait
--    :type sleeptime: :class:`integer`
--    :arg field: The field to center the view on
--    :type field: :class:`~wl.map.Field`
--
--    :returns: :const:`nil`
function sleep_then_goto(player, sleeptime, field)
    run(function()
       sleep(sleeptime)
       if player.number == wl.Game().interactive_player then scroll_to_field(field) end
    end)
end

-- RST
-- .. function:: launch_expeditions(player, items)
--
--    Creates some expedition ships in random places with the
--    given additional items on them. If called for the interactive
--    player, centers the view on an arbitrary of these ships.
--
--    :arg player: The player to use
--    :type player: :class:`~wl.game.Player`
--    :arg items: An :class:`array` of :class:`tables` with `ware_or_worker_name = amount` pairs. As many ships will
--                be created as there are subtables, and the n-th ship created will load the
--                additional wares and workers defined in ``items[n]``. The capacity of each ship will
--                be adjusted to accommodate the build cost of the player's tribe's port building
--                plus one builder plus the number of additional items for this ship.
--
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

function place_trade_pole(player, fields)
    local game = wl.Game()
    local map = game.map
    local objectcount = 1
    
    while #fields > 0 and objectcount > 0 do
        local idx = math.random(#fields)
        local f = fields[idx]
        if not f.immovable then
           place_object(f.x, f.y, "europeans_trade_pole")
           objectcount = 0
        end
        table.remove(fields, idx)
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
        for k, building in ipairs(player:get_buildings("europeans_headquarters")) do
            building:set_warehouse_policies(ware.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("europeans_warehouse")) do
            building:set_warehouse_policies(ware.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("europeans_port")) do
            building:set_warehouse_policies(ware.name, "normal")
        end
    end
    for i, worker in ipairs(tribe.workers) do
        for k, building in ipairs(player:get_buildings("europeans_headquarters")) do
            building:set_warehouse_policies(worker.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("europeans_warehouse")) do
            building:set_warehouse_policies(worker.name, "normal")
        end
        for k, building in ipairs(player:get_buildings("europeans_port")) do
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

function upgrade_random_forester(player)
    local fhb = player:get_buildings("europeans_foresters_house_basic")
    local fhn = player:get_buildings("europeans_foresters_house_normal")
    local random_number = 0
    local building = nil
    
    if #fhn > 0 then
        random_number = math.random(#fhn)
        building = fhn[random_number]
    elseif #fhb > 0 then
        random_number = math.random(#fhb)
        building = fhb[random_number]
    else
        building = nil
    end
    if building ~= nil then
        building:enhance(true)
    end
end

function upgrade_random_lumberjack(player)
    local lhb = player:get_buildings("europeans_lumberjacks_house_basic")
    local lhn = player:get_buildings("europeans_lumberjacks_house_normal")
    local random_number = 0
    local building = nil
    
    if #lhn > 0 then
        random_number = math.random(#lhn)
        building = lhn[random_number]
    elseif #lhb > 0 then
        random_number = math.random(#lhb)
        building = lhb[random_number]
    else
        building = nil
    end
    if building ~= nil then
        building:enhance(true)
    end
end

function upgrade_random_militarysites(player)
    local ms1 = player:get_buildings("europeans_guardhouse")
    local ms2 = player:get_buildings("europeans_tower_small")
    local mb1 = player:get_buildings("europeans_barrier")
    local mb2 = player:get_buildings("europeans_outpost")
    local mt1 = player:get_buildings("europeans_tower")
    local mt2 = player:get_buildings("europeans_tower_high")
    local mc1 = player:get_buildings("europeans_castle")
    local mc2 = player:get_buildings("europeans_fortress")
    local random_number = 0
    local building = nil
    
    if #mc2 > 0 then
        random_number = math.random(#mc2)
        building = mc2[random_number]
    elseif #mc1 > 0 then
        random_number = math.random(#mc1)
        building = mc1[random_number]
    else
        building = nil
    end
    if building ~= nil then
        building:enhance(true)
    end
    
    if #mt2 > 0 then
        random_number = math.random(#mt2)
        building = mt2[random_number]
    elseif #mt1 > 0 then
        random_number = math.random(#mt1)
        building = mt1[random_number]
    else
        building = nil
    end
    if building ~= nil then
        building:enhance(true)
    end

    if #mb2 > 0 then
        random_number = math.random(#mb2)
        building = mb2[random_number]
    elseif #mb1 > 0 then
        random_number = math.random(#mb1)
        building = mb1[random_number]
    else
        building = nil
    end
    if building ~= nil then
        building:enhance(true)
    end

    if #ms2 > 0 then
        random_number = math.random(#ms2)
        building = ms2[random_number]
    elseif #ms1 > 0 then
        random_number = math.random(#ms1)
        building = ms1[random_number]
    else
        building = nil
    end
    if building ~= nil then
        building:enhance(true)
    end
end

function place_ship_random_ai(player)
    local ships = player:get_ships()
    local ports = player:get_buildings(player.tribe.port)
    
    if #ships < #ports then
        place_ship_random(player, 64)
    end
end

function doing_ai_stuff(player, increment)
    local map = wl.Game().map
    
    if (increment == 0) then
        player:forbid_buildings("all")
        player:allow_buildings{"europeans_guardhouse", "europeans_tower", "europeans_barrier", }
        player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_quarry_basic", }
        player:allow_buildings{"europeans_farm_small_basic", "europeans_foresters_house_basic", }
        player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", }
    end
    if (increment == 4) then
        player:allow_buildings{"europeans_market_small", }
        player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
        player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
        player:allow_buildings{"europeans_charcoal_kiln_basic", "europeans_stonemasons_house_basic", "europeans_smelting_works_basic", "europeans_manufactory_basic", }
        player:allow_buildings{"europeans_scouts_house_basic", "europeans_recruitement_center_basic", "europeans_trainingscamp_basic", "europeans_battlearena_basic", }
        
        if (map.waterway_max_length > 0) then
            player:allow_buildings{"europeans_ferry_yard_basic", }
        end
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
            player:allow_buildings{"europeans_shipyard_basic", "europeans_port", }
            place_ship_random_ai(player)
        else
            player:allow_buildings{"europeans_terraformers_house_basic", "europeans_warehouse", }
        end
    end
    if (increment == 8) then
        player:allow_buildings{"europeans_castle", "europeans_market_big", }
        player:allow_buildings{"europeans_lumberjacks_house_normal", "europeans_quarry_normal", }
        player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", }
        player:allow_buildings{"europeans_farm_small_normal", "europeans_foresters_house_normal", }
        player:allow_buildings{"europeans_charcoal_kiln_normal", "europeans_stonemasons_house_normal", }
        player:allow_buildings{"europeans_coalmine_level_2", "europeans_ironmine_level_2", "europeans_goldmine_level_2", }
        player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", }
        player:allow_buildings{"europeans_smelting_works_normal", "europeans_manufactory_normal", "europeans_scouts_house_normal", "europeans_recruitement_center_normal", }
        player:allow_buildings{"europeans_trainingscamp_normal", "europeans_battlearena_level_1", }
        
        if (map.waterway_max_length > 0) then
            player:allow_buildings{"europeans_ferry_yard_normal", }
        end
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
            player:allow_buildings{"europeans_shipyard_normal", }
            place_ship_random_ai(player)
        else
            player:allow_buildings{"europeans_terraformers_house_normal", }
        end
    end
    if (increment == 12) then
        player:allow_buildings{"europeans_lumberjacks_house_advanced", "europeans_quarry_advanced", }
        player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6", }
        player:allow_buildings{"europeans_farm_small_advanced", "europeans_foresters_house_advanced", }
        player:allow_buildings{"europeans_charcoal_kiln_advanced", "europeans_stonemasons_house_advanced", }
        player:allow_buildings{"europeans_coalmine_level_4", "europeans_ironmine_level_4", "europeans_goldmine_level_4", }
        player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", }
        player:allow_buildings{"europeans_smelting_works_advanced", "europeans_manufactory_advanced", "europeans_recruitement_center_advanced", }
        player:allow_buildings{"europeans_trainingscamp_advanced", "europeans_battlearena_level_2", "europeans_battlearena_level_3", }
        player:allow_buildings{"europeans_scouts_house_advanced", "europeans_trading_post", }
        
        if (map.waterway_max_length > 0) then
            player:allow_buildings{"europeans_ferry_yard_advanced", }
        end
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
            player:allow_buildings{"europeans_shipyard_advanced", }
            place_ship_random_ai(player)
        else
            player:allow_buildings{"europeans_terraformers_house_advanced", }
        end
    end
    if (increment == 16) then
        player:allow_buildings{"europeans_store_small", "europeans_store_big", }
    end
    if (increment == 32) then
        player:allow_buildings("all")
        if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
            player:forbid_buildings{"europeans_terraformers_house_basic", "europeans_terraformers_house_normal", "europeans_terraformers_house_advanced", "europeans_warehouse", "europeans_headquarters", }
        else
            player:forbid_buildings{"europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced", "europeans_port", }
        end
    end
    
   -- Experimental actions
    if (increment >= 16) then
        balance_player_warehouse_wares(player)
        balance_player_warehouse_workers(player)
        if increment % 2 == 0 then
            upgrade_random_militarysites(player)
            place_ship_random_ai(player)
        end
    end
end
