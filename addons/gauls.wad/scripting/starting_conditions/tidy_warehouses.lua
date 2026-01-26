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
   tooltip = _("Start with 360 items, 50 workers and 40 soldiers in your Headquarters. From time to time your workers do inventories. If there is more than 500 items in any of your warehouses, workers throw away one quarter of stock stored in such a warehouse."),
   func = function(player, shared_in_start)

      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

      hq = prefilled_buildings(player, { "gauls_headquarters", sf.x, sf.y,
      wares = {
            log = 58,
            reed = 42,
            granite = 40,
            brick = 33,
            planks = 22,
            cloth = 5,
            clay = 2,
            wheat = 7,
            wool = 9,
            smoked_meat = 3,
            smoked_fish = 3,
            barbarians_bread = 8,
            meal = 4,
            ration = 11,
            coal = 12,
            copper = 2,
            iron_ore = 5,
            iron = 12,
            gold_ore = 1,
            gold = 2,
            bronze = 2,
            spear = 10,
            pick = 8,
            felling_ax = 4,
            shovel = 10,
            hammer = 14,
            scythe = 5,
            fire_tongs = 2,
            kitchen_tools = 4,
            buckets = 3,
            flail = 1,
            fishing_net = 2,
            basket = 2,
            elixir = 6,
            potion = 1,
            tunic = 5,
        },
        workers = {
            gauls_geologist = 4,
            gauls_carrier = 30,
            gauls_carrier_1 = 10,
            gauls_builder = 5,
            gauls_miner = 2,
            gauls_miner_master = 2,
            gauls_woodcutter = 3,
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
            gauls_trainer = 3,
      },
         -- Max health: 3, Max attack: 2, Max defense: 3, Max evade: 2
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
