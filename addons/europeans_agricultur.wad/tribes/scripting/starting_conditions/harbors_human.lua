-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_agricultur.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Harbors",
    -- TRANSLATORS: This is the tooltip for the "Harbors" starting condition
    tooltip = _"Start the game with one port only.",
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
          
    place_initial_port(player, sf)
    set_starting_warecount(player)
    
end
}

pop_textdomain()
return init
