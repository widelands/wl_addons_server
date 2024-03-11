if not wl.Editor then return end  -- Only in the editor

push_textdomain("editor_add_markers.wad", true)

wl.ui.MapView():add_toolbar_plugin(
   [[ include("addons/editor_add_markers.wad/settings_window.lua") ]],
   "addons/editor_add_markers.wad/icon_32.png",
   _("Place markers"),
   _("Place markers evenly on the map to get some points of orientation.")
)

pop_textdomain()
