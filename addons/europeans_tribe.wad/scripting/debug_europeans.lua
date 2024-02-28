-- =======================================================================
--           Test script for debugging europeans tribe.
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
        player:allow_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_normal", "europeans_trainingscamp_advanced"}
    end
end

function forbid_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_trainingscamp_basic", "europeans_trainingscamp_normal", "europeans_trainingscamp_advanced"}
    end
end

function allow_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_battlearena_basic", "europeans_battlearena_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_3"}
    end
end

function forbid_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_battlearena_basic", "europeans_battlearena_level_1", "europeans_battlearena_level_2", "europeans_battlearena_level_3"}
    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_2", "europeans_well_level_3", "europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_farm_small_normal"}
        player:allow_buildings{"europeans_manufactory_normal", "europeans_charcoal_kiln_normal", "europeans_quarry_normal", "europeans_stonemasons_house_normal"}
        player:allow_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", "europeans_smelting_works_normal"}
        player:allow_buildings{"europeans_recruitement_center_normal", "europeans_trainingscamp_normal", "europeans_ferry_yard_normal", "europeans_shipyard_normal"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_2","europeans_well_level_3", "europeans_lumberjacks_house_normal", "europeans_foresters_house_normal", "europeans_farm_small_normal"}
        player:forbid_buildings{"europeans_manufactory_normal", "europeans_charcoal_kiln_normal", "europeans_quarry_normal", "europeans_stonemasons_house_normal"}
        player:forbid_buildings{"europeans_coalmine_level_3", "europeans_ironmine_level_3", "europeans_goldmine_level_3", "europeans_smelting_works_normal"}
        player:forbid_buildings{"europeans_recruitement_center_normal", "europeans_trainingscamp_normal", "europeans_ferry_yard_normal", "europeans_shipyard_normal"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_farm_small_advanced"}
        player:allow_buildings{"europeans_manufactory_advanced", "europeans_charcoal_kiln_advanced", "europeans_quarry_advanced", "europeans_stonemasons_house_advanced"}
        player:allow_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", "europeans_smelting_works_advanced"}
        player:allow_buildings{"europeans_recruitement_center_advanced", "europeans_trainingscamp_advanced", "europeans_ferry_yard_advanced", "europeans_shipyard_advanced"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_lumberjacks_house_advanced", "europeans_foresters_house_advanced", "europeans_farm_small_advanced"}
        player:forbid_buildings{"europeans_manufactory_advanced", "europeans_charcoal_kiln_advanced", "europeans_quarry_advanced", "europeans_stonemasons_house_advanced"}
        player:forbid_buildings{"europeans_coalmine_level_5", "europeans_ironmine_level_5", "europeans_goldmine_level_5", "europeans_smelting_works_advanced"}
        player:forbid_buildings{"europeans_recruitement_center_advanced", "europeans_trainingscamp_advanced", "europeans_ferry_yard_advanced", "europeans_shipyard_advanced"}
    end
end

pop_textdomain()
