-- =======================================================================
--                 Start conditions for Discovery
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Discovery (AI optimized)",
    -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
    tooltip = _"AI optimized starting condition, not for human player.",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
    
    launch_expeditions(player, {
        {
            granite = 24,
            log = 16,
            reed = 16,
            blackwood = 8,
            cloth = 8,
            grout = 8,
            quartz = 4,
            buckets = 2,
            europeans_lumberjack_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_farmer_basic = 4,
            europeans_forester_basic = 2,
            europeans_claydigger_basic = 1,
            europeans_worker_basic = 6,
            europeans_trainer_basic = 1,
            europeans_trader = 1,
            europeans_builder = 1,
            europeans_soldier = 4,
        },
        {
            granite = 24,
            log = 16,
            reed = 16,
            blackwood = 8,
            cloth = 8,
            grout = 8,
            quartz = 4,
            buckets = 2,
            europeans_lumberjack_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_farmer_basic = 4,
            europeans_forester_basic = 2,
            europeans_claydigger_basic = 1,
            europeans_worker_basic = 6,
            europeans_trainer_basic = 1,
            europeans_trader = 1,
            europeans_builder = 1,
            europeans_soldier = 4,
        },
        {
            granite = 24,
            log = 16,
            reed = 16,
            blackwood = 8,
            cloth = 8,
            grout = 8,
            quartz = 4,
            buckets = 2,
            europeans_lumberjack_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_farmer_basic = 4,
            europeans_forester_basic = 2,
            europeans_claydigger_basic = 1,
            europeans_worker_basic = 6,
            europeans_trainer_basic = 1,
            europeans_trader = 1,
            europeans_builder = 1,
            europeans_soldier = 4,
        },
    })
    
    player:forbid_buildings("all")
    player:allow_buildings{"europeans_guardhouse", "europeans_tower", "europeans_barrier", "europeans_castle", }
    player:allow_buildings{"europeans_tower_small", "europeans_tower_high", "europeans_outpost", "europeans_fortress", }
    player:allow_buildings{"europeans_sentry", "europeans_advanced_tower", "europeans_advanced_barrier", "europeans_advanced_castle", }
    player:allow_buildings{"europeans_port", }
    sleep(900000)
    player:allow_buildings{"europeans_lumberjacks_house_basic", "europeans_quarry_basic", }
    player:allow_buildings{"europeans_well_basic", "europeans_well_level_1", "europeans_farm_basic", }
    sleep(900000)
    player:allow_buildings{"europeans_clay_pit_basic", "europeans_foresters_house_basic", }
    player:allow_buildings{"europeans_sawmill_basic", "europeans_weaving_mill_basic", } 
    player:allow_buildings{"europeans_charcoal_kiln_basic", "europeans_stonemasons_house_basic", }
    sleep(1800000)
    player:allow_buildings{"europeans_lumberjacks_house_normal", "europeans_quarry_normal", }
    player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", "europeans_farm_normal", }
    player:allow_buildings{"europeans_clay_pit_normal", "europeans_foresters_house_normal", }
    player:allow_buildings{"europeans_sawmill_normal", "europeans_weaving_mill_normal", }
    player:allow_buildings{"europeans_charcoal_kiln_normal", "europeans_stonemasons_house_normal", }
    sleep(1800000)
    player:allow_buildings{"europeans_lumberjacks_house_advanced", "europeans_quarry_advanced", }
    player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6", "europeans_farm_advanced", }
    player:allow_buildings{"europeans_clay_pit_advanced", "europeans_foresters_house_advanced", }
    player:allow_buildings{"europeans_sawmill_advanced", "europeans_weaving_mill_advanced", }
    player:allow_buildings{"europeans_charcoal_kiln_advanced", "europeans_stonemasons_house_advanced", }
    sleep(1800000)
    launch_expeditions(player, {
        {
            buckets = 8,
            planks = 8,
            brick = 8,
            marble = 8,
            marble_column = 8,
            quartz = 8,
            diamond = 8,
            coin_wood = 32,
            europeans_farmer_basic = 2,
            europeans_worker_basic = 2,
            europeans_miner_basic = 6,
            europeans_trainer_basic = 4,
            europeans_trader = 3,
            europeans_builder = 3,
            europeans_soldier = 2,
        },
    })
    player:allow_buildings{"europeans_animal_farm_basic", "europeans_beekeepers_house_basic", }
    player:allow_buildings{"europeans_brewery_basic", "europeans_mill_basic", "europeans_bakery_basic", }
    sleep(1800000)
    player:allow_buildings{"europeans_scouts_house_basic", "europeans_market_small", }
    player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
    player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
    sleep(1800000)
    player:allow_buildings{"europeans_smelting_works_basic", "europeans_toolsmithy_basic", "europeans_recruitement_center_basic", "europeans_shipyard_basic", }
    player:allow_buildings{"europeans_shoemakers_house_basic", "europeans_tailors_house_basic", "europeans_weaponsmithy_basic", "europeans_trainingscamp_basic", "europeans_battlearena_basic", }
    sleep(1800000)
    player:allow_buildings{"europeans_animal_farm_normal", "europeans_beekeepers_house_normal", }
    player:allow_buildings{"europeans_brewery_normal", "europeans_mill_normal", "europeans_bakery_normal", }
    sleep(1800000)
    player:allow_buildings{"europeans_scouts_house_normal", "europeans_market_big", }
    player:allow_buildings{"europeans_coalmine_level_2", "europeans_ironmine_level_2", "europeans_goldmine_level_2", }
    player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", }
    sleep(1800000)
    player:allow_buildings{"europeans_smelting_works_normal", "europeans_toolsmithy_normal", "europeans_recruitement_center_normal", "europeans_shipyard_normal", }
    player:allow_buildings{"europeans_shoemakers_house_normal", "europeans_tailors_house_normal", "europeans_weaponsmithy_normal", "europeans_trainingscamp_normal", "europeans_battlearena_level_1", }
    sleep(1800000)
    player:allow_buildings{"europeans_animal_farm_advanced", "europeans_beekeepers_house_advanced", }
    player:allow_buildings{"europeans_brewery_advanced", "europeans_mill_advanced", "europeans_bakery_advanced", }
    sleep(1800000)
    player:allow_buildings{"europeans_scouts_house_advanced", "europeans_trading_post", }
    player:allow_buildings{"europeans_coalmine_level_4", "europeans_ironmine_level_4", "europeans_goldmine_level_4", }
    player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", }
    sleep(1800000)
    player:allow_buildings{"europeans_smelting_works_advanced", "europeans_toolsmithy_advanced", "europeans_recruitement_center_advanced", "europeans_shipyard_advanced", }
    player:allow_buildings{"europeans_shoemakers_house_advanced", "europeans_tailors_house_advanced", "europeans_weaponsmithy_advanced", "europeans_trainingscamp_advanced", "europeans_battlearena_level_2", "europeans_battlearena_level_3", }
    sleep(3600000)
    player:allow_buildings{"europeans_animal_farm_big", "europeans_store_small", "europeans_store_big", }
    sleep(1800000)
    place_ship_random(player, 64)
    if (map.waterway_max_length > 0) and (i == 0) then
        player:allow_buildings{"europeans_ferry_yard_basic", }
    end
    sleep(900000)
    place_ship_random(player, 64)
    if (map.waterway_max_length > 0) and (i == 4) then
        player:allow_buildings{"europeans_ferry_yard_normal", }
    end
    sleep(900000)
    place_ship_random(player, 64)
    if (map.waterway_max_length > 0) and (i == 8) then
        player:allow_buildings{"europeans_ferry_yard_advanced", }
    end

    -- Delay of 10 min between actions
    local time_min = 15
    
    for i = 0, 672 do
        if ((i + 32) % 32 == 0) then
            launch_expeditions(player, {
                {
                     log = 8,
                     reed = 8,
                     granite = 8,
                     blackwood = 8,
                     cloth = 8,
                     grout = 8,
                     quartz = 4,
                     planks = 4,
                     brick = 4,
                     marble = 4,
                     marble_column = 4,
                     diamond = 4,
                     europeans_builder = 2,
                     europeans_worker_basic = 2,
                     europeans_soldier = 8
                },
            })
        end
        
       -- Experimental actions
        if (i % 8 < 4) then
            balance_warehouse_wares(player)
            balance_workerhouse_workers(player)
        else
            reset_warehouse_policy(player)
        end
        
        if (i % 4 == 0) then
            for j, building in ipairs(player:get_buildings("europeans_guardhouse")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
            for j, building in ipairs(player:get_buildings("europeans_castle")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i % 4 == 1) then
            for j, building in ipairs(player:get_buildings("europeans_barrier")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
            for j, building in ipairs(player:get_buildings("europeans_tower")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i % 4 == 2) then
            for j, building in ipairs(player:get_buildings("europeans_tower_small")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
            for j, building in ipairs(player:get_buildings("europeans_fortress")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        elseif (i % 4 == 3) then
            for j, building in ipairs(player:get_buildings("europeans_tower_high")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
            for j, building in ipairs(player:get_buildings("europeans_outpost")) do
                if (j == 1) then
                    building:enhance(true)
                end
            end
        end
        
        sleep(time_min * 60000)
    end
end
}

pop_textdomain()
return init
