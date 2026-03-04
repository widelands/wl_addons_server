-- =======================================================================
--             Headquarters starting conditions for Hebrews
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("hebrews_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Headquarters"),
   -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
   tooltip = _("Start the game with your headquarters only"),
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "hebrews_headquarters", sf.x, sf.y,
      wares = {
         -- Building Materials
         granite = 30,
         clay = 50,
         branch = 30,
         log = 5,
         -- Food
         water = 15,
         wheat = 10,
         bread_hebrews = 15,
         fish = 5,
         meat = 5,
         wine = 5,
         -- Mining
         copper_ore = 10,
         -- Textile
         sheep2 = 5,
         wool = 10,
         yarn = 10,
         cloth = 20,
         -- Tools
         pick = 5,
         hammer = 8,
         fishing_rod = 3,
         -- Religious items
         zizit = 5,
         tallit_katan = 3,
         -- Weapons
         slingshot = 5,
      },
      workers = {
         hebrews_donkey = 15,
         hebrews_builder = 5,
         hebrews_stonemason = 1,
         hebrews_geologist = 5,
         hebrews_fisher = 3,
         hebrews_farmer = 2,
         hebrews_shepherd = 3,
         hebrews_miner = 2,
         hebrews_scout = 1,
         hebrews_talmid = 30,
         hebrews_talmid_chacham = 4,
      },
      soldiers = {
         [{0,0,0,0}] = 45,
      }
   })
end
}

pop_textdomain()
return init
