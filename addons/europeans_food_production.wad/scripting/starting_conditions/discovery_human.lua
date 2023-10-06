-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_food_production.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery (Human Player)",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"Start the game with three ships on the ocean and only a handful of supplies. Disabled terraforming (diking of water bodies) because of lack of compatibility with seafaring.",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_headquarters", "europeans_store_big", "europeans_store_small"}
    player:forbid_buildings{"europeans_terraformers_house_basic", "europeans_terraformers_house_normal", "europeans_terraformers_house_advanced"}

    launch_expeditions(player, {
        {
            granite = 24,
            log = 16,
            reed = 16,
            blackwood = 8,
            cloth = 8,
            grout = 8,
            quartz = 4,
            buckets = 2,
            europeans_lumberjack_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_farmer_basic = 4,
            europeans_forester_basic = 2,
            europeans_claydigger_basic = 1,
            europeans_worker_basic = 6,
            europeans_trainer_basic = 1,
            europeans_trader = 1,
            europeans_builder = 1,
            europeans_soldier = 4,
        },
        {
            granite = 24,
            log = 16,
            reed = 16,
            blackwood = 8,
            cloth = 8,
            grout = 8,
            quartz = 4,
            buckets = 2,
            europeans_lumberjack_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_farmer_basic = 4,
            europeans_forester_basic = 2,
            europeans_claydigger_basic = 1,
            europeans_worker_basic = 6,
            europeans_trainer_basic = 1,
            europeans_trader = 1,
            europeans_builder = 1,
            europeans_soldier = 4,
        },
        {
            buckets = 8,
            planks = 8,
            brick = 8,
            marble = 8,
            marble_column = 8,
            quartz = 8,
            diamond = 8,
            coin_wood = 32,
            europeans_farmer_basic = 2,
            europeans_worker_basic = 2,
            europeans_miner_basic = 6,
            europeans_trainer_basic = 4,
            europeans_trader = 3,
            europeans_builder = 3,
            europeans_soldier = 4,
        },
    })
    
end
}

pop_textdomain()
return init
