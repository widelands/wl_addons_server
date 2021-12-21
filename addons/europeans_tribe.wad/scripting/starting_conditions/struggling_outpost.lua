-- =======================================================================
--                Hardcore Starting conditions for europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Struggling Outpost",
    -- TRANSLATORS: This is the tooltip for the "Hardcore" starting condition
    tooltip = _"Start the game with just your headquarters and very few wares for bootstrapping an economy. Warning: the AI can’t successfully start from this.",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
    
    -- forbid all advanced buildings, execpt for quarry and stonemasons house
    player:forbid_buildings{"europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_hunters_house_advanced", "europeans_fishers_house_advanced", "europeans_well_level_4", "europeans_well_level_5"}
    player:forbid_buildings{"europeans_farm_level_3", "europeans_brewery_advanced", "europeans_brewery_winery", "europeans_mill_advanced", "europeans_inn_level_2", "europeans_inn_level_1"}
    player:forbid_buildings{"europeans_charcoal_kiln_advanced", "europeans_sawmill_advanced", "europeans_smelting_works_advanced", "europeans_weaving_mill_advanced" }
    player:forbid_buildings{"europeans_toolsmithy_advanced", "europeans_armorsmithy_advanced", "europeans_trainingscamp_level_4", "europeans_battlearena_level_4", "europeans_battlearena_level_3"}    
    player:forbid_buildings{"europeans_scouts_house_advanced", "europeans_ferry_yard_advanced", "europeans_shipyard_advanced", "europeans_recruitement_center_advanced"}    
    
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            water = 63,
            log = 63,
            reed = 63,
            granite = 31,
            coal = 31,
            ore = 15,
            blackwood = 15,
            cloth = 15,
            planks = 15,
            spidercloth = 15,
            marble = 15,
            marble_column = 7,
            quartz = 7,
            diamond = 7,
            iron = 3,
            gold = 3,
            buckets = 15,
            basket = 12,
            pick = 7,
            saw = 7,
            hammer = 7,
            scythe = 5,
            shovel = 5,
            felling_ax = 5,
            fire_tongs = 5,
            milking_tongs = 3,
            needles = 3,
            bread_paddle = 3,
            hook_pole = 3,
            kitchen_tools = 3,
            fishing_net = 3,
            fishing_rod = 3,
            hunting_bow = 3,
            hunting_spear = 3,
            armor = 5,
            tabard = 5,
            spear_wooden = 5
        },
        workers = {
            europeans_carrier = 32,
            europeans_builder = 12,
            europeans_farmer_basic = 8,
            europeans_lumberjack_basic = 4,
            europeans_miner_basic = 4,
            europeans_forester_basic = 4,
            europeans_trainer_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_hunter_basic = 2,
            europeans_fisher_basic = 2,
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
            
        -- Allow all (advanced) buildings after 6 hours of game
        if i >= 24 then
           player:allow_buildings("all")
        end 
    end
end
}

pop_textdomain()
return init
