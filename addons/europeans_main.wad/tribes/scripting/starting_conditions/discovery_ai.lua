-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_main.wad/tribes/scripting/starting_conditions.lua"
include "addons/europeans_main.wad/tribes/scripting/debug_europeans.lua"

push_textdomain("europeans_tribe.wad", true)

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
            europeans_worker_advanced = 4,
            europeans_worker_normal = 4,
            europeans_worker_basic = 4,
            europeans_stonecutter_basic = 4,
            europeans_lumberjack_basic = 3,
            europeans_forester_basic = 3,
            europeans_trainer_basic = 2,
            buckets = 8,
            basket = 8,
            log = 12,
            granite = 12,
            blackwood = 8,
            grout = 8,
            planks = 8,
            brick = 8,
            quartz = 8,
            marble = 8,
            diamond = 4,
            marble_column = 4
        },
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 4,
            europeans_worker_normal = 4,
            europeans_worker_basic = 4,
            europeans_stonecutter_basic = 4,
            europeans_lumberjack_basic = 3,
            europeans_forester_basic = 3,
            europeans_trainer_basic = 2,
            buckets = 8,
            basket = 8,
            log = 12,
            granite = 12,
            blackwood = 8,
            grout = 8,
            planks = 8,
            brick = 8,
            quartz = 8,
            marble = 8,
            diamond = 4,
            marble_column = 4
        },
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 4,
            europeans_worker_normal = 4,
            europeans_worker_basic = 4,
            europeans_stonecutter_basic = 4,
            europeans_lumberjack_basic = 3,
            europeans_forester_basic = 3,
            europeans_trainer_basic = 2,
            buckets = 8,
            basket = 8,
            log = 12,
            granite = 12,
            blackwood = 8,
            grout = 8,
            planks = 8,
            brick = 8,
            quartz = 8,
            marble = 8,
            diamond = 4,
            marble_column = 4
        },
    })
    
    -- Delay of 15 min between actions
    local time_min = 15
    for i = 0, 2688 do
        doing_ai_stuff_seafaring (player, i)        
        sleep(time_min * 60000)
    end
    reset_player_warehouse_policy(player)
end
}

pop_textdomain()
return init
