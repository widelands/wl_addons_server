-- =======================================================================
--           Optimiertes Testskript für militärische Gebäude
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"
include "addons/enhanced_debug_scripts.wad/debug_buildings.lua"

-- ========================
--  Spieler- und Gebäude-Hilfsfunktionen
-- ========================
function apply_to_militarysites(player_number, size, action)
    size = size or "all"
    iterate_players(player_number or 0, function(player)
        local tribe_buildings = wl.Game():get_tribe_description(player.tribe.name).buildings
        for _, building in ipairs(tribe_buildings) do
            if building.type_name == "militarysite" and (size == "all" or building.size == size) then
                action(player, building.name)
            end
        end
    end)
end

-- ========================
--  Militärische Gebäude erlauben / verbieten
-- ========================
function allow_all_militarysites(player_number, size)
    apply_to_militarysites(player_number, size, function(player, name)
        player:allow_buildings{name}
    end)
end

function forbid_all_militarysites(player_number, size)
    apply_to_militarysites(player_number, size, function(player, name)
        player:forbid_buildings{name}
    end)
end

-- ========================
--  Militärische Gebäude platzieren
-- ========================
function force_militarysite(startx, starty, radius, player_number, size, index, heroes)
    size   = size   or "small"
    index  = index  or 0
    heroes = heroes or false

    local game  = wl.Game()
    local map   = game.map
    local field = map:get_field(startx, starty)
    local player = game.players[player_number]
    local tribe  = player.tribe.name
    local fields = field:region(radius)

    local hero_stats = {
        europeans = {5,5,2,2}, amazons = {3,2,2,3}, atlanteans= {1,4,2,2},
        barbarians= {3,5,0,2}, empire = {4,4,0,2}, frisians  = {2,6,2,0},
    }
    local max_soldier_stats = heroes and hero_stats[tribe] or {0,0,0,0}

    local militarysites_by_tribe = {
        europeans = {mine={"europeans_sentry_mountain"}, small={"europeans_sentry_basic","europeans_sentry_level_1","europeans_sentry_level_2","europeans_sentry_level_3"},
                     medium={"europeans_barrier_basic","europeans_barrier_level_1","europeans_barrier_level_2","europeans_barrier_level_3"},
                     tower={"europeans_tower_basic","europeans_tower_level_1","europeans_tower_level_2","europeans_tower_level_3"},
                     big={"europeans_castle_basic","europeans_castle_level_1","europeans_castle_level_2","europeans_castle_level_3","europeans_castle_level_4"}},
        amazons   = {small={"amazons_treetop_sentry","amazons_patrol_post"}, medium={"amazons_warriors_dwelling"}, tower={"amazons_tower","amazons_observation_tower"}, big={"amazons_fortress","amazons_fortification"}},
        atlanteans= {small={"atlanteans_guardhouse","atlanteans_tower_small"}, medium={"atlanteans_guardhall"}, tower={"atlanteans_tower","atlanteans_tower_high"}, big={"atlanteans_castle"}},
        barbarians= {small={"barbarians_sentry"}, medium={"barbarians_barrier"}, tower={"barbarians_tower"}, big={"barbarians_fortress","barbarians_citadel"}},
        empire    = {small={"empire_blockhouse","empire_sentry"}, medium={"empire_barrier","empire_outpost"}, tower={"empire_tower"}, big={"empire_fortress","empire_castle"}},
        frisians  = {small={"frisians_wooden_tower","frisians_wooden_tower_high"}, medium={"frisians_sentinel","frisians_outpost"}, tower={"frisians_tower"}, big={"frisians_fortress"}},
    }

    local tribe_sites = militarysites_by_tribe[tribe]
    if not tribe_sites or not tribe_sites[size] then return nil end
    
    print (tribe_sites[size])

    local militarysites = tribe_sites[size]
    local idx = (index % #militarysites)
    local site = player:place_building(militarysites[idx], fields[math.random(#fields)], false, true)
    site:set_soldiers(max_soldier_stats, site.max_soldiers)

    return site
end

-- ========================
--  Militärische Gebäude entfernen
-- ========================
local valid_militarysite_types = {
    militarysite   = true,
}

-- Reißt alle Militärgebäude in einer Region ab
function dismantle_all_militarysites_in_region(startx, starty, radius)
    local game, map = wl.Game(), wl.Game().map
    for _, f in ipairs(map:get_field(startx, starty):region(radius or 0)) do
        local b = f.immovable
        if b and valid_militarysite_types[b.descr.type_name] then b:dismantle(true) end
    end
end

-- Reißt alle eroberten Militärgebäude eines Spielers ab
function dismantle_all_conquered_militarysites(player_number)
    iterate_players(player_number, function(player)

        -- Menge der Gebäudenamen, die zum Stamm des Spielers gehören
        local tribe_buildings = {}
        for _, tb in ipairs(player.tribe.buildings) do
            tribe_buildings[tb.name] = true
        end

        -- Alle in der Engine registrierten Militärgebäude durchgehen
        for _, gameplayer in ipairs(wl.Game().players) do
            for _, builddesc in ipairs(gameplayer.tribe.buildings) do
                -- Gebäude dieses Typs, die dem Spieler gehören
                for _, building in ipairs(player:get_buildings(builddesc.name)) do
                    -- prüfen, ob es nicht zum Stamm gehört → erobert
                    if valid_militarysite_types[building.descr.type_name] and not tribe_buildings[building.descr.name] then
                        print("Dismantling conquered military site: " ..
                              building.descr.name ..
                              " (owner=" .. player.number .. ")")
                        building:dismantle(true)
                    end
                end
            end
        end
    end)
end

-- ========================
--  Kapazität / Präferenzen setzen
-- ========================
function set_militarysite_capacity(startx, starty, capacity)
    local building = wl.Game().map:get_field(startx, starty).immovable
    if building then
        if building.descr.type_name == "militarysite" or building.descr.type_name == "warehouse" then
            building.capacity = capacity
        elseif building.descr.type_name == "trainingsite" then
            building:set_capacity(capacity)
        end
    end
end

function set_all_militarysites_capacity(player_number, building_name, capacity)
    apply_to_buildings(player_number or 0, building_name or "all", function(building)
        if building.descr.type_name == "militarysite" then
            building.capacity = capacity
        end
    end)
end

function set_militarysite_preference(startx, starty, preference)
    preference = (preference == "rookies" or preference == "heroes") and preference or "any"
    local building = wl.Game().map:get_field(startx, starty).immovable
    if building then building.soldier_preference = preference end
end

function set_all_militarysites_preference(player_number, building_name, preference)
    preference = (preference == "rookies" or preference == "heroes") and preference or "any"
    apply_to_buildings(player_number or 0, building_name or "all", function(building)
        if building.descr.type_name == "militarysite" then
            building.soldier_preference = preference
        end
    end)
end

function set_all_ports_soldier_policy(player_number, policy)
    policy = policy or "normal"
    apply_to_buildings(player_number or 0, "port", function(building)
        building:set_warehouse_policies(building.owner.tribe.soldier, policy)
    end)
end

function set_all_ports_soldier_preference(player_number, preference)
    preference = (preference == "rookies" or preference == "heroes") and preference or "any"
    apply_to_buildings(player_number or 0, "port", function(building)
        building.soldier_preference = preference
    end)
end

pop_textdomain()
