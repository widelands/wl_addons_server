-- =======================================================================
--           Fortified Village starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("sumatran_tribe.wad", true)

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

      local h = plr:place_building("sumatran_fort", sf, false, true)
      h:set_soldiers{[{0,0,0,0}] = 10}

       place_building_in_region(plr, "sumatran_warehouse", sf:region(6), {
         wares = {
            log = 60,
            reed = 30,
            stone = 40,
            water = 5,
            tropicalwood = 20,
            sandedwood = 5,
            cloth = 6,
            palmleaves = 25,
            crocodile_jacket = 3,
            cassavaroot = 6,
            cassavaleaves = 7,
            fish = 6,
            eggs = 3,
            meal = 6,
            food_waste = 4,
            palm_wine = 5,
            coal = 12,
            copper_ore = 4,
            iron_ore = 6,
            iron = 6,
            gold = 4,
            diamond_raw = 3,
            diamond = 5,
            sumatran_spear = 4,
            pick = 4,
            felling_ax = 3,
            shovel = 6,
            hammer = 8,
            machete = 3,
            kitchen_tools = 2,
            buckets = 3,
            whetstone = 1,
            crocodile_skin = 2
         },
         workers = {
            sumatran_geologist = 4,
            sumatrans_carrier = 40,
            sumatran_carrier_1 = 10,
            sumatrans_builder = 10,
            sumatran_miner = 2,
            sumatran_miner_master = 2,
            sumatran_woodcutter = 5,
            sumatran_forester = 4,
            sumatran_water_carrier = 2,
            sumatran_leaf_gatherer = 2,
            sumatran_hunter = 3,
            sumatran_farmer_experienced = 3,
            sumatran_farmer = 1,
            sumatran_reedcutter = 1,
            sumatran_cook = 1,
            sumatran_smelter = 1,
            sumatran_chief = 1,
            sumatran_tribal_chief = 1,
            sumatran_craftsman = 1,
            sumatran_craftsman_experienced = 1,
            sumatran_coppersmith = 1,
            sumatran_stonecutter = 2,
            sumatran_weaver = 1,
         },
         soldiers = {
            [{0,0,0,0}] = 35,
         }
      })

      place_building_in_region(plr, "sumatran_hunting_camp", sf:region(12), {
         inputs = { meal = 5, palm_wine = 10 }
      })
      place_building_in_region(plr, "sumatran_workshop_basic", sf:region(12), {
         inputs = { log = 4, diamond_raw = 2, stone = 4 },
      })
      place_building_in_region(plr, "sumatran_workshop_tools", sf:region(12), {
         inputs = { iron = 5, sandedwood = 5 },
      })
      place_building_in_region(plr, "sumatran_workshop_weapons", sf:region(12), {
         inputs = { iron = 4 },
      })
      place_building_in_region(plr, "sumatran_furnace", sf:region(12), {
         inputs = { coal = 3, iron_ore = 3, copper_ore = 3 },
      })
      place_building_in_region(plr, "sumatran_jungle_marsh", sf:region(13))
      place_building_in_region(plr, "sumatran_hunters_house", sf:region(12))
   end
}
pop_textdomain()
return init
