if not wl.Editor then return end  -- Only in the editor

push_textdomain("editor_height_tools.wad", true)

-- Sorry, some globals are needed to store some information
__AREA_MARKER_1 = nil
__AREA_MARKER_2 = nil

wl.ui.MapView():add_toolbar_plugin(
      [[ include("addons/editor_height_tools.wad/settings_window.lua") ]],
      "addons/editor_height_tools.wad/img/height_tools.png",
      _("Height Tools"),
      _("Set height for the whole map or apply heights to mountainous terrains automatically")
   )

pop_textdomain()
