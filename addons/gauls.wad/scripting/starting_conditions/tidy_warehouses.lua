-- =======================================================================
--           Tidy Warehouses starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"
include "scripting/richtext.lua"
include "scripting/messages.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Tidy Warehouses"),
   -- TRANSLATORS: This is the tooltip for the "Tidy Warehouses" starting condition
   tooltip = _("Start with a basic Headquarter. From time to time your workers do inventories. If there is more than 500 items in any of your warehouses, workers throw away one quarter of stock stored in such a warehouse."),

   func = function(player, shared_in_start)

      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

      hq = prefilled_buildings(player, { "gauls_headquarters", sf.x, sf.y,
      wares = {
            log = 59,
            reed = 42,
            granite = 33,
            water = 6,
            brick = 21,
            planks = 23,
            cloth = 5,
            clay = 2,
            straw = 1,
            wool = 3,
            smoked_meat = 2,
            smoked_fish = 3,
            fish = 1,
            barbarians_bread = 8,
            meal = 4,
            milk = 2,
            ration = 12,
            coal = 12,
            copper = 2,
            iron_ore = 5,
            iron = 11,
            gold_ore = 1,
            gold = 2,
            bronze = 2,
            spear = 4,
            pick = 6,
            felling_ax = 4,
            shovel = 5,
            hammer = 10,
            scythe = 4,
            fire_tongs = 2,
            kitchen_tools = 4,
            buckets = 3,
            flail = 1,
            fishing_net = 2,
            basket = 2,
            elixir = 4,
            tunic = 5
        },
        workers = {
            gauls_geologist = 4,
            gauls_carrier = 40,
            gauls_carrier_1 = 10,
            gauls_builder = 10,
            gauls_miner = 2,
            gauls_miner_master = 2,
            gauls_woodcutter = 3,
            gauls_forester = 4,
            gauls_water_carrier = 2,
            gauls_hunter = 1,
            gauls_farmer = 3,
            gauls_toiler = 1,
            gauls_cook = 1,
            gauls_charcoal_burner = 1,
            gauls_smelter = 1,
            gauls_breeder = 1,
            gauls_gardener = 2,
            gauls_craftsman = 1,
            gauls_blacksmith = 1,
            gauls_stonecutter = 2,
            gauls_claydigger = 2,
            gauls_brickmaker = 1,
            gauls_druid = 3,
            gauls_trainer = 2,
      },
         -- Max health: 3, Max attack: 2, Max defense: 3, Max evade: 2
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
            invent_wh = wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("planks") + wh:get_wares("clay") + wh:get_wares("brick") + wh:get_wares("reed") + wh:get_wares("wool") + wh:get_wares("cloth") + wh:get_wares("water") + wh:get_wares("straw") + wh:get_wares("wheat_sheaf") + wh:get_wares("wheat") + wh:get_wares("flour") + wh:get_wares("barbarians_bread") + wh:get_wares("fruit") + wh:get_wares("milk") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("smoked_fish") + wh:get_wares("smoked_meat") + wh:get_wares("ration") + wh:get_wares("meal") + wh:get_wares("herbs") + wh:get_wares("vegetable") + wh:get_wares("tin_ore") + wh:get_wares("bronze") + wh:get_wares("coal") + wh:get_wares("copper_ore") + wh:get_wares("copper") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("scythe") + wh:get_wares("kitchen_tools") + wh:get_wares("fire_tongs") + wh:get_wares("buckets") + wh:get_wares("basket") + wh:get_wares("flail") + wh:get_wares("fishing_net") + wh:get_wares("elixir") + wh:get_wares("potion") + wh:get_wares("tunic") + wh:get_wares("spear") + wh:get_wares("armor_chain") + wh:get_wares("armor_bronze") + wh:get_wares("helmet_golden") + wh:get_wares("shield_wooden") + wh:get_wares("shield_bronze") + wh:get_wares("sword_short") + wh:get_wares("sword_long")

            if invent_wh > 500 then
               wh:set_wares("log", math.ceil(wh:get_wares("log") * 3 / 4))
               wh:set_wares("granite", math.ceil(wh:get_wares("granite") * 3 / 4))
               wh:set_wares("planks", math.ceil(wh:get_wares("planks") * 3 / 4))
               wh:set_wares("clay", math.ceil(wh:get_wares("clay") * 3 / 4))
               wh:set_wares("brick", math.ceil(wh:get_wares("brick") * 3 / 4))
               wh:set_wares("reed", math.ceil(wh:get_wares("reed") * 3 / 4))
               wh:set_wares("wool", math.ceil(wh:get_wares("wool") * 3 / 4))
               wh:set_wares("cloth", math.ceil(wh:get_wares("cloth") * 3 / 4))
               wh:set_wares("water", math.ceil(wh:get_wares("water") * 3 / 4))
               wh:set_wares("straw", math.ceil(wh:get_wares("straw") * 3 / 4))
               wh:set_wares("wheat_sheaf", math.ceil(wh:get_wares("wheat_sheaf") * 3 / 4))
               wh:set_wares("wheat", math.ceil(wh:get_wares("wheat") * 3 / 4))
               wh:set_wares("flour", math.ceil(wh:get_wares("flour") * 3 / 4))
               wh:set_wares("barbarians_bread", math.ceil(wh:get_wares("barbarians_bread") * 3 / 4))
               wh:set_wares("fruit", math.ceil(wh:get_wares("fruit") * 3 / 4))
               wh:set_wares("milk", math.ceil(wh:get_wares("milk") * 3 / 4))
               wh:set_wares("fish", math.ceil(wh:get_wares("fish") * 3 / 4))
               wh:set_wares("meat", math.ceil(wh:get_wares("meat") * 3 / 4))
               wh:set_wares("smoked_fish", math.ceil(wh:get_wares("smoked_fish") * 3 / 4))
               wh:set_wares("smoked_meat", math.ceil(wh:get_wares("smoked_meat") * 3 / 4))
               wh:set_wares("ration", math.ceil(wh:get_wares("ration") * 3 / 4))
               wh:set_wares("meal", math.ceil(wh:get_wares("meal") * 3 / 4))
               wh:set_wares("herbs", math.ceil(wh:get_wares("herbs") * 3 / 4))
               wh:set_wares("vegetable", math.ceil(wh:get_wares("vegetable") * 3 / 4))
               wh:set_wares("tin_ore", math.ceil(wh:get_wares("tin_ore") * 3 / 4))
               wh:set_wares("bronze", math.ceil(wh:get_wares("bronze") * 3 / 4))
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
               wh:set_wares("scythe", math.ceil(wh:get_wares("scythe") * 3 / 4))
               wh:set_wares("kitchen_tools", math.ceil(wh:get_wares("kitchen_tools") * 3 / 4))
               wh:set_wares("fire_tongs", math.ceil(wh:get_wares("fire_tongs") * 3 / 4))
               wh:set_wares("buckets", math.ceil(wh:get_wares("buckets") * 3 / 4))
               wh:set_wares("basket", math.ceil(wh:get_wares("basket") * 3 / 4))
               wh:set_wares("flail", math.ceil(wh:get_wares("flail") * 3 / 4))
               wh:set_wares("fishing_net", math.ceil(wh:get_wares("fishing_net") * 3 / 4))
               wh:set_wares("elixir", math.ceil(wh:get_wares("elixir") * 3 / 4))
               wh:set_wares("potion", math.ceil(wh:get_wares("potion") * 3 / 4))
               wh:set_wares("tunic", math.ceil(wh:get_wares("tunic") * 3 / 4))
               wh:set_wares("spear", math.ceil(wh:get_wares("spear") * 3 / 4))
               wh:set_wares("armor_chain", math.ceil(wh:get_wares("armor_chain") * 3 / 4))
               wh:set_wares("armor_bronze", math.ceil(wh:get_wares("armor_bronze") * 3 / 4))
               wh:set_wares("helmet_golden", math.ceil(wh:get_wares("helmet_golden") * 3 / 4))
               wh:set_wares("shield_wooden", math.ceil(wh:get_wares("shield_wooden") * 3 / 4))
               wh:set_wares("shield_bronze", math.ceil(wh:get_wares("shield_bronze") * 3 / 4))
               wh:set_wares("sword_short", math.ceil(wh:get_wares("sword_short") * 3 / 4))
               wh:set_wares("sword_long", math.ceil(wh:get_wares("sword_long") * 3 / 4))
            end

            removed_wh = invent_wh - (wh:get_wares("log") + wh:get_wares("granite") + wh:get_wares("planks") + wh:get_wares("clay") + wh:get_wares("brick") + wh:get_wares("reed") + wh:get_wares("wool") + wh:get_wares("cloth") + wh:get_wares("water") + wh:get_wares("straw") + wh:get_wares("wheat_sheaf") + wh:get_wares("wheat") + wh:get_wares("flour") + wh:get_wares("barbarians_bread") + wh:get_wares("fruit") + wh:get_wares("milk") + wh:get_wares("fish") + wh:get_wares("meat") + wh:get_wares("smoked_fish") + wh:get_wares("smoked_meat") + wh:get_wares("ration") + wh:get_wares("meal") + wh:get_wares("herbs") + wh:get_wares("vegetable") + wh:get_wares("tin_ore") + wh:get_wares("bronze") + wh:get_wares("coal") + wh:get_wares("copper_ore") + wh:get_wares("copper") + wh:get_wares("iron_ore") + wh:get_wares("iron") + wh:get_wares("gold_ore") + wh:get_wares("gold") + wh:get_wares("pick") + wh:get_wares("felling_ax") + wh:get_wares("shovel") + wh:get_wares("hammer") + wh:get_wares("scythe") + wh:get_wares("kitchen_tools") + wh:get_wares("fire_tongs") + wh:get_wares("buckets") + wh:get_wares("basket") + wh:get_wares("flail") + wh:get_wares("fishing_net") + wh:get_wares("elixir") + wh:get_wares("potion") + wh:get_wares("tunic") + wh:get_wares("spear") + wh:get_wares("armor_chain") + wh:get_wares("armor_bronze") + wh:get_wares("helmet_golden") + wh:get_wares("shield_wooden") + wh:get_wares("shield_bronze") + wh:get_wares("sword_short") + wh:get_wares("sword_long"))

            invent_wh = invent_wh - removed_wh

            if (removed_wh > 50) then
               print (player.number..": removed "..removed_wh.." items from warehouse "..idx.." of "..#warehouses.." (tidy warehouse)")

               heading = _("%1$s has been cleaned!"):bformat(wh.warehousename)
               -- TRANSLATORS: First placeholder is a number around 120, second placeholder is a number around 380.
               text = _(join_sentences(ngettext("%1$d item has been removed.", "%1$d items have been removed.", removed_wh), ngettext("%2$d item lefts.", "%2$d items left.", invent_wh))):bformat(removed_wh, invent_wh)
               send_to_inbox(player, title, text, {field = wh.fields[1], popup=false, icon = wh.descr.icon_name, heading = heading})

            end

            idx = idx + 1

      end
   end
end
}
pop_textdomain()
return init
