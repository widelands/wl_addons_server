-- =======================================================================
--           Test script for debugging seafaring (API-safe + Debug)
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"

-- general seafaring settings --
function set_seafaring(player_number, OnOff)
    OnOff = (OnOff ~= false)  -- default = true
    local game = wl.Game()

    local function toggle(player)
        local suffix = (player.tribe.name == "europeans") and "_basic" or ""
        local port_id = player.tribe.port
        local shipyard_id = player.tribe.name .. "_shipyard" .. suffix

        if OnOff then
            player:allow_buildings{port_id, shipyard_id}
            print("Allowed seafaring buildings for player " .. player.number)
        else
            player:forbid_buildings{port_id, shipyard_id}
            print("Forbidden seafaring buildings for player " .. player.number)
        end
    end

    if player_number > 0 then
        toggle(game.players[player_number])
    else
        for _, player in ipairs(game.players) do
            toggle(player)
        end
    end
end

-- Optional capacity manipulation (debug-only)
function set_ship_capacity(player_number, ship_name, capacity)
    local game = wl.Game()
    local player = game.players[player_number]

    if not player.get_ships then
        print("player:get_ships() not available in this Widelands build")
        return
    end

    local ships = player:get_ships()
    for _, ship in pairs(ships) do
        local sname = ship.shipname or "(no name field)"
        if (ship_name == "") or (sname == ship_name) then
            if ship.capacity ~= nil then
                ship.capacity = capacity
                print("Changed ship capacity of " .. sname .. " to " .. capacity)
            else
                print("Ship capacity not accessible")
            end
        end
    end
end

-- Force expedition from a player’s port
function force_expedition(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local ports = player:get_buildings(player.tribe.port)

    if #ports > 0 then
        local port = ports[math.random(#ports)]
        port:start_expedition()
        local pname = port.descr.name or "(unknown port)"
        print("Starting expedition from: " .. pname)
    else
        print("No port found for player " .. player_number)
    end
end

-- Force expedition from map coords
function force_expedition_from_port(startx, starty)
    local game = wl.Game()
    local portfield = game.map:get_field(startx, starty)
    local port = portfield.immovable

    if port and port.start_expedition then
        port:start_expedition()
        local pname = port.descr.name or "(unknown port)"
        print("Starting expedition from: " .. pname)
    else
        print("No valid port at (" .. startx .. "," .. starty .. ")")
    end
end

-- Place ship at coords
function force_ship(startx, starty, player_number, capacity)
    local game = wl.Game()
    local player = game.players[player_number]
    local field = game.map:get_field(startx, starty)

    local ship = player:place_ship(field)
    if ship then
        if ship.capacity ~= nil and capacity then
            ship.capacity = capacity
        end
        print("Placed ship for player " .. player_number)
        return ship
    else
        print("Failed to place ship at (" .. startx .. "," .. starty .. ")")
    end
end

-- Place ship on first available ocean field
function force_ship_random(player_number, capacity)
    local game = wl.Game()
    local oceanfields = game.map:find_ocean_fields(1)

    if #oceanfields == 0 then
        print("No ocean fields available")
        return
    end

    if player_number > 0 then
        local player = game.players[player_number]
        local ship = player:place_ship(oceanfields[1])
        if ship and ship.capacity ~= nil and capacity then
            ship.capacity = capacity
        end
        print("Random ship placed for player " .. player_number)
    else
        for _, player in ipairs(game.players) do
            local ship = player:place_ship(oceanfields[1])
            if ship and ship.capacity ~= nil and capacity then
                ship.capacity = capacity
            end
        end
        print("Random ship placed for all players")
    end
end

-- Remove ship(s) by name
function remove_ship(player_number, ship_name)
    local game = wl.Game()
    local player = game.players[player_number]

    if not player.get_ships then
        print("player:get_ships() not available")
        return
    end

    for _, ship in pairs(player:get_ships()) do
        local sname = ship.shipname or "(no name field)"
        if (ship_name == "") or (sname == ship_name) then
            ship:remove()
            print("Removed ship: " .. sname)
        end
    end
end

pop_textdomain()
