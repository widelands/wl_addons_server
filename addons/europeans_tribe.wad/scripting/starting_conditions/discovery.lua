-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"Start the game with three ships on the ocean and only a handful of supplies. Not suitable for AI players. Disabled terraforming (diking of water bodies) because of lack of compatibility with seafaring.",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_headquarters", "europeans_warehouse_normal", "europeans_warehouse_advanced"}
    player:forbid_buildings{"europeans_terraformers_house_basic", "europeans_terraformers_house_normal", "europeans_terraformers_house_advanced"}

    launch_expeditions(player, {
      {
         log = 32,
         water = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         felling_ax = 2,
         saw = 4,
         shovel = 2,
         buckets = 4,
         europeans_stonecutter_basic = 2,
         europeans_lumberjack_basic = 2,
         europeans_carpenter_basic = 1,
         europeans_weaver_basic = 1,
         europeans_stonemason_basic = 1,
         europeans_soldier = 2,
      },
      {
         water = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         basket = 6,
         scythe = 6,
         buckets = 6,
         shovel = 2,
         quartz = 7,
         diamond = 7,
         coal = 15,
         europeans_farmer_basic = 6,
         europeans_breeder_basic = 4,
         europeans_soldier = 2,
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
         europeans_miner_basic = 4,
         europeans_smith_basic = 1,
         europeans_trainer_basic = 1,
         europeans_geologist = 1,
         europeans_soldier = 3,
         europeans_trader = 3,
      },
    })
    
end
}

pop_textdomain()
return init
