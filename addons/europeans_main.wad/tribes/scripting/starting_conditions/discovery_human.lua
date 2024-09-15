-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_main.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery (Human Player)",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"Start the game with three ships on the ocean and only a handful of supplies.",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_headquarters"}

    launch_expeditions(player, {
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 4,
            europeans_worker_basic = 8,
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
            europeans_worker_basic = 8,
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
            europeans_worker_basic = 8,
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
    
end
}

pop_textdomain()
return init
