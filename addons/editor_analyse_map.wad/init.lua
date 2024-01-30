if not wl.Editor then return end  -- Only in the editor

push_textdomain("editor_analyse_map.wad", true)

wl.ui.MapView():add_toolbar_plugin(
   [[ include("addons/editor_analyse_map.wad/windows.lua") ]],
   "addons/editor_analyse_map.wad/img/map_analyse.png",
   _("Analyse the map"),
   _("Compare player positions with a few clicks or analyse the whole map.")
)

pop_textdomain()
