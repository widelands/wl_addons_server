-- =======================================================================
--               Village starting conditions for Hebrews
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("hebrews_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Village"),
   -- TRANSLATORS: This is the tooltip for the "Village" starting condition
   tooltip = _("Start the game with a peaceful village"),
   func =  function(plr, shared_in_start)

      local sf = wl.Game().map.player_slots[plr.number].starting_field

      if shared_in_start then
         sf = shared_in_start
      else
         plr:allow_workers("all")
      end

   hq = prefilled_buildings(plr, { "hebrews_headquarters", sf.x, sf.y,
         wares = {
         clay = 50,
         granite = 40,
         branch = 40,
         log = 5,
         pick = 8,
         hammer = 12,
         fishing_rod = 2,
         copper_ore = 5,
         gold_ore = 4,
         water = 15,
         wheat = 10,
         flour = 5,
         bread_hebrews = 8,
         fish = 6,
         meat = 6,
         sheep2 = 5,
         wool = 10,
         yarn = 10,
         cloth = 20,
         },
         workers = {
            hebrews_builder = 10,
            hebrews_carrier = 38,
            hebrews_geologist = 7,
            hebrews_branch_collector = 2,
            hebrews_stonemason = 2,
            hebrews_talmid = 30,
            hebrews_farmer = 1,
            hebrews_fisher = 3,
            hebrews_talmid_chacham = 4,
            hebrews_shepherd = 3,
            hebrews_donkey = 10,
         },
         soldiers = {
            [{0,0,0,0}] = 5,
         }
      })

      place_building_in_region(plr, "hebrews_bakery", sf:region(8), {
         inputs = { water = 5, flour = 5 },
      })

      place_building_in_region(plr, "hebrews_well", sf:region(8), {
         inputs = {},
      })
      place_building_in_region(plr, "hebrews_farm", sf:region(8), {
         inputs = {},
      })
   end
}
pop_textdomain()
return init
