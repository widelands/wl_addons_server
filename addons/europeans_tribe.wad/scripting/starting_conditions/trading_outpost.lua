-- =======================================================================
--          Trading Outpost Starting Conditions for the Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _"Trading Outpost",
    -- TRANSLATORS: This is the tooltip for the "Trading Outpost" starting condition
    tooltip = _"If this player runs low on important wares, they will be replenished for free. Debug Mode.",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
     sf = shared_in_start
    else
     player:allow_workers("all")
    end

    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                water = 256,
                log = 192,
                granite = 64,
                blackwood = 32,
                planks = 32,
                reed = 32,
                cloth = 32,
                iron = 32,
                coal = 32,
                spidercloth = 32,
                marble = 32,
                quartz = 32,
                diamond = 24,
                gold = 4,
                shovel = 16,
                buckets = 10,
                basket = 8,
                pick = 6,
                fire_tongs = 4,
                hammer = 4,
                saw = 4,
                scythe = 4,
                bread_paddle = 2,
                fishing_net = 2,
                fishing_rod = 2,
                hook_pole = 2,
                hunting_bow = 2,
                hunting_spear = 2,
                milking_tongs = 2
            },
            workers = {
                europeans_carrier = 32,
                europeans_builder = 16,
                europeans_farmer_basic = 6,
                europeans_trainer_basic = 3,
                europeans_lumberjack_basic = 3,
                europeans_carpenter_basic = 2,
                europeans_stonecutter_basic = 2,
                europeans_stonemason_normal = 2,
                europeans_weaver_basic = 1,
                europeans_weaver_normal = 1,
                europeans_shipwright_basic = 1,
                europeans_fishbreeder_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 16,
          }
    })
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(6), {
    })

    -- Get all warehouse types
    local warehouse_types = {}
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "warehouse") then
            table.insert(warehouse_types, building.name)
        end
    end

    -- index of a warehouse we will add to. Used to 'rotate' warehouses
    local idx = 1

    for i = 1, 100000 do
        sleep(300000)

        -- collect all ~warehouses and pick one to insert the wares
        local warehouses = {}
        for i, building_name in ipairs(warehouse_types) do
            warehouses = array_combine(warehouses, player:get_buildings(building_name))
        end

        if #warehouses > 0 then
            -- adding to a warehouse with index idx, if out of range, adding to wh 1
            if idx > #warehouses then
                idx = 1
            end

            local wh = warehouses[idx]
            local added = 0
            if player:get_wares("water") < 2 then
                wh:set_wares("water", wh:get_wares("water") + 2)
                added = added + 1
            end
            if player:get_wares("log") < 2 then
                wh:set_wares("log", wh:get_wares("log") + 2)
                added = added + 1
            end
            if player:get_wares("granite") < 2 then
                wh:set_wares("granite", wh:get_wares("granite") + 2)
                added = added + 1
            end
            if player:get_wares("marble") < 2 then
                wh:set_wares("marble", wh:get_wares("marble") + 2)
                added = added + 1
            end
            if player:get_wares("ore") < 2 then
                wh:set_wares("ore", wh:get_wares("ore") + 2)
                added = added + 1
            end
            if player:get_wares("quartz") < 1 then
                wh:set_wares("quartz", wh:get_wares("quartz") + 1)
                added = added + 1
            end
            if player:get_wares("diamond") < 1 then
                wh:set_wares("diamond", wh:get_wares("diamond") + 1)
                added = added + 1
            end
            if (added > 0) then
                print (player.number..": "..added.." types of ware added to warehouse "..idx.." of "..#warehouses.." (cheating mode)")
            end
            idx = idx + 1
        end
    end
end
}

pop_textdomain()
return init
