if not wl.Game or wl.Game().interactive_player == 0 then return end

include "scripting/coroutine.lua"

push_textdomain("notify-speed.wad", true)

g_addon_notify_speed_mode_last_message = nil
g_addon_notify_speed_mode_enabled = true

function toggle_notify_speed_mode()
	g_addon_notify_speed_mode_enabled = not g_addon_notify_speed_mode_enabled

	push_textdomain("notify-speed.wad", true)
	wl.ui.show_messagebox(
			g_addon_notify_speed_mode_enabled and _("Speed Down on Notify Enabled") or _("Speed Down on Notify Disabled"),
			g_addon_notify_speed_mode_enabled and
					_("The game will from now on be sped down to 1× speed whenever a new inbox message arrives. You can disable ‘Speed Down on Notify’ mode by using the toolbar button again.") or
					_("The game will no longer be sped down when a new inbox message arrives. You can re-enable ‘Speed Down on Notify’ mode by using the toolbar button again."),
			false)
	pop_textdomain()
end

function notify_speed_mode_check()
	local game = wl.Game()
	local current_message = game.players[game.interactive_player].inbox
	current_message = #current_message > 0 and current_message[#current_message] or nil

	if g_addon_notify_speed_mode_last_message ~= current_message then
		g_addon_notify_speed_mode_last_message = current_message
		if g_addon_notify_speed_mode_enabled and game.desired_speed > 1000 then
			game.desired_speed = 1000
		end
	end
end

local mv = wl.ui.MapView()

mv:add_toolbar_plugin(
		[[ toggle_notify_speed_mode() ]],
		"addons/notify-speed.wad/icon.png",
		_("Toggle ‘Speed Down on Notify’ Mode"),
		_("Toggle whether to speed the game down when a new notification is received."),
		"notify_speed_mode_toggle"
)

if mv.set_keyboard_shortcut then
	mv:set_keyboard_shortcut("notify_speed_mode_toggle", [[ toggle_notify_speed_mode() ]])
end

mv:add_plugin_timer("notify_speed_mode_check()", 500)

pop_textdomain()
