-- =======================================================================
--           Fortified Village starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("gauls.wad", true)

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

      local h = plr:place_building("gauls_stronghold", sf, false, true)
      h:set_soldiers{[{0,0,0,0}] = 10}

      place_building_in_region(plr, "gauls_warehouse", sf:region(6), {
      wares = {
            log = 33,
            reed = 40,
            granite = 33,
            brick = 33,
            planks = 33,
            cloth = 3,
            water = 10,
            wheat = 7,
            wool = 9,
            barbarians_bread = 5,
            ration = 11,
            coal = 3,
            copper = 2,
            iron_ore = 5,
            gold_ore = 1,
            gold = 2,
            bronze = 2,
            spear = 5,
            pick = 8,
            felling_ax = 4,
            shovel = 10,
            hammer = 14,
            scythe = 5,
            fire_tongs = 2,
            kitchen_tools = 4,
            buckets = 3,
            flail = 1,
            fishing_net = 2,
            basket = 2,
            tunic = 4,
        },
        workers = {
            gauls_geologist = 4,
            gauls_carrier = 30,
            gauls_carrier_1 = 8,
            gauls_builder = 5,
            gauls_miner = 2,
            gauls_miner_master = 2,
            gauls_woodcutter = 2,
            gauls_farmer = 3,
            gauls_toiler = 1,
            gauls_cook = 1,
            gauls_charcoal_burner = 1,
            gauls_smelter = 1,
            gauls_breeder = 1,
            gauls_gardener = 2,
            gauls_stonecutter = 2,
            gauls_claydigger = 2,
            gauls_trainer = 1,
      },
         -- Max health: 3, Max attack: 2, Max defense: 3, Max evade: 2
         soldiers = {
            [{0,0,0,0}] = 17,
         }
      })

      place_building_in_region(plr, "gauls_training_camp", sf:region(11), {
         inputs = { meal = 3, elixir = 3 }
      })
      place_building_in_region(plr, "gauls_fighting_arena", sf:region(11), {
         inputs = { meal = 1, potion = 1, tunic = 1 }
      })
      place_building_in_region(plr, "gauls_druids_gathering", sf:region(11), {
         inputs = { barbarians_bread = 3, smoked_fish = 3, smoked_meat = 3, elixir = 3 }
      })
      place_building_in_region(plr, "gauls_workshop", sf:region(6), {
         inputs = { iron = 6, log = 6, reed = 2 }
      })
      place_building_in_region(plr, "gauls_sawmill", sf:region(8), {
         inputs = { log = 3 }
      })
      place_building_in_region(plr, "gauls_weaponsmithy", sf:region(8), {
         inputs = { log = 4, coal = 4, iron = 4 },
      })
      place_building_in_region(plr, "gauls_armorsmithy", sf:region(8), {
         inputs = { coal = 2, iron = 2, cloth = 2 },
      })
      place_building_in_region(plr, "gauls_brick_kiln", sf:region(10), {
         inputs = { coal = 3, clay = 2, granite = 3 },
      })
      place_building_in_region(plr, "gauls_hunters_hut", sf:region(9))
   end
}
pop_textdomain()
return init
