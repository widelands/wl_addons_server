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
   tooltip = _("Start with a basic Headquarter. From time to time your workers do inventories. If there is more than 500 items in any of your warehouses, workers throw away one quarter of stock stored in such a warehouse."),
-- If there is more than 100 workers in a warehouse, one quarter of workers in such a warehouse will leave you. (not implemented)
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
         -- Max health: 3, Max attack: 3, Max defense: 3, Max evade: 1
         soldiers = {
            [{0,0,0,0}] = 45,
         }
      })

      -- Get all warehouse types
      local warehouse_types = {}
      for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
         if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
         end
      end

      -- idx index of a warehouse used to 'rotate' warehouses
      local idx = 1
      local invent_wh = 0
      local removed_wh = 0
      local title = _("Warehouse cleaned!")
      local heading = ""
      local text = ""

      for i=1,300000 do
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
            invent_wh = wh:get_wares("log") + wh:get_wares("stone") + wh:get_wares("tropicalwood") + wh:get_wares("sandedwood") + wh:get_wares("palmleaves") + wh:get_wares("reed") + wh:get_wares("cloth") + wh:get_wares("crocodile_skin") + wh:get_wares("water") + wh:get_wares("cassavaroot") + wh:get_wares("cassavaleaves") + wh:get_wares("starch") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("eggs") + wh:get_wares("meal") + wh:get_wares("food_waste") + wh:get_wares("palm_wine") + wh:get_wares("diamond_raw") + wh:get_wares("diamond") + wh:get_wares("coal") + wh:get_wares("copper_ore") + wh:get_wares("copper") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("machete") + wh:get_wares("kitchen_tools") + wh:get_wares("fire_tongs") + wh:get_wares("buckets") + wh:get_wares("whetstone") + wh:get_wares("copper_sheet") + wh:get_wares("gold_sheet") + wh:get_wares("crocodile_jacket") + wh:get_wares("sumatran_spear") + wh:get_wares("armor_copper") + wh:get_wares("armor_golden") + wh:get_wares("shield_golden") + wh:get_wares("crocodile_shoes") + wh:get_wares("warriors_dress")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("stone", math.ceil(wh:get_wares("stone") * 3 / 4))
               wh:set_wares("tropicalwood", math.ceil(wh:get_wares("tropicalwood") * 3 / 4))
               wh:set_wares("sandedwood", math.ceil(wh:get_wares("sandedwood") * 3 / 4))
               wh:set_wares("palmleaves", math.ceil(wh:get_wares("palmleaves") * 3 / 4))
               wh:set_wares("reed", math.ceil(wh:get_wares("reed") * 3 / 4))
               wh:set_wares("cloth", math.ceil(wh:get_wares("cloth") * 3 / 4))
               wh:set_wares("crocodile_skin", math.ceil(wh:get_wares("crocodile_skin") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("cassavaroot", math.ceil(wh:get_wares("cassavaroot") * 3 / 4))
               wh:set_wares("cassavaleaves", math.ceil(wh:get_wares("cassavaleaves") * 3 / 4))
               wh:set_wares("starch", math.ceil(wh:get_wares("starch") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("eggs", math.ceil(wh:get_wares("eggs") * 3 / 4))
               wh:set_wares("meal", math.ceil(wh:get_wares("meal") * 3 / 4))
               wh:set_wares("food_waste", math.ceil(wh:get_wares("food_waste") * 3 / 4))
               wh:set_wares("palm_wine", math.ceil(wh:get_wares("palm_wine") * 3 / 4))
               wh:set_wares("diamond_raw", math.ceil(wh:get_wares("diamond_raw") * 3 / 4))
               wh:set_wares("diamond", math.ceil(wh:get_wares("diamond") * 3 / 4))
               wh:set_wares("coal", math.ceil(wh:get_wares("coal") * 3 / 4))
               wh:set_wares("copper_ore", math.ceil(wh:get_wares("copper_ore") * 3 / 4))
               wh:set_wares("copper", math.ceil(wh:get_wares("copper") * 3 / 4))
               wh:set_wares("iron_ore", math.ceil(wh:get_wares("iron_ore") * 3 / 4))
               wh:set_wares("iron", math.ceil(wh:get_wares("iron") * 3 / 4))
               wh:set_wares("gold_ore", math.ceil(wh:get_wares("gold_ore") * 3 / 4))
               wh:set_wares("gold", math.ceil(wh:get_wares("gold") * 3 / 4))
               wh:set_wares("pick", math.ceil(wh:get_wares("pick") * 3 / 4))
               wh:set_wares("felling_ax", math.ceil(wh:get_wares("felling_ax") * 3 / 4))
               wh:set_wares("shovel", math.ceil(wh:get_wares("shovel") * 3 / 4))
               wh:set_wares("hammer", math.ceil(wh:get_wares("hammer") * 3 / 4))
               wh:set_wares("machete", math.ceil(wh:get_wares("machete") * 3 / 4))
               wh:set_wares("kitchen_tools", math.ceil(wh:get_wares("kitchen_tools") * 3 / 4))
               wh:set_wares("fire_tongs", math.ceil(wh:get_wares("fire_tongs") * 3 / 4))
               wh:set_wares("buckets", math.ceil(wh:get_wares("buckets") * 3 / 4))
               wh:set_wares("whetstone", math.ceil(wh:get_wares("whetstone") * 3 / 4))
               wh:set_wares("copper_sheet", math.ceil(wh:get_wares("copper_sheet") * 3 / 4))
               wh:set_wares("gold_sheet", math.ceil(wh:get_wares("gold_sheet") * 3 / 4))
               wh:set_wares("crocodile_jacket", math.ceil(wh:get_wares("crocodile_jacket") * 3 / 4))
               wh:set_wares("sumatran_spear", math.ceil(wh:get_wares("sumatran_spear") * 3 / 4))
               wh:set_wares("armor_copper", math.ceil(wh:get_wares("armor_copper") * 3 / 4))
               wh:set_wares("armor_golden", math.ceil(wh:get_wares("armor_golden") * 3 / 4))
               wh:set_wares("shield_golden", math.ceil(wh:get_wares("shield_golden") * 3 / 4))
               wh:set_wares("crocodile_shoes", math.ceil(wh:get_wares("crocodile_shoes") * 3 / 4))
               wh:set_wares("warriors_dress", math.ceil(wh:get_wares("warriors_dress") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("stone") + wh:get_wares("tropicalwood") + wh:get_wares("sandedwood") + wh:get_wares("palmleaves") + wh:get_wares("reed") + wh:get_wares("cloth") + wh:get_wares("crocodile_skin") + wh:get_wares("water") + wh:get_wares("cassavaroot") + wh:get_wares("cassavaleaves") + wh:get_wares("starch") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("eggs") + wh:get_wares("meal") + wh:get_wares("food_waste") + wh:get_wares("palm_wine") + wh:get_wares("diamond_raw") + wh:get_wares("diamond") + wh:get_wares("coal") + wh:get_wares("copper_ore") + wh:get_wares("copper") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("machete") + wh:get_wares("kitchen_tools") + wh:get_wares("fire_tongs") + wh:get_wares("buckets") + wh:get_wares("whetstone") + wh:get_wares("copper_sheet") + wh:get_wares("gold_sheet") + wh:get_wares("crocodile_jacket") + wh:get_wares("sumatran_spear") + wh:get_wares("armor_copper") + wh:get_wares("armor_golden") + wh:get_wares("shield_golden") + wh:get_wares("crocodile_shoes") + wh:get_wares("warriors_dress"))

            invent_wh = invent_wh - removed_wh

            if (removed_wh > 50) then
               print (player.number..": removed "..removed_wh.." items from warehouse "..idx.." of "..#warehouses.." (tidy warehouse)")

               heading = _("%1$s has been cleaned!"):bformat(wh.warehousename)
               text = _("%1$d items have been removed, %2$d items left."):bformat(removed_wh, invent_wh)
               send_to_inbox(player, title, text, {field = wh.fields[1], popup=false, icon = wh.descr.icon_name, heading = heading})

            end

            idx = idx + 1

      end
   end
end
}
pop_textdomain()
return init
