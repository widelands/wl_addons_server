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
   tooltip = _("Start with 360 items, 50 workers and 40 soldiers in your Headquarter. From time to time your workers do inventories. If there is more than 500 items in any of your warehouses, workers throw away one quarter of stock stored in such a warehouse."),
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
         granite = 40,
         reed = 42,
         brick = 72,
         clay = 2,
         fruit = 7,
         fish = 6,
         meat = 2,
         barley = 7,
         ration = 11,
         smoked_meat = 3,
         smoked_fish = 3,
         mead = 4,
         meal = 4,
         coal = 12,
         iron = 12,
         gold = 4,
         iron_ore = 5,
         bread_frisians = 8,
         honey_bread = 6,
         beer = 3,
         cloth = 5,
         fur = 4,
         fur_garment = 5,
         sword_short = 8,
         hammer = 14,
         basket = 2,
         fire_tongs = 2,
         bread_paddle = 2,
         kitchen_tools = 2,
         felling_ax = 3,
         needles = 1,
         pick = 5,
         shovel = 5,
         scythe = 4,
         hunting_spear = 2,
         fishing_net = 3,
      },
      workers = {
         frisians_blacksmith = 3,
         frisians_baker = 1,
         frisians_brewer = 1,
         frisians_builder = 5,
         frisians_charcoal_burner = 1,
         frisians_claydigger = 2,
         frisians_brickmaker = 2,
         frisians_carrier = 30,
         frisians_reed_farmer = 2,
         frisians_berry_farmer = 2,
         frisians_fruit_collector = 1,
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
