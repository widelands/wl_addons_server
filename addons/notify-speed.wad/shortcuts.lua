push_textdomain("notify-speed.wad", true)

local result = {
	{
		internal_name = "notify_speed_mode_toggle",
		descname = _("Toggle ‘Speed Down on Notify’ Mode"),
		scopes = {"game"},
		keycode = "F3",
	},
}

pop_textdomain()

return result
