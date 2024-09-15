if not wl.Game then return end  -- Only in a game
if wl.Game().interactive_player == 0 then return end -- Not in replays

push_textdomain("where_are_my_heroes.wad", true)

wl.ui.MapView():add_toolbar_plugin(
   [[ include("addons/where_are_my_heroes.wad/find_heroes.lua") ]],
   "addons/where_are_my_heroes.wad/icon_32.png",
   _("Where are my heroes?"),
   _("For each place containing a hero a message will be send to the inbox.")
)

pop_textdomain()
