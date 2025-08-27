-- =======================================================================
--   Optimiertes Debug-Skript für Flaggen und Straßen
--   (mit Nutzung der vorhandenen Helper-Funktionen)
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"
include "addons/enhanced_debug_scripts.wad/debug_map.lua"

-- ========================
-- Flaggen-Funktionen
-- ========================

-- Erzwingt das Platzieren einer Flagge an einem bestimmten Feld.
-- Wenn player_number = 0, dann wird der Besitzer des Feldes verwendet.
function force_flag(startx, starty, player_number)
    local game = wl.Game()
    local map = game.map
    local player = nil

    if player_number and player_number > 0 then
        player = game.players[player_number]
    else
        player = map:get_field(startx, starty).owner
    end

    if player then
        player:place_flag(map:get_field(startx, starty))
    end
end

-- Entfernt eine einzelne Flagge, wenn dort eine steht.
function remove_flag(startx, starty)
    local imm = wl.Game().map:get_field(startx, starty).immovable
    if imm and imm.descr.type_name == "flag" then
        imm:remove()
    end
end

-- Entfernt alle Flaggen in einem Radius um ein Feld.
function remove_all_flags(startx, starty, radius)
    radius = radius or 0
    local fields = wl.Game().map:get_field(startx, starty):region(radius)

    for _, field in ipairs(fields) do
        local imm = field.immovable
        if imm and imm.descr.type_name == "flag" and not imm.building then
            imm:remove()
        end
    end
end

-- ========================
-- Straßen-Funktionen
-- ========================

-- Normalisiert den Straßentyp (nur "normal", "busy", "waterway" sind gültig).
function normalize_roadtype(rt)
    if rt and (string.find(rt, "busy") or string.find(rt, "waterway")) then
        return rt
    else
        return "normal"
    end
end

-- Hilfsfunktion: Baut eine Straße anhand der Move-Liste.
-- force = true -> zwingt das Bauen auch über Hindernisse
-- create_carriers = true -> setzt sofort die passenden Träger ein
function build_road(player, startflag, moves, roadtype, force, create_carriers)
    if force then table.insert(moves, true) end
    local r = player:place_road(roadtype, startflag, table.unpack(moves))
    if r and create_carriers then
        r:set_workers(r.valid_workers)
    end
    return r
end

-- Baut eine normale Straße anhand eines Kommandostrings (z. B. "r,tr,br|").
function place_road(startx, starty, road_command, roadtype)
    roadtype = normalize_roadtype(roadtype)
    local map = wl.Game().map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner

    -- Stelle sicher, dass das Kommando mit "|" endet
    if road_command:sub(-1) ~= "|" then
        road_command = road_command .. "|"
    end

    local moves, r = {}
    for m in road_command:gmatch("%a+[,|]") do
        table.insert(moves, m:sub(1,-2))
        if m:sub(-1) == "|" then
            r = build_road(player, startflag, moves, roadtype, false, false)
            startflag, moves = r.end_flag, {}
        end
    end
    return r
end

-- Baut eine erzwungene Straße (ignoriert Hindernisse, kann Träger setzen).
function force_road(startx, starty, road_command, roadtype, create_carriers)
    roadtype = normalize_roadtype(roadtype)
    local map = wl.Game().map
    local startflag = map:get_field(startx, starty).immovable
    local player = startflag.owner

    if road_command:sub(-1) ~= "|" then
        road_command = road_command .. "|"
    end

    local moves, r = {}
    for m in road_command:gmatch("%a+[,|]") do
        table.insert(moves, m:sub(1,-2))
        if m:sub(-1) == "|" then
            r = build_road(player, startflag, moves, roadtype, true, create_carriers)
            startflag, moves = r.end_flag, {}
        end
    end
    return r
end

-- Entfernt eine Straße, wenn auf dem Feld eine ist.
function remove_road(startx, starty)
    local imm = wl.Game().map:get_field(startx, starty).immovable
    if imm and imm.descr.type_name == "road" then
        imm:remove()
    end
end

-- Entfernt alle Straßen in einem Radius um ein Feld.
function remove_all_roads(startx, starty, radius)
    radius = radius or 0
    local fields = wl.Game().map:get_field(startx, starty):region(radius)

    for _, field in ipairs(fields) do
        local imm = field.immovable
        if imm and imm.descr.type_name == "road" then
            imm:remove()
        end
    end
end

-- ========================
-- Verbindung zwischen zwei Punkten
-- ========================

-- Erstellt automatisch eine Straßenverbindung zwischen Start- und Zielfeld.
-- Nutzt dabei die Hilfsfunktion map_direction, um Schritt für Schritt
-- den kürzesten Pfad zu finden.
function force_connection(startx, starty, targetx, targety, roadtype, create_carriers)
    roadtype = normalize_roadtype(roadtype)

    local game = wl.Game()
    local map = game.map
    local startfield = map:get_field(startx, starty)
    local targetfield = map:get_field(targetx, targety)
    local player = startfield.owner

    -- Stelle sicher, dass am Startfeld eine Flagge steht
    local startflag = startfield.immovable
    if not startflag or startflag.descr.type_name ~= "flag" then
        if startflag then startflag:remove() end
        startflag = player:place_flag(startfield)
    end

    -- Schrittweise von Start zum Ziel laufen
    local road_command, road_field = "", startfield
    while road_field ~= targetfield do
        local dir = map_direction(road_field.x, road_field.y, targetfield.x, targetfield.y)
        if dir == "" then break end
        road_command = road_command == "" and dir or (road_command .. "," .. dir)
        road_field = road_field[dir .. "n"]
    end

    -- Wenn ein Pfad gefunden wurde -> Straße bauen
    if road_command ~= "" then
        print("Straße erstellt:", road_command)
        return force_road(startfield.x, startfield.y, road_command, roadtype, create_carriers)
    end
end

pop_textdomain()
