-- =======================================================================
--           Tidy Warehouses starting conditions for Amazons
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

   hq = prefilled_buildings(player, { "amazons_headquarters", sf.x, sf.y,
      wares = {
         log = 100,
         granite = 40,
         quartz = 14,
         rope = 30,
         liana = 15,
         ironwood = 15,
         rubber = 15,
         balsa = 9,
         water = 20,
         fish = 10,
         meat = 10,
         cassavaroot = 15,
         ration = 5,
         coal = 12,
         gold = 4,
         amazons_bread = 5,
         chocolate = 6,
         hammer = 10,
         shovel = 5,
         cocoa_beans = 3,
         tunic = 5,
         chisel = 3,
         pick = 2,
         machete = 2,
         spear_wooden = 6,
         stone_bowl = 2,
         needles = 2,
         firestones = 3,
      },
      workers = {
         amazons_cook = 3,
         amazons_builder = 10,
         amazons_gold_digger = 1,
         amazons_gold_smelter = 1,
         amazons_carrier = 40,
         amazons_cassava_farmer = 3,
         amazons_cocoa_farmer = 3,
         amazons_stone_carver = 3,
         amazons_geologist = 4,
         amazons_woodcutter = 10,
         amazons_liana_cutter = 4,
         amazons_jungle_preserver = 5,
         amazons_jungle_master = 3,
         amazons_shipwright = 1,
         amazons_hunter_gatherer = 3,
         amazons_stonecutter = 2,
         amazons_trainer = 3,
         amazons_dressmaker = 1,
         amazons_tapir = 5,
         amazons_woodcutter_master = 3,
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
            invent_wh = wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("quartz") + wh:get_wares("balsa") + wh:get_wares("ironwood") + wh:get_wares("rubber") + wh:get_wares("liana") + wh:get_wares("rope") + wh:get_wares("water") + wh:get_wares("cassavaroot") + wh:get_wares("cocoa_beans") + wh:get_wares("amazons_bread") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("chocolate") + wh:get_wares("ration") + wh:get_wares("gold_dust") + wh:get_wares("gold") + wh:get_wares("coal") + wh:get_wares("stone_bowl") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("machete") + wh:get_wares("kitchen_tools") + wh:get_wares("chisel") + wh:get_wares("needles") + wh:get_wares("firestones") + wh:get_wares("spear_wooden") + wh:get_wares("spear_stone_tipped") + wh:get_wares("spear_hardened") + wh:get_wares("tunic") + wh:get_wares("vest_padded") + wh:get_wares("protector_padded") + wh:get_wares("armor_wooden") + wh:get_wares("helmet_wooden") + wh:get_wares("warriors_coat") + wh:get_wares("boots_sturdy") + wh:get_wares("boots_swift") + wh:get_wares("boots_hero")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("granite", math.ceil(wh:get_wares("granite") * 3 / 4))
               wh:set_wares("quartz", math.ceil(wh:get_wares("quartz") * 3 / 4))
               wh:set_wares("balsa", math.ceil(wh:get_wares("balsa") * 3 / 4))
               wh:set_wares("ironwood", math.ceil(wh:get_wares("ironwood") * 3 / 4))
               wh:set_wares("rubber", math.ceil(wh:get_wares("rubber") * 3 / 4))
               wh:set_wares("liana", math.ceil(wh:get_wares("liana") * 3 / 4))
               wh:set_wares("rope", math.ceil(wh:get_wares("rope") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("cassavaroot", math.ceil(wh:get_wares("cassavaroot") * 3 / 4))
               wh:set_wares("cocoa_beans", math.ceil(wh:get_wares("cocoa_beans") * 3 / 4))
               wh:set_wares("amazons_bread", math.ceil(wh:get_wares("amazons_bread") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("chocolate", math.ceil(wh:get_wares("chocolate") * 3 / 4))
               wh:set_wares("ration", math.ceil(wh:get_wares("ration") * 3 / 4))
               wh:set_wares("gold_dust", math.ceil(wh:get_wares("gold_dust") * 3 / 4))
               wh:set_wares("gold", math.ceil(wh:get_wares("gold") * 3 / 4))
               wh:set_wares("coal", math.ceil(wh:get_wares("coal") * 3 / 4))
               wh:set_wares("stone_bowl", math.ceil(wh:get_wares("stone_bowl") * 3 / 4))
               wh:set_wares("pick", math.ceil(wh:get_wares("pick") * 3 / 4))
               wh:set_wares("felling_ax", math.ceil(wh:get_wares("felling_ax") * 3 / 4))
               wh:set_wares("shovel", math.ceil(wh:get_wares("shovel") * 3 / 4))
               wh:set_wares("hammer", math.ceil(wh:get_wares("hammer") * 3 / 4))
               wh:set_wares("machete", math.ceil(wh:get_wares("machete") * 3 / 4))
               wh:set_wares("kitchen_tools", math.ceil(wh:get_wares("kitchen_tools") * 3 / 4))
               wh:set_wares("chisel", math.ceil(wh:get_wares("chisel") * 3 / 4))
               wh:set_wares("needles", math.ceil(wh:get_wares("needles") * 3 / 4))
               wh:set_wares("firestones", math.ceil(wh:get_wares("firestones") * 3 / 4))
               wh:set_wares("spear_wooden", math.ceil(wh:get_wares("spear_wooden") * 3 / 4))
               wh:set_wares("spear_stone_tipped", math.ceil(wh:get_wares("spear_stone_tipped") * 3 / 4))
               wh:set_wares("spear_hardened", math.ceil(wh:get_wares("spear_hardened") * 3 / 4))
               wh:set_wares("tunic", math.ceil(wh:get_wares("tunic") * 3 / 4))
               wh:set_wares("vest_padded", math.ceil(wh:get_wares("vest_padded") * 3 / 4))
               wh:set_wares("protector_padded", math.ceil(wh:get_wares("protector_padded") * 3 / 4))
               wh:set_wares("armor_wooden", math.ceil(wh:get_wares("armor_wooden") * 3 / 4))
               wh:set_wares("helmet_wooden", math.ceil(wh:get_wares("helmet_wooden") * 3 / 4))
               wh:set_wares("warriors_coat", math.ceil(wh:get_wares("warriors_coat") * 3 / 4))
               wh:set_wares("boots_sturdy", math.ceil(wh:get_wares("boots_sturdy") * 3 / 4))
               wh:set_wares("boots_swift", math.ceil(wh:get_wares("boots_swift") * 3 / 4))
               wh:set_wares("boots_hero", math.ceil(wh:get_wares("boots_hero") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("quartz") + wh:get_wares("balsa") + wh:get_wares("ironwood") + wh:get_wares("rubber") + wh:get_wares("liana") + wh:get_wares("rope") + wh:get_wares("water") + wh:get_wares("cassavaroot") + wh:get_wares("cocoa_beans") + wh:get_wares("amazons_bread") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("chocolate") + wh:get_wares("ration") + wh:get_wares("gold_dust") + wh:get_wares("gold") + wh:get_wares("coal") + wh:get_wares("stone_bowl") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("machete") + wh:get_wares("kitchen_tools") + wh:get_wares("chisel") + wh:get_wares("needles") + wh:get_wares("firestones") + wh:get_wares("spear_wooden") + wh:get_wares("spear_stone_tipped") + wh:get_wares("spear_hardened") + wh:get_wares("tunic") + wh:get_wares("vest_padded") + wh:get_wares("protector_padded") + wh:get_wares("armor_wooden") + wh:get_wares("helmet_wooden") + wh:get_wares("warriors_coat") + wh:get_wares("boots_sturdy") + wh:get_wares("boots_swift") + wh:get_wares("boots_hero"))

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
