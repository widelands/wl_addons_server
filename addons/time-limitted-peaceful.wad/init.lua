-- limits the time for peaceful mode to xx minutes (45 is set, change it if you want to)

local MINUTES_LIMITED = 45

if wl.Game and wl.Game().type == "singleplayer" then
    local function end_peaceful_mode_after(minutes)
        sleep(minutes * 60 * 1000)
        local was_forbidden = 0
        local players = wl.Game().players
        for _i, player in ipairs(players) do
            for nr, _p in ipairs(players) do
                if nr ~= player.number and player:is_attack_forbidden(nr) then
                    player:set_attack_forbidden(nr, false)
                    was_forbidden = was_forbidden + 1
                end
            end
        end
        if was_forbidden > 0 then
            push_textdomain("time-limitted-peaceful.wad")
            local title = _("peaceful mode ends now")
            local message = _("all players can attack each other now (team mates excluded of course)")
            pop_textdomain()
            for _i, player in ipairs(players) do
                player:send_to_inbox(title, message, { popup = false, icon = "images/wui/stats/genstats_kills.png"})
            end
        end
    end
    run(end_peaceful_mode_after, MINUTES_LIMITED)
end
