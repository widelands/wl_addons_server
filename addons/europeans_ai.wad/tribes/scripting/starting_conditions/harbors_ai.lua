-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_ai.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_ai.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Harbors (AI optimized)",
    -- TRANSLATORS: This is the tooltip for the "Harbors" starting condition
    tooltip = _"AI optimized starting condition, not for human player.",
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
        player:allow_buildings("all")
    end

    place_initial_port(player, sf)
    set_starting_warecount(player)
    
    -- Delay of 15 min between actions
    local time_min = 30
    for i = 0, 2688 do
        doing_ai_stuff_seafaring (player, i)
               
        sleep(time_min * 60000)
    end
end
}

pop_textdomain()
return init
