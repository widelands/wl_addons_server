-- test extension win conditions

include "scripting/coroutine.lua"
include "scripting/messages.lua"
include "scripting/win_conditions/win_condition_functions.lua"
include "scripting/win_conditions/win_condition_texts.lua"
-- include "addons/explorer-wins.wad/debug_string.lua" -- include only for debugging

local textdomain = "explorer-wins.wad"

push_textdomain(textdomain, true)

-- how many % of the world shall be explored
local MAXEXPLORED = 60

local wc_name = "Explorer Wins"
-- This needs to be exactly like above, but localized, because above
-- will be used as the key to fetch the translation in C++
local wc_name_i18n = _("Explorer Wins")
local wc_version = 1
local wc_desc = _("The player who has explored %1d%% of the world wins the game"):bformat(MAXEXPLORED)
local wc_explored = "% explored"
-- This needs to be exactly like above, but localized, because above
-- will be used as the key to fetch the translation in C++
local tmp_i18n = _("% explored")

local r = {
    name = wc_name,
    description = wc_desc,
    peaceful_mode_allowed = true,
    textdomain = textdomain,
    func = function()
        -- set the objective with the game type for all players
        broadcast_objective("win_condition", wc_name_i18n, wc_desc .. "\n\n" .. _("You can explore by expanding, with a scout, with ships, ..."))

        local map = wl.Game().map
        local max_map_fields = map.width * map.height
        local plrs = wl.Game().players
        local fields = {}
        local i = 1
        for x=0, map.width-1 do
            for y=0, map.height-1 do
                fields[i] = map:get_field(x,y)
                i = i + 1
            end
        end

        if not map.allows_seafaring then
            -- check if map is probably winnable without seafaring
            local terrestrial = map:count_terrestrial_fields()
            -- TODO above and map:count_conquerable_fields() both count lava fields, which can not be walked
            if max_map_fields * MAXEXPLORED > 105 * terrestrial then
                push_textdomain(textdomain, true)
                local explain = p(_("There are %1$d fields on the map, but only %2$d are terrestrial, which is %3$d%%. You need to explore %4$d%%.")
                    :bformat(max_map_fields, terrestrial, terrestrial * 100 // max_map_fields, MAXEXPLORED)
                )
                local header
                if max_map_fields * MAXEXPLORED > 120 * terrestrial then
                    broadcast(plrs, _'Probably not winnable', p(_('This map is probably not winnable with %1$s.'):bformat(wc_name_i18n)) .. explain, {popup = show_popup})
                else
                    broadcast(plrs, _'Maybe not winnable', p(_('This map is maybe not winnable with %1$s.'):bformat(wc_name_i18n)) .. explain, {popup = show_popup})
                end
                pop_textdomain()
            end
        end

        map = nil -- unset
        local plr_data = {} -- teams get same points automatically since they see the same fields (for initial teams)
        local function update_explored_for_all(players, initial)
            local max_explored = -2
            for i, plr in ipairs(players) do
                local seenFields = 0
                for i, field in ipairs(fields) do
                    local s = plr:seen_field(field) -- visible, may have fog
                    if s then
                        seenFields = seenFields + 1
                    end
                    -- plr:sees_field(field) -- currently seen, no fog
                end
                if initial or -1 == plr_data[plr.number].start then
                    plr_data[plr.number] = {start = seenFields} -- to give a similar start when players have various starting conditions
                    if (seenFields == max_map_fields) then
                        -- do not yet initialize if start position not yet selected
                        plr_data[plr.number].start = -1
                    end
                else
                    if seenFields - plr_data[plr.number].start > max_explored then
                        max_explored = seenFields - plr_data[plr.number].start
                    end
                end
                plr_data[plr.number].seen = seenFields
            end
            return max_explored
        end
        update_explored_for_all(plrs, "INIT")

        local function calc_result(seen, start)
            if start < 0 then return 0 end -- while selecting start position
            return (seen - start) * 100 // max_map_fields
        end

        local end_game = false

        -- Install statistics hook
        hooks.custom_statistic = {
            name = wc_explored,
            pic = "images/wui/fieldaction/menu_tab_watch.png", -- maybe adapt
            calculator = function(p)
                if end_game then update_explored_for_all(plrs) end -- update points after endgame
                return calc_result(plr_data[p.number].seen, plr_data[p.number].start)
            end,
        }

        local max_explored_fields = -1
        -- main loop
        repeat
            sleep(5431)
            -- A player might have been defeated since the last calculation
            check_player_defeated(plrs, lost_game.title, lost_game.body)
            if #plrs < 2 then
                end_game = true
            end

            max_explored_fields = update_explored_for_all(plrs)
            if calc_result(max_explored_fields, 0) >= MAXEXPLORED then
                end_game = true
            end
        until end_game
        -- Game has ended
        push_textdomain(textdomain, true)
        local msg = game_status.body
        for i, plr in ipairs(wl.Game().players) do
            msg = msg .. p(_("Player %1d has explored %1d%%"):bformat(plr.number, calc_result(plr_data[plr.number].seen, plr_data[plr.number].start)))
        end
        for i, plr in ipairs(plrs) do
            -- broadcast win/loose
            local extra_data = {
                score = calc_result(plr_data[plr.number].seen, plr_data[plr.number].start) .. '% (' .. plr_data[plr.number].seen - plr_data[plr.number].start .. ')',
                total = max_map_fields,
            } -- TODO what can I provide
            if plr_data[plr.number].seen - plr_data[plr.number].start >= max_explored_fields then
                broadcast_win({plr}, won_game_over.title, won_game_over.body .. msg, {}, wc_name, wc_version, extra_data)
                -- could: -- plr.objectives["win_condition"].done = true
            else
                broadcast_lost({plr}, lost_game_over.title, lost_game_over.body .. msg, {}, wc_name, wc_version, extra_data)
            end
        end
        pop_textdomain()
    end,
}

pop_textdomain()
return r
