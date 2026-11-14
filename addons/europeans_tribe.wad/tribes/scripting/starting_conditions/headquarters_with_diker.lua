-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_all.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_all.wad", true)

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
          
    player:forbid_buildings{"europeans_amazons_port", "europeans_atlanteans_port", "europeans_barbarians_port", "europeans_empire_port", "europeans_frisians_port"}
    player:forbid_buildings{"europeans_shipyard_basic", "europeans_shipyard_level_1", "europeans_shipyard_level_2", "europeans_shipyard_level_3", "europeans_shipyard_level_4"}
    place_headquarters(player, sf)
    set_starting_warecount(player)
    
end
}

pop_textdomain()
return init
