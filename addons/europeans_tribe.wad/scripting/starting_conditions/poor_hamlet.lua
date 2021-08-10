-- =======================================================================
--                Minimum Starting conditions for europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Poor Hamlet",
    -- TRANSLATORS: This is the tooltip for the "Poor Hamlet" (minimum) starting condition
    tooltip = _"Start the game with just a warehouse and the bare minimum for bootstrapping an economy. Warning: the AI can’t successfully start from this.",
    func =  function(player, shared_in_start)
    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end

    -- forbid all advanced buildings, execpt for advanced quarry and stonemasons house, because of production of brick, grout and quartz for trainingsites
    player:forbid_buildings{"europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_hunters_house_advanced", "europeans_fishers_house_advanced", "europeans_well_advanced"}
    player:forbid_buildings{"europeans_farm_level_3", "europeans_brewery_advanced", "europeans_brewery_winery", "europeans_mill_advanced", "europeans_inn_level_2", "europeans_inn_level_1", "europeans_inn_basic"}
    player:forbid_buildings{"europeans_charcoal_kiln_advanced", "europeans_sawmill_advanced", "europeans_smelting_works_advanced", "europeans_weaving_mill_advanced" }
    player:forbid_buildings{"europeans_smithy_level_9", "europeans_smithy_level_8", "europeans_smithy_level_7", "europeans_trainingscamp_level_4", "europeans_battlearena_level_4", "europeans_battlearena_level_3"}    
    player:forbid_buildings{"europeans_scouts_house_advanced", "europeans_ferry_yard_advanced", "europeans_shipyard_advanced", "europeans_recruitement_center_advanced"}    
    
    -- forbid all normal buildings, execpt for farm level 1 and weaving mill, because of production of spidercloth for tools and tabard for soldiers
    player:forbid_buildings{"europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_hunters_house_normal", "europeans_fishers_house_normal", "europeans_well_normal"}
    player:forbid_buildings{"europeans_farm_level_2", "europeans_brewery_normal", "europeans_mill_normal", "europeans_tavern_level_5", "europeans_tavern_level_4"}
    player:forbid_buildings{"europeans_charcoal_kiln_normal", "europeans_sawmill_normal", "europeans_smelting_works_normal"}
    player:forbid_buildings{"europeans_smithy_level_6", "europeans_smithy_level_5", "europeans_smithy_level_4", "europeans_trainingscamp_level_3", "europeans_trainingscamp_level_2", "europeans_trainingscamp_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_1"}    
    player:forbid_buildings{"europeans_scouts_house_normal", "europeans_ferry_yard_normal", "europeans_shipyard_normal", "europeans_recruitement_center_normal"}    
        
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            water = 48,
            log = 48,
            reed = 32,
            blackwood = 16,
            planks = 16,
            cloth = 16,
            granite = 16,
            coal = 16,
            iron = 16,
            spidercloth = 8,
            marble = 8,
            marble_column = 8,
            quartz = 8,
            gold = 2
        },
        workers = {
            europeans_carrier = 16,
            europeans_farmer_basic = 8,
            europeans_builder = 6,
            europeans_miner_basic = 4,
            europeans_lumberjack_basic = 2,
            europeans_forester_basic = 1,
            europeans_carpenter_basic = 1,
            europeans_stonecutter_basic = 1,
            europeans_stonemason_basic = 1,
            europeans_hunter_basic = 1,
            europeans_fisher_basic = 1,
            europeans_fishbreeder_basic = 1,
            europeans_breeder_normal = 1,
            europeans_weaver_basic = 1,
            europeans_smith_basic = 1,
            europeans_trainer_basic = 1
      },
        soldiers = {
            [{0,0,0,0}] = 2,
      }
    })
    
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(6), {
    })

    player:reveal_fields(sf:region(10))
    player:conquer(sf, 9)

    push_textdomain("europeans_tribe.wad", true)
    player:send_to_inbox(_"Be careful", _"You have only one iron for each tool you will need to start your economy. Make sure no unneeded tool is created.")
    pop_textdomain()

    check_trees_rocks_poor_hamlet(player, sf, "europeans_headquarters", {granite = 1}, {log = 1, planks = 1, granite = 1})
      
    -- Get all trainingsite types
    local trainingsite_types = {}
    local trainingsites = {}
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "trainingsite") then
            table.insert(trainingsite_types, building.name)
        end
    end
    
    for i = 1, 1000 do
        -- Delay of 15 min between actions
        sleep(900000)
        
        -- Allow all normal buildings after 6 hours of game
        if i >= 24 then
            player:forbid_buildings{"europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_hunters_house_normal", "europeans_fishers_house_normal", "europeans_well_normal"}
            player:forbid_buildings{"europeans_farm_level_2", "europeans_brewery_normal", "europeans_mill_normal", "europeans_tavern_level_5", "europeans_tavern_level_4"}
            player:forbid_buildings{"europeans_charcoal_kiln_normal", "europeans_sawmill_normal", "europeans_smelting_works_normal"}
            player:forbid_buildings{"europeans_smithy_level_4", "europeans_smithy_level_5", "europeans_smithy_level_6", "europeans_trainingscamp_level_3", "europeans_trainingscamp_level_2", "europeans_trainingscamp_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_1"}    
            player:forbid_buildings{"europeans_scouts_house_normal", "europeans_ferry_yard_normal", "europeans_shipyard_normal", "europeans_recruitement_center_normal"}    
        end 
        
        -- Allow all (advanced) buildings after 12 hours of game
        if i >= 48 then
           player:allow_buildings("all")
        end
    end
end
}

pop_textdomain()
return init
