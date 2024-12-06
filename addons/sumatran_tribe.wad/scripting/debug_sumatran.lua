-- =======================================================================
--           Test script for debugging Sumatran tribe.
-- =======================================================================

include "addons/sumatran_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("sumatran_tribe.wad", true)

-- following functions are only for debugging sumatran tribe --
function allow_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "sumatrans" then
        player:allow_buildings{"sumatran_guard_post", "sumatran_sentry_small", "sumatran_sentry_big"}
        player:allow_buildings{"sumatran_watchtower", "sumatran_fort"}
        player:allow_buildings{"sumatran_fortified_tower"}
    end
end

function forbid_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "sumatrans" then
        player:forbid_buildings{"sumatran_guard_post", "sumatran_sentry_small", "sumatran_sentry_big"}
        player:forbid_buildings{"sumatran_watchtower", "sumatran_fort"}
        player:forbid_buildings{"sumatran_fortified_tower"}
    end
end

function allow_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "sumatrans" then
        player:allow_buildings{"sumatran_tribal_gathering"}
    end
end

function forbid_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "sumatrans" then
        player:forbid_buildings{"sumatran_tribal_gathering"}
    end
end

function allow_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "sumatrans" then
        player:allow_buildings{"sumatran_training_camp", "sumatran_hunting_camp"} -- , "sumatran_hunting_camp"}
    end
end

function forbid_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "sumatrans" then
        player:forbid_buildings{"sumatran_training_camp", "sumatran_hunting_camp"} -- , "sumatran_hunting_camp"}

    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "sumatrans" then
        player:allow_buildings{"sumatran_palm_planters_hut", "sumatran_jungle_preservers_hut", "sumatran_woodscutters_house"}
        player:allow_buildings{"sumatran_stonecutters_hut", "sumatran_water_carriers_hut", "sumatran_leaves_gatherers_hut" }
        player:allow_buildings{"sumatran_hunters_tent", "sumatran_scouts_dwelling", "sumatran_thermal_springs" }
        player:allow_buildings{"sumatran_reed_yard", "sumatran_workshop_basic", "sumatran_sewing_workshop", "sumatran_furnace" }
        player:allow_buildings{"sumatran_coppersmiths_house", "sumatran_winery", "sumatran_cassava_kithen", "sumatran_charcoal_kiln"}
        player:allow_buildings{"sumatran_cassava_fields", "sumatran_chickens_farm", "sumatran_weaving_mill", "sumatran_jungle_marsh"}
        player:allow_buildings{"sumatran_ferry_yard", "sumatran_shipyard"}
--        player:allow_buildings{sumatran_tribal_gathering, "sumatran_training_camp", "sumatran_hunting_camp"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "sumatrans" then
        player:forbid_buildings{"sumatran_palm_planters_hut", "sumatran_jungle_preservers_hut", "sumatran_woodscutters_house"}
        player:forbid_buildings{"sumatran_stonecutters_hut", "sumatran_water_carriers_hut", "sumatran_leaves_gatherers_hut" }
        player:forbid_buildings{"sumatran_hunters_tent", "sumatran_scouts_dwelling", "sumatran_thermal_springs" }
        player:forbid_buildings{"sumatran_reed_yard", "sumatran_workshop_basic", "sumatran_sewing_workshop", "sumatran_furnace" }
        player:forbid_buildings{"sumatran_coppersmiths_house", "sumatran_winery", "sumatran_cassava_kithen", "sumatran_charcoal_kiln"}
        player:forbid_buildings{"sumatran_cassava_fields", "sumatran_chickens_farm", "sumatran_weaving_mill", "sumatran_jungle_marsh"}
        player:forbid_buildings{"sumatran_ferry_yard", "sumatran_shipyard"}
--        player:forbid_buildings{sumatran_tribal_gathering, "sumatran_training_camp", "sumatran_hunting_camp"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "sumatrans" then
        player:allow_buildings{"sumatran_hunters_house", "sumatran_workshop_tools", "sumatran_workshop_weapons", }
        player:allow_buildings{"sumatran_armorsmithy", "sumatran_kitchen", "sumatran_cassava_plantation"}
        player:allow_buildings{"sumatran_deep_stone_mine", "sumatran_deep_mixed_metal_mine", "sumatran_deep_gold_mine"}
        player:allow_buildings{"sumatran_fortified_tower"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "sumatrans" then
        player:forbid_buildings{"sumatran_hunters_house", "sumatran_workshop_tools", "sumatran_workshop_weapons", }
        player:forbid_buildings{"sumatran_armorsmithy", "sumatran_kitchen", "sumatran_cassava_plantation"}
        player:forbid_buildings{"sumatran_deep_stone_mine", "sumatran_deep_mixed_metal_mine", "sumatran_deep_gold_mine"}
        player:forbid_buildings{"sumatran_fortified_tower"}
    end
end

pop_textdomain()
