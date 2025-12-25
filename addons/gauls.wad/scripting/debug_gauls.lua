-- =======================================================================
--           Test script for debugging Gauls tribe.
-- =======================================================================

include "addons/gauls.wad/scripting/starting_conditions.lua"

push_textdomain("gauls.wad", true)

-- following functions are only for debugging gauls tribe --
function allow_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "gauls" then
        player:allow_buildings{"gauls_guard_post", "gauls_watchtower"}
        player:allow_buildings{"gauls_castle", "gauls_stronghold"}
        player:allow_buildings{"gauls_stone_tower", "gauls_sentry"}
    end
end

function forbid_militarysites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "gauls" then
        player:forbid_buildings{"gauls_guard_post", "gauls_watchtower"}
        player:forbid_buildings{"gauls_castle", "gauls_stronghold"}
        player:forbid_buildings{"gauls_stone_tower", "gauls_sentry}
    end
end

function allow_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "gauls" then
        player:allow_buildings{"gauls_barracks"}
    end
end

function forbid_barracks(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "gauls" then
        player:forbid_buildings{"gauls_barracks"}
    end
end

function allow_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "gauls" then
        player:allow_buildings{"gauls_training_camp", "gauls_fighting_arena", "gauls_druids_gathering"}
    end
end

function forbid_trainingssites(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "gauls" then
        player:forbid_buildings{"gauls_training_camp", "gauls_fighting_arena", "gauls_druids_gathering"}

    end
end

function allow_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "gauls" then
        player:allow_buildings{"gauls_woodcutters_house", "gauls_foresters_house", "gauls_clay_pit"}
        player:allow_buildings{"gauls_stonecutters_hut", "gauls_well", "gauls_fishers_hut", "gauls_hunters_hut" }
        player:allow_buildings{"gauls_scouts_cottage", "gauls_workshop", "gauls_sawmill", "gauls_brick_kiln" }
        player:allow_buildings{"gauls_reed_yard", "gauls_garden", "gauls_orchard", "gauls_furnace", "gauls_mill" }
        player:allow_buildings{"gauls_bakery", "gauls_kitchen_small", "gauls_smokery", "gauls_druids_house"}
        player:allow_buildings{"gauls_sewing_workshop", "gauls_weaponsmithy", "gauls_weaving_mill", "gauls_armorsmithy"}
        player:allow_buildings{"gauls_charcoal_kiln", "gauls_farm", "gauls_threshing_floor_small", "gauls_cattle_farm"}
        player:allow_buildings{"gauls_sheep_farm", "gauls_ferry_yard", "gauls_shipyard"}
        player:allow_buildings{"gauls_tin_mine", "gauls_coal_mine_small", "gauls_iron_mine_small", "gauls_copper_mine"}
    end
end

function forbid_normal_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "gauls" then
        player:forbid_buildings{"gauls_woodcutters_house", "gauls_foresters_house", "gauls_clay_pit"}
        player:forbid_buildings{"gauls_stonecutters_hut", "gauls_well", "gauls_fishers_hut", "gauls_hunters_hut" }
        player:forbid_buildings{"gauls_scouts_cottage", "gauls_workshop", "gauls_sawmill", "gauls_brick_kiln" }
        player:forbid_buildings{"gauls_reed_yard", "gauls_garden", "gauls_orchard", "gauls_furnace", "gauls_mill" }
        player:forbid_buildings{"gauls_bakery", "gauls_kitchen_small", "gauls_smokery", "gauls_druids_house"}
        player:forbid_buildings{"gauls_sewing_workshop", "gauls_weaponsmithy", "gauls_weaving_mill", "gauls_armorsmithy"}
        player:forbid_buildings{"gauls_charcoal_kiln", "gauls_farm", "gauls_threshing_floor_small", "gauls_cattle_farm"}
        player:forbid_buildings{"gauls_sheep_farm", "gauls_ferry_yard", "gauls_shipyard"}
        player:forbid_buildings{"gauls_tin_mine", "gauls_coal_mine_small", "gauls_iron_mine_small", "gauls_copper_mine"}
    end
end

function allow_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe

    if tribe.name == "gauls" then
        player:allow_buildings{"gauls_kitchen", "gauls_threshing_floor" }
        player:allow_buildings{"gauls_coal_mine", "gauls_coal_mine_deep", "gauls_iron_mine"}
        player:allow_buildings{"gauls_iron_mine_deep", "gauls_copper_gold_mine", "gauls_tin_mine_deep"}
        player:allow_buildings{"gauls_stone_tower", "gauls_stronghold"}
    end
end

function forbid_advanced_buildings(player_number)
    local game = wl.Game()
    local player = game.players[player_number]
    local tribe = player.tribe
    
    if tribe.name == "gauls" then
        player:forbid_buildings{"gauls_kitchen", "gauls_threshing_floor" }
        player:forbid_buildings{"gauls_coal_mine", "gauls_coal_mine_deep", "gauls_iron_mine"}
        player:forbid_buildings{"gauls_iron_mine_deep", "gauls_copper_gold_mine", "gauls_tin_mine_deep"}
        player:forbid_buildings{"gauls_stone_tower", "gauls_stronghold"}
    end
end

pop_textdomain()
