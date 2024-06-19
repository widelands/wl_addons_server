-- =======================================================================
--           Test script for debugging europeans tribe.
-- =======================================================================

include "addons/europeans_main.wad/tribes/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

-- following functions are only for debugging europeans economy --
function set_seafaring(player_number, OnOff)
    local game = wl.Game()
    local player = game.players[player_number]
    
    if player then
        if OnOff == true then
             player:allow_buildings{player.tribe.port}
        elseif OnOff == false then
             player:forbid_buildings{player.tribe.port}
        end
    else
        for idx, player in ipairs(game.players) do
             if OnOff == true then
                 player:allow_buildings{player.tribe.port}
             elseif OnOff == false then
                 player:forbid_buildings{player.tribe.port}
             end
        end
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

function allow_basic_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_basic", "europeans_well_level_1"}
        player:allow_buildings{"europeans_coalmine_basic", "europeans_coalmine_level_1"}
        player:allow_buildings{"europeans_ironmine_basic", "europeans_ironmine_level_1"}
        player:allow_buildings{"europeans_goldmine_basic", "europeans_goldmine_level_1"}
        player:allow_buildings{"europeans_quarry_basic", "europeans_lumberjacks_house_basic", "europeans_tree_nursery_basic"}
        player:allow_buildings{"europeans_sawmill_basic", "europeans_stonemasons_house_basic"}
        player:allow_buildings{"europeans_charcoal_kiln_basic", "europeans_smelting_works_basic", "europeans_manufactory_basic"}
    end
end

function forbid_basic_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_basic", "europeans_well_level_1",}
        player:forbid_buildings{"europeans_coalmine_basic", "europeans_coalmine_level_1"}
        player:forbid_buildings{"europeans_ironmine_basic", "europeans_ironmine_level_1"}
        player:forbid_buildings{"europeans_goldmine_basic", "europeans_goldmine_level_1"}
        player:forbid_buildings{"europeans_quarry_basic", "europeans_lumberjacks_house_basic", "europeans_tree_nursery_basic"}
        player:forbid_buildings{"europeans_sawmill_basic", "europeans_stonemasons_house_basic"}
        player:forbid_buildings{"europeans_charcoal_kiln_basic", "europeans_smelting_works_basic", "europeans_manufactory_basic"}
    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_2","europeans_well_level_3"}
        player:allow_buildings{"europeans_coalmine_level_2", "europeans_coalmine_level_3"}
        player:allow_buildings{"europeans_ironmine_level_2", "europeans_ironmine_level_3"}
        player:allow_buildings{"europeans_goldmine_level_2", "europeans_goldmine_level_3"}
        player:allow_buildings{"europeans_quarry_normal", "europeans_lumberjacks_house_normal", "europeans_tree_nursery_normal"}
        player:allow_buildings{"europeans_sawmill_normal", "europeans_stonemasons_house_normal"}
        player:allow_buildings{"europeans_charcoal_kiln_normal", "europeans_smelting_works_normal", "europeans_manufactory_normal"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_2","europeans_well_level_3"}
        player:forbid_buildings{"europeans_coalmine_level_2", "europeans_coalmine_level_3"}
        player:forbid_buildings{"europeans_ironmine_level_2", "europeans_ironmine_level_3"}
        player:forbid_buildings{"europeans_goldmine_level_2", "europeans_goldmine_level_3"}
        player:forbid_buildings{"europeans_quarry_normal", "europeans_lumberjacks_house_normal", "europeans_tree_nursery_normal"}
        player:forbid_buildings{"europeans_sawmill_normal", "europeans_stonemasons_house_normal"}
        player:forbid_buildings{"europeans_charcoal_kiln_normal", "europeans_smelting_works_normal", "europeans_manufactory_normal"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6"}
        player:allow_buildings{"europeans_coalmine_level_4", "europeans_coalmine_level_5"}
        player:allow_buildings{"europeans_ironmine_level_4", "europeans_ironmine_level_5"}
        player:allow_buildings{"europeans_goldmine_level_4", "europeans_goldmine_level_5"}
        player:allow_buildings{"europeans_quarry_advanced", "europeans_lumberjacks_house_advanced", "europeans_tree_nursery_advanced"}
        player:allow_buildings{"europeans_sawmill_advanced", "europeans_stonemasons_house_advanced"}
        player:allow_buildings{"europeans_charcoal_kiln_advanced", "europeans_smelting_works_advanced", "europeans_manufactory_advanced"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_well_level_4", "europeans_well_level_5", "europeans_well_level_6"}
        player:forbid_buildings{"europeans_coalmine_level_4", "europeans_coalmine_level_5"}
        player:forbid_buildings{"europeans_ironmine_level_4", "europeans_ironmine_level_5"}
        player:forbid_buildings{"europeans_goldmine_level_4", "europeans_goldmine_level_5"}
        player:forbid_buildings{"europeans_quarry_advanced", "europeans_lumberjacks_house_advanced", "europeans_tree_nursery_advanced"}
        player:forbid_buildings{"europeans_sawmill_advanced", "europeans_stonemasons_house_advanced"}
        player:forbid_buildings{"europeans_charcoal_kiln_advanced", "europeans_smelting_works_advanced", "europeans_manufactory_advanced"}
    end
end

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

function allow_shipyard(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
    end
end

function forbid_shipyard(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
    end
end

function allow_ferry_yard(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "europeans" then
        player:allow_buildings{"europeans_ferry_yard_basic", "europeans_ferry_yard_normal", "europeans_ferry_yard_advanced"}
    end
end

function forbid_ferry_yard(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "europeans" then
        player:forbid_buildings{"europeans_ferry_yard_basic", "europeans_ferry_yard_normal", "europeans_ferry_yard_advanced"}
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
pop_textdomain()
