-- =======================================================================
--           Tidy Warehouses starting conditions for Empire
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

   hq = prefilled_buildings(player, { "empire_headquarters", sf.x, sf.y,
      wares = {
         armor_helmet = 4,
         spear_wooden = 5,
         felling_ax = 6,
         bread_paddle = 2,
         basket = 2,
         empire_bread = 8,
         cloth = 5,
         coal = 12,
         fire_tongs = 2,
         fish = 6,
         fishing_rod = 2,
         flour = 4,
         gold = 4,
         grape = 4,
         hammer = 14,
         hunting_spear = 2,
         iron = 12,
         iron_ore = 5,
         kitchen_tools = 4,
         marble = 25,
         marble_column = 6,
         meal = 4,
         meat = 6,
         pick = 8,
         ration = 12,
         saw = 2,
         scythe = 5,
         shovel = 6,
         granite = 40,
         log = 30,
         water = 12,
         wheat = 4,
         wine = 8,
         planks = 45,
         wool = 2,
      },
      workers = {
         empire_armorsmith = 1,
         empire_brewer = 1,
         empire_builder = 10,
         empire_carrier = 40,
         empire_charcoal_burner = 1,
         empire_geologist = 4,
         empire_lumberjack = 3,
         empire_miner = 4,
         empire_stonemason = 2,
         empire_toolsmith = 2,
         empire_trainer = 3,
         empire_weaponsmith = 1,
         empire_donkey = 5,
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
            invent_wh = wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("planks") + wh:get_wares("flour") + wh:get_wares("wool") + wh:get_wares("cloth") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("water") + wh:get_wares("wheat") + wh:get_wares("empire_bread") + wh:get_wares("beer") + wh:get_wares("grape") + wh:get_wares("ration") + wh:get_wares("wine") + wh:get_wares("meal") + wh:get_wares("marble") + wh:get_wares("marble_column") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("fishing_rod") + wh:get_wares("hunting_spear") + wh:get_wares("kitchen_tools") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("basket") + wh:get_wares("saw") + wh:get_wares("spear_wooden") + wh:get_wares("spear") + wh:get_wares("spear_advanced") + wh:get_wares("spear_heavy") + wh:get_wares("spear_war") + wh:get_wares("armor_helmet") + wh:get_wares("armor") + wh:get_wares("armor_chain") + wh:get_wares("armor_gilded")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("granite", math.ceil(wh:get_wares("granite") * 3 / 4))
               wh:set_wares("planks", math.ceil(wh:get_wares("planks") * 3 / 4))
               wh:set_wares("flour", math.ceil(wh:get_wares("flour") * 3 / 4))
               wh:set_wares("wool", math.ceil(wh:get_wares("wool") * 3 / 4))
               wh:set_wares("cloth", math.ceil(wh:get_wares("cloth") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("wheat", math.ceil(wh:get_wares("wheat") * 3 / 4))
               wh:set_wares("empire_bread", math.ceil(wh:get_wares("empire_bread") * 3 / 4))
               wh:set_wares("beer", math.ceil(wh:get_wares("beer") * 3 / 4))
               wh:set_wares("grape", math.ceil(wh:get_wares("grape") * 3 / 4))
               wh:set_wares("ration", math.ceil(wh:get_wares("ration") * 3 / 4))
               wh:set_wares("wine", math.ceil(wh:get_wares("wine") * 3 / 4))
               wh:set_wares("meal", math.ceil(wh:get_wares("meal") * 3 / 4))
               wh:set_wares("marble", math.ceil(wh:get_wares("marble") * 3 / 4))
               wh:set_wares("marble_column", math.ceil(wh:get_wares("marble_column") * 3 / 4))
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
               wh:set_wares("basket", math.ceil(wh:get_wares("basket") * 3 / 4))
               wh:set_wares("saw", math.ceil(wh:get_wares("saw") * 3 / 4))
               wh:set_wares("fire_tongs", math.ceil(wh:get_wares("fire_tongs") * 3 / 4))
               wh:set_wares("spear_wooden", math.ceil(wh:get_wares("spear_wooden") * 3 / 4))
               wh:set_wares("spear", math.ceil(wh:get_wares("spear") * 3 / 4))
               wh:set_wares("spear_advanced", math.ceil(wh:get_wares("spear_advanced") * 3 / 4))
               wh:set_wares("spear_heavy", math.ceil(wh:get_wares("spear_heavy") * 3 / 4))
               wh:set_wares("spear_war", math.ceil(wh:get_wares("spear_war") * 3 / 4))
               wh:set_wares("armor_helmet", math.ceil(wh:get_wares("ax_warriors") * 3 / 4))
               wh:set_wares("armor", math.ceil(wh:get_wares("armor") * 3 / 4))
               wh:set_wares("armor_chain", math.ceil(wh:get_wares("armor_chain") * 3 / 4))
               wh:set_wares("armor_gilded", math.ceil(wh:get_wares("armor_gilded") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("planks") + wh:get_wares("flour") + wh:get_wares("wool") + wh:get_wares("cloth") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("water") + wh:get_wares("wheat") + wh:get_wares("empire_bread") + wh:get_wares("beer") + wh:get_wares("grape") + wh:get_wares("ration") + wh:get_wares("wine") + wh:get_wares("meal") + wh:get_wares("marble") + wh:get_wares("marble_column") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("fishing_rod") + wh:get_wares("hunting_spear") + wh:get_wares("kitchen_tools") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("basket") + wh:get_wares("saw") + wh:get_wares("spear_wooden") + wh:get_wares("spear") + wh:get_wares("spear_advanced") + wh:get_wares("spear_heavy") + wh:get_wares("spear_war") + wh:get_wares("armor_helmet") + wh:get_wares("armor") + wh:get_wares("armor_chain") + wh:get_wares("armor_gilded"))

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
