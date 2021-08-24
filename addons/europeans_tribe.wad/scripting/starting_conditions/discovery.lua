-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"Start the game with three ships on the ocean and only a handful of supplies",
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
         europeans_lumberjack_basic = 3,
         europeans_forester_basic = 2,
         europeans_carpenter_basic = 1,
         europeans_soldier = 1,
      },
      {
         water = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         europeans_farmer_basic = 6,
         europeans_weaver_basic = 1,
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
         iron = 6,
         ore = 6,
         gold = 4,
         europeans_stonecutter_basic = 2,
         europeans_stonemason_normal = 2,
         europeans_trainer_basic = 1,
         europeans_geologist = 1,
         europeans_miner_basic = 4,
         europeans_smelter_basic = 2,
         europeans_smith_basic = 2,
         europeans_soldier = 1,
      },
    })
    
end
}

pop_textdomain()
return init
