-- =======================================================================
--           Test script for debugging.
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

-- following functions are only for debugging europeans tribe --
function allow_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_guardhouse", "europeans_tower_small", "europeans_blockhouse", "europeans_sentry"}
        player:allow_buildings{"europeans_barrier", "europeans_outpost", "europeans_advanced_barrier"}
        player:allow_buildings{"europeans_tower", "europeans_tower_high", "europeans_advanced_tower"}
        player:allow_buildings{"europeans_castle", "europeans_fortress", "europeans_advanced_castle"}
    end
end

function forbid_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_guardhouse", "europeans_tower_small", "europeans_blockhouse", "europeans_sentry"}
        player:forbid_buildings{"europeans_barrier", "europeans_outpost", "europeans_advanced_barrier"}
        player:forbid_buildings{"europeans_tower", "europeans_tower_high", "europeans_advanced_tower"}
        player:forbid_buildings{"europeans_castle", "europeans_fortress", "europeans_advanced_castle"}
    end
end

function allow_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_level_1", "europeans_trainingscamp_level_2", "europeans_trainingscamp_level_3", "europeans_trainingscamp_level_4"}
    end
end

function forbid_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_level_1", "europeans_trainingscamp_level_2", "europeans_trainingscamp_level_3", "europeans_trainingscamp_level_4"}
    end
end

function allow_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_battlearena_basic", "europeans_battlearena_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_3", "europeans_battlearena_level_4"}
    end
end

function forbid_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_battlearena_basic", "europeans_battlearena_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_3", "europeans_battlearena_level_4"}
    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", "europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_quarry_normal", "europeans_fishers_house_normal", "europeans_hunters_house_normal", "europeans_scouts_house_normal"}
        player:allow_buildings{"europeans_sawmill_normal", "europeans_lumberjacks_house_normal", "europeans_charcoal_kiln_normal", "europeans_stonemasons_house", "europeans_mill_normal", "europeans_tavern_level_3", "europeans_brewery_normal", "europeans_smelting_works_normal", "europeans_toolsmithy_normal", "europeans_armorsmithy_normal"}
        player:allow_buildings{"europeans_recruitement_center_normal", "europeans_farm_level_2", "europeans_sheepfarm", "europeans_weaving_mill_normal", "europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_2","europeans_well_level_3", "europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_quarry_normal", "europeans_fishers_house_normal", "europeans_hunters_house_normal", "europeans_scouts_house_normal"}
        player:forbid_buildings{"europeans_sawmill_normal", "europeans_lumberjacks_house_normal", "europeans_charcoal_kiln_normal", "europeans_stonemasons_house", "europeans_mill_normal", "europeans_tavern_level_3", "europeans_brewery_normal", "europeans_smelting_works_normal", "europeans_toolsmithy_normal", "europeans_armorsmithy_normal"}
        player:forbid_buildings{"europeans_recruitement_center_normal", "europeans_farm_level_2", "europeans_sheepfarm", "europeans_weaving_mill_normal", "europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_quarry_advanced", "europeans_fishers_house_advanced", "europeans_hunters_house_advanced", "europeans_scouts_house_advanced"}
        player:allow_buildings{"europeans_sawmill_advanced", "europeans_lumberjacks_house_advanced", "europeans_charcoal_kiln_advanced", "europeans_stonemasons_house", "europeans_mill_advanced", "europeans_inn_basic", "europeans_brewery_advanced", "europeans_smelting_works_advanced", "europeans_toolsmithy_advanced", "europeans_armorsmithy_advanced"}
        player:allow_buildings{"europeans_recruitement_center_advanced", "europeans_farm_level_3", "europeans_sheepfarm", "europeans_weaving_mill_advanced", "europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_quarry_advanced", "europeans_fishers_house_advanced", "europeans_hunters_house_advanced", "europeans_scouts_house_advanced"}
        player:forbid_buildings{"europeans_sawmill_advanced", "europeans_lumberjacks_house_advanced", "europeans_charcoal_kiln_advanced", "europeans_stonemasons_house", "europeans_mill_advanced", "europeans_inn_basic", "europeans_brewery_advanced", "europeans_smelting_works_advanced", "europeans_toolsmithy_advanced", "europeans_armorsmithy_advanced"}
        player:forbid_buildings{"europeans_recruitement_center_advanced", "europeans_farm_level_3", "europeans_sheepfarm", "europeans_weaving_mill_advanced", "europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5"}
    end
end

pop_textdomain()
