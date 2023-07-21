if not wl.Editor then return end  -- Only in the editor

push_textdomain("editor_swap_terrains.wad", true)

wl.ui.MapView():add_toolbar_plugin(
		[[ include("addons/editor_swap_terrains.wad/show_window.lua") ]],
		"addons/editor_swap_terrains.wad/icon32.png",
		_("Swap Terrains"),
		_("Globally exchange two terrains with each other")
)

pop_textdomain()
