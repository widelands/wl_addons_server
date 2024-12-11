-- =======================================================================
--           Trading Outpost starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("sumatran_tribe.wad", true)

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

      hq = prefilled_buildings(player, { "sumatran_headquarters", sf.x, sf.y,
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
            spear = 4,
            pick = 4,
            felling_ax = 3,
            shovel = 6,
            hammer = 8,
            machete = 3,
            kitchen_tools = 2,
            buckets = 3,
            whetstone = 1,
            crocodile_skin = 4
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
            sumatran_leaves_gatherer = 2,
            sumatran_hunter = 3,
            sumatran_farmer_experienced = 3,
            sumatran_farmer = 1,
            sumatran_reedcutter = 1,
            sumatran_cook = 1,
            sumatran_smelter = 1,
            sumatran_tribal_chief = 1,
            sumatran_craftsman = 1,
            sumatran_craftsman_experienced = 1,
            sumatran_coppersmith = 1,
            sumatran_stonecutter = 2,
            sumatran_weaver = 1,
         },
         -- Max health: 3, Max attack: 3, Max defense: 3, Max evade: 1
         soldiers = {
            [{0,0,0,0}] = 35,
            [{1,0,0,1}] = 5,
            [{1,1,0,0}] = 5,
         }
      })

      place_building_in_region(player, "sumatran_workshop_tools", sf:region(8), {
         inputs = {
            iron = 5,
            sandedwood = 5
         }
      })

      place_building_in_region(player, "sumatran_workshop_basic", sf:region(10), {
         inputs = {
            log = 8,
            diamond_raw = 2,
            stone = 4
         }
      })

      place_building_in_region(player, "sumatran_hunters_tent", sf:region(11), {
         inputs = {}
      })

      place_building_in_region(player, "sumatran_fortified_tower", sf:region(13), {
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
            wh:set_wares("log", wh:get_wares("log") + 20)
            added = added + 1
         end
         if player:get_wares("tropicalwood") < 30 + #warehouses * 10 then
            wh:set_wares("tropicalwood", wh:get_wares("tropicalwood") +  5 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("reed") < 20 + #warehouses * 10 then
            wh:set_wares("reed", wh:get_wares("reed") +  3 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("palmleaves") < 10 + #warehouses * 5 then
            wh:set_wares("palmleaves", wh:get_wares("palmleaves") + 3)
            added = added + 1
         end
         if player:get_wares("stone") < 30 + #warehouses * 10 then
            wh:set_wares("stone", wh:get_wares("stone") +  10 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("coal") < 40 + #warehouses * 10 then
            wh:set_wares("coal", wh:get_wares("coal") + 20 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("iron_ore") < 30 + #warehouses * 10 then
            wh:set_wares("iron_ore", wh:get_wares("iron_ore") + 10 + #warehouses * 2)
            added = added + 1
         end
         if wh:get_wares("fish") < 40 + #warehouses * 5 then
            wh:set_wares("fish", wh:get_wares("fish") + 15)
            added = added + 1
         end
         if player:get_wares("gold") < 20 + #warehouses * 5 then
            wh:set_wares("gold", wh:get_wares("gold") + 3)
            added = added + 1
         end
         if player:get_wares("starch") < 20 + #warehouses * 5 then
            wh:set_wares("starch", wh:get_wares("starch") + 5 + #warehouses * 2)
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
