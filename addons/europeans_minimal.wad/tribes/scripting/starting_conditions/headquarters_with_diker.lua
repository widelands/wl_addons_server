-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters with Diker",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters only. Enables dikers and disables ports and shipyards.",
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
          
    player:forbid_buildings{"europeans_port", "europeans_port_big"}
    player:forbid_buildings{"europeans_shipyard_basic", "europeans_shipyard_advanced"}
    place_headquarters(player, sf)
    set_starting_warecount(player)
    
end
}

pop_textdomain()
return init
