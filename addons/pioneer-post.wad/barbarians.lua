-- =======================================================================
--                 Pioneer Post Starting conditions for Barbarians
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("pioneer-post.wad", true)

local init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Pioneer Post",
   -- TRANSLATORS: This is the tooltip for the "Pioneer Post" starting condition
   tooltip = _"Start the game with just your headquarters and very few wares for bootstrapping an economy",
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "barbarians_headquarters", sf.x, sf.y,
      wares = {
         ax = 3,
         bread_paddle = 3,
         blackwood = 8,
         cloth = 4,
         coal = 18,
         gold = 5,
         felling_ax = 3,
         fire_tongs = 3,
         fish = 6,
         fishing_rod = 2,
         grout = 18,
         hammer = 12,
         hunting_spear = 1,
         iron = 4,
         iron_ore = 18,
         kitchen_tools = 3,
         meal = 4,
         meat = 6,
         pick = 6,
         barbarians_bread = 8,
         ration = 12,
         granite = 18,
         scythe = 6,
         shovel = 4,
         snack = 3,
         reed = 16,
         log = 30,
      },
      workers = {
         barbarians_blacksmith = 2,
         barbarians_brewer = 1,
         barbarians_builder = 10,
         barbarians_charcoal_burner = 1,
         barbarians_carrier = 40,
         barbarians_gardener = 1,
         barbarians_geologist = 2,
         barbarians_lime_burner = 1,
         barbarians_lumberjack = 0,
         barbarians_miner = 5,
         barbarians_miner_master = 4,
         barbarians_ranger = 1,
         barbarians_stonemason = 2,
         barbarians_trainer = 4,
         barbarians_ox = 9,
      },
      soldiers = {
         [{0,0,0,0}] = 28,
      }
   })
end
}

pop_textdomain()
return init
