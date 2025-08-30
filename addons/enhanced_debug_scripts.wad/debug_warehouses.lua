-- =======================================================================
--           Test script for debugging warehouses.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"
include "addons/enhanced_debug_scripts.wad/debug_buildings.lua"

-- Platziert ein Hauptquartier
function force_headquarters(startx, starty, radius, complete)
    return force_building(startx, starty, radius, "headquarters", complete)
end

-- Platziert ein Warenlager
function force_warehouse(startx, starty, radius, complete)
    return force_building(startx, starty, radius, "warehouse", complete)
end

-- Platziert einen Hafen auf geeigneten Feldern
function force_port(startx, starty, radius, player_number, complete)
    complete = complete or false

    local game = wl.Game()
    local map = game.map
    if not (map.allows_seafaring and map.number_of_port_spaces > 0) then return end

    for _, portfield in pairs(map.port_spaces) do
        if map_distance(startx, starty, portfield.x, portfield.y) <= radius then
            local field = map:get_field(portfield.x, portfield.y)
            local player = (player_number > 0) and game.players[player_number] or field.owner
            if not player then goto continue end

            if (field.immovable) and (field.immovable.descr.type_name == "warehouse") then
                print ("There is already a Port/Warehouse on field: ", portfield.x, portfield.y)
                return false
            else
                print ("New Port", player.tribe.port, "at: ", portfield.x, portfield.y)
                if field.immovable then field.immovable:remove() end
                return player:place_building(player.tribe.port, field, not (complete or false), true)
            end
        end
        ::continue::
    end
end

-- HQ auf Startpositionen erzwingen
function force_headquarters_on_starting_spots(player_number)
    local game = wl.Game()
    local map = game.map
    iterate_players(player_number or 0, function(player)
        for _, slot in ipairs(map.player_slots) do
            local sf = slot.starting_field
            if sf.owner == player and field_is_free_for_building(sf) then
                player:place_building(player.tribe.name .. "_headquarters", sf, true, true)
            end
        end
    end)
end

-- Hafen zufällig setzen
function force_port_random(player_number)
    local game = wl.Game()
    local map = game.map

    if not (map.allows_seafaring and map.number_of_port_spaces > 0) then return end

    iterate_players(player_number or 0, function(player)
        if player.tribe.port then
            local random_idx = math.random(map.number_of_port_spaces)
            for i, portfield in pairs(map.port_spaces) do
                if i >= random_idx - 1 then
                    local field = map:get_field(portfield.x, portfield.y)
                    if field.owner == player and field.brn.owner == player and field_is_free_for_building(field) then
                        player:place_building(player.tribe.port, field, true, true)
                        break
                    end
                end
            end
        end
    end)
end

function set_warehouse_policy(startx, starty, target, policiename)
    policiename = policiename or "normal"
    if not (string.find(policiename, "prefer")
         or string.find(policiename, "dontstock")
         or string.find(policiename, "remove")) then
        policiename = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local warehouse = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    if not (player and warehouse and warehouse.descr.type_name == "warehouse") then
        return false
    end

    local tribe = player.tribe

    -- Worker-Policy
    local function apply_worker_policy(workername)
        for _, worker in ipairs(tribe.workers) do
            if worker.name == workername or worker.name == tribe.name .. "_" .. workername then
                warehouse:set_warehouse_policies(worker.name, policiename)
            end
        end
    end

    -- Ware-Policy
    local function apply_ware_policy(warename)
        for _, ware in ipairs(tribe.wares) do
            if ware.name == warename then
                warehouse:set_warehouse_policies(ware.name, policiename)
            end
        end
    end

    -- Kategorie-Policy
    local function apply_category_policy(category)
        if category == "all" then
            for _, ware in ipairs(tribe.wares) do
                apply_ware_policy(ware.name)
            end

        elseif category == "build" then
            for _, ware in ipairs(tribe.wares) do
                if ware:is_construction_material(tribe.name) then
                    apply_ware_policy(ware.name)
                end
            end
            for _, tbuilding in ipairs(tribe.buildings) do
                for warename, _ in pairs(tbuilding.buildcost) do
                    apply_ware_policy(warename)
                end
                for warename, _ in pairs(tbuilding.enhancement_cost) do
                    apply_ware_policy(warename)
                end
            end

        elseif category == "tools" then
            for _, tworker in ipairs(tribe.workers) do
                for warename, _ in pairs(tworker.buildcost) do
                    apply_ware_policy(warename)
                end
            end
            for _, tbuilding in ipairs(tribe.buildings) do
                if tbuilding.output_worker_types then
                    for _, output in pairs(tbuilding.output_worker_types) do
                        if string.find(output.name, tribe.name)
                           and not string.find(output.name, "soldier")
                           and tbuilding.inputs then
                            for waretype, _ in pairs(tbuilding.inputs) do
                                apply_ware_policy(waretype.name)
                            end
                        end
                    end
                end
            end

        elseif category == "weapons" then
            for _, tbuilding in ipairs(tribe.buildings) do
                if tbuilding.type_name == "productionsite" and tbuilding.output_worker_types then
                    for _, output in pairs(tbuilding.output_worker_types) do
                        if string.find(output.name, tribe.name)
                           and string.find(output.name, "soldier")
                           and tbuilding.inputs then
                            for waretype, _ in pairs(tbuilding.inputs) do
                                apply_ware_policy(waretype.name)
                            end
                        end
                    end
                end
                if tbuilding.type_name == "trainingsite" and tbuilding.inputs then
                    for waretype, _ in pairs(tbuilding.inputs) do
                        apply_ware_policy(waretype.name)
                    end
                end
            end

        elseif category == "ore" then
            for _, tbuilding in ipairs(tribe.buildings) do
                if tbuilding.is_mine and tbuilding.output_ware_types then
                    for waretype, _ in pairs(tbuilding.output_ware_types) do
                        apply_ware_policy(waretype.name)
                    end
                end
            end

        elseif category == "metals" then
            for _, tbuilding in ipairs(tribe.buildings) do
                if string.find(tbuilding.name, "smelting") and tbuilding.output_ware_types then
                    for waretype, _ in pairs(tbuilding.output_ware_types) do
                        apply_ware_policy(waretype.name)
                    end
                end
            end
        end
    end

    -- Hauptentscheidung
    if type(target) == "string" then
        if target == "all" or target == "build" or target == "tools"
           or target == "weapons" or target == "ore" or target == "metals" then
            apply_category_policy(target)
        else
            -- Worker oder Ware?
            local is_worker = false
            for _, w in ipairs(tribe.workers) do
                if w.name == target or w.name == tribe.name .. "_" .. target then
                    is_worker = true
                    break
                end
            end
            if is_worker then
                apply_worker_policy(target)
            else
                apply_ware_policy(target)
            end
        end
    end

    return true
end

function set_warehouse_stock(startx, starty, target, amount)
    amount = amount or 1

    local game = wl.Game()
    local map = game.map
    local warehouse = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    if not (player and warehouse and warehouse.descr.type_name == "warehouse") then
        return false
    end

    local tribe = player.tribe

    -- Hilfsfunktion: einzelne Ware setzen
    local function apply_ware(warename)
        for _, ware in ipairs(tribe.wares) do
            if ware.name == warename then
                warehouse:set_wares(ware.name, amount)
            end
        end
    end

    -- Hilfsfunktion: einzelner Worker setzen
    local function apply_worker(workername)
        if workername == "soldier" then
            warehouse:set_soldiers({0,0,0,0}, amount)
        else
            for _, worker in ipairs(tribe.workers) do
                if worker.name == workername or worker.name == tribe.name .. "_" .. workername then
                    warehouse:set_workers(worker.name, amount)
                end
            end
        end
    end

    -- Kategorien für Waren
    local function apply_ware_category(category)
        if category == "all" then
            for _, ware in ipairs(tribe.wares) do
                apply_ware(ware.name)
            end

        elseif category == "build" then
            for _, ware in ipairs(tribe.wares) do
                if ware:is_construction_material(tribe.name) then
                    apply_ware(ware.name)
                end
            end
            for _, tbuilding in ipairs(tribe.buildings) do
                for warename, _ in pairs(tbuilding.buildcost) do
                    apply_ware(warename)
                end
                for warename, _ in pairs(tbuilding.enhancement_cost) do
                    apply_ware(warename)
                end
            end

        elseif category == "tools" then
            for _, tworker in ipairs(tribe.workers) do
                for warename, _ in pairs(tworker.buildcost) do
                    apply_ware(warename)
                end
            end
            for _, tbuilding in ipairs(tribe.buildings) do
                if tbuilding.output_worker_types then
                    for _, output in pairs(tbuilding.output_worker_types) do
                        if string.find(output.name, tribe.name)
                           and not string.find(output.name, "soldier")
                           and tbuilding.inputs then
                            for waretype, _ in pairs(tbuilding.inputs) do
                                apply_ware(waretype.name)
                            end
                        end
                    end
                end
            end

        elseif category == "weapons" then
            for _, tbuilding in ipairs(tribe.buildings) do
                if tbuilding.type_name == "productionsite" and tbuilding.output_worker_types then
                    for _, output in pairs(tbuilding.output_worker_types) do
                        if string.find(output.name, tribe.name)
                           and string.find(output.name, "soldier")
                           and tbuilding.inputs then
                            for waretype, _ in pairs(tbuilding.inputs) do
                                apply_ware(waretype.name)
                            end
                        end
                    end
                end
                if tbuilding.type_name == "trainingsite" and tbuilding.inputs then
                    for waretype, _ in pairs(tbuilding.inputs) do
                        apply_ware(waretype.name)
                    end
                end
            end

        elseif category == "ore" then
            for _, tbuilding in ipairs(tribe.buildings) do
                if tbuilding.is_mine and tbuilding.output_ware_types then
                    for waretype, _ in pairs(tbuilding.output_ware_types) do
                        apply_ware(waretype.name)
                    end
                end
            end

        elseif category == "metals" then
            for _, tbuilding in ipairs(tribe.buildings) do
                if string.find(tbuilding.name, "smelting") and tbuilding.output_ware_types then
                    for waretype, _ in pairs(tbuilding.output_ware_types) do
                        apply_ware(waretype.name)
                    end
                end
            end
        end
    end

    -- Kategorien für Worker
    local function apply_worker_category(category)
        if category == "workers" then
            for _, worker in ipairs(tribe.workers) do
                if worker.name ~= "soldier" then
                    apply_worker(worker.name)
                end
            end
        elseif category == "soldiers" then
            apply_worker("soldier")
        end
    end

    -- Hauptentscheidung: Kategorie oder einzelner Name
    if target == "all" or target == "build" or target == "tools"
       or target == "weapons" or target == "ore" or target == "metals" then
        apply_ware_category(target)

    elseif target == "workers" or target == "soldiers" then
        apply_worker_category(target)

    else
        -- Prüfen, ob es ein Worker oder eine Ware ist
        local found = false
        for _, ware in ipairs(tribe.wares) do
            if ware.name == target then
                apply_ware(target)
                found = true
                break
            end
        end
        if not found then
            apply_worker(target)
        end
    end

    return true
end

function _set_all_wares_policy(startx, starty, policy)
    -- Default: "normal"
    local valid_policies = {
        normal   = true,
        prefer   = true,
        dontstock= true,
        remove   = true
    }
    if not valid_policies[policy] then
        policy = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local player = field.owner
    local warehouse = field.immovable

    if not (player and warehouse and warehouse.descr.type_name == "warehouse") then
        return false
    end

    local tribe = player.tribe
    for _, ware in ipairs(tribe.wares) do
        warehouse:set_warehouse_policies(ware.name, policy)
    end
    return true
end

function set_warehouse_remove_all(x, y, policy)   _set_all_wares_policy(x, y, policy or "remove") end
function set_warehouse_dontstock_all(x, y, policy) _set_all_wares_policy(x, y, policy or "dontstock") end
function set_warehouse_prefer_all(x, y, policy)   _set_all_wares_policy(x, y, policy or "prefer") end
function reset_warehouse_policy(x, y, policy)     _set_all_wares_policy(x, y, policy or "normal") end

function set_warehouse_remove_all(x, y)   _set_all_wares_policy(x, y, "remove") end
function set_warehouse_dontstock_all(x, y) _set_all_wares_policy(x, y, "dontstock") end
function set_warehouse_prefer_all(x, y)   _set_all_wares_policy(x, y, "prefer") end
function reset_warehouse_policy(x, y)     _set_all_wares_policy(x, y, "normal") end

-- Benennt ein Gebäude (z. B. Lagerhaus, HQ) auf einem bestimmten Feld um.
-- Funktioniert nur, wenn das Objekt die Eigenschaft "warehousename" unterstützt.
function rename_object(startx, starty, objectname)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local immovable = field.immovable

    -- Prüfen, ob überhaupt ein unbewegliches Objekt existiert
    if immovable and immovable.descr and immovable.descr.type_name == "building" then
        -- Prüfen, ob es ein Lagerhaus/HQ ist (diese besitzen "warehousename")
        if immovable.warehousename ~= nil then
            immovable.warehousename = objectname
        else
            print("rename_object: Objekt ist ein Gebäude, aber kein Lagerhaus/HQ")
        end
    else
        print("rename_object: Kein gültiges Gebäude auf diesem Feld")
    end
end

pop_textdomain()
