-- =======================================================================
--                Hardcore Starting conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Struggling Outpost",
    -- TRANSLATORS: This is the tooltip for the "Hardcore" starting condition
    tooltip = _"Start the game with just your headquarters and very few wares for bootstrapping an economy. Warning: the AI can’t successfully start from this. Disabled seafaring because of lack of compatibility with terraforming (diking of water bodies).",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_port", "europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced", }
    
    -- forbid all advanced buildings
    player:forbid_buildings{"europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_well_level_4", "europeans_well_level_5", }
    player:forbid_buildings{"europeans_farm_advanced", "europeans_animal_farm_advanced", }
    player:forbid_buildings{"europeans_brewery_advanced", "europeans_brewery_winery", "europeans_mill_advanced", "europeans_bakery_advanced", }
    player:forbid_buildings{"europeans_charcoal_kiln_advanced", "europeans_sawmill_advanced", "europeans_smelting_works_advanced", "europeans_weaving_mill_advanced", }
    player:forbid_buildings{"europeans_toolsmithy_advanced", "europeans_weaponsmithy_advanced", "europeans_tailors_house_advanced", "europeans_shoemakers_house_advanced" }
    player:forbid_buildings{"europeans_scouts_house_advanced", "europeans_recruitement_center_advanced", "europeans_trainingscamp_advanced", "europeans_battlearena_level_3" }
    
    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            log = 64,
            reed = 64,
            coal = 32,
            granite = 24,
            blackwood = 16,
            cloth = 16,
            grout = 16,
            water = 16,
            ore = 8,
            planks = 8,
            brick = 8,
            marble = 8,
            marble_column = 4,
            iron = 4,
            gold = 4,
            quartz = 8,
            diamond = 8,
            buckets = 8,
            basket = 8,
            armor_wooden = 4,
            boots_wooden = 4,
            helmet_wooden = 4,
            spear_wooden = 4
        },
        workers = {
            europeans_geologist = 1,
            europeans_carrier = 16,
            europeans_builder = 16,
            europeans_worker_basic = 12,
            europeans_farmer_basic = 12,
            europeans_miner_basic = 6,
            europeans_trader = 4,
            europeans_trainer_basic = 4,
            europeans_lumberjack_basic = 2,
            europeans_forester_basic = 2,
            europeans_stonecutter_basic = 1,
            europeans_claydigger_basic = 1,
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
