-- limits the time for peaceful mode to xx minutes (45 is set, change it if you want to)

local MINUTES_LIMITED = 45
local SHOW_DIALOGUE = nil -- can be "singleplayer" or "always"
                          -- will desync replays, and network games if not all choose the same

local function end_peaceful_mode_after(minutes)
    if minutes <= 0 then
        return -- do not change peaceful mode
    end
    wake_me(minutes * 60 * 1000) -- from coroutines.lua
    local was_forbidden = 0
    local players = wl.Game().players
    for _p_idx, player in ipairs(players) do
        if player.team >= 80 then -- special, was set by addon code
             goto NextPlayer -- ignore special players
        end
        for _o_ixd, o_plr in ipairs(players) do
            local o_nr = o_plr.number
            if o_nr ~= player.number and player:is_attack_forbidden(o_nr) then
                player:set_attack_forbidden(o_nr, false)
                was_forbidden = was_forbidden + 1
            end
        end
        ::NextPlayer::
    end
    if was_forbidden > 0 then
        push_textdomain("time-limitted-peaceful.wad")
        local title = _("Peaceful mode ends now")
        local message = _("All players can attack each other. (Team mates excluded of course.)")
        pop_textdomain()
        local opts = { popup = false, icon = "images/wui/stats/genstats_kills.png" }
        for _i, player in ipairs(players) do
            player:send_to_inbox(title, message, opts)
        end
    end
end

-- global for callback of dialogue
time_limited_peaceful = {}
function time_limited_peaceful.set_config()
    local cfg_window = wl.ui.MapView():get_child('peaceful_mode_limited_config', false)
    local minutes_limited = cfg_window:get_child('minutes_limited').value -- read from dialogue
    cfg_window:close()
    run(end_peaceful_mode_after, minutes_limited)
end

local function is_peaceful_mode()
    local players = wl.Game().players
    for _p_idx, player in ipairs(players) do
        if player.team >= 80 then
            goto NextPlayer -- ignore special players
        end
        for _o_ixd, o_plr in ipairs(players) do
            local o_nr = o_plr.number
            if o_nr ~= player.number and not player:is_attack_forbidden(o_nr) then
                return false
            end
        end
        ::NextPlayer::
    end
    return true
end

-- shows a config dialoque (if configured) and starts end_peaceful_mode_after() when selected
local function show_config()
    local mv = wl.ui.MapView()
    local gm = wl.Game()
    if mv.create_child and -- since wl 1.2
        (gm.type == SHOW_DIALOGUE or SHOW_DIALOGUE == "always") and
        is_peaceful_mode()
    then
        mv:create_child({
            widget = "unique_window",
            registry = "peaceful_mode_limited_config",
            name = "peaceful_mode_limited_config",
            title = _("win condition config"),
            x = mv.width // 2,
            y = mv.height // 2,
            content = {
                widget = "box",
                orientation = "vertical",
                name = "box_config",
                children = {
                    {
                        widget = "textarea",
                        font   = "wui_info_panel_paragraph",
                        text   = _("Peaceful mode for ..."),
                        tooltip = _("Duration of peaceful mode"),
                        name   = "lbl",
                    },
                    {
                        widget = "spinbox",
                        name = "minutes_limited",
                        unit_w = 264, -- 124 is min
                        resizing = "fullsize",
                        value = MINUTES_LIMITED,
                        min = 0,
                        max = 8 * 60,
                        units = "minutes",
                        step_size_big = 15,
                    },
                    {
                        widget = "button",
                        title = "OK",
                        name = "button_ok",
                        on_click = [[
                            time_limited_peaceful.set_config()
                        ]],
                    },
                }
            }
        })
        return true
    else
        time_limited_peaceful.set_config = nil
        return false
    end
end

local function init_peaceful_mode()
    if not show_config() then
        -- config dialogue not enabled, start with default time
        run(end_peaceful_mode_after, MINUTES_LIMITED)
    end
end

if wl.Game then
    init_peaceful_mode()
end
