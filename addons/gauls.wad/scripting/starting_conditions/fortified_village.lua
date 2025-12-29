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
            log = 59,
            reed = 42,
            granite = 33,
            water = 6,
            brick = 21,
            planks = 23,
            cloth = 5,
            clay = 2,
            straw = 1,
            wool = 3,
            smoked_meat = 2,
            smoked_fish = 3,
            fish = 1,
            barbarians_bread = 8,
            meal = 4,
            milk = 2,
            ration = 12,
            coal = 12,
            copper = 2,
            iron_ore = 5,
            iron = 11,
            gold_ore = 1,
            gold = 2,
            bronze = 2,
            spear = 4,
            pick = 6,
            felling_ax = 4,
            shovel = 5,
            hammer = 10,
            scythe = 4,
            fire_tongs = 2,
            kitchen_tools = 4,
            buckets = 3,
            flail = 1,
            fishing_net = 2,
            basket = 2,
            elixir = 4,
            tunic = 5
        },
        workers = {
            gauls_geologist = 4,
            gauls_carrier = 40,
            gauls_carrier_1 = 10,
            gauls_builder = 10,
            gauls_miner = 2,
            gauls_miner_master = 2,
            gauls_woodcutter = 3,
            gauls_forester = 4,
            gauls_water_carrier = 2,
            gauls_hunter = 1,
            gauls_farmer = 3,
            gauls_toiler = 1,
            gauls_cook = 1,
            gauls_charcoal_burner = 1,
            gauls_smelter = 1,
            gauls_breeder = 1,
            gauls_gardener = 2,
            gauls_craftsman = 1,
            gauls_blacksmith = 1,
            gauls_stonecutter = 2,
            gauls_claydigger = 2,
            gauls_brickmaker = 1,
            gauls_druid = 3,
            gauls_trainer = 2,
      },
         soldiers = {
            [{0,0,0,0}] = 35,
         }
      })

      place_building_in_region(plr, "gauls_training_camp", sf:region(12), {
         inputs = { meal = 8, elixir = 8 }
      })
      place_building_in_region(plr, "gauls_fighting_arena", sf:region(12), {
         inputs = { meal = 8, potion = 8, tunic = 4 }
      })
      place_building_in_region(plr, "gauls_druids_gathering", sf:region(12), {
         inputs = { barbarians_bread = 4, smoked_fish = 4, smoked_meat = 4, elixir = 8 }
      })
      place_building_in_region(plr, "gauls_workshop", sf:region(8), {
         inputs = { iron = 6, log = 6, planks = 4, reed = 6 }
      })
      place_building_in_region(plr, "gauls_sawmill", sf:region(10), {
         inputs = { log = 8 }
      })
      place_building_in_region(plr, "gauls_weaponsmithy", sf:region(10), {
         inputs = { log = 4, coal = 4, iron = 4 },
      })
      place_building_in_region(plr, "gauls_armorsmithy", sf:region(10), {
         inputs = { coal = 4, iron = 2, cloth = 2 },
      })
      place_building_in_region(plr, "gauls_brick_kiln", sf:region(11), {
         inputs = { coal = 3, clay = 3, granite = 3 },
      })
      place_building_in_region(plr, "gauls_hunters_hut", sf:region(11))
   end
}
pop_textdomain()
return init
