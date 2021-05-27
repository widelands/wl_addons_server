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

   hq = prefilled_buildings(player, { "frisians_headquarters", sf.x, sf.y,
      wares = {
         log = 40,
         granite = 50,
         reed = 50,
         brick = 80,
         clay = 30,
         water = 10,
         fish = 10,
         meat = 10,
         fruit = 10,
         barley = 5,
         ration = 24,
         honey = 10,
         smoked_meat = 5,
         smoked_fish = 5,
         mead = 5,
         meal = 2,
         coal = 18,
         coal = 32,
         gold = 16,
         iron_ore = 18,
         bread_frisians = 28,
         honey_bread = 8,
         beer = 16,
         cloth = 5,
         fur = 10,
         fur_garment = 5,
         sword_short = 5,
         hammer = 10,
         fire_tongs = 6,
         bread_paddle = 3,
         kitchen_tools = 6,
         felling_ax = 3,
         needles = 1,
         basket = 3,
         pick = 5,
         shovel = 9,
         scythe = 3,
         hunting_spear = 3,
         fishing_net = 3,
      },
      workers = {
         frisians_blacksmith = 3,
         frisians_baker = 3,
         frisians_brewer = 3,
         frisians_builder = 32,
         frisians_charcoal_burner = 1,
         frisians_claydigger = 2,
         frisians_brickmaker = 2,
         frisians_carrier = 40,
         frisians_reed_farmer = 2,
         frisians_berry_farmer = 3,
         frisians_fruit_collector = 2,
         frisians_farmer = 7,
         frisians_landlady = 1,
         frisians_smoker = 6,
         frisians_geologist = 4,
         frisians_beekeeper = 4,
         frisians_miner = 8,
         frisians_miner_master = 8,
         frisians_forester = 2,
         frisians_stonemason = 2,
         frisians_reindeer = 18,
         frisians_trainer = 8,
         frisians_seamstress_master = 1,
      },
      soldiers = {
         [{0,0,0,0}] = 55,
         [{2,0,0,0}] = 1, 
         [{4,0,0,0}] = 1, 
         [{6,0,0,0}] = 1,
      }
   })
end
}

pop_textdomain()
return init
