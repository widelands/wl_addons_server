push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"

-- Alle Tribe-spezifischen Baukosten-Regeln
local tribe_rules = {
    amazons = {
        all = {
            small  = { log={1,1}, granite={1,1}, ironwood={1,1}, balsa={1,1}, rope={1,1}, rubber={1,1} },
            mine   = { log={2,1}, granite={2,1}, ironwood={2,1}, balsa={2,1}, rope={2,1}, rubber={2,1} },
            medium = { log={2,1}, granite={2,1}, ironwood={2,1}, balsa={2,1}, rope={2,1}, rubber={2,1} },
            big    = { log={3,2}, granite={3,2}, ironwood={3,2}, balsa={3,2}, rope={3,2}, rubber={3,2} },
            port   = { log={3,2}, granite={3,2}, ironwood={3,2}, balsa={3,2}, rope={3,2}, rubber={3,2} },
        },
        militarysite = {
            medium = { gold={1,2}, quartz={1,2} },
            big    = { gold={2,3}, quartz={1,2} },
        },
    },
    atlanteans = {
        all = {
            small  = { log={1,1}, granite={1,1}, planks={1,1}, spidercloth={1,1} },
            mine   = { log={2,1}, granite={2,1}, planks={2,1}, spidercloth={2,1} },
            medium = { log={2,1}, granite={2,1}, planks={2,1}, spidercloth={2,1} },
            big    = { log={3,2}, granite={3,2}, planks={3,2}, spidercloth={3,2} },
            port   = { log={3,2}, granite={3,2}, planks={3,2}, spidercloth={3,2} },
        },
        militarysite = {
            medium = { gold={1,2}, iron={1,2} },
            big    = { gold={2,3}, iron={2,3} },
        },
    },
    barbarians = {
        all = {
            small  = { log={1,1}, granite={1,1}, blackwood={1,1}, reed={1,1}, grout={1,1} },
            mine   = { log={2,1}, granite={2,1}, blackwood={2,1}, reed={2,1}, grout={2,1} },
            medium = { log={2,1}, granite={2,1}, blackwood={2,1}, reed={2,1}, grout={2,1} },
            big    = { log={3,2}, granite={3,2}, blackwood={3,2}, reed={3,2}, grout={3,2} },
            port   = { log={3,2}, granite={3,2}, blackwood={3,2}, reed={3,2}, grout={3,2} },
        },
        militarysite = {
            medium = { gold={1,2}, iron={1,2} },
            big    = { gold={2,3}, iron={2,3} },
        },
    },
    empire = {
        all = {
            small  = { log={1,1}, granite={1,1}, planks={1,1}, cloth={1,1}, marble={1,1} },
            mine   = { log={2,1}, granite={2,1}, planks={2,1}, cloth={2,1}, marble={2,1} },
            medium = { log={2,1}, granite={2,1}, planks={2,1}, cloth={2,1}, marble_column={2,1} },
            big    = { log={3,2}, granite={3,2}, planks={3,2}, cloth={3,2}, marble_column={3,2} },
            port   = { log={3,2}, granite={3,2}, planks={3,2}, cloth={3,2}, marble_column={3,2} },
        },
        militarysite = {
            medium = { gold={1,2}, iron={1,2} },
            big    = { gold={2,3}, iron={2,3} },
        },
    },
    frisians = {
        all = {
            small  = { log={1,1}, granite={1,1}, reed={1,1}, brick={1,1} },
            mine   = { log={2,1}, granite={2,2}, reed={2,1}, brick={2,1} },
            medium = { log={2,1}, granite={2,1}, reed={2,1}, brick={2,1} },
            big    = { log={3,2}, granite={3,2}, reed={3,2}, brick={3,2} },
            port   = { log={3,2}, granite={3,2}, reed={3,2}, brick={3,2} },
        },
        militarysite = {
            medium = { gold={1,2}, iron={1,2} },
            big    = { gold={2,3}, iron={2,3} },
        },
    },
}

-- Aufrufe für alle Stämme
function buildcost_modifier()
    remove_all_buildcosts("productionsite")
    for tribe, ruleset in pairs(tribe_rules) do
        apply_buildcost_ruleset(tribe, ruleset)
    end
end

-- Alle Baukosten entfernen
function remove_all_buildcosts(building_type)
    building_type = building_type or "all"
    
    local game = wl.Game()
    for k, player in ipairs(game.players) do
        for j, ware in ipairs(player.tribe.wares) do
            for i, building in ipairs(player.tribe.buildings) do
                if (building.type_name == building_type) or (building_type == "all") then
                    wl.Descriptions():modify_unit("building", building.name, "buildcost", "remove", ware.name)
                    wl.Descriptions():modify_unit("building", building.name, "return_on_dismantle", "remove", ware.name)
                end
            end
        end
    end
end

-- universelle Funktion mit Produktions-Check
function apply_buildcost_ruleset(tribe, ruleset)
    local d = wl.Descriptions()
    local game = wl.Game()

    for _, player in ipairs(game.players) do
        if player.tribe.name == tribe then
            for _, building in ipairs(player.tribe.buildings) do
                for category, sizes in pairs(ruleset) do
                    if category == "all" or building.type_name == category then
                        local size_rules = sizes[building.size]
                        if size_rules then
                            for ware, amounts in pairs(size_rules) do
                                -- skip, wenn das Gebäude die Ware selber produziert
                                if not contains(building.output_ware_types, ware) then
                                    d:modify_unit("building", building.name, "buildcost", "set", ware, amounts[1])
                                    d:modify_unit("building", building.name, "return_on_dismantle", "set", ware, amounts[2])
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


pop_textdomain()
