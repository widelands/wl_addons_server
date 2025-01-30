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

function place_headquarters(player, startfield)
    local hq = nil
    local radius = 0
    local fields = startfield:region(radius)

    while not hq do
        hq = place_building_in_region(player, "europeans_headquarters", fields)
        radius = radius + 1
        fields = startfield:region(radius)
    end
end

function place_initial_port(player, startfield)
    local hq = nil
    local radius = 2
    local port_fields = {}
    local game = wl.Game()
    local map = game.map
    local port_field = startfield
   
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        while not hq do
            for i, portfield in pairs(map.port_spaces) do
                for j, localfield in pairs(startfield:region(radius)) do
                    if ((localfield.x == portfield.x) and (localfield.y == portfield.y)) then
                        port_field = map:get_field(portfield.x, portfield.y)
                        table.insert(port_fields, port_field)
                    end
                end
            end
            print (player.name, radius, #port_fields)
            if #port_fields > 0 then
                hq = place_building_in_region(player, "europeans_port_big", port_fields)
            else
                radius = radius + 2
            end
        end
    else
        place_headquarters(player, startfield)
    end
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

    local ware_economy = warehouses[1].flag.ware_economy
    local worker_economy = warehouses[1].flag.worker_economy

    for i, worker in ipairs(tribe.workers) do
        if string.find(worker.name, "soldier") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name)) / #warehouses))
            end
        elseif string.find(worker.name, "carrier") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name)) / #warehouses))
            end
        elseif string.find(worker.name, "builder") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name) + 16) / #warehouses))
            end
        elseif string.find(worker.name, "worker") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name) + 8) / #warehouses))
            end
        elseif string.find(worker.name, "basic") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name) + 8) / #warehouses))
            end
        elseif string.find(worker.name, "advanced") then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name) + 4) / #warehouses))
            end
        else
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name) + 4) / #warehouses))
            end
        end
    end

    for i, ware in ipairs(tribe.wares) do
        if (ware:is_construction_material(player.tribe_name)) then
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_wares(ware.name, ((ware_economy:target_quantity(ware.name) + 32) / #warehouses))
            end
        else
            for j, warehouse in ipairs(warehouses) do
                warehouse:set_wares(ware.name, 1)
            end
        end
    end
end

function allow_productionsites_without_input(player)
    local map = wl.Game().map
    local tribe = player.tribe

    for i, tbuilding in ipairs(tribe.buildings) do
        if ((tbuilding.type_name == "productionsite") or (tbuilding.type_name == "trainingsite")) and (#tbuilding.inputs == 0) then
            player:allow_buildings{tbuilding.name}
        end
    end
end

function allow_productionsites_per_input(player)
    local map = wl.Game().map
    local tribe = player.tribe
    local enough_input_wares = false
    
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
    local ware_economy = warehouses[1].flag.ware_economy

    for i, tbuilding in ipairs(tribe.buildings) do
        enough_input_wares = true
        if (tbuilding.type_name == "productionsite") and tbuilding.inputs then
            for k, ware in pairs(tbuilding.inputs) do
                enough_input_wares = enough_input_wares and (player:get_wares(ware.name) >= (1.25 * ware_economy:target_quantity(ware.name)))
            end
        end
        if (tbuilding.type_name == "trainingsite") and tbuilding.inputs then
            for k, ware in pairs(tbuilding.inputs) do
                enough_input_wares = enough_input_wares and (player:get_wares(ware.name) >= (1.10 * ware_economy:target_quantity(ware.name)))
            end
        end
        if ((tbuilding.type_name == "productionsite") or (tbuilding.type_name == "trainingsite")) and enough_input_wares then
            player:allow_buildings{tbuilding.name}
        end
    end
end

function allow_warehouses_per_ware_amount(player)
    local map = wl.Game().map
    local tribe = player.tribe
    local enough_ware_amount = true
    
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
    local ware_economy = warehouses[1].flag.ware_economy

    for k, ware in pairs(tribe.wares) do
        enough_ware_amount = enough_ware_amount and (player:get_wares(ware.name) >= ware_economy:target_quantity(ware.name))
    end
    if (enough_ware_amount) then
        player:allow_buildings{"europeans_warehouse", "europeans_headquarters"}
    end
    local number_shipyard = #player:get_buildings("europeans_shipyard_basic")
    if ((enough_ware_amount) or (number_shipyard > 0)) and ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
        player:allow_buildings{"europeans_port", "europeans_port_big"}
    end
end

function allow_all_militarysites(player)
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "militarysite") then
            player:allow_buildings{building.name}
        end
    end
end

function forbid_all_militarysites(player)
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "militarysite") then
            player:forbid_buildings{building.name}
        end
    end
end

function dismantle_idle_buildings(player)
    local game = wl.Game()

    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if ((tbuilding.type_name == "productionsite") and (building.productivity < 10) and not (building.is_stopped)) then
                building:dismantle(true)
                break
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
        for i, ware in ipairs(tribe.wares) do
            local ware_description = game:get_ware_description(ware.name)
            local is_build_material = ware_description:is_construction_material(tribe.name)

            for j, building in ipairs(warehouses) do
                if (is_build_material) and (building:get_wares(ware.name) < 0.25 * (player:get_wares(ware.name) / #warehouses)) then
                    building:set_warehouse_policies(ware.name, "prefer")
                elseif (building:get_wares(ware.name) < 0.10 * (player:get_wares(ware.name) / #warehouses)) then
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
                if (building:get_workers(worker.name) < 0.50 * (player:get_workers(worker.name) / #warehouses)) then
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
            for j, building in ipairs(warehouses) do
                building:set_warehouse_policies(ware.name, "normal")
            end
        end
        for i, worker in ipairs(tribe.workers) do
            for j, building in ipairs(warehouses) do
                building:set_warehouse_policies(worker.name, "normal")
            end
        end
    end
end

function upgrade_random_militarysites(player)
    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if ((tbuilding.type_name == "militarysite") or (tbuilding.type_name == "trainingsite")) and (tbuilding.enhancement) then
                building:enhance(true)
                break
            end
        end
    end
end

function set_hero_advanced_militarysites(player)
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

    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) and (tribe.port) then
        local random_idx = math.random(map.number_of_port_spaces)
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

function start_stopped_buildings(player)
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

function doing_ai_stuff(player, increment)
    local map = wl.Game().map

    -- Unlocking buildings
    if (increment == 0) then
        player:forbid_buildings("all")
        allow_all_militarysites(player)
        allow_productionsites_without_input(player)
    end
    if (increment >= 2) then
        allow_productionsites_per_input(player)
        allow_warehouses_per_ware_amount(player)
    end

    -- Experimental actions
    if (increment >= 16) then
        dismantle_idle_buildings(player)
        start_stopped_buildings(player)
        upgrade_random_militarysites(player)
        set_hero_advanced_militarysites(player)
    end
end

function doing_ai_stuff_seafaring(player, increment)
    local map = wl.Game().map

    -- Unlocking buildings
    if (increment == 0) then
        player:forbid_buildings("all")
        allow_all_militarysites(player)
        allow_productionsites_without_input(player)
    end
    if (increment >= 2) then
        allow_productionsites_per_input(player)
        allow_warehouses_per_ware_amount(player)
    end

    -- Experimental actions
    if (increment >= 16) and (increment < 288) and (increment % 4 == 0) then
        launch_expeditions(player, {
            {
                europeans_soldier = 8,
                europeans_builder = 6,
                europeans_worker_basic = 6,
                europeans_lumberjack_basic = 4,
                europeans_stonecutter_basic = 4,
                europeans_forester_basic = 4,
            }
        })
        place_port_random_ai(player)
    elseif (increment >= 288) and (increment < 576) and (increment % 4 == 0) then
        place_port_random_ai(player)
    end
    if (increment >= 24) then
        upgrade_random_militarysites(player)
        start_stopped_buildings(player)
        set_hero_advanced_militarysites(player)
    end
    if (increment >= 24) and (increment % 2 == 0) then
        dismantle_idle_buildings(player)
    end
    if (increment >= 48) and (increment % 2 == 0) then
        balance_player_warehouse_wares(player)
        balance_player_warehouse_workers(player)
    end
end
