-- =======================================================================
--                 Start conditions for Royal
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("royal.wad", true)

local init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Royal",
   -- TRANSLATORS: This is the tooltip for the "Royal" starting condition
   tooltip = _"Start the game with just your headquarters and a large number of wares and workers",
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "barbarians_headquarters", sf.x, sf.y,
      wares = {
         ax = 5,
         bread_paddle = 6,
         blackwood = 18,
         cloth = 5,
         coal = 32,
         gold = 16,
         iron_ore = 18,
         felling_ax = 5,
         fire_tongs = 6,
         fish = 6,
         fishing_rod = 2,
         grout = 48,
         hammer = 12,
         hunting_spear = 3,
         kitchen_tools = 6,
         meal = 4,
         meat = 6,
         pick = 8,
         barbarians_bread = 8,
         ration = 12,
         granite = 30,
         scythe = 6,
         shovel = 4,
         snack = 3,
         reed = 44,
         log = 68,
      },
      workers = {
         barbarians_blacksmith = 4,
         barbarians_brewer = 3,
         barbarians_builder = 32,
         barbarians_charcoal_burner = 1,
         barbarians_carrier = 40,
         barbarians_gardener = 1,
         barbarians_geologist = 4,
         barbarians_lime_burner = 2,
         barbarians_lumberjack = 0,
         barbarians_miner = 6,
         barbarians_miner_master = 6,
         barbarians_ranger = 1,
         barbarians_stonemason = 2,
         barbarians_trainer = 8,
         barbarians_ox = 18,
      },
      soldiers = {
         [{0,0,0,0}] = 68,
         [{0,2,0,0}] = 1,
         [{0,3,0,0}] = 1,
         [{0,5,0,0}] = 1,
      }
   })
end
}

pop_textdomain()
return init
