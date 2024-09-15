if not wl.Editor then return end  -- Only in the editor

push_textdomain("editor_copy_area.wad", true)

wl.ui.MapView():add_toolbar_plugin(
		[[ include("addons/editor_copy_area.wad/show_window.lua") ]],
		"addons/editor_copy_area.wad/icon32.png",
		_("Copy Area"),
		_("Copy a map area to another area")
)

pop_textdomain()
