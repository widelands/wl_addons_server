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
    local ports = player:get_buildings(tribe.name .. "_port")
    
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
   while #fields > 0 do
      local idx = math.random(#fields)
      local f = fields[idx]

      place_object(f.x, f.y, "europeans_trade_pole")
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
    
    for i, ware in ipairs(tribe.wares) do
        local ware_description = game:get_ware_description(ware.name)
        local is_build_material = ware_description:is_construction_material(tribe.name)
        for k, building in ipairs(player:get_buildings("europeans_headquarters")) do
            if (building:get_wares(ware.name) > (player:get_wares(ware.name) * 0.9)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * 8)) then
                building:set_warehouse_policies(ware.name, "remove")
            elseif (building:get_wares(ware.name) > (player:get_wares(ware.name) * 0.5)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * 2)) then
                building:set_warehouse_policies(ware.name, "dontstock")
            elseif (building:get_wares(ware.name) < building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name)) and (is_build_material == true) then
                building:set_warehouse_policies(ware.name, "prefer")
            else
                building:set_warehouse_policies(ware.name, "normal")
            end
        end
        for k, building in ipairs(player:get_buildings("europeans_warehouse")) do
            if (building:get_wares(ware.name) > (player:get_wares(ware.name) * 0.9)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * 8)) then
                building:set_warehouse_policies(ware.name, "remove")
            elseif (building:get_wares(ware.name) > (player:get_wares(ware.name) * 0.5)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * 2)) then
                building:set_warehouse_policies(ware.name, "dontstock")
            elseif (building:get_wares(ware.name) < building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name)) and (is_build_material == true) then
                building:set_warehouse_policies(ware.name, "prefer")
            else
                building:set_warehouse_policies(ware.name, "normal")
            end
        end
        for k, building in ipairs(player:get_buildings("europeans_port")) do
            if (building:get_wares(ware.name) > (player:get_wares(ware.name) * 0.9)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * 8)) then
                building:set_warehouse_policies(ware.name, "remove")
            elseif (building:get_wares(ware.name) > (player:get_wares(ware.name) * 0.5)) and (player:get_wares(ware.name) > (building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name) * 2)) then
                building:set_warehouse_policies(ware.name, "dontstock")
            elseif (building:get_wares(ware.name) < building.fields[1].brn.immovable.ware_economy:target_quantity(ware.name)) and (is_build_material == true) then
                building:set_warehouse_policies(ware.name, "prefer")
            else
                building:set_warehouse_policies(ware.name, "normal")
            end
        end
    end
end

function balance_player_warehouse_workers(player)
    local game = wl.Game()
    local map = game.map
    local tribe = player.tribe
    
    for i, worker in ipairs(tribe.workers) do
        for k, building in ipairs(player:get_buildings("europeans_headquarters")) do
            if (building:get_workers(worker.name) > (player:get_workers(worker.name) * 0.9)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * 8)) then
                building:set_warehouse_policies(worker.name, "dontstock")
            elseif (building:get_workers(worker.name) > (player:get_workers(worker.name) * 0.5)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * 2)) then
                building:set_warehouse_policies(worker.name, "dontstock")
            else
                building:set_warehouse_policies(worker.name, "normal")
            end
        end
        for k, building in ipairs(player:get_buildings("europeans_warehouse")) do
            if (building:get_workers(worker.name) > (player:get_workers(worker.name) * 0.9)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * 8)) then
                building:set_warehouse_policies(worker.name, "dontstock")
            elseif (building:get_workers(worker.name) > (player:get_workers(worker.name) * 0.5)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * 2)) then
                building:set_warehouse_policies(worker.name, "dontstock")
            else
                building:set_warehouse_policies(worker.name, "normal")
            end
        end
        for k, building in ipairs(player:get_buildings("europeans_port")) do
            if (building:get_workers(worker.name) > (player:get_workers(worker.name) * 0.9)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * 8)) then
                building:set_warehouse_policies(worker.name, "dontstock")
            elseif (building:get_workers(worker.name) > (player:get_workers(worker.name) * 0.5)) and (player:get_workers(worker.name) > (building.fields[1].brn.immovable.worker_economy:target_quantity(worker.name) * 2)) then
                building:set_warehouse_policies(worker.name, "dontstock")
            else
                building:set_warehouse_policies(worker.name, "normal")
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

function change_idle_stopped_buildings(player, productivity_threshold)
    local game = wl.Game()
    N = (get_build_id():find("1.0") ~= 1)

    for i, tbuilding in ipairs(player.tribe.buildings) do
       for j, building in ipairs(player:get_buildings(tbuilding.name)) do
          if tbuilding.type_name == "productionsite" and (building.productivity < productivity_threshold or building.is_stopped == true) then
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

function doing_ai_stuff(player, increment)
    local map = wl.Game().map
    
    if (increment == 0) then
        player:forbid_buildings("all")
        player:allow_buildings{"europeans_guardhouse", "europeans_tower", "europeans_barrier", "europeans_castle", }
        player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_quarry_basic", }
        player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", "europeans_farm_medium_basic", }
        player:allow_buildings{"europeans_clay_pit_basic", "europeans_foresters_house_basic", }
    end
    if (increment == 2) then
        player:allow_buildings{"europeans_sawmill_basic", "europeans_weaving_mill_basic", } 
        player:allow_buildings{"europeans_charcoal_kiln_basic", "europeans_stonemasons_house_basic", }
    end
    if (increment == 4) then
        player:allow_buildings{"europeans_market_small", }
    end
    if (increment == 6) then
        player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
        player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
    end
    if (increment == 8) then
        player:allow_buildings{"europeans_smelting_works_basic", "europeans_toolsmithy_basic", "europeans_shoemakers_house_basic", "europeans_tailors_house_basic", "europeans_weaponsmithy_basic", }
        player:allow_buildings{"europeans_scouts_house_basic", "europeans_recruitement_center_basic", "europeans_trainingscamp_basic", "europeans_battlearena_basic", }
        player:allow_buildings{"europeans_market_big", }
    end
    if (increment == 10) then
        player:allow_buildings{"europeans_lumberjacks_house_normal", "europeans_quarry_normal", }
        player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", "europeans_farm_medium_normal", }
        player:allow_buildings{"europeans_clay_pit_normal", "europeans_foresters_house_normal", }
        player:allow_buildings{"europeans_sawmill_normal", "europeans_weaving_mill_normal", }
        player:allow_buildings{"europeans_charcoal_kiln_normal", "europeans_stonemasons_house_normal", }
    end
    if (increment == 12) then
        player:allow_buildings{"europeans_coalmine_level_2", "europeans_ironmine_level_2", "europeans_goldmine_level_2", }
        player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", }
        player:allow_buildings{"europeans_smelting_works_normal", "europeans_toolsmithy_normal", "europeans_scouts_house_normal", "europeans_recruitement_center_normal", }
        player:allow_buildings{"europeans_shoemakers_house_normal", "europeans_tailors_house_normal", "europeans_weaponsmithy_normal", "europeans_trainingscamp_normal", "europeans_battlearena_level_1", }
    end
    if (increment == 14) then
        player:allow_buildings{"europeans_lumberjacks_house_advanced", "europeans_quarry_advanced", }
        player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6", "europeans_farm_medium_advanced", }
        player:allow_buildings{"europeans_clay_pit_advanced", "europeans_foresters_house_advanced", }
        player:allow_buildings{"europeans_sawmill_advanced", "europeans_weaving_mill_advanced", }
        player:allow_buildings{"europeans_charcoal_kiln_advanced", "europeans_stonemasons_house_advanced", }
    end
    if (increment == 16) then        
        player:allow_buildings{"europeans_coalmine_level_4", "europeans_ironmine_level_4", "europeans_goldmine_level_4", }
        player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", }
        player:allow_buildings{"europeans_smelting_works_advanced", "europeans_toolsmithy_advanced", "europeans_recruitement_center_advanced", }
        player:allow_buildings{"europeans_shoemakers_house_advanced", "europeans_tailors_house_advanced", "europeans_weaponsmithy_advanced", "europeans_trainingscamp_advanced", "europeans_battlearena_level_2", "europeans_battlearena_level_3", }
        player:allow_buildings{"europeans_scouts_house_advanced", "europeans_trading_post", }
        player:allow_buildings{"europeans_store_small", "europeans_store_big", }
    end
    
    if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (increment == 0) then
        player:allow_buildings{"europeans_port", }
    end
    
    if (map.waterway_max_length > 0) and (increment == 8) then
        player:allow_buildings{"europeans_ferry_yard_basic", }
    end
    if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (increment == 8) then
        player:allow_buildings{"europeans_shipyard_basic", }
        place_ship_random(player, 64)
    elseif (increment == 8) then
        player:allow_buildings{"europeans_warehouse", "europeans_terraformers_house_basic", }
    end
    
    if (map.waterway_max_length > 0) and (increment == 12) then
        player:allow_buildings{"europeans_ferry_yard_normal", }
    end
    if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (increment == 12) then
        player:allow_buildings{"europeans_shipyard_normal", }
        place_ship_random(player, 64)
    elseif (increment == 8) then
        player:allow_buildings{"europeans_terraformers_house_normal", }
    end
    
    if (map.waterway_max_length > 0) and (increment == 12) then
        player:allow_buildings{"europeans_ferry_yard_advanced", }
    end
    if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) and (increment == 16) then
        player:allow_buildings{"europeans_shipyard_advanced", }
        place_ship_random(player, 64)
    elseif (increment == 16) then
        player:allow_buildings{"europeans_headquarters", "europeans_terraformers_house_advanced", }
    end

    if (increment == 16) then
        player:allow_buildings{"europeans_tower_small", "europeans_tower_high", "europeans_outpost", "europeans_fortress", }
        player:allow_buildings{"europeans_sentry", "europeans_advanced_tower", "europeans_advanced_barrier", "europeans_advanced_castle", }
    end
    
   -- Experimental actions
    if (increment >= 16) and (increment % 8 < 4) then
        balance_player_warehouse_wares(player)
        balance_player_warehouse_workers(player)
    else
        reset_player_warehouse_policy(player)
    end
    
    if (increment >= 16) and (increment % 4 == 0) then
        for j, building in ipairs(player:get_buildings("europeans_guardhouse")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
        for j, building in ipairs(player:get_buildings("europeans_castle")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
    elseif (increment >= 16) and (increment % 4 == 1) then
        for j, building in ipairs(player:get_buildings("europeans_barrier")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
        for j, building in ipairs(player:get_buildings("europeans_tower")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
    elseif (increment >= 16) and (increment % 4 == 2) then
        for j, building in ipairs(player:get_buildings("europeans_tower_small")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
        for j, building in ipairs(player:get_buildings("europeans_fortress")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
    elseif (increment >= 16) and (increment % 4 == 3) then
        for j, building in ipairs(player:get_buildings("europeans_tower_high")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
        for j, building in ipairs(player:get_buildings("europeans_outpost")) do
            if (j == 1) then
                building:enhance(true)
            end
        end
    end
end
