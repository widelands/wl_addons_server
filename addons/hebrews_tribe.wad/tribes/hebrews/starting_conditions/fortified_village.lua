-- =======================================================================
--           Fortified Village starting conditions for Hebrews
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("hebrews_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Fortified Village"),
   -- TRANSLATORS: This is the tooltip for the "Fortified Village" starting condition
   tooltip = _("Start the game with a fortified military installation"),
   incompatible_wc = {"scripting/win_conditions/hq_hunter.lua"},

   func =  function(plr, shared_in_start)

      local sf = wl.Game().map.player_slots[plr.number].starting_field

      if shared_in_start then
         sf = shared_in_start
      else
         plr:allow_workers("all")
      end

      local h = plr:place_building("hebrews_massada", sf, false, true)
      h:set_soldiers{[{0,0,0,0}] = 12}

       place_building_in_region(plr, "hebrews_warehouse", sf:region(7), {
         wares = {
            clay = 50,
            granite = 34,
            branch = 40,
            log = 5,
            pick = 8,
            hammer = 11,
            fishing_rod = 2,
            copper_ore = 5,
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
            hebrews_donkey = 20,
         },
         soldiers = {
            [{0,0,0,0}] = 25,
         }
      })

      place_building_in_region(plr, "hebrews_yeshiva", sf:region(12), {
         inputs = {
            zizit = 4,
            tallit_katan = 4,
            tefilin = 4,
            tallit = 4,
         }
      })

      place_building_in_region(plr, "hebrews_trainingcamp", sf:region(12))

      place_building_in_region(plr, "hebrews_weaponsmithy", sf:region(12), {
         inputs = { fur = 4, copper_ore = 4 }
      })
      place_building_in_region(plr, "hebrews_bakery", sf:region(12), {
         inputs = { water = 5, flour = 5 },
      })
      place_building_in_region(plr, "hebrews_well", sf:region(12), {
         inputs = {},
      })
   end
}
pop_textdomain()
return init
