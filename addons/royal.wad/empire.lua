-- =======================================================================
--                Starting conditions for Royal
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("royal.wad", true)

local init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Royal",
   -- TRANSLATORS: This is the tooltip for the "Royal" starting condition
   tooltip = _"Start the game with just your headquarters and a large number of wares and workers",
   func =  function(p, shared_in_start)

   local sf = wl.Game().map.player_slots[p.number].starting_field

   if shared_in_start then
      sf = shared_in_start
   else
      p:allow_workers("all")
   end

   prefilled_buildings(p, { "empire_headquarters", sf.x, sf.y,
      wares = {
         armor_helmet = 4,
         spear_wooden = 5,
         felling_ax = 5,
         bread_paddle = 6,
         basket = 2,
         empire_bread = 8,
         cloth = 5,
         coal = 32,
         gold = 16,
         iron_ore = 18,
         fire_tongs = 6,
         fish = 6,
         fishing_rod = 2,
         flour = 4,
         grape = 4,
         hammer = 14,
         hunting_spear = 1,
         kitchen_tools = 6,
         marble = 25,
         marble_column = 6,
         meal = 4,
         meat = 6,
         pick = 8,
         ration = 12,
         saw = 2,
         scythe = 7,
         shovel = 6,
         granite = 40,
         log = 60,
         water = 12,
         wheat = 5,
         wine = 18,
         planks = 45,
         wool = 2,
      },
      workers = {
         empire_armorsmith = 1,
         empire_brewer = 2,
         empire_builder = 32,
         empire_carrier = 40,
         empire_charcoal_burner = 1,
         empire_geologist = 4,
         empire_miner = 16,
         empire_stonemason = 2,
         empire_toolsmith = 4,
         empire_trainer = 8,
         empire_weaponsmith = 6,
         empire_donkey = 18,
      },
      soldiers = {
         [{0,0,0,0}] = 55,
         [{0,1,0,0}] = 1,
         [{0,2,0,0}] = 1,
         [{0,4,0,0}] = 1,
      }
   })
end
}

pop_textdomain()
return init
