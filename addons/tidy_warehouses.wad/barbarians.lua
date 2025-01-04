-- =======================================================================
--           Tidy Warehouses starting conditions for Barbarians
-- =======================================================================

include "scripting/infrastructure.lua"
include "scripting/richtext.lua"
include "scripting/messages.lua"

push_textdomain("tidy_warehouses.wad", true)

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

   hq = prefilled_buildings(player, { "barbarians_headquarters", sf.x, sf.y,
      wares = {
         ax = 5,
         bread_paddle = 2,
         blackwood = 32,
         cloth = 5,
         coal = 12,
         felling_ax = 4,
         fire_tongs = 2,
         fish = 6,
         fishing_rod = 2,
         gold = 4,
         grout = 12,
         hammer = 12,
         hunting_spear = 2,
         iron = 12,
         iron_ore = 5,
         kitchen_tools = 4,
         meal = 4,
         meat = 6,
         pick = 8,
         barbarians_bread = 8,
         ration = 12,
         granite = 40,
         scythe = 6,
         shovel = 4,
         snack = 3,
         reed = 24,
         log = 80,
      },
      workers = {
         barbarians_blacksmith = 2,
         barbarians_brewer = 1,
         barbarians_builder = 10,
         barbarians_charcoal_burner = 1,
         barbarians_carrier = 40,
         barbarians_gardener = 1,
         barbarians_geologist = 4,
         barbarians_lime_burner = 1,
         barbarians_lumberjack = 3,
         barbarians_miner = 4,
         barbarians_miner_master = 4,
         barbarians_ranger = 1,
         barbarians_stonemason = 2,
         barbarians_trainer = 3,
         barbarians_ox = 5,
      },
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
            invent_wh = wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("blackwood") + wh:get_wares("grout") + wh:get_wares("reed") + wh:get_wares("cloth") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("water") + wh:get_wares("wheat") + wh:get_wares("barbarians_bread") + wh:get_wares("beer") + wh:get_wares("beer_strong") + wh:get_wares("ration") + wh:get_wares("snack") + wh:get_wares("meal") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("fishing_rod") + wh:get_wares("hunting_spear") + wh:get_wares("kitchen_tools") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("ax") + wh:get_wares("ax_sharp") + wh:get_wares("ax_broad") + wh:get_wares("ax_bronze") + wh:get_wares("ax_battle") + wh:get_wares("ax_warriors") + wh:get_wares("helmet") + wh:get_wares("helmet_mask") + wh:get_wares("helmet_warhelm")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("granite", math.ceil(wh:get_wares("granite") * 3 / 4))
               wh:set_wares("blackwood", math.ceil(wh:get_wares("blackwood") * 3 / 4))
               wh:set_wares("grout", math.ceil(wh:get_wares("grout") * 3 / 4))
               wh:set_wares("reed", math.ceil(wh:get_wares("reed") * 3 / 4))
               wh:set_wares("cloth", math.ceil(wh:get_wares("cloth") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("wheat", math.ceil(wh:get_wares("wheat") * 3 / 4))
               wh:set_wares("barbarians_bread", math.ceil(wh:get_wares("barbarians_bread") * 3 / 4))
               wh:set_wares("beer", math.ceil(wh:get_wares("beer") * 3 / 4))
               wh:set_wares("beer_strong", math.ceil(wh:get_wares("beer_strong") * 3 / 4))
               wh:set_wares("ration", math.ceil(wh:get_wares("ration") * 3 / 4))
               wh:set_wares("snack", math.ceil(wh:get_wares("snack") * 3 / 4))
               wh:set_wares("meal", math.ceil(wh:get_wares("meal") * 3 / 4))
               wh:set_wares("coal", math.ceil(wh:get_wares("coal") * 3 / 4))
               wh:set_wares("iron_ore", math.ceil(wh:get_wares("iron_ore") * 3 / 4))
               wh:set_wares("iron", math.ceil(wh:get_wares("iron") * 3 / 4))
               wh:set_wares("gold_ore", math.ceil(wh:get_wares("gold_ore") * 3 / 4))
               wh:set_wares("gold", math.ceil(wh:get_wares("gold") * 3 / 4))
               wh:set_wares("scythe", math.ceil(wh:get_wares("scythe") * 3 / 4))
               wh:set_wares("pick", math.ceil(wh:get_wares("pick") * 3 / 4))
               wh:set_wares("felling_ax", math.ceil(wh:get_wares("felling_ax") * 3 / 4))
               wh:set_wares("shovel", math.ceil(wh:get_wares("shovel") * 3 / 4))
               wh:set_wares("hammer", math.ceil(wh:get_wares("hammer") * 3 / 4))
               wh:set_wares("fishing_rod", math.ceil(wh:get_wares("fishing_rod") * 3 / 4))
               wh:set_wares("hunting_spear", math.ceil(wh:get_wares("hunting_spear") * 3 / 4))
               wh:set_wares("kitchen_tools", math.ceil(wh:get_wares("kitchen_tools") * 3 / 4))
               wh:set_wares("bread_paddle", math.ceil(wh:get_wares("bread_paddle") * 3 / 4))
               wh:set_wares("fire_tongs", math.ceil(wh:get_wares("fire_tongs") * 3 / 4))
               wh:set_wares("ax", math.ceil(wh:get_wares("ax") * 3 / 4))
               wh:set_wares("ax_sharp", math.ceil(wh:get_wares("ax_sharp") * 3 / 4))
               wh:set_wares("ax_broad", math.ceil(wh:get_wares("ax_broad") * 3 / 4))
               wh:set_wares("ax_bronze", math.ceil(wh:get_wares("ax_bronze") * 3 / 4))
               wh:set_wares("ax_battle", math.ceil(wh:get_wares("ax_battle") * 3 / 4))
               wh:set_wares("ax_warriors", math.ceil(wh:get_wares("ax_warriors") * 3 / 4))
               wh:set_wares("helmet", math.ceil(wh:get_wares("helmet") * 3 / 4))
               wh:set_wares("helmet_mask", math.ceil(wh:get_wares("helmet_mask") * 3 / 4))
               wh:set_wares("helmet_warhelm", math.ceil(wh:get_wares("helmet_warhelm") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("blackwood") + wh:get_wares("grout") + wh:get_wares("reed") + wh:get_wares("cloth") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("water") + wh:get_wares("wheat") + wh:get_wares("barbarians_bread") + wh:get_wares("beer") + wh:get_wares("beer_strong") + wh:get_wares("ration") + wh:get_wares("snack") + wh:get_wares("meal") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("fishing_rod") + wh:get_wares("hunting_spear") + wh:get_wares("kitchen_tools") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("ax") + wh:get_wares("ax_sharp") + wh:get_wares("ax_broad") + wh:get_wares("ax_bronze") + wh:get_wares("ax_battle") + wh:get_wares("ax_warriors") + wh:get_wares("helmet") + wh:get_wares("helmet_mask") + wh:get_wares("helmet_warhelm"))

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
