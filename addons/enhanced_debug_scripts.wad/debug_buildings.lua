-- =======================================================================
--           Optimiertes Debug-Building-Skript
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"
include "addons/enhanced_debug_scripts.wad/debug_map.lua"

-- ========================
--  Spieler- und Gebäude-Hilfsfunktionen
-- ========================
function building_matches(tbuilding, building_name, tribe_name)
    building_name = string.lower(building_name or "all")
    if building_name == "all" then return true end
    return tbuilding.name == building_name
       or tbuilding.name == (tribe_name .. "_" .. building_name)
       or string.find(tbuilding.name, building_name, 1, true)
       or tbuilding.type_name == building_name
end

function field_is_free_for_building(field)
    return not field.immovable 
       or (field.immovable.descr.type_name ~= "constructionsite" 
       and field.immovable.descr.type_name ~= "warehouse")
end

function apply_to_buildings(player_number, building_name, action)
    iterate_players(player_number, function(player)
        for _, tbuilding in ipairs(player.tribe.buildings) do
            if building_matches(tbuilding, building_name, player.tribe.name) then
                for _, building in ipairs(player:get_buildings(tbuilding.name)) do
                    action(building, tbuilding)
                end
            end
        end
    end)
end

function set_buildings(player_number, building_name, building_size, mode)
    building_name = building_name or "all"
    building_size = building_size or "all"
    iterate_players(player_number, function(player)
        for _, tbuilding in ipairs(player.tribe.buildings) do
            if building_matches(tbuilding, building_name, player.tribe.name) and (building_size == "all" or tbuilding.size == building_size) then
                if mode == "forbid" then player:forbid_buildings{tbuilding.name}
                elseif mode == "allow" then player:allow_buildings{tbuilding.name} end
            end
        end
    end)
end

-- ========================
--  Koordinaten-basierte Aktionen
-- ========================
function force_building(startx, starty, radius, building_name, complete)
    local field = get_random_field(startx, starty, radius)
    local player = field.owner
    if not player then return nil end
    local building_name = string.lower(building_name)
    local found_building = nil

    for _, tbuilding in ipairs(player.tribe.buildings) do
        if tbuilding.name == building_name or string.find(tbuilding.name, building_name, 1, true) then
            found_building = tbuilding.name
            break
        end
    end
    if not found_building then return nil end
    if field.immovable then field.immovable:remove() end
    return player:place_building(found_building, field, not (complete or false), true)
end

function force_mine(startx, starty, radius)
    local field = get_random_field(startx, starty, radius)
    local resource, amount, player = field.resource, field.resource_amount, field.owner
    if not player then return nil end
    local tribe = player.tribe.name

    local resources = {
        resource_water = { amazons = "water_gatherers_hut", _default = "well" },
        resource_coal  = { _default = "coalmine" },
        resource_iron  = { _default = "ironmine" },
        resource_gold  = { amazons = "gold_digger_dwelling", _default = "goldmine" },
        resource_stone = { amazons = "stonemine", atlanteans = "crystalmine", barbarians = "granitemine", empire = "marblemine", frisians = "rockmine", _default = "stonemine" },
    }

    local suffix_rules = {
        europeans = function(a) return a>=20 and "_basic" or (a>16 and "_level_1" or (a>8 and "_level_2" or "_level_3")) end,
        barbarians = function(a) return a>=15 and "" or (a>=8 and "_deep" or "_deeper") end,
        empire = function(a) return a>=10 and "" or "_deep" end,
        frisians = function(a) return a>=10 and "" or "_deep" end,
    }

    local minename = (resources[resource] or { _default = "well" })[tribe] or (resources[resource] or { _default = "well" })._default
    local suffix = suffix_rules[tribe] and suffix_rules[tribe](amount) or ""
    return player:place_building(tribe.."_"..minename..suffix, field, true, true)
end

-- ========================
--  Dismantle / Upgrade
-- ========================
local valid_building_types = {
    productionsite = true,
    trainingsite   = true,
    militarysite   = true,
    warehouse      = true,
    market         = true,
    headquarters   = true,
    port           = true
}

function dismantle_building(startx, starty)
    local field = wl.Game().map:get_field(startx, starty)
    local b = field.immovable
    if b and valid_building_types[b.descr.type_name] then b:dismantle(true); return true end
    return false
end

function dismantle_all_buildings_in_region(startx, starty, radius)
    local game, map = wl.Game(), wl.Game().map
    for _, f in ipairs(map:get_field(startx, starty):region(radius or 0)) do
        local b = f.immovable
        if b and valid_building_types[b.descr.type_name] then b:dismantle(true) end
    end
end

function upgrade_building(startx, starty)
    local field = wl.Game().map:get_field(startx, starty)
    local b = field.immovable
    if b and valid_building_types[b.descr.type_name] then
        b:enhance(true)
        return true
    end
    return false
end

function upgrade_all_buildings_in_region(startx, starty, radius)
    local game, map = wl.Game(), wl.Game().map
    for _, f in ipairs(map:get_field(startx, starty):region(radius or 0)) do
        local b = f.immovable
        if b and valid_building_types[b.descr.type_name] then 
            b:enhance(true) 
            return true
        end
    end
    return false
end

function startstop_building(startx, starty)
    local b = wl.Game().map:get_field(startx, starty).immovable
    if b and (b.descr.type_name == "productionsite" or b.descr.type_name == "trainingsite") then b:toggle_start_stop() end
end

-- ========================
--  Spieler-basierte Aktionen
-- ========================
function allow_all_buildings(player_number, building_name, building_size)
    if building_name == "warehouse" then building_name = "_warehouse" end
    set_buildings(player_number, building_name, building_size or "all", "allow")
end

function forbid_all_buildings(player_number, building_name, building_size)
    if building_name == "warehouse" then building_name = "_warehouse" end
    set_buildings(player_number, building_name, building_size or "all", "forbid")
end

function dismantle_all_buildings(player_number, building_name)
    apply_to_buildings(player_number, building_name or "all", function(b) b:dismantle(true) end)
end

function ban_all_buildings(player_number, building_name)
    if building_name == "warehouse" then building_name = "_warehouse" end
    set_buildings(player_number, building_name, "all", "forbid")
    dismantle_all_buildings(player_number, building_name)
end

function upgrade_all_buildings(player_number, building_name)
    apply_to_buildings(player_number, building_name or "all", function(b) b:enhance(true) end)
end

function dismantle_idle_buildings(player_number, threshold)
    threshold = threshold or 10
    apply_to_buildings(player_number, "all", function(b)
        if b.descr.type_name == "productionsite" and b.productivity < threshold then b:dismantle(true) end
    end)
end

function stop_all_buildings(player_number, building_name)
    apply_to_buildings(player_number, building_name or "all", function(b, t)
        if (t.type_name == "productionsite" or t.type_name == "trainingsite") and not b.is_stopped then b:toggle_start_stop() end
    end)
end

function start_all_buildings(player_number, building_name)
    apply_to_buildings(player_number, building_name or "all", function(b, t)
        if (t.type_name == "productionsite" or t.type_name == "trainingsite") and b.is_stopped then b:toggle_start_stop() end
    end)
end

-- =========================================
-- Gebäude automatisch stoppen/starten je nach Zielmengen der Flagge
-- =========================================
function auto_manage_buildings(player_number)
    iterate_players(player_number, function(player)
        local map = wl.Game().map

        for x = 0, map.width - 1 do
            for y = 0, map.height - 1 do
                local field = map:get_field(x, y)
                local site = field.immovable

                -- nur Produktionsgebäude mit Outputs prüfen
                if site and site.descr and site.descr.type_name == "productionsite"
                   and site.flag
                   and (site.descr.output_ware_types or site.descr.output_worker_types) then

                    local should_stop = false
                    local should_start = false
                    local flag_economy = site.flag

                    -- Output-Waren prüfen
                    if site.descr.output_ware_types then
                        for _, ware in pairs(site.descr.output_ware_types) do
                            local target = flag_economy.ware_economy:target_quantity(ware.name)
                            if not target or target < 0 or target > 64 then
                                target = 64
                            end
                            local current = player:get_wares(ware.name)
                            if current >= target then
                                should_stop = true
                            else
                                should_start = true
                            end
                        end
                    end

                    -- Output-Arbeiter prüfen
                    if site.descr.output_worker_types then
                        for _, worker in pairs(site.descr.output_worker_types) do
                            local target = flag_economy.worker_economy:target_quantity(worker.name)
                            if not target or target < 0 or target > 64 then
                                target = 64
                            end
                            local current = player:get_workers(worker.name)
                            if current >= target then
                                should_stop = true
                            else
                                should_start = true
                            end
                        end
                    end

                    -- Gebäude entsprechend steuern
                    if should_stop and not site.is_stopped then
                        site:toggle_start_stop()
                        print(string.format("[AutoManage] ⏹ '%s' (Spieler %d) gestoppt", site.descr.name, player.number))
                    elseif should_start and site.is_stopped then
                        site:toggle_start_stop()
                        print(string.format("[AutoManage] ▶ '%s' (Spieler %d) gestartet", site.descr.name, player.number))
                    end
                end
            end
        end
    end)
end


pop_textdomain()
