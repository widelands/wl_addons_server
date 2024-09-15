-- explore win condition

include "scripting/coroutine.lua"
include "scripting/messages.lua"
include "scripting/win_conditions/win_condition_functions.lua"
include "scripting/win_conditions/win_condition_texts.lua"
-- include "addons/debug-print.wad/debug_print.lua" -- include only for debugging with debug_print()

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
-- local _wc_explored_i18n =
_("% explored")

pop_textdomain()

local function init_explorer_wins(plrs)
    local map = wl.Game().map
    local max_map_fields = map.width * map.height
    local fields = {}
    for x=0, map.width-1 do
        for y=0, map.height-1 do
            table.insert(fields, map:get_field(x,y))
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
            if max_map_fields * MAXEXPLORED > 120 * terrestrial then
                broadcast(plrs, _('Probably not winnable'), p(_('This map is probably not winnable with %1$s.'):bformat(wc_name_i18n)) .. explain, {popup = true})
            else
                broadcast(plrs, _('Maybe not winnable'), p(_('This map is maybe not winnable with %1$s.'):bformat(wc_name_i18n)) .. explain, {popup = true})
            end
            pop_textdomain()
        end
    end

    return fields, max_map_fields
end

local r = {
    name = wc_name,
    description = wc_desc,
    peaceful_mode_allowed = true,
    textdomain = textdomain,
    func = function()
        -- set the objective with the game type for all players
        broadcast_objective("win_condition", wc_name_i18n,
            wc_desc .. "\n\n" .. _("You can explore by expanding, with a scout, with ships, ...")
        )

        local plrs = wl.Game().players
        local fields, max_map_fields = init_explorer_wins(plrs)

        local plr_data = {} -- teams get same points automatically since they see the same fields (for initial teams)
        local function update_explored_for_all(players, initial)
            local max_explored = -2
            for _i, plr in ipairs(players) do
                local seenFields = 0
                for _j, field in ipairs(fields) do
                    local s = plr:seen_field(field) -- visible, may have fog
                    if s then
                        seenFields = seenFields + 1
                    end
                    -- plr:sees_field(field) -- currently seen, no fog
                end
                if initial or -1 == plr_data[plr.number].start then
                    plr_data[plr.number] = {start = seenFields} -- to give a similar start when players have various starting conditions
                    if plr.see_all then
                        -- do not yet initialize if start position not yet selected
                        plr_data[plr.number].start = -1
                    elseif seenFields >= max_map_fields then
                        plr:send_to_inbox(
                            _('Win condition not compatible with "No fog of war"'),
                            p(_('The win condition %1$s can not be played with "No fog of war" enabled.'):bformat(wc_name_i18n)) ..
                            p(_('Continue playing endlessly or restart with fog.')),
                            {popup = true}
                        )
                        max_map_fields = max_map_fields * 16 -- never win, but keep running to support plr.resigned
                    end
                else
                    local explored = seenFields - plr_data[plr.number].start
                    if explored > max_explored then
                        max_explored = explored
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
            pic = "addons/explorer-wins.wad/watch_stat_icon.png",
            -- icon created from images/wui/fieldaction/menu_tab_watch.png
            calculator = function(p)
                if end_game then update_explored_for_all(plrs) end -- update points after endgame
                return calc_result(plr_data[p.number].seen, plr_data[p.number].start)
            end,
        }

        local max_explored_fields
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
        for _i, plr in ipairs(wl.Game().players) do
            msg = msg .. p(_("Player %1$1d has explored %2$1d%%"):bformat(
                plr.number, calc_result(plr_data[plr.number].seen, plr_data[plr.number].start)
            ) ..  _(" (%d fields)"):bformat(plr_data[plr.number].seen - plr_data[plr.number].start))
        end
        for _i, plr in ipairs(plrs) do
            -- broadcast win/loose
            local pd = plr_data[plr.number]
            local extra_data = {
                score = calc_result(pd.seen, pd.start) .. '% (' .. pd.seen - pd.start .. ')',
                total = max_map_fields, -- is not shown
                -- team_score = -- would be shown, but does not make sense
            } -- what else can I provide ??
            if pd.seen - plr_data[plr.number].start >= max_explored_fields then
                broadcast_win({plr}, won_game_over.title, won_game_over.body .. msg, {}, wc_name, wc_version, extra_data)
                -- could: -- plr.objectives["win_condition"].done = true
            else
                broadcast_lost({plr}, lost_game_over.title, lost_game_over.body .. msg, {}, wc_name, wc_version, extra_data)
            end
        end
        pop_textdomain()
    end,
}

return r
