-- =======================================================================
--           Test script for debugging Lutas’ Atlanteans tribe
-- =======================================================================

include "addons/lutas_atlanteans.wad/scripting/starting_conditions.lua"

push_textdomain("lutas_atlanteans.wad", true)

-- following functions are only for debugging Lutas' Atlanteans tribe --
function allow_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "lutas_atlanteans" then
        player:allow_buildings{"lutas_atlanteans_guardhouse", "lutas_atlanteans_tower_small"}
        player:allow_buildings{"lutas_atlanteans_tower", "lutas_atlanteans_tower_high", "lutas_atlanteans_guardhall"}
        player:allow_buildings{"lutas_atlanteans_castle"}
    end
end

function forbid_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "lutas_atlanteans" then
        player:forbid_buildings{"lutas_atlanteans_guardhouse", "lutas_atlanteans_tower_small"}
        player:forbid_buildings{"lutas_atlanteans_tower", "lutas_atlanteans_tower_high", "lutas_atlanteans_guardhall"}
        player:forbid_buildings{"lutas_atlanteans_castle"}
    end
end

function allow_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "lutas_atlanteans" then
        player:allow_buildings{"lutas_atlanteans_barracks"}
    end
end

function forbid_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "lutas_atlanteans" then
        player:forbid_buildings{"lutas_atlanteans_barracks"}
    end
end

function allow_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "lutas_atlanteans" then
        player:allow_buildings{"lutas_atlanteans_dungeon", "lutas_atlanteans_labyrinth", "lutas_atlanteans_temple"}
    end
end

function forbid_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "lutas_atlanteans" then
        player:forbid_buildings{"lutas_atlanteans_dungeon", "lutas_atlanteans_labyrinth", "lutas_atlanteans_temple"}

    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "lutas_atlanteans" then
        player:allow_buildings{"lutas_atlanteans_woodcutters_house", "lutas_atlanteans_foresters_house", "lutas_atlanteans_quarry"}
        player:allow_buildings{"lutas_atlanteans_well", "lutas_atlanteans_fishers_house", "lutas_atlanteans_fishbreeders_house" }
        player:allow_buildings{"lutas_atlanteans_hunters_house", "lutas_atlanteans_gold_spinning_mill", "lutas_atlanteans_scouts_house" }
        player:allow_buildings{"lutas_atlanteans_toolsmithy", "lutas_atlanteans_sawmill", "lutas_atlanteans_mill", "lutas_atlanteans_bakery" }
        player:allow_buildings{"lutas_atlanteans_smokery", "lutas_atlanteans_charcoal_kiln", "lutas_atlanteans_smelting_works"}
        player:allow_buildings{"lutas_atlanteans_weaponsmithy", "lutas_atlanteans_armorsmithy"}
        player:allow_buildings{"lutas_atlanteans_shipyard", "lutas_atlanteans_ferry_yard"}
        player:allow_buildings{"lutas_atlanteans_farm", "lutas_atlanteans_blackroot_farm", "lutas_atlanteans_spiderfarm"}
        player:allow_buildings{"lutas_atlanteans_weaving_mill", "lutas_atlanteans_horsefarm"}
        player:allow_buildings{"lutas_atlanteans_low_crystalmine", "lutas_atlanteans_low_coalmine"}
        player:allow_buildings{"lutas_atlanteans_low_ironmine", "lutas_atlanteans_low_goldmine"}
--        player:allow_buildings{"lutas_atlanteans_barracks", "lutas_atlanteans_dungeon", "lutas_atlanteans_labyrinth", "lutas_atlanteans_temple"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "lutas_atlanteans" then
        player:forbid_buildings{"lutas_atlanteans_woodcutters_house", "lutas_atlanteans_foresters_house", "lutas_atlanteans_quarry"}
        player:forbid_buildings{"lutas_atlanteans_well", "lutas_atlanteans_fishers_house", "lutas_atlanteans_fishbreeders_house" }
        player:forbid_buildings{"lutas_atlanteans_hunters_house", "lutas_atlanteans_gold_spinning_mill", "lutas_atlanteans_scouts_house" }
        player:forbid_buildings{"lutas_atlanteans_toolsmithy", "lutas_atlanteans_sawmill", "lutas_atlanteans_mill", "lutas_atlanteans_bakery" }
        player:forbid_buildings{"lutas_atlanteans_smokery", "lutas_atlanteans_charcoal_kiln", "lutas_atlanteans_smelting_works"}
        player:forbid_buildings{"lutas_atlanteans_weaponsmithy", "lutas_atlanteans_armorsmithy"}
        player:forbid_buildings{"lutas_atlanteans_shipyard", "lutas_atlanteans_ferry_yard"}
        player:forbid_buildings{"lutas_atlanteans_farm", "lutas_atlanteans_blackroot_farm", "lutas_atlanteans_spiderfarm"}
        player:forbid_buildings{"lutas_atlanteans_weaving_mill", "lutas_atlanteans_horsefarm"}
        player:forbid_buildings{"lutas_atlanteans_low_crystalmine", "lutas_atlanteans_low_coalmine"}
        player:forbid_buildings{"lutas_atlanteans_low_ironmine", "lutas_atlanteans_low_goldmine"}
--        player:forbid_buildings{"lutas_atlanteans_barracks", "lutas_atlanteans_dungeon", "lutas_atlanteans_labyrinth", "lutas_atlanteans_temple"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "lutas_atlanteans" then
        player:allow_buildings{"lutas_atlanteans_crystalmine", "lutas_atlanteans_coalmine"}
        player:allow_buildings{"lutas_atlanteans_ironmine", "lutas_atlanteans_goldmine"}
        player:allow_buildings{"lutas_atlanteans_tower_high"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "lutas_atlanteans" then
        player:forbid_buildings{"lutas_atlanteans_crystalmine", "lutas_atlanteans_coalmine"}
        player:forbid_buildings{"lutas_atlanteans_ironmine", "lutas_atlanteans_goldmine"}
        player:forbid_buildings{"lutas_atlanteans_tower_high"}
    end
end

pop_textdomain()
