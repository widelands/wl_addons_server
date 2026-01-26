-- =======================================================================
--           Trading Outpost starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Trading Outpost"),
   -- TRANSLATORS: This is the tooltip for the "Trading Outpost" starting condition
   tooltip = _("If this player runs low on important wares, they will be replenished for free"),
   func = function(player, shared_in_start)

      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

      hq = prefilled_buildings(player, { "gauls_headquarters", sf.x, sf.y,
      wares = {
            log = 33,
            reed = 40,
            granite = 33,
            brick = 33,
            planks = 33,
            cloth = 5,
            clay = 2,
            wheat = 7,
            wool = 9,
            smoked_meat = 3,
            smoked_fish = 3,
            barbarians_bread = 8,
            meal = 4,
            ration = 11,
            coal = 12,
            copper = 3,
            iron_ore = 5,
            iron = 12,
            gold_ore = 1,
            gold = 6,
            tin_ore = 3,
            bronze = 5,
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
            elixir = 6,
            potion = 1,
            tunic = 5,
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
            gauls_blacksmith = 1,
            gauls_dressmaker = 1,
            gauls_stonecutter = 2,
            gauls_claydigger = 2,
            gauls_brickmaker = 1,
            gauls_druid = 3,
            gauls_trainer = 4,
      },
         -- Max health: 3, Max attack: 2, Max defense: 3, Max evade: 2
         soldiers = {
            [{0,0,0,0}] = 35,
            [{0,1,1,0}] = 5,
            [{1,0,1,0}] = 5,
         }
      })
      place_building_in_region(player, "gauls_workshop", sf:region(6), {
         inputs = { iron = 6, log = 6, reed = 2 }
      })
      place_building_in_region(player, "gauls_sawmill", sf:region(8), {
         inputs = { log = 3 }
      })
      place_building_in_region(player, "gauls_hunters_hut", sf:region(8))
      place_building_in_region(player, "gauls_stone_tower", sf:region(13), {
         soldiers = {
            [{0,0,0,0}] = 1,
         },
      })

      -- Get all warehouse types
      local warehouse_types = {}
      for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
         if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
         end
      end

      -- index of a warehouse we will add to. Used to 'rotate' warehouses
      local idx = 1

      for i=1,100000 do
      sleep(300000)

      -- collect all ~warehouses and pick one to insert the wares
      local warehouses = {}
      for i, building_name in ipairs(warehouse_types) do
            warehouses = array_combine(warehouses, player:get_buildings(building_name))
      end

      if #warehouses > 0 then

         -- adding to a warehouse with index idx, if out of range, adding to wh 1
          if idx > #warehouses then
            idx = 1
         end

         local wh = warehouses[idx]
         local added = 0

         if player:get_wares("water") < 40 + #warehouses * 10 then
            wh:set_wares("water", wh:get_wares("water") + 20 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("log") < 40 + #warehouses * 10 then
            wh:set_wares("log", wh:get_wares("log") + 20 + #warehouses)
            added = added + 1
         end
         if player:get_wares("brick") < 10 + #warehouses * 3 then
            wh:set_wares("brick", wh:get_wares("brick") +  5 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("reed") < 20 + #warehouses * 10 then
            wh:set_wares("reed", wh:get_wares("reed") +  10 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("granite") < 20 + #warehouses * 10 then
            wh:set_wares("granite", wh:get_wares("granite") +  10 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("wheat") < 40 + #warehouses * 5 then
            wh:set_wares("wheat", wh:get_wares("wheat") + 20 + #warehouses * 2)
            added = added + 1
         end
         if wh:get_wares("fish") < 40 + #warehouses * 5 then
            wh:set_wares("fish", wh:get_wares("fish") + 15)
            added = added + 1
         end
         if player:get_wares("coal") < 20 + #warehouses * 10 then
            wh:set_wares("coal", wh:get_wares("coal") + 20 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("iron_ore") < 20 + #warehouses * 10 then
            wh:set_wares("iron_ore", wh:get_wares("iron_ore") + 10 + #warehouses)
            added = added + 1
         end
         if player:get_wares("copper_ore") < 10 + #warehouses * 5 then
            wh:set_wares("copper_ore", wh:get_wares("copper_ore") + 3)
            added = added + 1
         end
         if player:get_wares("bronze") < 20 + #warehouses * 5 then
            wh:set_wares("bronze", wh:get_wares("bronze") + 2)
            added = added + 1
         end
         if player:get_wares("gold") < 20 + #warehouses * 5 then
            wh:set_wares("gold", wh:get_wares("gold") + 2)
            added = added + 1
         end
         if player:get_wares("elixir") < 20 + #warehouses * 2 then
            wh:set_wares("elixir", wh:get_wares("elixir") + 10 + #warehouses * 3)
            added = added + 1
         end

         if (added > 0) then
            print (player.number..": "..added.." types of ware added to warehouse "..idx.." of "..#warehouses.." (cheating mode)")
         end

         idx = idx + 1
      end
   end
end
}

pop_textdomain()
return init
