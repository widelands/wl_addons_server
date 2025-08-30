-- =======================================================================
--           Test script for map debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)
include "addons/enhanced_debug_scripts.wad/debug.lua"

-- gibt ein zufälliges Feld zurück
function get_random_field(startx, starty, radius)
    local game = wl.Game()
    local map = game.map
    local center = map:get_field(startx, starty)
    local fields = center:region(radius or 0)
    return fields[math.random(#fields)]
end

-- Berechnet die (euklidische) Distanz zwischen zwei Punkten auf der Karte
-- berücksichtigt toroidales (wrap-around) Verhalten in x- und y-Richtung
function map_distance(startx, starty, targetx, targety)
    local game = wl.Game()
    local map = game.map

    local mapx = map.width
    local mapy = map.height

    -- Roh-Differenzen
    local diffx = math.abs(targetx - startx)
    local diffy = math.abs(targety - starty)

    -- Wrap-around berücksichtigen: kürzeren Abstand wählen
    if diffx > mapx / 2 then
        diffx = mapx - diffx
    end
    if diffy > mapy / 2 then
        diffy = mapy - diffy
    end

    -- Standard-Euklidische Distanz
    return math.sqrt(diffx * diffx + diffy * diffy)
end

-- Bestimmt die Bewegungsrichtung auf der Karte von (startx, starty) nach (targetx, targety)
-- Gibt einen String zurück: "", "l", "r", "tl", "tr", "bl", "br"
function map_direction(startx, starty, targetx, targety)
    local game = wl.Game()
    local map = game.map
    local mapx = math.floor(map.width / 2)
    local mapy = math.floor(map.height / 2)

    local diffx = targetx - startx
    local diffy = targety - starty

    -- Korrektur für toroidale Karten (falls die Map an den Rändern "wrap-around" hat)
    if math.abs(diffx) >= mapx then diffx = -diffx end
    if math.abs(diffy) >= mapy then diffy = -diffy end

    -- Falls Start und Ziel identisch sind → keine Richtung
    if diffx == 0 and diffy == 0 then
        return ""
    end

    -- Spezialfall: Bewegung rein vertikal (diffx == 0)
    -- In diesem Fall hängt die Richtung zusätzlich von der Parität der y-Koordinate ab
    if diffx == 0 then
        if diffy < 0 then
            return (targety % 2 == 0) and "tl" or "tr"
        else
            return (targety % 2 == 0) and "bl" or "br"
        end
    end

    -- Standardfälle: Bewegung in eine der sechs Hexfeld-Richtungen
    if diffx < 0 then
        if diffy < 0 then return "tl"
        elseif diffy == 0 then return "l"
        else return "bl" end
    else -- diffx > 0
        if diffy < 0 then return "tr"
        elseif diffy == 0 then return "r"
        else return "br" end
    end
end

-- Ändert das Terrain (terr) und die Deko-Variante (terd)
-- im Umkreis von (startx, starty) auf den angegebenen Typ
-- Standardwerte: radius = 1, terrainname = "summer_water"
function change_terrain(startx, starty, radius, terrainname)
    radius = radius or 1
    terrainname = terrainname or "summer_water"

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for _, field in ipairs(fields) do
        -- Terrain-Typ setzen
        field.terr = terrainname
        -- Deko-Variante explizit gleichsetzen
        field.terd = terrainname
    end
end

-- Platziert eine Ressource (z.B. Kohle, Eisen, Wasser) in allen Feldern
-- im Umkreis von (startx, starty).
-- Standardwerte: radius = 1, resourcename = "none", resourceamount = 1
function place_resource(startx, starty, radius, resourcename, resourceamount)
    radius = radius or 1
    resourcename = resourcename or "none"
    resourceamount = resourceamount or 1

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    for _, field in ipairs(fields) do
        -- Ressourcentyp setzen (z.B. "resource_coal", "resource_iron", "resource_water")
        field.resource = resourcename
        -- Ressourcenvorrat setzen (Menge im Feld)
        field.resource_amount = resourceamount
    end
end

-- Platziert ein einzelnes unbewegliches Objekt (z. B. Baum, Stein, Gebäude)
-- an der angegebenen Kartenposition (startx, starty).
function place_object(startx, starty, objectname)
    local game = wl.Game()
    local map = game.map
    local field = map:get_field(startx, starty)

    -- Objekt wird direkt ins Feld gesetzt
    map:place_immovable(objectname, field)
end

-- Platziert mehrere Objekte zufällig verteilt in einem Radius um (startx, starty).
-- Standard: objectcount = 1
function place_objects(startx, starty, radius, objectname, objectcount)
    objectcount = objectcount or 1

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)
    local fields = centerfield:region(radius)

    -- Solange es freie Felder gibt und noch Objekte zu setzen sind
    while #fields > 0 and objectcount > 0 do
        -- Zufälliges Feld wählen
        local idx = math.random(#fields)
        local f = fields[idx]

        -- Nur leere Felder verwenden
        if not f.immovable then
            place_object(f.x, f.y, objectname)
            objectcount = objectcount - 1
        end

        -- Feld aus der Liste entfernen (Vermeidung von Doppelbelegung)
        table.remove(fields, idx)
    end
end

-- Setzt zufällige Bäume passend zum Terrain
function place_random_trees(startx, starty, radius, objectcount)
    objectcount = objectcount or 1

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    -- Baumlisten je nach Terrain
    local treelist_desert = {
        "palm_borassus_desert_mature",
        "palm_coconut_desert_mature",
        "palm_date_desert_mature",
        "palm_oil_desert_mature",
        "palm_roystonea_desert_mature"
    }
    local treelist_summer = {
        "alder_summer_mature",   -- Erle
        "aspen_summer_mature",   -- Espe
        "beech_summer_mature",   -- Buche
        "birch_summer_mature",   -- Birke
        "larch_summer_mature",   -- Lärche
        "oak_summer_mature",     -- Eiche
        "rowan_summer_mature",   -- Eberesche
        "spruce_summer_mature"   -- Fichte
    }
    local treelist_wasteland = {
        "cirrus_wasteland_mature",
        "liana_wasteland_mature",
        "mushroom_dark_wasteland_mature",
        "mushroom_green_wasteland_mature",
        "mushroom_red_wasteland_mature",
        "twine_wasteland_mature",
        "umbrella_green_wasteland_mature",
        "umbrella_red_wasteland_mature"
    }
    local treelist_winter = {
        "maple_winter_mature",   -- Ahorn
    }

    -- Standard = Sommerbäume
    local treelist = treelist_summer

    -- Terrainname abfragen (z.B. "summer_meadow", "desert_dry")
    local terrainname = centerfield.terr or ""

    if terrainname:find("desert") then
        treelist = treelist_desert
    elseif terrainname:find("summer") then
        treelist = treelist_summer
    elseif terrainname:find("wasteland") then
        treelist = treelist_wasteland
    elseif terrainname:find("winter") then
        treelist = treelist_winter
    end

    -- Objekte zufällig im Radius verteilen
    while objectcount > 0 do
        local randomtree = treelist[math.random(#treelist)]
        local rcount = math.random(objectcount)
        place_objects(startx, starty, radius, randomtree, rcount)
        objectcount = objectcount - rcount
    end
end

-- Setzt zufällige Felsen passend zum Terrain
function place_random_rocks(startx, starty, radius, objectcount)
    objectcount = objectcount or 1

    local game = wl.Game()
    local map = game.map
    local centerfield = map:get_field(startx, starty)

    -- Felsenlisten je nach Terrain
    local rocklist_blackland = {
        "blackland_rocks1", "blackland_rocks2", "blackland_rocks3", "blackland_rocks4", "blackland_rocks5", "blackland_rocks6"
    }
    local rocklist_desert = {
        "desert_rocks1", "desert_rocks2", "desert_rocks3", "desert_rocks4", "desert_rocks5", "desert_rocks6"
    }
    local rocklist_greenland = {
        "greenland_rocks1", "greenland_rocks2", "greenland_rocks3", "greenland_rocks4", "greenland_rocks5", "greenland_rocks6"
    }
    local rocklist_winterland = {
        "winterland_rocks1", "winterland_rocks2", "winterland_rocks3", "winterland_rocks4", "winterland_rocks5", "winterland_rocks6"
    }

    -- Standard = Grünland
    local rocklist = rocklist_greenland

    -- Terrainname prüfen
    local terrainname = centerfield.terr or ""

    if terrainname:find("blackland") then
        rocklist = rocklist_blackland
    elseif terrainname:find("desert") then
        rocklist = rocklist_desert
    elseif terrainname:find("winter") then
        rocklist = rocklist_winterland
    elseif terrainname:find("green") then
        rocklist = rocklist_greenland
    end

    -- Objekte zufällig im Radius verteilen
    while objectcount > 0 do
        local randomrock = rocklist[math.random(#rocklist)]
        local rcount = math.random(objectcount)
        place_objects(startx, starty, radius, randomrock, rcount)
        objectcount = objectcount - rcount
    end
end

-- Entfernt ein einzelnes Objekt ohne Effekte
function remove_object(startx, starty)
    local field = wl.Game().map:get_field(startx, starty)
    if field.immovable then
        field.immovable:remove()
    end
end

-- Entfernt alle Objekte in einem Radius ohne Effekte
function remove_all_objects(startx, starty, radius)
    radius = radius or 0
    local game = wl.Game()
    local fields = game.map:get_field(startx, starty):region(radius)

    for _, field in ipairs(fields) do
        if field.immovable then
            field.immovable:remove()
        end
    end
end

-- Zerstört ein einzelnes Objekt (mit Effekten)
function destroy_object(startx, starty)
    local field = wl.Game().map:get_field(startx, starty)
    if field.immovable then
        field.immovable:destroy()
    end
end

-- Zerstört alle Objekte in einem Radius (mit Effekten)
function destroy_all_objects(startx, starty, radius)
    radius = radius or 0
    local game = wl.Game()
    local fields = game.map:get_field(startx, starty):region(radius)

    for _, field in ipairs(fields) do
        if field.immovable then
            field.immovable:destroy()
        end
    end
end

-- Setzt ein Objekt auf ein Feld, entfernt vorher vorhandene Objekte
function force_object(startx, starty, objectname)
    local game = wl.Game()
    local field = game.map:get_field(startx, starty)

    -- Vorhandenes Objekt entfernen, falls vorhanden
    if field.immovable then
        remove_object(startx, starty)
    end

    -- Neues Objekt platzieren
    place_object(startx, starty, objectname)
end

function force_trade_pole(startx, starty)
    force_object(startx, starty, "europeans_trade_pole")
end

-- Erobert Felder für einen Spieler innerhalb eines bestimmten Radius
-- startx, starty: Koordinaten des Zentrums
-- radius: Radius der zu erobernden Felder
-- player_number: Nummer des Spielers, der erobern soll
function conquer_fields(startx, starty, radius, player_number)
    local game = wl.Game()
    local player = game.players[player_number]  -- Spieler anhand der Nummer auswählen
    local map = game.map
    local centerfield = map:get_field(startx, starty)  -- Zentrales Feld ermitteln

    -- Spieler erobert alle Felder im Radius um das Zentrum
    player:conquer(centerfield, radius)
end

-- Erobert nur Wasserfelder innerhalb eines Radius für einen bestimmten Spieler
-- startx, starty: Koordinaten des Zentrums
-- radius: Radius um das Zentrum (Standard 0)
-- player_number: Nummer des Spielers, der erobern soll
function conquer_water_fields(startx, starty, radius, player_number)
    radius = radius or 0

    local game = wl.Game()
    local player = game.players[player_number]  -- Spieler auswählen
    local map = game.map
    local centerfield = map:get_field(startx, starty)  -- Zentrum ermitteln
    local fields = centerfield:region(radius)          -- Alle Felder im Radius

    -- Nur Felder erobern, die schwimmbar sind (Wasserfelder)
    for _, field in ipairs(fields) do
        if field:has_caps("swimmable") then
            player:conquer(field, 0)  -- Feld für Spieler erobern
        end
    end
end

-- Erobert alle Wasserfelder auf der Karte für einen Spieler
-- player_number: Nummer des Spielers
-- radius: Radius um jedes Feld, der erobert wird (Standard 0)
function conquer_all_water_fields(player_number, radius)
    radius = radius or 0

    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map

    -- Alle Felder der Karte durchlaufen
    for x = 0, map.width - 1 do
        for y = 0, map.height - 1 do
            local field = map:get_field(x, y)

            -- Nur Wasserfelder erobern
            if field:has_caps("swimmable") then
                player:conquer(field, radius)
            end
        end
    end
end

-- Erobert alle nicht begehbaren Felder auf der Karte für einen Spieler
-- player_number: Nummer des Spielers
-- radius: Radius um jedes Feld, der erobert wird (Standard 0)
function conquer_all_nonwalkable_fields(player_number, radius)
    radius = radius or 0

    local game = wl.Game()
    local player = game.players[player_number]
    local map = game.map

    -- Alle Felder der Karte durchlaufen
    for x = 0, map.width - 1 do
        for y = 0, map.height - 1 do
            local field = map:get_field(x, y)

            -- Nur nicht begehbare Felder erobern
            if not field:has_max_caps("walkable") then
                player:conquer(field, radius)
            end
        end
    end
end

-- Erobert alle Felder, die eine Flagge oder Straße besitzen, für deren Besitzer
-- radius: Radius um jedes Feld, der erobert wird (Standard 1)
function conquer_flag_fields(radius)
    radius = radius or 1

    local game = wl.Game()
    local map = game.map

    -- Alle Felder der Karte durchlaufen
    for x = 0, map.width - 1 do
        for y = 0, map.height - 1 do
            local field = map:get_field(x, y)
            local immovable = field.immovable
            local player = nil

            -- Spieler bestimmen: entweder Besitzer des Objekts oder Feldbesitzer
            if immovable then
                player = immovable.owner
            else
                player = field.owner
            end

            -- Wenn ein Spieler existiert und ein Objekt vorhanden ist
            if player and immovable then
                local type_name = immovable.descr.type_name

                -- Erobere das Feld, wenn es eine Flagge oder Straße ist
                if type_name == "flag" or type_name == "road" then
                    player:conquer(field, radius)
                end
            end
        end
    end
end

-- Erobert alle Hafen-Felder für deren Besitzer
-- radius: Radius um jedes Feld, der erobert wird (Standard 1)
function conquer_port_fields(radius)
    radius = radius or 1

    local game = wl.Game()
    local map = game.map

    -- Alle Hafen-Felder der Karte durchlaufen
    for _, portfield in ipairs(map.port_spaces) do
        local field = map:get_field(portfield.x, portfield.y)
        local player = field.owner

        -- Feld nur erobern, wenn ein Besitzer existiert
        if player then
            player:conquer(field, radius)
        end
    end
end

-- Überträgt Felder von einem Spieler zu einem anderen
-- player_number1: Quellspieler (0 = alle Felder)
-- player_number2: Zielspieler (0 = nur freigeben)
function transfer_fields(player_number1, player_number2)
    local game = wl.Game()
    local map = game.map

    local player1 = player_number1 > 0 and game.players[player_number1] or nil
    local player2 = player_number2 > 0 and game.players[player_number2] or nil

    -- verbotene Typen einmal definieren
    local blocked_types = {
        flag = true,
        roadbase = true,
        building = true,
        constructionsite = true,
        dismantlesite = true,
        warehouse = true,
        port = true,
        militarysite = true,
        trainingsite = true,
        productionsite = true,
    }

    for x = 0, map.width - 1 do
        for y = 0, map.height - 1 do
            local field = map:get_field(x, y)
            local imm = field.immovable

            -- nur Felder bearbeiten, die nicht geblockt sind
            if not imm or not blocked_types[imm.descr.type_name] then
                if player1 and player2 then
                    if field.owner == player1 then
                        player2:conquer(field, 0)
                    end
                elseif player1 then
                    if field.owner == player1 then
                        field.owner = nil
                    end
                elseif player2 then
                    if field.owner and field.owner ~= player2 then
                        player2:conquer(field, 0)
                    end
                else
                    field.owner = nil
                end
            end
        end
    end
end


pop_textdomain()
