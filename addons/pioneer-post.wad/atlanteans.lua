-- =======================================================================
--              Pioneer Post Starting Conditions for Atlanteans
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

   prefilled_buildings(player, { "atlanteans_headquarters", sf.x, sf.y,
      wares = {
         diamond = 8,
         iron_ore = 12,
         quartz = 8,
         granite = 30,
         spider_silk = 12,
         log = 22,
         coal = 12,
         gold = 8,
         gold_thread = 5,
         iron = 4,
         planks = 30,
         spidercloth = 4,
         blackroot = 5,
         blackroot_flour = 12,
         atlanteans_bread = 8,
         corn = 5,
         cornmeal = 12,
         fish = 3,
         meat = 3,
         smoked_fish = 6,
         smoked_meat = 6,
         water = 12,
         bread_paddle = 3,
         buckets = 3,
         fire_tongs = 3,
         fishing_net = 2,
         hammer = 11,
         hunting_bow = 1,
         milking_tongs = 2,
         hook_pole = 3,
         pick = 6,
         saw = 5,
         scythe = 4,
         shovel = 8,
         tabard = 5,
         trident_light = 5,
      },
      workers = {
         atlanteans_armorsmith = 1,
         atlanteans_blackroot_farmer = 2,
         atlanteans_builder = 10,
         atlanteans_charcoal_burner = 1,
         atlanteans_carrier = 40,
         atlanteans_fishbreeder = 1,
         atlanteans_geologist = 4,
         atlanteans_miner = 6,
         atlanteans_sawyer = 2,
         atlanteans_stonecutter = 2,
         atlanteans_toolsmith = 2,
         atlanteans_trainer = 4,
         atlanteans_weaponsmith = 2,
         atlanteans_woodcutter = 0,
         atlanteans_horse = 9,
      },
      soldiers = {
         [{0,0,0,0}] = 22,
      }
   })
end
}


pop_textdomain()
return init
