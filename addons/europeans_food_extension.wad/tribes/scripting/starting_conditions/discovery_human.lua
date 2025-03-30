-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_food_extension.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery",
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
            europeans_worker_advanced = 8,
            europeans_worker_basic = 12,
            log = 40,
            granite = 40,
            planks = 4,
            brick = 4,
            grout = 4,
            marble = 4,
            marble_column = 4
        },
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 8,
            europeans_worker_basic = 12,
            log = 40,
            granite = 40,
            planks = 4,
            brick = 4,
            grout = 4,
            marble = 4,
            marble_column = 4
        },
        {
            europeans_soldier = 4,
            europeans_builder = 4,
            europeans_worker_advanced = 8,
            europeans_worker_basic = 12,
            log = 40,
            granite = 40,
            planks = 4,
            brick = 4,
            grout = 4,
            marble = 4,
            marble_column = 4
        },
    })
    
end
}

pop_textdomain()
return init
