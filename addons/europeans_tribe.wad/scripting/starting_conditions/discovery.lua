-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"Start the game with three ships on the ocean and only a handful of supplies. Not suitable for AI players.",
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
         log = 32,
         reed = 16,
         granite = 16,
         blackwood = 8,
         felling_ax = 2,
         saw = 4,
         shovel = 2,
         buckets = 4,
         europeans_soldier = 1,
      },
      {
         water = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         basket = 6,
         scythe = 6,
         milking_tongs = 2,
         buckets = 4,
         shovel = 2,
         quartz = 7,
         diamond = 7,
         coal = 15,
         europeans_soldier = 1,
      },
      {
         water = 16,
         clay = 16,
         granite = 16,
         marble = 12,
         marble_column = 16,
         blackwood = 16,
         reed = 16,
         planks = 8,
         iron = 16,
         ore = 6,
         gold = 4,
         pick = 8,
         shovel = 2,
         buckets = 4,
         fire_tongs = 4,
         hammer = 8,
         saw = 8,
         europeans_smith_basic = 1,
         europeans_trainer_basic = 1,
         europeans_geologist = 1,
         europeans_soldier = 1,
      },
    })
    
end
}

pop_textdomain()
return init
