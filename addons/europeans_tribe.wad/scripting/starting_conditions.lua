include "scripting/coroutine.lua"
include "scripting/ui.lua"
include "scripting/infrastructure.lua"

-- RST
-- starting_conditions.lua
-- -----------------------
--
-- This script contains some convenience functions intended mainly for use
-- in the Discovery and New World starting conditions.
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

function set_ship_capacity(player, ship_name, capacity)
    local ships = player:get_ships()
    
    for i, ship in pairs(ships) do
        -- print(i, ship.shipname)
        if (ship.shipname == ship_name) or (ship_name == "") then
            ship.capacity = capacity
        end
    end
end

function allow_building(player, bld_name)
    if bld_name == "all" then
        player:allow_buildings(bld_name)
    else
        player:allow_buildings{bld_name}
    end
end

function forbid_building(player, bld_name)
    if bld_name == "all" then
        player:forbid_buildings(bld_name)
    else
        player:forbid_buildings{bld_name}
    end
end

function allow_worker(player, wrk_name)
    if wrk_name == "all" then
        player:allow_workers(wrk_name)
    else
        player:allow_workers{wrk_name}
    end
end

function forbid_worker(player, wrk_name)
    if wrk_name == "all" then
        player:forbid_workers(wrk_name)
    else
        player:forbid_workers{wrk_name}
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

function place_building(player, startx, starty, radius, buildingname)
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    place_building_in_region(player, buildingname, fields)
end

function place_headquarters(player, startx, starty)
    local tribe = player.tribe
    local hqname = tribe.name .. "_headquarters"

    place_building(player, startx, starty, 1, hqname)
end

function place_port(player, startx, starty, radius)
    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    local tribe = player.tribe
    local portname = tribe.name .. "_port"
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

function warehouse_worker_policy(startx, starty, workername, policiename)
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

function warehouse_ware_policy(startx, starty, warename, policiename)
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

function warehouse_ware_count(startx, starty, warename, warecount)
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
        warehouse_ware_policy(startx, starty, ware.name, "remove")
    end
end

function set_warehouse_dontstock_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        warehouse_ware_policy(startx, starty, ware.name, "dontstock")
    end
end

function set_warehouse_prefer_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        warehouse_ware_policy(startx, starty, ware.name, "prefer")
    end
end

function reset_warehouse_policy(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    
    for i, ware in ipairs(tribe.wares) do
        warehouse_ware_policy(startx, starty, ware.name, "normal")
    end
end

function set_ware(player, warename, warecount)
    local tribe = player.tribe

    for i, building in ipairs(tribe.buildings) do
       -- restock warehouses
       if building.type_name == "warehouse" then
            for i, building in ipairs(player:get_buildings(building.name)) do
                  building:set_wares(warename, warecount)
            end
       end
    end
end
