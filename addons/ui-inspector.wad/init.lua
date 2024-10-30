push_textdomain("ui-inspector.wad", true)

if wl.ui.MapView then
	wl.ui.MapView():add_toolbar_plugin(
			[[ include("addons/ui-inspector.wad/show_window.lua") ]],
			"images/plugin.png",
			_("UI Inspector"),
			_("Inspect all open panels")
	)
elseif wl.ui.MainMenu ~= nil and wl.ui.MainMenu():get_child("ui_inspector_main", false) == nil then
	local clock = wl.ui.MainMenu():get_child("clock")
	wl.ui.MainMenu():create_child({
		widget   = "button",
		name     = "ui_inspector_main",
		icon     = "images/plugin.png",
		tooltip  = _("UI Inspector"),
		x        = 4,
		y        = 8 + clock.position_y + clock.height,
		w        = 48,
		h        = 48,
		on_click = [[ include("addons/ui-inspector.wad/show_window.lua") ]],
	})
end

pop_textdomain()
