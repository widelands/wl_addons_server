-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

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
            granite = 32,
            log = 32,
            reed = 32,
            blackwood = 16,
            cloth = 16,
            grout = 16,
            quartz = 8,
            buckets = 4,
            basket = 4,
            europeans_lumberjack_advanced = 3,
            europeans_forester_advanced = 2,
            europeans_stonecutter_advanced = 2,
            europeans_gardener_advanced = 2,
            europeans_worker_advanced = 6,
            europeans_trader = 2,
            europeans_builder = 3,
            europeans_soldier = 4,
        },
        {
            granite = 32,
            log = 32,
            reed = 32,
            blackwood = 16,
            cloth = 16,
            grout = 16,
            quartz = 8,
            buckets = 4,
            basket = 4,
            europeans_lumberjack_advanced = 3,
            europeans_forester_advanced = 2,
            europeans_stonecutter_advanced = 2,
            europeans_gardener_advanced = 2,
            europeans_worker_advanced = 6,
            europeans_trader = 2,
            europeans_builder = 3,
            europeans_soldier = 4,
        },
        {
            basket = 8,
            buckets = 8,
            planks = 8,
            brick = 8,
            marble = 8,
            marble_column = 8,
            quartz = 8,
            diamond = 8,
            coin_wood = 32,
            coin_copper = 16,
            coin_silver = 8,
            coin_gold = 8,
            europeans_worker_advanced = 6,
            europeans_miner_advanced = 6,
            europeans_trainer_advanced = 4,
            europeans_trader = 2,
            europeans_builder = 2,
            europeans_soldier = 2,
        },
    })
    
    -- Delay of 15 min between actions
    local time_min = 15
    for i = 0, 2688 do
        doing_ai_stuff (player, i)
        
        if (i > 16) and (i <= 1344) and (i % 24 == 0) then
            launch_expeditions(player, {
                {
                     log = 8,
                     reed = 8,
                     granite = 8,
                     blackwood = 8,
                     cloth = 8,
                     grout = 8,
                     quartz = 4,
                     planks = 4,
                     brick = 4,
                     marble = 4,
                     marble_column = 4,
                     diamond = 4,
                     europeans_lumberjack_basic = 2,
                     europeans_forester_basic = 1,
                     europeans_stonecutter_basic = 1,
                     europeans_gardener_basic = 1,
                     europeans_miner_basic = 2,
                     europeans_worker_basic = 2,
                     europeans_trainer_basic = 2,
                     europeans_trader = 2,
                     europeans_builder = 2,
                     europeans_soldier = 8
                }
            })
        elseif (i > 16) and (i <= 1344) and (i % 24 == 12) then
            place_ship_random(player, 64)
        end
        
        sleep(time_min * 60000)
    end
    reset_player_warehouse_policy(player)
end
}

pop_textdomain()
return init
