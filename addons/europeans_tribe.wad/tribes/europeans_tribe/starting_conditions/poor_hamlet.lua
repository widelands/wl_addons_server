-- =======================================================================
--                Minimum Starting conditions for europeans
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug.lua"

push_textdomain("europeans_tribe.wad", true)

local r = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Poor Hamlet",
   -- TRANSLATORS: This is the tooltip for the "Poor Hamlet" (minimum) starting condition
   tooltip = _"Start the game with just a warehouse and the bare minimum for bootstrapping an economy. Warning: the AI can’t successfully start from this.",
   func =  function(player, shared_in_start)
      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

   prefilled_buildings(plr, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            water = 32,
            log = 32,
            planks = 16,
            reed = 16,
            cloth = 16,
            granite = 16,
            coal = 16,
            iron = 16,
            corn = 8,
            spider_silk = 8,
            spidercloth = 8,
            grout = 8,
            brick = 8,
            marble = 8,
            quartz = 8
        },
        workers = {
            europeans_carrier = 16,
            europeans_farmer_basic = 8,
            europeans_builder = 6,
            europeans_miner_basic = 4,
            europeans_lumberjack_basic = 2,
            europeans_forester_basic = 1,
            europeans_carpenter_basic = 1,
            europeans_stonecutter_basic = 1,
            europeans_stonemason_basic = 1,
            europeans_hunter_basic = 1,
            europeans_fisher_basic = 1,
            europeans_fishbreeder = 1,
            europeans_breeder_normal = 1,
            europeans_weaver_basic = 1,
            europeans_smith_basic = 1,
            europeans_trainer = 1
      },
        soldiers = {
            [{0,0,0,0}] = 2,
      }
   })

      player:reveal_fields(sf:region(10))
      player:conquer(sf, 9)

      push_textdomain("europeans_tribe.wad", true)
      player:send_to_inbox(_"Be careful", _"You have only one iron for each tool you will need to start your economy. Make sure no unneeded tool is created.")
      pop_textdomain()

      check_trees_rocks_poor_hamlet(player, sf, "europeans_warehouse_normal", {granite = 1}, {log = 1, planks = 1, granite = 1})
   end
}
pop_textdomain()
return r
