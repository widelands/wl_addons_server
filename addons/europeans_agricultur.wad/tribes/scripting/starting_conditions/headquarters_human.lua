-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_agricultur.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters only.",
    
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
          
    place_building(player, sf.x, sf.y, 0, "europeans_headquarters")
    set_starting_warecount(player)
    
end
}

pop_textdomain()
return init
