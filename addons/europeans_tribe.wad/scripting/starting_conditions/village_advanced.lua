-- =======================================================================
--                 Europeans Fortified Village Starting Conditions
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Advanced Village",
    -- TRANSLATORS: This is the tooltip for the "Fortified Village" starting condition
    tooltip = _"Start the game with a fortified village with advanced castle in its center. Useful starting condition for the AI.",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
      sf = shared_in_start
    else
      player:allow_workers("all")
    end

    local h = player:place_building("europeans_advanced_castle", sf, false, true)
    h:set_soldiers{[{2,2,2,2}] = 18}
      
    place_building_in_region(player, "europeans_warehouse_advanced", sf:region(2), {
        wares = {
            log = 127,
            reed = 63,
            granite = 63,
            coal = 63,
            water = 31,
            ore = 31,
            cloth = 31,
            blackwood = 31,
            planks = 15,
            marble = 15,
            marble_column = 15,
            iron = 7,
            gold = 7,
            quartz = 15,
            diamond = 15,
            buckets = 15,
            basket = 15,
            pick = 12,
            saw = 12,
            hammer = 12,
            scythe = 12,
            shovel = 9,
            felling_ax = 9,
            fire_tongs = 7,
            needles = 3,
            bread_paddle = 3,
            hook_pole = 3,
            kitchen_tools = 3,
            armor = 7,
            tabard = 7,
            spear_wooden = 7
        },
        workers = {
            europeans_carrier = 32,
            europeans_builder = 16,
            europeans_farmer_basic = 16,
            europeans_lumberjack_basic = 8,
            europeans_breeder_basic = 6,
            europeans_miner_basic = 6,
            europeans_forester_basic = 6,
            europeans_stonecutter_basic = 6,
            europeans_trainer_basic = 4,
            europeans_carpenter_basic = 2,
            europeans_charcoal_burner_basic = 2,
            europeans_smith_basic = 2,
            europeans_stonemason_basic = 2,
            europeans_brewer_basic = 1,
            europeans_miller_basic = 1,
            europeans_baker_basic = 1,
            europeans_smelter_basic = 1,
            europeans_weaver_basic = 1,
            europeans_claydigger_basic = 1
      },
        soldiers = {
            [{0,0,0,0}] = 16,
      }
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_4", sf:region(10), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_4", sf:region(10), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_4", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_4", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_level_3", sf:region(16), {
        inputs = {water = 6},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_level_3", sf:region(16), {
        inputs = {water = 6},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_medium_advanced", sf:region(12), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_medium_advanced", sf:region(12), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_quarry_advanced", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_lumberjacks_house_advanced", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_foresters_house_advanced", sf:region(12), {
        inputs = {water = 6},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_lumberjacks_house_advanced", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_foresters_house_advanced", sf:region(12), {
        inputs = {water = 6},
    })
    
    -- run script for 8760 hours of gametime = 1 year
    for i = 1, 35040 do
        -- Delay of 15 min between actions, 4 loops = 1 hour of gametime
        sleep(900000)
        
        -- Activate the script after 6 hours of gametime
        if i > 24 then
            -- dismantle buildings automatically, that are stopped
            dismantle_stopped_buildings(player)
            -- enhance productionssites automatically, which productivity is lower than 25 %
            enhance_idle_buildings(player, 25)
            -- enhance productionssites automatically, which productivity is lower than 5 %
            dismantle_idle_buildings(player, 5)
        end
    end
end
}

pop_textdomain()
return init
