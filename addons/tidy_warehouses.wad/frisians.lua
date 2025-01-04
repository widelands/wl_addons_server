-- =======================================================================
--           Tidy Warehouses starting conditions for Frisians
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

   hq = prefilled_buildings(player, { "frisians_headquarters", sf.x, sf.y,
      wares = {
         log = 40,
         granite = 50,
         reed = 50,
         brick = 80,
         clay = 30,
         water = 10,
         fish = 10,
         meat = 10,
         fruit = 10,
         barley = 5,
         ration = 20,
         honey = 10,
         smoked_meat = 5,
         smoked_fish = 5,
         mead = 5,
         meal = 2,
         coal = 20,
         iron = 5,
         gold = 4,
         iron_ore = 10,
         bread_frisians = 15,
         honey_bread = 5,
         beer = 5,
         cloth = 5,
         fur = 10,
         fur_garment = 5,
         sword_short = 5,
         hammer = 10,
         fire_tongs = 2,
         bread_paddle = 2,
         kitchen_tools = 2,
         felling_ax = 3,
         needles = 1,
         basket = 2,
         pick = 5,
         shovel = 5,
         scythe = 3,
         hunting_spear = 2,
         fishing_net = 3,
      },
      workers = {
         frisians_blacksmith = 3,
         frisians_baker = 1,
         frisians_brewer = 1,
         frisians_builder = 10,
         frisians_charcoal_burner = 1,
         frisians_claydigger = 2,
         frisians_brickmaker = 2,
         frisians_carrier = 40,
         frisians_reed_farmer = 2,
         frisians_berry_farmer = 2,
         frisians_fruit_collector = 2,
         frisians_farmer = 1,
         frisians_landlady = 1,
         frisians_smoker = 1,
         frisians_geologist = 4,
         frisians_woodcutter = 3,
         frisians_beekeeper = 1,
         frisians_miner = 4,
         frisians_miner_master = 2,
         frisians_forester = 2,
         frisians_stonemason = 2,
         frisians_reindeer = 5,
         frisians_trainer = 3,
         frisians_seamstress_master = 1,
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
            invent_wh = wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("clay") + wh:get_wares("brick") + wh:get_wares("reed") + wh:get_wares("fur") + wh:get_wares("cloth") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("smoked_fish") + wh:get_wares("smoked_meat") + wh:get_wares("water") + wh:get_wares("fruit") + wh:get_wares("barley") + wh:get_wares("honey") + wh:get_wares("bread_frisians") + wh:get_wares("ration") + wh:get_wares("honey_bread") + wh:get_wares("meal") + wh:get_wares("beer") + wh:get_wares("mead") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scrap_iron") + wh:get_wares("scrap_metal_mixed") + wh:get_wares("fur_garment_old") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("fishing_net") + wh:get_wares("hunting_spear") + wh:get_wares("kitchen_tools") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("basket") + wh:get_wares("needles") + wh:get_wares("sword_short") + wh:get_wares("sword_long") + wh:get_wares("sword_broad") + wh:get_wares("sword_double") + wh:get_wares("fur_garment") + wh:get_wares("fur_garment_studded") + wh:get_wares("fur_garment_golden") + wh:get_wares("helmet") + wh:get_wares("helmet_golden")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("granite", math.ceil(wh:get_wares("granite") * 3 / 4))
               wh:set_wares("clay", math.ceil(wh:get_wares("clay") * 3 / 4))
               wh:set_wares("brick", math.ceil(wh:get_wares("brick") * 3 / 4))
               wh:set_wares("reed", math.ceil(wh:get_wares("reed") * 3 / 4))
               wh:set_wares("fur", math.ceil(wh:get_wares("fur") * 3 / 4))
               wh:set_wares("cloth", math.ceil(wh:get_wares("cloth") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("smoked_fish", math.ceil(wh:get_wares("smoked_fish") * 3 / 4))
               wh:set_wares("smoked_meat", math.ceil(wh:get_wares("smoked_meat") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("fruit", math.ceil(wh:get_wares("fruit") * 3 / 4))
               wh:set_wares("barley", math.ceil(wh:get_wares("barley") * 3 / 4))
               wh:set_wares("honey", math.ceil(wh:get_wares("honey") * 3 / 4))
               wh:set_wares("bread_frisians", math.ceil(wh:get_wares("bread_frisians") * 3 / 4))
               wh:set_wares("ration", math.ceil(wh:get_wares("ration") * 3 / 4))
               wh:set_wares("honey_bread", math.ceil(wh:get_wares("honey_bread") * 3 / 4))
               wh:set_wares("meal", math.ceil(wh:get_wares("meal") * 3 / 4))
               wh:set_wares("beer", math.ceil(wh:get_wares("beer") * 3 / 4))
               wh:set_wares("mead", math.ceil(wh:get_wares("mead") * 3 / 4))
               wh:set_wares("coal", math.ceil(wh:get_wares("coal") * 3 / 4))
               wh:set_wares("iron_ore", math.ceil(wh:get_wares("iron_ore") * 3 / 4))
               wh:set_wares("iron", math.ceil(wh:get_wares("iron") * 3 / 4))
               wh:set_wares("gold_ore", math.ceil(wh:get_wares("gold_ore") * 3 / 4))
               wh:set_wares("gold", math.ceil(wh:get_wares("gold") * 3 / 4))
               wh:set_wares("scrap_iron", math.ceil(wh:get_wares("scrap_iron") * 3 / 4))
               wh:set_wares("scrap_metal_mixed", math.ceil(wh:get_wares("scrap_metal_mixed") * 3 / 4))
               wh:set_wares("fur_garment_old", math.ceil(wh:get_wares("fur_garment_old") * 3 / 4))
               wh:set_wares("scythe", math.ceil(wh:get_wares("scythe") * 3 / 4))
               wh:set_wares("pick", math.ceil(wh:get_wares("pick") * 3 / 4))
               wh:set_wares("felling_ax", math.ceil(wh:get_wares("felling_ax") * 3 / 4))
               wh:set_wares("shovel", math.ceil(wh:get_wares("shovel") * 3 / 4))
               wh:set_wares("hammer", math.ceil(wh:get_wares("hammer") * 3 / 4))
               wh:set_wares("fishing_net", math.ceil(wh:get_wares("fishing_net") * 3 / 4))
               wh:set_wares("hunting_spear", math.ceil(wh:get_wares("hunting_spear") * 3 / 4))
               wh:set_wares("kitchen_tools", math.ceil(wh:get_wares("kitchen_tools") * 3 / 4))
               wh:set_wares("bread_paddle", math.ceil(wh:get_wares("bread_paddle") * 3 / 4))
               wh:set_wares("basket", math.ceil(wh:get_wares("basket") * 3 / 4))
               wh:set_wares("needles", math.ceil(wh:get_wares("needles") * 3 / 4))
               wh:set_wares("fire_tongs", math.ceil(wh:get_wares("fire_tongs") * 3 / 4))
               wh:set_wares("sword_short", math.ceil(wh:get_wares("sword_short") * 3 / 4))
               wh:set_wares("sword_long", math.ceil(wh:get_wares("sword_long") * 3 / 4))
               wh:set_wares("sword_broad", math.ceil(wh:get_wares("sword_broad") * 3 / 4))
               wh:set_wares("sword_double", math.ceil(wh:get_wares("sword_double") * 3 / 4))
               wh:set_wares("fur_garment", math.ceil(wh:get_wares("fur_garment") * 3 / 4))
               wh:set_wares("fur_garment_studded", math.ceil(wh:get_wares("fur_garment_studded") * 3 / 4))
               wh:set_wares("fur_garment_golden", math.ceil(wh:get_wares("fur_garment_golden") * 3 / 4))
               wh:set_wares("helmet", math.ceil(wh:get_wares("helmet") * 3 / 4))
               wh:set_wares("helmet_golden", math.ceil(wh:get_wares("helmet_golden") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("clay") + wh:get_wares("brick") + wh:get_wares("reed") + wh:get_wares("fur") + wh:get_wares("cloth") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("smoked_fish") + wh:get_wares("smoked_meat") + wh:get_wares("water") + wh:get_wares("fruit") + wh:get_wares("barley") + wh:get_wares("honey") + wh:get_wares("bread_frisians") + wh:get_wares("ration") + wh:get_wares("honey_bread") + wh:get_wares("meal") + wh:get_wares("beer") + wh:get_wares("mead") + wh:get_wares("coal") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("scrap_iron") + wh:get_wares("scrap_metal_mixed") + wh:get_wares("fur_garment_old") + wh:get_wares("scythe") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("fishing_net") + wh:get_wares("hunting_spear") + wh:get_wares("kitchen_tools") + wh:get_wares("bread_paddle") + wh:get_wares("fire_tongs") + wh:get_wares("basket") + wh:get_wares("needles") + wh:get_wares("sword_short") + wh:get_wares("sword_long") + wh:get_wares("sword_broad") + wh:get_wares("sword_double") + wh:get_wares("fur_garment") + wh:get_wares("fur_garment_studded") + wh:get_wares("fur_garment_golden") + wh:get_wares("helmet") + wh:get_wares("helmet_golden"))

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
