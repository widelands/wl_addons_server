-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_ai.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_ai.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery (AI optimized)",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"AI optimized starting condition, not for human player.",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
    
    launch_expeditions(player, {
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 8,
            europeans_worker_basic = 12,
            log = 24,
            granite = 24,
            reed = 24,
            planks = 4,
            brick = 4,
            grout = 4,
            marble = 4,
            marble_column = 4,
            quartz = 4,
            diamond = 4,
        },
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 8,
            europeans_worker_basic = 12,
            log = 24,
            granite = 24,
            reed = 24,
            planks = 4,
            brick = 4,
            grout = 4,
            marble = 4,
            marble_column = 4,
            quartz = 4,
            diamond = 4,
        },
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 8,
            europeans_worker_basic = 12,
            log = 24,
            granite = 24,
            reed = 24,
            planks = 4,
            brick = 4,
            grout = 4,
            marble = 4,
            marble_column = 4,
            quartz = 4,
            diamond = 4,
        },
    })
    
    -- Delay of 15 min between actions
    local time_min = 30
    for i = 0, 2688 do
        doing_ai_stuff_seafaring (player, i)        
        sleep(time_min * 60000)
    end
    reset_player_warehouse_policy(player)
end
}

pop_textdomain()
return init
