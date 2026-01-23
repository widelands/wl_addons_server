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
   tooltip = _("Start with 360 items, 50 workers and 40 soldiers in your Headquarter. From time to time your workers do inventories. If there is more than 500 items in any of your warehouses, workers throw away one quarter of stock stored in such a warehouse."),
   func = function(player, shared_in_start)

      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

   hq = prefilled_buildings(player, { "empire_headquarters", sf.x, sf.y,
      wares = {
         armor_helmet = 8,
         spear_wooden = 5,
         felling_ax = 6,
         bread_paddle = 2,
         basket = 2,
         beer = 3,
         empire_bread = 8,
         cloth = 5,
         coal = 12,
         fire_tongs = 2,
         fish = 6,
         fishing_rod = 2,
         flour = 13,
         gold = 4,
         hammer = 12,
         hunting_spear = 2,
         iron = 12,
         iron_ore = 5,
         kitchen_tools = 4,
         marble = 22,
         marble_column = 7,
         meal = 4,
         meat = 11,
         pick = 8,
         ration = 11,
         saw = 2,
         scythe = 6,
         shovel = 6,
         granite = 40,
         log = 58,
         water = 22,
         wheat = 7,
         wine = 10,
         grape = 4,
         planks = 27,
         wool = 2,
      },
      workers = {
         empire_armorsmith = 2,
         empire_brewer = 1,
         empire_builder = 10,
         empire_carrier = 30,
         empire_charcoal_burner = 1,
         empire_fisher = 1,
         empire_hunter = 1,
         empire_geologist = 4,
         empire_lumberjack = 3,
         empire_forester = 1,
         empire_vintner = 1,
         empire_miller = 1,
         empire_donkeybreeder = 1,
         empire_pigbreeder = 1,
         empire_miner = 4,
         empire_stonemason = 2,
         empire_toolsmith = 2,
         empire_trainer = 3,
         empire_weaponsmith = 1,
         empire_donkey = 10,
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
