if wl.Game == nil then
   return
end

local addondir = path.dirname(__file__)
local plrstats_icon = addondir .. "plrstat_toolbar.png"

include(addondir .. "player_stats.lua")

push_textdomain("player_stats.wad", true)

local plrstats_label = _("Show player statistics")

pop_textdomain()

local mv = wl.ui.MapView()
mv:set_keyboard_shortcut("player_stats", "show_player_stats()")
mv:add_toolbar_plugin("show_player_stats()", plrstats_icon, plrstats_label, "", "player_stats")
mv:update_toolbar()

-- try to remember the starting stock in new games
include(addondir .. "starting_stock.lua")
