-- no player stats

local i_plr_no = wl.Game().interactive_player
for _i, plr in pairs(wl.Game().players) do
    if plr.number ~= i_plr_no then
        plr.hidden_from_general_statistics = true
    end
end
