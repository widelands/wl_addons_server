-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_all.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_all.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters with Seafaring",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters only. Enables ports and shipyards and disables dikers.",
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
          
    player:forbid_buildings{"europeans_dikers_house"}
    place_headquarters(player, sf)
    set_starting_warecount(player)
    
end
}

pop_textdomain()
return init
