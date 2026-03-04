-- =======================================================================
--           Trading Outpost starting conditions for Hebrews
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("hebrews_tribe.wad", true)

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

      hq = prefilled_buildings(player, { "hebrews_headquarters", sf.x, sf.y,
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
            hebrews_talmid_chacham = 2,
            hebrews_builder = 10,
            hebrews_carrier = 40,
            hebrews_talmid = 30,
            hebrews_farmer = 1,
            hebrews_geologist = 7,
            hebrews_branch_collector = 3,
            hebrews_stonemason = 2,
            hebrews_fisher = 3,
            hebrews_shepherd = 3,
            hebrews_donkey = 15,
         },
         -- Max health: 3, Max attack: 5, Max defense: 0, Max evade: 2
         soldiers = {
            [{0,0,0,0}] = 35,
            [{1,0,0,1}] = 5,
            [{1,1,0,0}] = 5,
         }
      })

      place_building_in_region(player, "hebrews_bakery", sf:region(11), {
         inputs = {
            water = 5,
            flour = 5
         }
      })

      place_building_in_region(player, "hebrews_well", sf:region(11), {
         inputs = {}
      })

      place_building_in_region(player, "hebrews_tent_small", sf:region(13), {
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
         if player:get_wares("log") < 10 + #warehouses * 2 then
            wh:set_wares("log", wh:get_wares("log") + 5)
            added = added + 1
         end
         if player:get_wares("granite") < 30 + #warehouses * 10 then
            wh:set_wares("granite", wh:get_wares("granite") +  10 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("branch") < 70 + #warehouses * 10 then
            wh:set_wares("branch", wh:get_wares("branch") + 25 + #warehouses * 5)
            added = added + 1
         end
         if player:get_wares("copper_ore") < 30 + #warehouses * 10 then
            wh:set_wares("copper_ore", wh:get_wares("copper_ore") + 10 + #warehouses * 2)
            added = added + 1
         end
         if wh:get_wares("fish") < 40 + #warehouses * 5 then
            wh:set_wares("fish", wh:get_wares("fish") + 10)
            added = added + 1
         end
         if player:get_wares("gold_ore") < 20 + #warehouses * 5 then
            wh:set_wares("gold_ore", wh:get_wares("gold_ore") + 3)
            added = added + 1
         end
         if player:get_wares("wheat") < 60 + #warehouses * 10 then
            wh:set_wares("wheat", wh:get_wares("wheat") + 15 + #warehouses * 2)
            added = added + 1
         end
         if player:get_wares("bread_hebrews") < 40 + #warehouses * 5 then
            wh:set_wares("bread_hebrews", wh:get_wares("bread_hebrews") + 8 + #warehouses * 2)
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
