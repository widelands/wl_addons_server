-- =======================================================================
--           Test script for debugging buildings.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"

-- building settings with coordinates --
function force_building(startx, starty, radius, building_name, complete)
    complete = complete or false

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)
    local field = fields[math.random(#fields)]

    local player = field.owner
    local building = nil
    local found_building = nil

    if player then
        local tribe = player.tribe

        for i, tbuilding in ipairs(tribe.buildings) do
            if tbuilding.name == string.lower(building_name) then
                found_building = building_name
                break
            elseif string.find(tbuilding.name, string.lower(building_name)) then
                found_building = tbuilding.name
                break
            end
        end

        if (found_building) and (complete == true) then
            if (field.immovable) then
                field.immovable:remove()
            end
            building = player:place_building(found_building, field, false, true)
        elseif (found_building) and (complete == false) then
            if (field.immovable) then
                field.immovable:remove()
            end
            building = player:place_building(found_building, field, true, true)
        end
    end

    return building
end

function force_headquarters(startx, starty, radius, complete)
    radius = radius or 0
    complete = complete or false

    local headquarters = force_building(startx, starty, radius, "headquarters", complete)
end

function force_warehouse(startx, starty, radius, complete)
    radius = radius or 0
    complete = complete or false

    local warehouse = force_building(startx, starty, radius, "warehouse", complete)
end

function force_mine(startx, starty, radius)
    radius = radius or 0

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    local fields = centerfield:region(radius)
    local mine_field = fields[math.random(#fields)]
    local resource = mine_field.resource
    local amount = mine_field.resource_amount

    local minename = ""
    local suffix = ""

    local player = mine_field.owner

    if player then
        local tribe = player.tribe
        local tribe_name = tribe.name

        if resource == "resource_water" then
            if tribe_name == "amazons" then
                minename = "water_gatherers_hut"
            else
                minename = "well"
            end
        elseif resource == "resource_coal" then
            minename = "coalmine"
        elseif resource == "resource_iron" then
            minename = "ironmine"
        elseif resource == "resource_gold" then
            if tribe_name == "amazons" then
                minename = "gold_digger_dwelling"
            else
                minename = "goldmine"
            end
        elseif resource == "resource_stone" then
            if tribe_name == "amazons" then
                minename = "stonemine"
            elseif tribe_name == "atlanteans" then
                minename = "crystalmine"
            elseif tribe_name == "barbarians" then
                minename = "granitemine"
            elseif tribe_name == "empire" then
                minename = "marblemine"
            elseif tribe_name == "frisians" then
                minename = "rockmine"
            else
                minename = "stonemine"
            end
        else
            minename = "well"
        end

        if tribe_name == "europeans" then
            if amount >= 20 then
                suffix = "_basic"
            elseif amount > 16 then
                suffix = "_level_1"
            elseif amount > 8 then
                suffix = "_level_2"
            else
                suffix = "_level_3"
            end
        elseif tribe_name == "barbarians" then
            if amount >= 15 then
                suffix = ""
            elseif amount >= 8 then
                suffix = "_deep"
            else
                suffix = "_deeper"
            end
        elseif tribe_name == "empire" then
            if amount >= 10 then
                suffix = ""
            else
                suffix = "_deep"
            end
        elseif tribe_name == "frisians" then
            if amount >= 10 then
                suffix = ""
            else
                suffix = "_deep"
            end
        end

        local mine = player:place_building(tribe_name.."_"..minename..suffix, mine_field, true, true)
    end
end

function force_port(startx, starty, radius, player_number, complete)
    complete = complete or false

    local game = wl.Game()
    local map = game.map

    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        if player_number > 0 then
            local player = game.players[player_number]
            local tribe = player.tribe

            for i, portfield in pairs(map.port_spaces) do
                if (map_distance(startx, starty, portfield.x, portfield.y) <= radius) then
                    field = map:get_field(portfield.x, portfield.y)
                    if not (field.immovable) then
                        if (complete == true) then
                            local port = player:place_building(player.tribe.port, field, false, true)
                        end
                        if (complete == false) then
                            local port = player:place_building(player.tribe.port, field, true, true)
                        end
                    end
                    if (field.immovable) then
                        if (complete == true) and not (field.immovable.descr.type_name == "warehouse") then
                            local port = player:place_building(player.tribe.port, field, false, true)
                        end
                        if (complete == false) and not (field.immovable.descr.type_name == "warehouse") then
                            local port = player:place_building(player.tribe.port, field, true, true)
                        end
                    end
                end
            end
        else
            for i, portfield in pairs(map.port_spaces) do
                if (map_distance(startx, starty, portfield.x, portfield.y) <= radius) then
                    field = map:get_field(portfield.x, portfield.y)
                    if not (field.immovable) then
                        if (complete == true) then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, false, true)
                            end
                        end
                        if (complete == false) then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, true, true)
                            end
                        end
                    end
                    if (field.immovable) then
                        if (complete == true) and not (field.immovable.descr.type_name == "warehouse") then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, false, true)
                            end
                        end
                        if (complete == false) and not (field.immovable.descr.type_name == "warehouse") then
                            local player = field.owner
                            if player then
                                local port = player:place_building(player.tribe.port, field, true, true)
                            end
                        end
                    end
                end
            end
        end
    end
end

function force_militarysite(startx, starty, radius, player_number, size, index, heroes)
    size = size or "small"
    index = index or 0
    heroes = heroes or false

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)
    local player = game.players[player_number]
    local tribe_name = player.tribe.name

    local max_soldier_stats = {0,0,0,0}

    if heroes and (tribe_name == "europeans") then
        max_soldier_stats = {1,1,1,1}
    elseif heroes and (tribe_name == "amazons") then
        max_soldier_stats = {3,2,2,3}
    elseif heroes and (tribe_name == "atlanteans") then
        max_soldier_stats = {1,4,2,2}
    elseif heroes and (tribe_name == "barbarians") then
        max_soldier_stats = {3,5,0,2}
    elseif heroes and (tribe_name == "empire") then
        max_soldier_stats = {4,4,0,2}
    elseif heroes and (tribe_name == "frisians") then
        max_soldier_stats = {2,6,2,0}
    end

    if tribe_name == "europeans" then
        if (size == "mine") or (size == "mountain") then
            militarysites = {"europeans_sentry_mountain"}
        elseif (size == "test") then
            militarysites = {"europeans_empire_sentry"}
        elseif size == "small" then
            militarysites = {"europeans_sentry_basic", "europeans_sentry_level_1", "europeans_sentry_level_2", "europeans_sentry_level_3"}
        elseif size == "medium" then
            militarysites = {"europeans_barrier_basic", "europeans_barrier_level_1", "europeans_barrier_level_2", "europeans_barrier_level_3"}
        elseif size == "tower" then
            militarysites = {"europeans_tower_basic", "europeans_tower_level_1", "europeans_tower_level_2", "europeans_tower_level_3"}
        elseif size == "big" then
            militarysites = {"europeans_castle_basic", "europeans_castle_level_1", "europeans_castle_level_2", "europeans_castle_level_3", "europeans_castle_level_4"}
        end
    elseif tribe_name == "amazons" then
        if size == "small" then
            militarysites = {"amazons_treetop_sentry", "amazons_patrol_post"}
        elseif size == "medium" then
            militarysites = {"amazons_warriors_dwelling"}
        elseif size == "tower" then
            militarysites = {"amazons_tower", "amazons_observation_tower"}
        elseif size == "big" then
            militarysites = {"amazons_fortress", "amazons_fortification"}
        end
    elseif tribe_name == "atlanteans" then
        if size == "small" then
            militarysites = {"atlanteans_guardhouse", "atlanteans_tower_small"}
        elseif size == "medium" then
            militarysites = {"atlanteans_guardhall"}
        elseif size == "tower" then
            militarysites = {"atlanteans_tower", "atlanteans_tower_high"}
        elseif size == "big" then
            militarysites = {"atlanteans_castle"}
        end
    elseif tribe_name == "barbarians" then
        if size == "small" then
            militarysites = {"barbarians_sentry"}
        elseif size == "medium" then
            militarysites = {"barbarians_barrier"}
        elseif size == "tower" then
            militarysites = {"barbarians_tower"}
        elseif size == "big" then
            militarysites = {"barbarians_fortress", "barbarians_citadel"}
        end
    elseif tribe_name == "empire" then
        if size == "small" then
            militarysites = {"empire_blockhouse", "empire_sentry"}
        elseif size == "medium" then
            militarysites = {"empire_barrier", "empire_outpost"}
        elseif size == "tower" then
            militarysites = {"empire_tower"}
        elseif size == "big" then
            militarysites = {"empire_fortress", "empire_castle"}
        end
    elseif tribe_name == "frisians" then
        if size == "small" then
            militarysites = {"frisians_wooden_tower", "frisians_wooden_tower_high"}
        elseif size == "medium" then
            militarysites = {"frisians_sentinel", "frisians_outpost"}
        elseif size == "tower" then
            militarysites = {"frisians_tower"}
        elseif size == "big" then
            militarysites = {"frisians_fortress"}
        end
    end
    index = (index % #militarysites) + 1
    local militarysite = player:place_building(militarysites[index], fields[math.random(#fields)], false, true)
    militarysite:set_soldiers(max_soldier_stats, militarysite.max_soldiers)
end

function dismantle_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       map:get_field(startx, starty).immovable:dismantle(true)
    end
end

function dismantle_all_buildings_in_region(startx, starty, radius)
    radius = radius or 0

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for idx, field in ipairs(fields) do
        if (field.immovable) and (field.immovable.building) then
           field.immovable.building:dismantle(true)
        end
    end
end

function upgrade_building(startx, starty)
    local game = wl.Game()
    local map = game.map

    if (map:get_field(startx, starty).immovable.descr.type_name == "productionsite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "trainingsite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "militarysite") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "warehouse") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
    if (map:get_field(startx, starty).immovable.descr.type_name == "market") then
       map:get_field(startx, starty).immovable:enhance(true)
    end
end

function block_dismantle_building(startx, starty, yesno)
    yesno = yesno or true

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    building.destruction_blocked = yesno
end

function block_destruction_building(startx, starty, yesno)
    yesno = yesno or true

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    building.destruction_blocked = yesno
end

function set_warehouse_worker_policy(startx, starty, workername, policiename)
    policiename = policiename or "normal"
    if not policiename or not (string.find(policiename, "prefer") or string.find(policiename, "dontstock") or string.find(policiename, "remove")) then
        policiename = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local worker_name = (tribe.name .. "_" .. workername)

    for i, worker in ipairs(tribe.workers) do
        if worker.name == workername then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_warehouse_policies(workername, policiename)
                     end
                end
            end
        end
        if worker.name == worker_name then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_warehouse_policies(worker_name, policiename)
                     end
                end
            end
        end
    end
end

function set_warehouse_ware_policy(startx, starty, warename, policiename)
    policiename = policiename or "normal"
    if not policiename or not (string.find(policiename, "prefer") or string.find(policiename, "dontstock") or string.find(policiename, "remove")) then
        policiename = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        if ware.name == warename then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_warehouse_policies(warename, policiename)
                     end
                end
            end
        end
    end
end

function set_warehouse_waretype_policy(startx, starty, waretype, policiename)
    policiename = policiename or "normal"
    if not policiename or not (string.find(policiename, "prefer") or string.find(policiename, "dontstock") or string.find(policiename, "remove")) then
        policiename = "normal"
    end

    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    if waretype == "all" then
        for i, ware in ipairs(tribe.wares) do
            set_warehouse_ware_policy(startx, starty, ware.name, policiename)
        end
    elseif waretype == "build" then
        for i, ware in ipairs(tribe.wares) do
            if (ware:is_construction_material(tribe.name)) then
                set_warehouse_ware_policy(startx, starty, ware.name, policiename)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.buildcost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.enhancement_cost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
    elseif waretype == "tools" then
        for i, tworker in ipairs(tribe.workers) do
            for warecount, warename in pairs(tworker.buildcost) do
                set_warehouse_ware_policy(startx, starty, warename, policiename)
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and not string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                        end
                    end
                end
            end
        end
    elseif waretype == "weapons" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "productionsite" and tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                        end
                    end
                end
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "trainingsite" then
                if tbuilding.inputs then
                    for k, waretype, warecount in pairs(tbuilding.inputs) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    elseif waretype == "ore" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.is_mine then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    elseif waretype == "metals" then
        for i, tbuilding in pairs(tribe.buildings) do
            if string.find(tbuilding.name, "smelting") then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_ware_policy(startx, starty, waretype.name, policiename)
                    end
                end
            end
        end
    end
end

function set_warehouse_warecount(startx, starty, warename, warecount)
    warecount = warecount or 1

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty).immovable
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        if ware.name == warename then
            for j, tbuilding in ipairs(tribe.buildings) do
                for k, building in ipairs(player:get_buildings(tbuilding.name)) do
                     if building.descr.type_name == "warehouse" and building == field then
                         building:set_wares(warename, warecount)
                     end
                end
            end
        end
    end
end

function set_warehouse_waretype_warecount(startx, starty, waretype, warenumber)
    warenumber = warenumber or 1

    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe
    local field = map:get_field(startx, starty).immovable

    if waretype == "all" then
        for i, ware in ipairs(tribe.wares) do
            set_warehouse_warecount(startx, starty, ware.name, warenumber)
        end
    elseif waretype == "build" then
        for i, ware in ipairs(tribe.wares) do
            if (ware:is_construction_material(tribe.name)) then
                set_warehouse_warecount(startx, starty, ware.name, warenumber)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.buildcost) do
                set_warehouse_warecount(startx, starty, warename, warenumber)
            end
        end
        for i, tbuilding in ipairs(tribe.buildings) do
            for warename, warecount in pairs(tbuilding.enhancement_cost) do
                set_warehouse_warecount(startx, starty, warename, warenumber)
            end
        end
    elseif waretype == "tools" then
        for i, tworker in ipairs(tribe.workers) do
            for warecount, warename in pairs(tworker.buildcost) do
                set_warehouse_warecount(startx, starty, warename, warenumber)
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and not string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                        end
                    end
                end
            end
        end
    elseif waretype == "weapons" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "productionsite" and tbuilding.output_worker_types then
                for j, output in pairs(tbuilding.output_worker_types) do
                    if string.find(output.name, tribe.name) and string.find(output.name, "soldier") and tbuilding.inputs then
                        for k, waretype, warecount in pairs(tbuilding.inputs) do
                            set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                        end
                    end
                end
            end
        end
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.type_name == "trainingsite" then
                if tbuilding.inputs then
                    for k, waretype, warecount in pairs(tbuilding.inputs) do
                        set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                    end
                end
            end
        end
    elseif waretype == "ore" then
        for i, tbuilding in pairs(tribe.buildings) do
            if tbuilding.is_mine then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                    end
                end
            end
        end
    elseif waretype == "metals" then
        for i, tbuilding in pairs(tribe.buildings) do
            if string.find(tbuilding.name, "smelting") then
                if tbuilding.output_ware_types then
                    for k, waretype, warecount in pairs(tbuilding.output_ware_types) do
                        set_warehouse_warecount(startx, starty, waretype.name, warenumber)
                    end
                end
            end
        end
    end
end

function set_warehouse_remove_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "remove")
    end
end

function set_warehouse_dontstock_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "dontstock")
    end
end

function set_warehouse_prefer_all(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "prefer")
    end
end

function reset_warehouse_policy(startx, starty)
    local game = wl.Game()
    local map = game.map
    local player = map:get_field(startx, starty).owner
    local tribe = player.tribe

    for i, ware in ipairs(tribe.wares) do
        set_warehouse_ware_policy(startx, starty, ware.name, "normal")
    end
end

function startstop_building(startx, starty)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    if building.descr.type_name == "productionsite" then
        building:toggle_start_stop()
    elseif building.descr.type_name == "trainingsite" then
        building:toggle_start_stop()
    end
end

function set_militarysite_capacity(startx, starty, capacity)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    if building.descr.type_name == "militarysite" then
        building.capacity = capacity
    elseif building.descr.type_name == "trainingsite" then
        building:set_capacity(capacity)
    elseif building.descr.type_name == "warehouse" then
        building.capacity = capacity
    end
end

function set_militarysite_preference(startx, starty, preference)
    preference = preference or "any"
    if not preference or not (string.find(preference, "rookies") or string.find(preference, "heroes")) then
        preference = "any"
    end

    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)
    local building = field.immovable

    if building then
        building.soldier_preference = preference
    end
end

-- building functions without coordinates --
function forbid_all_buildings(player_number, building_name)
    player_number = player_number or 0
    building_name = building_name or "all"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
            if string.lower(building_name) == "all" then
                player:forbid_buildings{tbuilding.name}
            elseif tbuilding.name == string.lower(building_name) then
                player:forbid_buildings{tbuilding.name}
            elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                player:forbid_buildings{tbuilding.name}
            elseif string.find(tbuilding.name, string.lower(building_name)) then
                player:forbid_buildings{tbuilding.name}
            elseif tbuilding.type_name == string.lower(building_name) then
                player:forbid_buildings{tbuilding.name}
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                if string.lower(building_name) == "all" then
                    player:forbid_buildings{tbuilding.name}
                elseif tbuilding.name == string.lower(building_name) then
                    player:forbid_buildings{tbuilding.name}
                elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                    player:forbid_buildings{tbuilding.name}
                elseif string.find(tbuilding.name, string.lower(building_name)) then
                    player:forbid_buildings{tbuilding.name}
                elseif tbuilding.type_name == string.lower(building_name) then
                    player:forbid_buildings{tbuilding.name}
                end
            end
        end
    end
end

function allow_all_buildings(player_number, building_name)
    player_number = player_number or 0
    building_name = building_name or "all"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
            if string.lower(building_name) == "all" then
                player:allow_buildings{tbuilding.name}
            elseif tbuilding.name == string.lower(building_name) then
                player:allow_buildings{tbuilding.name}
            elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                player:allow_buildings{tbuilding.name}
            elseif string.find(tbuilding.name, string.lower(building_name)) then
                player:allow_buildings{tbuilding.name}
            elseif tbuilding.type_name == string.lower(building_name) then
                player:allow_buildings{tbuilding.name}
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                if string.lower(building_name) == "all" then
                    player:allow_buildings{tbuilding.name}
                elseif tbuilding.name == string.lower(building_name) then
                    player:allow_buildings{tbuilding.name}
                elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                    player:allow_buildings{tbuilding.name}
                elseif string.find(tbuilding.name, string.lower(building_name)) then
                    player:allow_buildings{tbuilding.name}
                elseif tbuilding.type_name == string.lower(building_name) then
                    player:allow_buildings{tbuilding.name}
                end
            end
        end
    end
end

function force_port_random(player_number)
    player_number = player_number or 0

    local game = wl.Game()
    local map = game.map

    if player_number > 0 then
        local player = game.players[player_number]

        if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) and (player.tribe.port) then
            local random_idx = math.random(map.number_of_port_spaces)
            for i, portfield in pairs(map.port_spaces) do
                local field = map:get_field(portfield.x, portfield.y)
                if (i >= random_idx-1) and (field.owner == player) and (field.brn.owner == player) then
                    if not (field.immovable) or ((field.immovable) and not ((field.immovable.descr.type_name == "constructionsite") or (field.immovable.descr.type_name == "warehouse"))) then
                        player:place_building(player.tribe.port, field, true, true)
                        break
                    end
                end
            end
        end
    else
        if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
            local random_idx = math.random(map.number_of_port_spaces)
            for i, portfield in pairs(map.port_spaces) do
                local field = map:get_field(portfield.x, portfield.y)
                if (i >= random_idx-1) and (field.owner) and (field.brn.owner == field.owner) and (field.owner.tribe.port) then
                    if not (field.immovable) or ((field.immovable) and not ((field.immovable.descr.type_name == "constructionsite") or (field.immovable.descr.type_name == "warehouse"))) then
                        field.owner:place_building(field.owner.tribe.port, field, true, true)
                        break
                    end
                end
            end
        end
    end
end

function force_warehouses_on_starting_spots(player_number)
    player_number = player_number or 0

    local game = wl.Game()
    local map = game.map

    if player_number > 0 then
        local player = game.players[player_number]
        local sf = map.player_slots[player.number].starting_field
        for i, slot in ipairs(map.player_slots) do
            sf = slot.starting_field
            if (sf.owner == player) then
                if not (sf.immovable) or ((sf.immovable) and not ((sf.immovable.descr.type_name == "constructionsite") or (sf.immovable.descr.type_name == "warehouse"))) then
                    player:place_building(player.tribe.name .. "_warehouse", sf, true, true)
                end
            end
        end
    else
        for i, slot in ipairs(map.player_slots) do
            local sf = slot.starting_field
            local player = sf.owner
            if (player) then
                if not (sf.immovable) or ((sf.immovable) and not ((sf.immovable.descr.type_name == "constructionsite") or (sf.immovable.descr.type_name == "warehouse"))) then
                    player:place_building(player.tribe.name .. "_warehouse", sf, true, true)
                end
            end
        end
    end
end

function dismantle_all_buildings(player_number, building_name)
    player_number = player_number or 0

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for k, tplayer in ipairs(game.players) do
            for i, tbuilding in ipairs(tplayer.tribe.buildings) do
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if tbuilding.name == string.lower(building_name) then
                        building:dismantle(true)
                    elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                        building:dismantle(true)
                    elseif string.find(tbuilding.name, string.lower(building_name)) then
                        building:dismantle(true)
                    elseif tbuilding.type_name == string.lower(building_name) then
                        building:dismantle(true)
                    end
               end
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if tbuilding.name == string.lower(building_name) then
                        building:dismantle(true)
                    elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                        building:dismantle(true)
                    elseif string.find(tbuilding.name, string.lower(building_name)) then
                        building:dismantle(true)
                    elseif tbuilding.type_name == string.lower(building_name) then
                        building:dismantle(true)
                    end
               end
            end
        end
    end
end

function ban_all_buildings(player_number, building_name)
    if building_name == "warehouse" then building_name = "_warehouse" end
    
    forbid_all_buildings(player_number, building_name)
    dismantle_all_buildings(player_number, building_name)
end

function upgrade_all_buildings(player_number, building_name)
    player_number = player_number or 0

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
           for j, building in ipairs(player:get_buildings(tbuilding.name)) do
              if tbuilding.name == string.lower(building_name) then
                 building:enhance(true)
              elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                 building:enhance(true)
              elseif string.find(tbuilding.name, string.lower(building_name)) then
                 building:enhance(true)
              elseif tbuilding.type_name == string.lower(building_name) then
                 building:enhance(true)
              end
           end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if tbuilding.name == string.lower(building_name) then
                        building:enhance(true)
                    elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                        building:enhance(true)
                    elseif string.find(tbuilding.name, string.lower(building_name)) then
                        building:dismantle(true)
                    elseif tbuilding.type_name == string.lower(building_name) then
                        building:enhance(true)
                    end
               end
            end
        end
    end
end

function stop_all_buildings(player_number, building_name)
    player_number = player_number or 0
    building_name = building_name or "all"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
            if (tbuilding.type_name == "productionsite") or (tbuilding.type_name == "trainingsite") then
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if string.lower(building_name) == "all" then
                        if not (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif tbuilding.name == string.lower(building_name) then
                        if not (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                        if not (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif string.find(tbuilding.name, string.lower(building_name)) then
                        if not (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif tbuilding.type_name == string.lower(building_name) then
                        if not (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    end
                end
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                if (tbuilding.type_name == "productionsite") or (tbuilding.type_name == "trainingsite") then
                    for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                        if string.lower(building_name) == "all" then
                            if not (building.is_stopped) then
                                building:toggle_start_stop()
                            end
                        elseif tbuilding.name == string.lower(building_name) then
                            if not (building.is_stopped) then
                                building:toggle_start_stop()
                            end
                        elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                            if not (building.is_stopped) then
                                building:toggle_start_stop()
                            end
                        elseif string.find(tbuilding.name, string.lower(building_name)) then
                            if not (building.is_stopped) then
                                building:toggle_start_stop()
                            end
                        elseif tbuilding.type_name == string.lower(building_name) then
                            if not (building.is_stopped) then
                                building:toggle_start_stop()
                            end
                        end
                    end
                end
            end
        end
    end
end


function start_all_buildings(player_number, building_name)
    player_number = player_number or 0
    building_name = building_name or "all"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
            for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                if string.lower(building_name) == "all" then
                    if (building.is_stopped) then
                        building:toggle_start_stop()
                    end
                elseif tbuilding.name == string.lower(building_name) then
                    if (building.is_stopped) then
                        building:toggle_start_stop()
                    end
                elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                    if (building.is_stopped) then
                        building:toggle_start_stop()
                    end
                elseif string.find(tbuilding.name, string.lower(building_name)) then
                    if (building.is_stopped) then
                        building:toggle_start_stop()
                    end
                elseif tbuilding.type_name == string.lower(building_name) then
                    if (building.is_stopped) then
                        building:toggle_start_stop()
                    end
                end
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if string.lower(building_name) == "all" then
                        if (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif tbuilding.name == string.lower(building_name) then
                        if (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name)) then
                        if (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif string.find(tbuilding.name, string.lower(building_name)) then
                        if (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    elseif tbuilding.type_name == string.lower(building_name) then
                        if (building.is_stopped) then
                            building:toggle_start_stop()
                        end
                    end
                end
            end
        end
    end
end

function dismantle_idle_buildings(player_number, productivity_threshold)
    player_number = player_number or 0
    productivity_threshold = productivity_threshold or 10

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
            for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                if ((tbuilding.type_name == "productionsite") and (building.productivity < productivity_threshold)) then
                    building:dismantle(true)
                    break
                end
           end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if ((tbuilding.type_name == "productionsite") and (building.productivity < productivity_threshold)) then
                        building:dismantle(true)
                        break
                    end
               end
            end
        end
    end
end

function set_all_militarysites_preference(player_number, building_name, preference)
    player_number = player_number or 0
    preference = preference or "any"
    if not preference or not (string.find(preference, "rookies") or string.find(preference, "heroes")) then
        preference = "any"
    end

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, tbuilding in ipairs(player.tribe.buildings) do
            for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                if (string.lower(building_name) == "all") and (building.descr.type_name == "militarysite") then
                    building.soldier_preference = preference
                elseif (tbuilding.name == string.lower(building_name)) and (building.descr.type_name == "militarysite") then
                    building.soldier_preference = preference
                elseif (tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name))) and (tbuilding.type_name == "militarysite") then
                    building.soldier_preference = preference
                elseif string.find(tbuilding.name, string.lower(building_name)) and (tbuilding.type_name == "militarysite") then
                    building.soldier_preference = preference
                elseif (tbuilding.type_name == string.lower(building_name)) and (tbuilding.type_name == "militarysite") then
                    building.soldier_preference = preference
                end
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, tbuilding in ipairs(player.tribe.buildings) do
                for j, building in ipairs(player:get_buildings(tbuilding.name)) do
                    if (string.lower(building_name) == "all") and (building.descr.type_name == "militarysite") then
                        building.soldier_preference = preference
                    elseif (tbuilding.name == string.lower(building_name)) and (building.descr.type_name == "militarysite") then
                        building.soldier_preference = preference
                    elseif (tbuilding.name == (player.tribe.name .. "_" .. string.lower(building_name))) and (tbuilding.type_name == "militarysite") then
                        building.soldier_preference = preference
                    elseif string.find(tbuilding.name, string.lower(building_name)) and (tbuilding.type_name == "militarysite") then
                        building.soldier_preference = preference
                    elseif (tbuilding.type_name == string.lower(building_name)) and (tbuilding.type_name == "militarysite") then
                        building.soldier_preference = preference
                    end
                end
            end
        end
    end
end

function set_all_ports_soldier_policy(player_number, policy)
    player_number = player_number or 0
    policy = policy or "normal"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, port in ipairs(player:get_buildings(player.tribe.port)) do
            port:set_warehouse_policies(player.tribe.soldier, policy)
        end
    else
        for k, player in ipairs(game.players) do
            for i, port in ipairs(player:get_buildings(player.tribe.port)) do
                port:set_warehouse_policies(player.tribe.soldier, policy)
            end
        end
    end
end

function allow_all_militarysites(player_number, size)
    player_number = player_number or 0
    size = size or "all"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, building in ipairs(wl.Game():get_tribe_description(player.tribe.name).buildings) do
            if (building.type_name == "militarysite") and ((building.size == size) or (size == "all")) then
                player:allow_buildings{building.name}
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, building in ipairs(wl.Game():get_tribe_description(player.tribe.name).buildings) do
                if (building.type_name == "militarysite") and ((building.size == size) or (size == "all")) then
                    player:allow_buildings{building.name}
                end
            end
        end
    end
end

function forbid_all_militarysites(player_number, size)
    player_number = player_number or 0
    size = size or "all"

    local game = wl.Game()

    if player_number > 0 then
        local player = game.players[player_number]

        for i, building in ipairs(wl.Game():get_tribe_description(player.tribe.name).buildings) do
            if (building.type_name == "militarysite") and ((building.size == size) or (size == "all")) then
                player:forbid_buildings{building.name}
            end
        end
    else
        for k, player in ipairs(game.players) do
            for i, building in ipairs(wl.Game():get_tribe_description(player.tribe.name).buildings) do
                if (building.type_name == "militarysite") and ((building.size == size) or (size == "all"))then
                    player:forbid_buildings{building.name}
                end
            end
        end
    end
end

pop_textdomain()
