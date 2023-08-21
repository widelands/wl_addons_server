-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery",
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
    
    player:forbid_buildings{"europeans_headquarters"}
    player:forbid_buildings{"europeans_terraformers_house_basic", "europeans_terraformers_house_normal", "europeans_terraformers_house_advanced"}

    launch_expeditions(player, {
      {
         water = 16,
         log = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         cloth = 8,
         grout = 8,
         planks = 4,
         brick = 4,
         marble = 4,
         marble_column = 4,
         quartz = 4,
         diamond = 4,
         buckets = 2,
         coin_wood = 16,
         europeans_farmer_basic = 2,
         europeans_lumberjack_basic = 2,
         europeans_stonecutter_basic = 2,
         europeans_forester_basic = 2,
         europeans_carpenter_basic = 1,
         europeans_stonemason_basic = 1,
         europeans_weaver_basic = 1,
         europeans_miner_basic = 2,
         europeans_smith_basic = 1,
         europeans_trainer_basic = 1,
         europeans_trader = 1,
         europeans_builder = 1,
         europeans_soldier = 3,
      },
      {
         water = 16,
         log = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         cloth = 8,
         grout = 8,
         planks = 4,
         brick = 4,
         marble = 4,
         marble_column = 4,
         quartz = 4,
         diamond = 4,
         buckets = 2,
         coin_wood = 16,
         europeans_farmer_basic = 4,
         europeans_lumberjack_basic = 2,
         europeans_stonecutter_basic = 2,
         europeans_carpenter_basic = 1,
         europeans_stonemason_basic = 1,
         europeans_weaver_basic = 1,
         europeans_breeder_basic = 2,
         europeans_trainer_basic = 1,
         europeans_trader = 1,
         europeans_builder = 1,
         europeans_soldier = 3,
      },
      {
         water = 16,
         log = 16,
         reed = 16,
         granite = 16,
         blackwood = 8,
         cloth = 8,
         grout = 8,
         planks = 4,
         brick = 4,
         marble = 4,
         marble_column = 4,
         quartz = 4,
         diamond = 4,
         buckets = 2,
         coin_wood = 16,
         europeans_farmer_basic = 2,
         europeans_lumberjack_basic = 2,
         europeans_stonecutter_basic = 2,
         europeans_geologist = 1,
         europeans_miner_basic = 2,
         europeans_charcoal_burner_basic = 1,
         europeans_smelter_basic = 1,
         europeans_smith_basic = 1,
         europeans_trainer_basic = 1,
         europeans_trader = 1,
         europeans_builder = 1,
         europeans_soldier = 3,
      },
    })
    
end
}

pop_textdomain()
return init
