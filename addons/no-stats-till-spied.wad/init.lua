-- no player stats until a scout is working and any warehouse is seen

include "scripting/coroutine.lua" -- for run(), sleep()

local i_plr_no = wl.Game().interactive_player
local interactive_player
for _i, plr in pairs(wl.Game().players) do
    if plr.number ~= i_plr_no then
        plr.hidden_from_general_statistics = true
    else
        interactive_player = plr
    end
end

run(function()
    sleep(1234)
    interactive_player:send_to_inbox(
        _("No player statistics till spied"),
        _([[Players have statistics about their XXX in their warehouses (all buildings storing wares).
            To know statistics about other players, you need a scout to spy there.]]))
    -- scout's building name
    local scout_building_name
    for _i, worker_descr in pairs(interactive_player.tribe.workers) do
        if worker_descr.name:find("scout") then
            scout_building_name = worker_descr.employers[1].name
            break
        end
    end

    repeat
        sleep(12345)
        -- check if interactive player has a scout building with a working scout
        local working_scout = false
        for _i, scouts_house in pairs(interactive_player:get_buildings(scout_building_name)) do
            if scouts_house.productivity > 40 then
                local _n, scout_count = next(scouts_house:get_workers("all"))
                if scout_count > 0 then
                    working_scout = true
                    break
                end
            end
        end

        local all_players_shown = nil
        if not working_scout then
            goto ContinueRepeat -- no statistics without a scout
        end

        all_players_shown = true
        for _i, plr in pairs(wl.Game().players) do
            if not plr.hidden_from_general_statistics then
                goto ContinueForPlr -- is already shown
            end
            -- check if interactive player can see any warehouse of the other player
            for _j, buildings in pairs(plr:get_buildings("all")) do
                for _h, house in pairs(buildings) do
                    if not house.set_warehouse_policies then
                        break -- not a warehouse type
                    end
                    if interactive_player:seen_field(house.fields[1]) then
                        if interactive_player:sees_field(house.fields[1]) or math.random() > 0.7 then
                            -- warehouse is visible now or was visible and now good luck
                            plr.hidden_from_general_statistics = false -- show his statistics
                            push_textdomain("no-stats-till-spied.wad", true)
                            -- TRANSLATORS: %s is the name of a player
                            local msg = _(
                                "A spy has now information about %s. Find it in statistics."
                                ):bformat(plr.name)
                            interactive_player:send_to_inbox(_("A spy gives information"), msg)
                            pop_textdomain()
                            goto ContinueForPlr
                        end
                    end
                end
            end

            all_players_shown = false
            ::ContinueForPlr::
        end
        ::ContinueRepeat::
    until all_players_shown
    -- all statistics are shown now
end)
