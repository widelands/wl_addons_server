-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Debug Europeans",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Only for debug purposes. No regular starting condition",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
        player:allow_buildings("all")
    end
          
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                log = 127,
                reed = 127,
                granite = 63,
                coal = 63,
                water = 31,
                cloth = 31,
                blackwood = 31,
                planks = 31,
                marble = 31,
                marble_column = 15,
                grout = 15,
                brick = 15,
                gold = 15,
                quartz = 15,
                diamond = 15,
                buckets = 31,
                basket = 31
            },
            workers = {
                europeans_geologist = 1,
                europeans_carrier = 32,
                europeans_builder = 16,
                europeans_lumberjack_basic = 12,
                europeans_forester_basic = 12,
                europeans_carpenter_basic = 6,
                europeans_claydigger_basic = 2,
                europeans_stonecutter_basic = 6,
                europeans_charcoal_burner_basic = 3,
                europeans_stonemason_basic = 3,
                europeans_farmer_basic = 24,
                europeans_weaver_basic = 2,
                europeans_breeder_basic = 6,
                europeans_beekeeper_basic = 2,
                europeans_brewer_basic = 4,
                europeans_miller_basic = 4,
                europeans_baker_basic = 4,
                europeans_miner_basic = 9,
                europeans_smelter_basic = 4,
                europeans_smith_basic = 4,
                europeans_trainer_basic = 6,
                europeans_trader = 6,
                europeans_shipwright_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 24,
          }
    })
    
    player:forbid_buildings("all")
    player:allow_buildings{"europeans_guardhouse", "europeans_tower", "europeans_castle", }
    
    for i = 0, 1000 do
    
        -- Time-dependent activation (gametime)
        if i == 0 then
            player:allow_buildings{"europeans_well_basic", "europeans_quarry_basic", "europeans_lumberjacks_house_basic", "europeans_foresters_house_basic", }
        end
        if i == 1 then
            player:allow_buildings{"europeans_well_level_1", "europeans_farm_medium_basic", }
        end
        if i == 2 then
            player:allow_buildings{"europeans_sawmill_basic", }
        end
        if i == 3 then
            player:allow_buildings{"europeans_weaving_mill_basic", }
        end
        if i == 4 then
            player:allow_buildings{"europeans_charcoal_kiln_basic", }
        end
        if i == 5 then
            player:allow_buildings{"europeans_stonemasons_house_basic", }
        end
        if i == 6 then
            player:allow_buildings{"europeans_farm_basic", }
        end
        if i == 7 then
            player:allow_buildings{"europeans_animal_farm_basic", }
        end
        if i == 8 then
            player:allow_buildings{"europeans_beekeepers_house_basic", }
        end
        if i == 9 then
            player:allow_buildings{"europeans_brewery_basic", }
        end
        if i == 10 then
            player:allow_buildings{"europeans_mill_basic", }
        end
        if i == 11 then
            player:allow_buildings{"europeans_tavern_basic", }
        end
        if i == 12 then
            player:allow_buildings{"europeans_coalmine_basic", "europeans_ironmine_basic", "europeans_goldmine_basic", }
        end
        if i == 13 then
            player:allow_buildings{"europeans_clay_pit_basic", }
        end
        if i == 14 then
            player:allow_buildings{"europeans_smelting_works_basic", }
        end
        if i == 15 then
            player:allow_buildings{"europeans_toolsmithy_basic", }
        end
        if i == 16 then
            player:allow_buildings{"europeans_armorsmithy_basic", }
        end
        if i == 17 then
            player:allow_buildings{"europeans_recruitement_center_basic", }
        end
        if i == 18 then
            player:allow_buildings{"europeans_market", }
        end
        if i == 19 then
            player:allow_buildings{"europeans_port", }
        end
        if i == 20 then
            player:allow_buildings{"europeans_shipyard_basic", "europeans_ferry_yard_basic", }
        end
        if i == 21 then
            player:allow_buildings{"europeans_trainingscamp_basic", }
        end
        if i == 22 then
            player:allow_buildings{"europeans_battlearena_basic", }
        end
        if i == 23 then
            player:allow_buildings{"europeans_quarry_normal", "europeans_stonemasons_house_normal", }
        end
        if i == 24 then
            player:allow_buildings{"europeans_well_level_2", "europeans_farm_medium_normal", }
        end
        if i == 25 then
            player:allow_buildings{"europeans_well_level_3", "europeans_farm_level_1", "europeans_farm_level_2", }
        end
        if i == 26 then
            player:allow_buildings{"europeans_animal_farm_level_1", "europeans_animal_farm_level_2", }
        end
        if i == 27 then
            player:allow_buildings{"europeans_brewery_normal", "europeans_tavern_level_1", "europeans_tavern_level_2", }
        end
        if i == 28 then
            player:allow_buildings{"europeans_coalmine_level_1", "europeans_ironmine_level_1", "europeans_goldmine_level_1", }
            player:allow_buildings{"europeans_coalmine_level_2", "europeans_ironmine_level_2", "europeans_goldmine_level_2", }
        end
        if i == 29 then
            player:allow_buildings{"europeans_quarry_advanced", "europeans_stonemasons_house_advanced", }
        end
        if i == 30 then
            player:allow_buildings{"europeans_well_level_4", "europeans_farm_medium_advanced", }
        end
        if i == 31 then
            player:allow_buildings{"europeans_well_level_5", "europeans_farm_level_3", "europeans_farm_level_4", }
        end
        if i == 32 then
            player:allow_buildings{"europeans_animal_farm_level_3", "europeans_animal_farm_level_4", }
        end
        if i == 33 then
            player:allow_buildings{"europeans_brewery_advanced", "europeans_brewery_winery", "europeans_inn_level_1", "europeans_inn_level_2", }
        end
        if i == 34 then
            player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", }
            player:allow_buildings{"europeans_coalmine_level_4", "europeans_ironmine_level_4", "europeans_goldmine_level_4", }
        end
        if i == 35 then
            player:allow_buildings{"europeans_well_level_6", "europeans_farm_level_5", "europeans_animal_farm_level_5", }
        end
        if i == 36 then
            player:allow_buildings{"europeans_smelting_works_normal", "europeans_toolsmithy_normal", "europeans_armorsmithy_normal", }
        end
        if i == 37 then
            player:allow_buildings{"europeans_battlearena_level_1", "europeans_trainingscamp_level_1", }
            player:allow_buildings{"europeans_battlearena_level_2", "europeans_trainingscamp_level_2", }
        end
        if i == 38 then
            player:allow_buildings{"europeans_recruitement_center_normal", }
        end
        if i == 39 then
            player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", }
        end
        if i == 40 then
            player:allow_buildings{"europeans_smelting_works_advanced", "europeans_toolsmithy_advanced", "europeans_armorsmithy_advanced", }
        end
        if i == 41 then
            player:allow_buildings{"europeans_battlearena_level_3", "europeans_trainingscamp_level_3", }
            player:allow_buildings{"europeans_battlearena_level_4", "europeans_trainingscamp_level_4", }
        end
        if i == 42 then
            player:allow_buildings{"europeans_recruitement_center_advanced", }
        end
        
        if i == 45 then
            player:allow_buildings{"europeans_warehouse_basic", "europeans_store", }
        end
        if i == 50 then
            player:allow_buildings{"europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_clay_pit_normal", "europeans_beekeepers_house_normal", "europeans_scouts_house_normal", }
            player:allow_buildings{"europeans_sawmill_normal", "europeans_charcoal_kiln_normal", "europeans_weaving_mill_normal", "europeans_mill_normal", "europeans_shipyard_normal", "europeans_ferry_yard_normal", }
        end
        if i == 60 then
            player:allow_buildings{"europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_clay_pit_advanced", "europeans_beekeepers_house_advanced", "europeans_scouts_house_advanced", }
            player:allow_buildings{"europeans_sawmill_advanced", "europeans_charcoal_kiln_advanced", "europeans_weaving_mill_advanced", "europeans_mill_advanced", "europeans_shipyard_advanced", "europeans_ferry_yard_advanced", }
        end
        
        -- Delay of 5 min between actions
        sleep(300000)
    end
end
}

pop_textdomain()
return init
