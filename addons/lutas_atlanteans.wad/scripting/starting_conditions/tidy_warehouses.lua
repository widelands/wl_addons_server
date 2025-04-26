-- =======================================================================
--           Tidy Warehouses starting conditions for Lutas’ Atlanteans
-- =======================================================================

include "scripting/infrastructure.lua"
include "scripting/richtext.lua"
include "scripting/messages.lua"

push_textdomain("lutas_atlanteans.wad", true)

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

   prefilled_buildings(player, { "lutas_atlanteans_headquarters", sf.x, sf.y,
      wares = {
         diamond = 7,
         iron_ore = 5,
         quartz = 8,
         granite = 50,
         spider_silk = 9,
         log = 20,
         coal = 12,
         gold = 4,
         gold_thread = 6,
         iron = 8,
         planks = 45,
         spidercloth = 5,
         blackroot = 5,
         blackroot_flour = 12,
         atlanteans_bread = 8,
         corn = 5,
         cornmeal = 12,
         fish = 3,
         meat = 3,
         smoked_fish = 6,
         smoked_meat = 6,
         water = 12,
         bread_paddle = 2,
         buckets = 2,
         fire_tongs = 2,
         fishing_net = 4,
         hammer = 11,
         hunting_bow = 1,
         spider_tongs = 2,
         hook_pole = 2,
         pick = 8,
         saw = 8,
         scythe = 4,
         shovel = 9,
         tabard = 5,
         trident_light = 5,
      },
      workers = {
         lutas_atlanteans_armorsmith = 1,
         lutas_atlanteans_blackroot_farmer = 1,
         lutas_atlanteans_builder = 10,
         lutas_atlanteans_charcoal_burner = 1,
         lutas_atlanteans_carrier = 40,
         lutas_atlanteans_fishbreeder = 1,
         lutas_atlanteans_geologist = 4,
         lutas_atlanteans_miner = 4,
         lutas_atlanteans_sawyer = 1,
         lutas_atlanteans_stonecutter = 2,
         lutas_atlanteans_toolsmith = 2,
         lutas_atlanteans_trainer = 3,
         lutas_atlanteans_weaponsmith = 1,
         lutas_atlanteans_woodcutter = 3,
         lutas_atlanteans_horse = 5,
      },
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
            invent_wh = wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("planks") + wh:get_wares("spider_silk") + wh:get_wares("spidercloth") + wh:get_wares("fish") + wh:get_wares("smoked_fish") + wh:get_wares("meat") + wh:get_wares("smoked_meat") + wh:get_wares("water") + wh:get_wares("corn") + wh:get_wares("cornmeal") + wh:get_wares("blackroot") + wh:get_wares("blackroot_flour") + wh:get_wares("atlanteans_bread") + wh:get_wares("quartz") + wh:get_wares("diamond") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("saw") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("spider_tongs") + wh:get_wares("fishing_net") + wh:get_wares("buckets") + wh:get_wares("hunting_bow") + wh:get_wares("hook_pole") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("trident_light") + wh:get_wares("trident_long") + wh:get_wares("trident_steel") + wh:get_wares("trident_diamond_double") + wh:get_wares("trident_heavy_double") + wh:get_wares("shield_steel") + wh:get_wares("shield_advanced") + wh:get_wares("tabard") + wh:get_wares("gold_thread") + wh:get_wares("tabard_golden")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("granite", math.ceil(wh:get_wares("granite") * 3 / 4))
               wh:set_wares("planks", math.ceil(wh:get_wares("planks") * 3 / 4))
               wh:set_wares("spider_silk", math.ceil(wh:get_wares("spider_silk") * 3 / 4))
               wh:set_wares("spidercloth", math.ceil(wh:get_wares("spidercloth") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("smoked_fish", math.ceil(wh:get_wares("smoked_fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("smoked_meat", math.ceil(wh:get_wares("smoked_meat") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("corn", math.ceil(wh:get_wares("corn") * 3 / 4))
               wh:set_wares("cornmeal", math.ceil(wh:get_wares("cornmeal") * 3 / 4))
               wh:set_wares("blackroot", math.ceil(wh:get_wares("blackroot") * 3 / 4))
               wh:set_wares("blackroot_flour", math.ceil(wh:get_wares("blackroot_flour") * 3 / 4))
               wh:set_wares("atlanteans_bread", math.ceil(wh:get_wares("atlanteans_bread") * 3 / 4))
               wh:set_wares("quartz", math.ceil(wh:get_wares("quartz") * 3 / 4))
               wh:set_wares("diamond", math.ceil(wh:get_wares("diamond") * 3 / 4))
               wh:set_wares("coal", math.ceil(wh:get_wares("coal") * 3 / 4))
               wh:set_wares("iron_ore", math.ceil(wh:get_wares("iron_ore") * 3 / 4))
               wh:set_wares("iron", math.ceil(wh:get_wares("iron") * 3 / 4))
               wh:set_wares("gold_ore", math.ceil(wh:get_wares("gold_ore") * 3 / 4))
               wh:set_wares("gold", math.ceil(wh:get_wares("gold") * 3 / 4))
               wh:set_wares("scythe", math.ceil(wh:get_wares("scythe") * 3 / 4))
               wh:set_wares("pick", math.ceil(wh:get_wares("pick") * 3 / 4))
               wh:set_wares("saw", math.ceil(wh:get_wares("saw") * 3 / 4))
               wh:set_wares("shovel", math.ceil(wh:get_wares("shovel") * 3 / 4))
               wh:set_wares("hammer", math.ceil(wh:get_wares("hammer") * 3 / 4))
               wh:set_wares("milking_tongs", math.ceil(wh:get_wares("spider_tongs") * 3 / 4))
               wh:set_wares("fishing_net", math.ceil(wh:get_wares("fishing_net") * 3 / 4))
               wh:set_wares("buckets", math.ceil(wh:get_wares("buckets") * 3 / 4))
               wh:set_wares("hunting_bow", math.ceil(wh:get_wares("hunting_bow") * 3 / 4))
               wh:set_wares("hook_pole", math.ceil(wh:get_wares("hook_pole") * 3 / 4))
               wh:set_wares("bread_paddle", math.ceil(wh:get_wares("bread_paddle") * 3 / 4))
               wh:set_wares("fire_tongs", math.ceil(wh:get_wares("fire_tongs") * 3 / 4))
               wh:set_wares("trident_light", math.ceil(wh:get_wares("trident_light") * 3 / 4))
               wh:set_wares("trident_long", math.ceil(wh:get_wares("trident_long") * 3 / 4))
               wh:set_wares("trident_steel", math.ceil(wh:get_wares("trident_steel") * 3 / 4))
               wh:set_wares("trident_double", math.ceil(wh:get_wares("trident_diamond_double") * 3 / 4))
               wh:set_wares("trident_heavy_double", math.ceil(wh:get_wares("trident_heavy_double") * 3 / 4))
               wh:set_wares("shield_steel", math.ceil(wh:get_wares("shield_steel") * 3 / 4))
               wh:set_wares("shield_advanced", math.ceil(wh:get_wares("shield_advanced") * 3 / 4))
               wh:set_wares("tabard", math.ceil(wh:get_wares("tabard") * 3 / 4))
               wh:set_wares("gold_thread", math.ceil(wh:get_wares("gold_thread") * 3 / 4))
               wh:set_wares("tabard_golden", math.ceil(wh:get_wares("tabard_golden") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("planks") + wh:get_wares("spider_silk") + wh:get_wares("spidercloth") + wh:get_wares("fish") + wh:get_wares("smoked_fish") + wh:get_wares("meat") + wh:get_wares("smoked_meat") + wh:get_wares("water") + wh:get_wares("corn") + wh:get_wares("cornmeal") + wh:get_wares("blackroot") + wh:get_wares("blackroot_flour") + wh:get_wares("atlanteans_bread") + wh:get_wares("quartz") + wh:get_wares("diamond") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("saw") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("spider_tongs") + wh:get_wares("fishing_net") + wh:get_wares("buckets") + wh:get_wares("hunting_bow") + wh:get_wares("hook_pole") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("trident_light") + wh:get_wares("trident_long") + wh:get_wares("trident_steel") + wh:get_wares("trident_diamond_double") + wh:get_wares("trident_heavy_double") + wh:get_wares("shield_steel") + wh:get_wares("shield_advanced") + wh:get_wares("tabard") + wh:get_wares("gold_thread") + wh:get_wares("tabard_golden"))

            invent_wh = invent_wh - removed_wh

            if (removed_wh > 50) then
               print (player.number..": removed "..removed_wh.." items from warehouse "..idx.." of "..#warehouses.." (tidy warehouse)")

               heading = _("%1$s has been cleaned!"):bformat(wh.warehousename)
               -- TRANSLATORS: First placeholder is a number around 120, second placeholder is a number around 380.
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
