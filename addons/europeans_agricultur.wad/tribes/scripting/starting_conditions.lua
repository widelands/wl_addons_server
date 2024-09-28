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
                warehouse:set_workers(worker.name, ((worker_economy:target_quantity(worker.name) + 24) / #warehouses))
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
        if ((tbuilding.type_name == "productionsite") or (tbuilding.type_name == "trainingsite")) and tbuilding.inputs then
            for k, ware in pairs(tbuilding.inputs) do
                enough_input_wares = enough_input_wares and (player:get_wares(ware.name) >= (16 + ware_economy:target_quantity(ware.name)))
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
    local number_shipyard = #player:get_buildings("europeans_shipyard_advanced")
    if ((enough_ware_amount) or (number_shipyard > 0)) and ((map.allows_seafaring == true) and (map.number_of_port_spaces > 0)) then
        player:allow_buildings{"europeans_port", "europeans_port_big"}
    end
end

function allow_all_militarysites(player)
    if player.tribe.name == "europeans" then
        player:allow_buildings{"europeans_sentry_basic", "europeans_sentry_level_1", "europeans_sentry_level_2", "europeans_sentry_level_3"}
        player:allow_buildings{"europeans_barrier_basic", "europeans_barrier_level_1", "europeans_barrier_level_2", "europeans_barrier_level_3"}
        player:allow_buildings{"europeans_tower_basic", "europeans_tower_level_1", "europeans_tower_level_2", "europeans_tower_level_3"}
        player:allow_buildings{"europeans_castle_basic", "europeans_castle_level_1", "europeans_castle_level_2", "europeans_castle_level_3", "europeans_castle_level_4"}
    end
end

function forbid_all_militarysites(player)
    if player.tribe.name == "europeans" then
        player:forbid_buildings{"europeans_sentry_basic", "europeans_sentry_level_1", "europeans_sentry_level_2", "europeans_sentry_level_3"}
        player:forbid_buildings{"europeans_barrier_basic", "europeans_barrier_level_1", "europeans_barrier_level_2", "europeans_barrier_level_3"}
        player:forbid_buildings{"europeans_tower_basic", "europeans_tower_level_1", "europeans_tower_level_2", "europeans_tower_level_3"}
        player:forbid_buildings{"europeans_castle_basic", "europeans_castle_level_1", "europeans_castle_level_2", "europeans_castle_level_3", "europeans_castle_level_4"}
    end
end

function upgrade_random_militarysites(player)
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
    for i, tbuilding in ipairs(player.tribe.buildings) do
        for j, building in ipairs(player:get_buildings(tbuilding.name)) do
            if (tbuilding.type_name == "militarysite") and (building.soldier_preference) then
                building.soldier_preference = "any"
                building.soldier_preference = "heroes"
            end
        end
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
        player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_quarry_basic", "europeans_well_basic"}
    end
    if (increment >= 2) then
        allow_productionsites_per_input(player)
        allow_warehouses_per_ware_amount(player)
    end

   -- Experimental actions
    if (increment >= 16) then
        start_stopped_buildings(player)
        upgrade_random_militarysites(player)
        set_hero_advanced_militarysites(player)
    end
end
