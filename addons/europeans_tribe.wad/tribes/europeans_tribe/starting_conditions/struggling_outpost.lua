-- =======================================================================
--                Hardcore Starting conditions for europeans
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug.lua"

push_textdomain("europeans_tribe.wad", true)

local r = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Struggling Outpost",
   -- TRANSLATORS: This is the tooltip for the "Hardcore" starting condition
   tooltip = _"Start the game with just your headquarters and very few wares for bootstrapping an economy. Warning: the AI can’t successfully start from this.",
   func =  function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field

   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   prefilled_buildings(plr, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            water = 128,
            log = 128,
            granite = 32,
            coal = 32,
            planks = 32,
            reed = 32,
            cloth = 48,
            marble = 24,
            quartz = 24,
            iron = 16,
            corn = 16,
            spider_silk = 16,
            spidercloth = 16,
            grout = 16,
            brick = 16,
            diamond = 8,
        },
        workers = {
            europeans_carrier = 32,
            europeans_farmer_basic = 8,
            europeans_builder = 6,
            europeans_miner_basic = 6,
            europeans_lumberjack_basic = 4,
            europeans_forester_basic = 4,
            europeans_carpenter_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_stonemason_basic = 2,
            europeans_charcoal_burner_basic = 2,
            europeans_hunter_basic = 2,
            europeans_fisher_basic = 2,
            europeans_fishbreeder = 2,
            europeans_miller_basic = 2,
            europeans_baker_basic = 2,
            europeans_smoker_basic = 2,
            europeans_brewer_basic = 2,
            europeans_breeder_normal = 2,
            europeans_weaver_basic = 2,
            europeans_smelter_basic = 2,
            europeans_smith_basic = 2,
            europeans_trainer = 1,
            europeans_shipwright = 1,
            europeans_geologist = 1
      },
        soldiers = {
            [{0,0,0,0}] = 16,
      }
   })
end
}
pop_textdomain()
return init
