-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_craft_buildings.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery (Craft Addon)",
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
            granite = 24,
            log = 16,
            reed = 16,
            blackwood = 8,
            cloth = 8,
            grout = 8,
            quartz = 4,
            buckets = 2,
            basket = 2,
            europeans_lumberjack_advanced = 3,
            europeans_forester_advanced = 2,
            europeans_stonecutter_advanced = 2,
            europeans_gardener_advanced = 2,
            europeans_worker_advanced = 6,
            europeans_trainer_advanced = 1,
            europeans_builder = 3,
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
            basket = 2,
            europeans_lumberjack_advanced = 3,
            europeans_forester_advanced = 2,
            europeans_stonecutter_advanced = 2,
            europeans_gardener_advanced = 2,
            europeans_worker_advanced = 6,
            europeans_trainer_advanced = 1,
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
            europeans_worker_advanced = 5,
            europeans_miner_advanced = 6,
            europeans_trainer_advanced = 4,
            europeans_builder = 3,
            europeans_soldier = 4,
        },
    })
    
end
}

pop_textdomain()
return init
