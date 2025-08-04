-- =======================================================================
--           Test script for debugging seafaring
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"

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
        if (ship.shipname == ship_name) or (ship_name == "") then
             ship.capacity = capacity
        end
    end
end

function force_expedition(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    local ports = player:get_buildings(tribe.port)
    local port = ports[math.random(#ports)]

    if port then
        port:start_expedition()
        print ("Starting expedition from: ", port.warehousename)
    end
end

function force_expedition_from_port(startx, starty)
    local game = wl.Game()
    local map = game.map
    local portfield = map:get_field(startx, starty)
    local port = portfield.immovable

    if port then
        port:start_expedition()
        print ("Starting expedition from: ", port.warehousename)
    end
end

function force_ship(startx, starty, player_number, capacity)
    capacity = capacity or 64

    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    local ship = player:place_ship(centerfield)
    ship.capacity = capacity
end

function force_ship_random(player_number, capacity)
    capacity = capacity or 64

    local game = wl.Game()
    local map = game.map
    local oceanfields = map:find_ocean_fields(1)
    local player = nil
    local ship = nil

    if player_number > 0 then
        player = game.players[player_number]
        ship = player:place_ship(oceanfields[1])
        ship.capacity = capacity
    else
        for idx, player in ipairs(game.players) do
            ship = player:place_ship(oceanfields[1])
            ship.capacity = capacity
        end
    end

end

function remove_ship(player_number, ship_name)
    local game = wl.Game()
    local player = game.players[player_number]
    local ships = player:get_ships()

    for i, ship in pairs(ships) do
        if (ship.shipname == ship_name) or (ship_name == "") then
            ship:remove()
        end
    end
end


pop_textdomain()
