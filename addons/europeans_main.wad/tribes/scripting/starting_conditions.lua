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
                     place_building(player, portfield.x, portfield.y, 0, portname)
                 end
             end
        end
    end
end

function set_starting_warecount(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    local warehouse_types = {}
    for i, building in ipairs(game:get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
        end
    end
    local warehouses = {}
    for i, building_name in ipairs(warehouse_types) do
        warehouses = array_combine(warehouses, player:get_buildings(building_name))
    end
    
    local general_worker_count = 16 / #warehouses
    local basic_worker_count = 8 / #warehouses
    local normal_worker_count = 8 / #warehouses
    local advanced_worker_count = 8 / #warehouses

    local general_ware_count = 8 / #warehouses
    local build_ware_count = 32 / #warehouses
    local enhancement_ware_count = 32 / #warehouses
    local basic_build_ware_count = 48 / #warehouses

    for i, worker in ipairs(tribe.workers) do
        if string.find(worker.name, "advanced") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, advanced_worker_count)
            end
        elseif string.find(worker.name, "normal") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, normal_worker_count)
            end
        elseif string.find(worker.name, "basic") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, basic_worker_count)
            end
        else
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, general_worker_count)
            end
        end
    end
    
    for i, ware in ipairs(tribe.wares) do
        for j, warehouse in ipairs(warehouses) do
            warehouse:set_wares(ware.name, general_ware_count)
        end
    end
    
    for i, ware in ipairs(tribe.wares) do
        if (ware:is_construction_material(player.tribe_name)) then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_wares(ware.name, build_ware_count)
            end
        end
    end
    for i, tbuilding in ipairs(tribe.buildings) do
        for warename, warecount in pairs(tbuilding.enhancement_cost) do
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_wares(warename, enhancement_ware_count)
            end
        end
    end
    for i, tbuilding in ipairs(tribe.buildings) do
        for warename, warecount in pairs(tbuilding.buildcost) do
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_wares(warename, basic_build_ware_count)
            end
        end
    end
end

function allow_basic_productionsites(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_basic", "europeans_well_level_1"}
        player:allow_buildings{"europeans_coalmine_basic", "europeans_coalmine_level_1"}
        player:allow_buildings{"europeans_ironmine_basic", "europeans_ironmine_level_1"}
        player:allow_buildings{"europeans_goldmine_basic", "europeans_goldmine_level_1"}
        player:allow_buildings{"europeans_quarry_basic", "europeans_lumberjacks_house_basic", "europeans_tree_nursery_basic"}
        player:allow_buildings{"europeans_sawmill_basic", "europeans_stonemasons_house_basic"}
        player:allow_buildings{"europeans_charcoal_kiln_basic", "europeans_smelting_works_basic", "europeans_manufactory_basic"}
    end
end

function forbid_basic_productionsites(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_basic", "europeans_well_level_1",}
        player:forbid_buildings{"europeans_coalmine_basic", "europeans_coalmine_level_1"}
        player:forbid_buildings{"europeans_ironmine_basic", "europeans_ironmine_level_1"}
        player:forbid_buildings{"europeans_goldmine_basic", "europeans_goldmine_level_1"}
        player:forbid_buildings{"europeans_quarry_basic", "europeans_lumberjacks_house_basic", "europeans_tree_nursery_basic"}
        player:forbid_buildings{"europeans_sawmill_basic", "europeans_stonemasons_house_basic"}
        player:forbid_buildings{"europeans_charcoal_kiln_basic", "europeans_smelting_works_basic", "europeans_manufactory_basic"}
    end
end

function allow_normal_productionsites(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_2","europeans_well_level_3"}
        player:allow_buildings{"europeans_coalmine_level_2", "europeans_coalmine_level_3"}
        player:allow_buildings{"europeans_ironmine_level_2", "europeans_ironmine_level_3"}
        player:allow_buildings{"europeans_goldmine_level_2", "europeans_goldmine_level_3"}
        player:allow_buildings{"europeans_quarry_normal", "europeans_lumberjacks_house_normal", "europeans_tree_nursery_normal"}
        player:allow_buildings{"europeans_sawmill_normal", "europeans_stonemasons_house_normal"}
        player:allow_buildings{"europeans_charcoal_kiln_normal", "europeans_smelting_works_normal", "europeans_manufactory_normal"}
    end
end

function forbid_normal_productionsites(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_2","europeans_well_level_3"}
        player:forbid_buildings{"europeans_coalmine_level_2", "europeans_coalmine_level_3"}
        player:forbid_buildings{"europeans_ironmine_level_2", "europeans_ironmine_level_3"}
        player:forbid_buildings{"europeans_goldmine_level_2", "europeans_goldmine_level_3"}
        player:forbid_buildings{"europeans_quarry_normal", "europeans_lumberjacks_house_normal", "europeans_tree_nursery_normal"}
        player:forbid_buildings{"europeans_sawmill_normal", "europeans_stonemasons_house_normal"}
        player:forbid_buildings{"europeans_charcoal_kiln_normal", "europeans_smelting_works_normal", "europeans_manufactory_normal"}
    end
end

function allow_advanced_productionsites(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6"}
        player:allow_buildings{"europeans_coalmine_level_4", "europeans_coalmine_level_5"}
        player:allow_buildings{"europeans_ironmine_level_4", "europeans_ironmine_level_5"}
        player:allow_buildings{"europeans_goldmine_level_4", "europeans_goldmine_level_5"}
        player:allow_buildings{"europeans_quarry_advanced", "europeans_lumberjacks_house_advanced", "europeans_tree_nursery_advanced"}
        player:allow_buildings{"europeans_sawmill_advanced", "europeans_stonemasons_house_advanced"}
        player:allow_buildings{"europeans_charcoal_kiln_advanced", "europeans_smelting_works_advanced", "europeans_manufactory_advanced"}
    end
end

function forbid_advanced_productionsites(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6"}
        player:forbid_buildings{"europeans_coalmine_level_4", "europeans_coalmine_level_5"}
        player:forbid_buildings{"europeans_ironmine_level_4", "europeans_ironmine_level_5"}
        player:forbid_buildings{"europeans_goldmine_level_4", "europeans_goldmine_level_5"}
        player:forbid_buildings{"europeans_quarry_advanced", "europeans_lumberjacks_house_advanced", "europeans_tree_nursery_advanced"}
        player:forbid_buildings{"europeans_sawmill_advanced", "europeans_stonemasons_house_advanced"}
        player:forbid_buildings{"europeans_charcoal_kiln_advanced", "europeans_smelting_works_advanced", "europeans_manufactory_advanced"}
    end
end

function allow_warehouses(player)
    local game = wl.Game()
    local map = wl.Game().map
    local tribe = player.tribe

    if ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
        player:allow_buildings{"europeans_port", }
    else
        player:allow_buildings{"europeans_warehouse", "europeans_headquarters"}
    end
end

function forbid_warehouses(player)
    local game = wl.Game()
    local map = wl.Game().map
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_warehouse", "europeans_headquarters", "europeans_port"}
    end
end

function allow_militarysites(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_sentry_basic", "europeans_sentry_level_1", "europeans_sentry_level_2", "europeans_sentry_level_3"}
        player:allow_buildings{"europeans_barrier_basic", "europeans_barrier_level_1", "europeans_barrier_level_2", "europeans_barrier_level_3"}
        player:allow_buildings{"europeans_tower_basic", "europeans_tower_level_1", "europeans_tower_level_2", "europeans_tower_level_3"}
        player:allow_buildings{"europeans_castle_basic", "europeans_castle_level_1", "europeans_castle_level_2", "europeans_castle_level_3", "europeans_castle_level_4"}
    end
end

function forbid_militarysites(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_sentry_basic", "europeans_sentry_level_1", "europeans_sentry_level_2", "europeans_sentry_level_3"}
        player:forbid_buildings{"europeans_barrier_basic", "europeans_barrier_level_1", "europeans_barrier_level_2", "europeans_barrier_level_3"}
        player:forbid_buildings{"europeans_tower_basic", "europeans_tower_level_1", "europeans_tower_level_2", "europeans_tower_level_3"}
        player:forbid_buildings{"europeans_castle_basic", "europeans_castle_level_1", "europeans_castle_level_2", "europeans_castle_level_3", "europeans_castle_level_4"}
    end
end

function allow_barracks(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_normal", "europeans_trainingscamp_advanced"}
    end
end

function forbid_barracks(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_normal", "europeans_trainingscamp_advanced"}
    end
end

function allow_scout(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_scouts_house_basic", "europeans_scouts_house_normal", "europeans_scouts_house_advanced"}
    end
end

function forbid_scout(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_scouts_house_basic", "europeans_scouts_house_normal", "europeans_scouts_house_advanced"}
    end
end

function allow_shipyard(player)
    local game = wl.Game()
    local map = wl.Game().map
    local tribe = player.tribe

    if tribe.name == "europeans" and ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
        player:allow_buildings{"europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
    end
end

function forbid_shipyard(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
    end
end

function allow_ferry_yard(player)
    local game = wl.Game()
    local map = wl.Game().map
    local tribe = player.tribe

    if tribe.name == "europeans" and (map.waterway_max_length > 0) then
        player:allow_buildings{"europeans_ferry_yard_basic", "europeans_ferry_yard_normal", "europeans_ferry_yard_advanced"}
    end
end

function forbid_ferry_yard(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_ferry_yard_basic", "europeans_ferry_yard_normal", "europeans_ferry_yard_advanced"}
    end
end

function forbid_trainingssites(player)
    local game = wl.Game()
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_battlearena_basic", "europeans_battlearena_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_3"}
    end
end

function allow_trainingssites(player)
    local game = wl.Game()
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_battlearena_basic", "europeans_battlearena_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_3"}
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
        for i, ware in ipairs(tribe.wares) do
            local ware_description = game:get_ware_description(ware.name)
            local is_build_material = ware_description:is_construction_material(tribe.name)

            for j, building in ipairs(warehouses) do
                if (is_build_material) and (building:get_wares(ware.name) < 0.90 * (player:get_wares(ware.name) / #warehouses)) then
                    building:set_warehouse_policies(ware.name, "prefer")
                elseif (building:get_wares(ware.name) < 0.80 * (player:get_wares(ware.name) / #warehouses)) then
                    building:set_warehouse_policies(ware.name, "prefer")
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
    
    if #warehouses > 1 then
        for i, worker in ipairs(tribe.workers) do
            local worker_description = game:get_worker_description(worker.name)

            for j, building in ipairs(warehouses) do
                if (building:get_workers(worker.name) < 0.90 * (player:get_workers(worker.name) / #warehouses)) then
                    building:set_warehouse_policies(worker.name, "prefer")
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

function start_stopped_buildings(player)
    local game = wl.Game()

    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if (tbuilding.type_name == "productionsite") and (building.is_stopped == true) then
                building:toggle_start_stop()
            end
            if (tbuilding.type_name == "trainingsite") and (building.is_stopped == true) then
                building:toggle_start_stop()
            end
        end
    end
end

function upgrade_random_trainingsite(player)
    local game = wl.Game()

    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if (tbuilding.type_name == "trainingsite") and (tbuilding.enhancement) then
                building:enhance(true)
                break
            end
        end
    end
end

function upgrade_random_militarysites(player)
    local game = wl.Game()

    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if (tbuilding.type_name == "militarysite") and (tbuilding.enhancement) then
                building:enhance(true)
                break
            end
        end
    end
end

function set_hero_advanced_militarysites(player)
    local game = wl.Game()

    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if (tbuilding.type_name == "militarysite") and (building.soldier_preference) then
                building.soldier_preference = "any"
                building.soldier_preference = "heroes"
            end
        end
    end
end

function place_port_random_ai(player)
    local game = wl.Game()
    local map = game.map
    local tribe = player.tribe
    local random_idx = math.random(map.number_of_port_spaces)
    
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) and (tribe.port) then
        for i, portfield in pairs(map.port_spaces) do
            local field = map:get_field(portfield.x, portfield.y)
            if (i >= random_idx-1) and (field.owner == player) and (field.brn.owner == player) then
                if not (field.immovable) or ((field.immovable) and not ((field.immovable.descr.type_name == "constructionsite") or (field.immovable.descr.type_name == "warehouse"))) then
                    player:place_building(tribe.port, field, true, true)
                    break
                end
            end
        end
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
        player:allow_buildings{"europeans_sentry_basic", "europeans_tower_basic", "europeans_barrier_basic", "europeans_castle_basic", }
        player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_quarry_basic", "europeans_tree_nursery_basic", }
        player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", }
    end
    if (increment == 2) then
        allow_basic_productionsites(player)
        player:allow_buildings{"europeans_trainingscamp_basic", "europeans_battlearena_basic", }
    end
    if (increment == 4) then
        allow_warehouses(player)
    end
    if (increment == 16) then
        allow_normal_productionsites(player)
        player:allow_buildings{"europeans_trainingscamp_normal", "europeans_battlearena_level_1", }
    end
    if (increment == 32) then
        allow_advanced_productionsites(player)
        allow_barracks(player)
        allow_scout(player)
        allow_shipyard(player)
        allow_militarysites(player)
        allow_trainingssites(player)
    end
    
    -- Experimental actions
    if (increment >= 48) then
        start_stopped_buildings(player)
        balance_player_warehouse_wares(player)
        balance_player_warehouse_workers(player)
        set_hero_advanced_militarysites(player)
        if increment % 2 == 0 then
            upgrade_random_militarysites(player)
            place_port_random_ai(player)
            place_ship_random_ai(player)
        end
        if increment % 8 == 0 then
            upgrade_random_trainingsite(player)
        end
    end
end

function doing_ai_stuff_seafaring(player, increment)
    local map = wl.Game().map
    
    if (increment == 0) then
        player:forbid_buildings("all")
        player:allow_buildings{"europeans_sentry_basic", "europeans_tower_basic", "europeans_barrier_basic", "europeans_castle_basic", }
        player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_quarry_basic", "europeans_tree_nursery_basic", }
        player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", }
    end
    if (increment == 2) then
        player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
        player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
        player:allow_buildings{"europeans_charcoal_kiln_basic", "europeans_smelting_works_basic", }

    end
    if (increment == 4) then
        allow_warehouses(player)
        allow_basic_productionsites(player)
        player:allow_buildings{"europeans_trainingscamp_basic", "europeans_battlearena_basic", }
    end
    if (increment == 16) then
        allow_normal_productionsites(player)
        player:allow_buildings{"europeans_trainingscamp_normal", "europeans_battlearena_level_1", }
    end
    if (increment == 32) then
        allow_advanced_productionsites(player)
        allow_shipyard(player)
        allow_militarysites(player)
        allow_trainingssites(player)
    end
    
    -- Experimental actions
    if (increment >= 32) and (increment < 288) and (increment % 8 == 0) then
        launch_expeditions(player, {
            {
                europeans_soldier = 8,
                europeans_builder = 6,
                europeans_worker_basic = 4,
                europeans_lumberjack_basic = 4,
                europeans_stonecutter_basic = 4,
                europeans_forester_basic = 4,
                europeans_trainer_basic = 2,
            }
        })
        place_port_random_ai(player)
    elseif (increment >= 288) and (increment < 576) and (increment % 8 == 0) then
        place_port_random_ai(player)
    end
    if (increment >= 48) then
        player:allow_buildings{"europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced", }
        start_stopped_buildings(player)
        balance_player_warehouse_wares(player)
        balance_player_warehouse_workers(player)
        set_hero_advanced_militarysites(player)
        if increment % 2 == 0 then
            upgrade_random_militarysites(player)
        end
        if increment % 8 == 0 then
            upgrade_random_trainingsite(player)
        end
    end
end
