-- =======================================================================
--           Tidy Warehouses starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"
include "scripting/richtext.lua"
include "scripting/messages.lua"

push_textdomain("sumatran_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Tidy Warehouses"),
   -- TRANSLATORS: This is the tooltip for the "Tidy Warehouses" starting condition
   tooltip = _("Start with 360 items, 50 workers and 40 soldiers in your Headquarter. From time to time your workers do inventories. If there is more than 500 items in any of your warehouses, workers throw away one quarter of stock stored in such a warehouse."),
   func = function(player, shared_in_start)

      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

      hq = prefilled_buildings(player, { "sumatran_headquarters", sf.x, sf.y,
         wares = {
            log = 58,
            reed = 33,
            granite = 40,
            water = 18,
            tropicalwood = 22,
            sandedwood = 4,
            cloth = 5,
            palmleaves = 27,
            crocodile_jacket = 8,
            cassavaroot = 7,
            cassavaleaves = 5,
            fish = 6,
            eggs = 3,
            meal = 4,
            meat = 2,
            food_waste = 4,
            palm_wine = 5,
            coal = 12,
            copper_ore = 4,
            iron_ore = 5,
            iron = 12,
            gold = 4,
            diamond_raw = 2,
            diamond = 7,
            spear = 8,
            pick = 8,
            felling_ax = 6,
            shovel = 10,
            hammer = 12,
            machete = 6,
            kitchen_tools = 2,
            buckets = 10,
            whetstone = 1,
        },
        workers = {
            sumatran_geologist = 4,
            sumatrans_carrier = 30,
            sumatran_carrier_1 = 10,
            sumatrans_builder = 5,
            sumatran_miner = 2,
            sumatran_miner_master = 2,
            sumatran_woodcutter = 3,
            sumatran_forester = 4,
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
            sumatran_winemaker = 1,
         },
         -- Max health: 3, Max attack: 3, Max defense: 3, Max evade: 1
         soldiers = {
            [{0,0,0,0}] = 40,
         }
      })

      -- Get all warehouse types
      local warehouse_types = {}
      for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
         if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
         end
      end
      -- Get all ware sorts
      local ware_types = {}
      for i, ware in ipairs(wl.Game():get_tribe_description(player.tribe_name).wares) do
         table.insert(ware_types, ware.name)
      end

      -- idx index of a warehouse used to 'rotate' warehouses
      local idx = 1
      local invent_wh = 0
      local removed_wh = 0
      local title = _("Warehouse cleaned!")
      local heading = ""
      local text = ""

      for i=1,100000 do
         sleep(10000)

      -- collect all ~warehouses and pick one for an inventory
         local warehouses = {}
         for i, building_name in ipairs(warehouse_types) do
            warehouses = array_combine(warehouses, player:get_buildings(building_name))
         end

         if #warehouses > 0 then

         -- inventory in the warehouse with index idx, if out of range, starts from first warehouse
            if idx > #warehouses then
               idx = 1
            end

            local wh = warehouses[idx]
            for i, ware_type in ipairs(ware_types) do
               invent_wh = invent_wh + wh:get_wares(ware_type)
            end

            if invent_wh > 500 then
               for i, ware_type in ipairs(ware_types) do
                  wh:set_wares(ware_type, math.ceil(wh:get_wares(ware_type) * 3 / 4))
                  removed_wh = removed_wh + wh:get_wares(ware_type)
               end
               removed_wh = invent_wh - removed_wh
               invent_wh = invent_wh - removed_wh
            end

            if (removed_wh > 50) then
               print (player.number..": removed "..removed_wh.." items from warehouse "..idx.." of "..#warehouses.." (tidy warehouse)")

               heading = _("%1$s has been cleaned!"):bformat(wh.warehousename)
               -- TRANSLATORS: First placeholder is a number around 120, second placeholder is a number around 380.
               text = _(join_sentences(ngettext("%1$d item has been removed.", "%1$d items have been removed.", removed_wh), ngettext("%2$d item lefts.", "%2$d items left.", invent_wh))):bformat(removed_wh, invent_wh)
               send_to_inbox(player, title, text, {field = wh.fields[1], popup=false, icon = wh.descr.icon_name, heading = heading})

            end

            invent_wh = 0
            removed_wh = 0
            idx = idx + 1

      end
   end
end
}
pop_textdomain()
return init
