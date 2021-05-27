-- =======================================================================
--                Pioneer Post Starting conditions for Empire
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

   prefilled_buildings(player, { "empire_headquarters", sf.x, sf.y,
      wares = {
         armor_helmet = 2,
         spear_wooden = 3,
         felling_ax = 3,
         bread_paddle = 3,
         basket = 2,
         empire_bread = 4,
         cloth = 4,
         coal = 8,
         fire_tongs = 3,
         fish = 4,
         fishing_rod = 2,
         flour = 4,
         grape = 4,
         hammer = 8,
         hunting_spear = 2,
         iron = 2,
         gold = 4,
         iron_ore = 4,
         kitchen_tools = 3,
         marble = 25,
         marble_column = 6,
         meal = 4,
         meat = 6,
         pick = 6,
         ration = 6,
         saw = 1,
         scythe = 5,
         shovel = 6,
         granite = 28,
         log = 20,
         water = 6,
         wheat = 4,
         wine = 8,
         planks = 28,
         wool = 2,
      },
      workers = {
         empire_armorsmith = 1,
         empire_brewer = 2,
         empire_builder = 8,
         empire_carrier = 40,
         empire_charcoal_burner = 1,
         empire_geologist = 4,
         empire_lumberjack = 3,
         empire_miner = 3,
         empire_stonemason = 1,
         empire_toolsmith = 1,
         empire_trainer = 2,
         empire_weaponsmith = 3,
         empire_donkey = 5,
      },
      soldiers = {
         [{0,0,0,0}] = 25,
      }
   })
end
}

pop_textdomain()
return init
