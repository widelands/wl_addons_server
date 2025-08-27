-- =======================================================================
--           Test script for player debugging.
-- =======================================================================

push_textdomain("enhanced_debug_scripts.wad", true)

-- =========================================
-- Globale Hilfsfunktionen
-- =========================================

-- Hilfsfunktion: prüft, ob ein Wert in einer Liste enthalten ist
function contains(list, value)
    if not list then return false end
    for _, v in ipairs(list) do
        if v == value then
            return true
        elseif type(v) == "table" and v.name == value then
            return true
        end
    end
    return false
end

-- Hilfsfunktion: Spieler iterieren
function iterate_players(player_number, fn)
    local game = wl.Game()
    if player_number > 0 then
        fn(game.players[player_number])
    else
        for _, player in ipairs(game.players) do fn(player) end
    end
end

-- Hilfsfunktion: über alle Flaggen eines Spielers iterieren
function iterate_flags(player, fn)
    local map = wl.Game().map
    for x = 0, map.width - 1 do
        for y = 0, map.height - 1 do
            local field = map:get_field(x, y)
            local immovable = field.immovable
            if immovable and immovable.owner == player then
                fn(immovable)
            end
        end
    end
end

-- Hilfsfunktion: über alle Flaggen mit Warenlager eines Spielers iterieren
function iterate_warehouse_flags(player, fn)
    local map = wl.Game().map
    for x = 0, map.width - 1 do
        for y = 0, map.height - 1 do
            local field = map:get_field(x, y)
            local immovable = field.immovable
            local warehouse = field.tln.immovable
            if immovable and immovable.owner == player and warehouse and warehouse.descr.type_name == "warehouse" then
                fn(immovable)
            end
        end
    end
end

-- Prüfen ob eine Ware im Stamm existiert
function tribe_has_ware(tribe, ware)
    for _, w in ipairs(tribe.wares) do
        if (w == ware) or (w.name == ware) then
            return true
        end
    end
    return false
end

-- Prüfen ob ein Arbeiter im Stamm existiert
function tribe_has_worker(tribe, worker)
    local full_name = worker
    -- Wenn keine Stammesangabe drin ist, automatisch ergänzen
    if not string.find(worker, "_") then
        full_name = tribe.name .. "_" .. worker
    end

    for _, w in ipairs(tribe.workers) do
        if (w == worker) or (w == full_name) or (w.name == worker) or (w.name == full_name) then
            return true
        end
    end
    return false
end


-- =========================================
-- Allgemeine Spieler-Einstellungen
-- =========================================

-- Spieler wechseln
-- Spieler player_number1 übernimmt die Kontrolle von player_number2
function switch_player(player_number1, player_number2)
    local game = wl.Game()
    local player1 = game.players[player_number1]
    if player1 and game.players[player_number2] then
        player1:switchplayer(player_number2)
    end
end

-- Beobachter-Modus aktivieren
-- Für ein ganzes Team
-- observer = true aktiviert sehen aller Felder, false deaktiviert
function observer_mode_team(team_number, observer)
    observer = observer ~= false  -- Standard: true
    local game = wl.Game()
    for _, tplayer in ipairs(game.players) do
        if tplayer.team == team_number then
            tplayer.see_all = observer
        end
    end
end

-- Für einen einzelnen Spieler
function observer_mode_player(player_number, observer)
    observer = observer ~= false  -- Standard: true
    local game = wl.Game()
    local player = game.players[player_number]
    if player then
        player.see_all = observer
    end
end

-- Friedens- oder Kriegsmodus setzen
-- Hilfsfunktion, um Angriffserlaubnis zwischen Spielergruppen zu setzen
function set_attack_mode(player_number1, player_number2, forbidden)
    local game = wl.Game()

    local players1 = {}
    local players2 = {}

    -- Bestimme erste Spielergruppe
    if player_number1 > 0 and game.players[player_number1] then
        players1 = {game.players[player_number1]}
    else
        players1 = game.players
    end

    -- Bestimme zweite Spielergruppe
    if player_number2 > 0 and game.players[player_number2] then
        players2 = {game.players[player_number2]}
    else
        players2 = game.players
    end

    -- Angriffserlaubnis setzen
    for _, p1 in ipairs(players1) do
        for _, p2 in ipairs(players2) do
            p1:set_attack_forbidden(p2.number, forbidden)
            p2:set_attack_forbidden(p1.number, forbidden)
        end
    end
end

-- Friedensmodus aktivieren (keine Angriffe möglich)
function peace_mode(player_number1, player_number2)
    set_attack_mode(player_number1, player_number2, true)
end

-- Kriegsmodus aktivieren (Angriffe erlaubt)
function war_mode(player_number1, player_number2)
    set_attack_mode(player_number1, player_number2, false)
end

pop_textdomain()
