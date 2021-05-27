-- =======================================================================
--                Pioneer Post Starting conditions for Frisians
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("pioneer-post.wad", true)

local init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Pioneer Post",
   -- TRANSLATORS: This is the tooltip for the "Pioneer Post" starting condition
   tooltip = _"Start the game with just your headquarters and very few wares for bootstrapping an economy",
   func =  function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field

   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   prefilled_buildings(player, { "frisians_headquarters", sf.x, sf.y,
      wares = {
         log = 20,
         granite = 20,
         reed = 20,
         brick = 40,
         clay = 12,
         water = 10,
         fish = 10,
         fruit = 4,
         barley = 5,
         ration = 8,
         honey = 6,
         smoked_meat = 3,
         smoked_fish = 3,
         mead = 5,
         meal = 2,
         coal = 18,
         iron = 8,
         gold = 5,
         iron_ore = 8,
         bread_frisians = 12,
         honey_bread = 3,
         beer = 4,
         cloth = 5,
         fur = 10,
         fur_garment = 5,
         sword_short = 5,
         hammer = 6,
         fire_tongs = 3,
         bread_paddle = 2,
         kitchen_tools = 3,
         felling_ax = 3,
         needles = 1,
         basket = 3,
         pick = 3,
         shovel = 6,
         scythe = 3,
         hunting_spear = 1,
         fishing_net = 2,
      },
      workers = {
         frisians_blacksmith = 1,
         frisians_baker = 1,
         frisians_brewer = 1,
         frisians_builder = 6,
         frisians_charcoal_burner = 1,
         frisians_claydigger = 2,
         frisians_brickmaker = 1,
         frisians_carrier = 40,
         frisians_reed_farmer = 2,
         frisians_berry_farmer = 2,
         frisians_fruit_collector = 2,
         frisians_farmer = 1,
         frisians_landlady = 1,
         frisians_smoker = 3,
         frisians_geologist = 4,
         frisians_woodcutter = 3,
         frisians_beekeeper = 1,
         frisians_miner = 2,
         frisians_miner_master = 2,
         frisians_forester = 2,
         frisians_stonemason = 2,
         frisians_reindeer = 5,
         frisians_trainer = 2,
         frisians_seamstress_master = 1,
      },
      soldiers = {
         [{0,0,0,0}] = 30,
      }
   })
end
}

pop_textdomain()
return init
