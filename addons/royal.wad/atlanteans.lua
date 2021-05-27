-- =======================================================================
--              Royal Starting Conditions for Atlanteans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("royal.wad", true)

local init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Royal",
   -- TRANSLATORS: This is the tooltip for the "Royal" starting condition
   tooltip = _"Start the game with just your headquarters and a large number of wares and workers",
   func =  function(plr, shared_in_start)

   local sf = wl.Game().map.player_slots[plr.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      plr:allow_workers("all")
   end

   prefilled_buildings(plr, { "atlanteans_headquarters", sf.x, sf.y,
      wares = {
         diamond = 18,
         quartz = 28,
         granite = 48,
         spider_silk = 16,
         log = 62,
         coal = 32,
         gold = 16,
         iron_ore = 18,
         planks = 45,
         spidercloth = 8,
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
         bread_paddle = 6,
         buckets = 3,
         fire_tongs = 6,
         fishing_net = 4,
         hammer = 11,
         hunting_bow = 1,
         milking_tongs = 2,
         hook_pole = 6,
         pick = 8,
         saw = 5,
         scythe = 7,
         shovel = 18,
         tabard = 5,
         trident_light = 5,
      },
      workers = {
         atlanteans_armorsmith = 1,
         atlanteans_blackroot_farmer = 2,
         atlanteans_builder = 32,
         atlanteans_charcoal_burner = 1,
         atlanteans_carrier = 40,
         atlanteans_fishbreeder = 1,
         atlanteans_geologist = 4,
         atlanteans_miner = 18,
         atlanteans_sawyer = 3,
         atlanteans_stonecutter = 2,
         atlanteans_toolsmith = 4,
         atlanteans_trainer = 8,
         atlanteans_weaponsmith = 4,
         atlanteans_woodcutter = 0,
         atlanteans_horse = 18,
      },
      soldiers = {
         [{0,0,0,0}] = 45,
         [{0,1,0,0}] = 1,
         [{0,3,0,0}] = 1,
         [{0,4,0,0}] = 1,
      }
   })
end
}

pop_textdomain()
return init
