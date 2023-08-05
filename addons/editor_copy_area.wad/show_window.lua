push_textdomain("editor_copy_area.wad", true)

local map = wl.Editor().map

local spinner_total_w = 300
local spinner_unit_w = 200
local padding = 4
local spacing = 32

wl.ui.MapView():create_child({
	widget   = "unique_window",
	registry = "copy_area_plugin_window",
	name     = "copy_area_plugin_window",
	title    = _("Copy Area"),
	x        = wl.ui.MapView().width  // 6,
	y        = wl.ui.MapView().height // 4,
	content  = {
		widget      = "box",
		orientation = "vert",
		name        = "main_box",
		children    = {
			{
				widget      = "box",
				orientation = "horz",
				name        = "hbox",
				children    = {
					{
						widget      = "box",
						orientation = "vert",
						name        = "src_box",
						children    = {
							{
								widget      = "textarea",
								name        = "src_label",
								font        = "wui_info_panel_heading",
								text        = _("Source Rectangle:"),
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "src_x",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 0,
								min             = 0,
								max             = map.width - 1,
								label           = _("X"),
								step_size_small = 1,
								step_size_big   = 32,
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "src_y",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 0,
								min             = 0,
								max             = map.height - 1,
								label           = _("Y"),
								step_size_small = 1,
								step_size_big   = 32,
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "src_w",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 32,
								min             = 1,
								max             = map.width,
								label           = _("Width"),
								step_size_small = 1,
								step_size_big   = 32,
								on_changed = [[
									local window = wl.ui.MapView():get_child("copy_area_plugin_window")
									local src = window:get_child("src_w").value
									local dst = window:get_child("dst_w")
									dst:set_interval(src, src)
									dst.value = src
								]]
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "src_h",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 32,
								min             = 1,
								max             = map.height,
								label           = _("Height"),
								step_size_small = 1,
								step_size_big   = 32,
								on_changed = [[
									local window = wl.ui.MapView():get_child("copy_area_plugin_window")
									local src = window:get_child("src_h").value
									local dst = window:get_child("dst_h")
									dst:set_interval(src, src)
									dst.value = src
								]]
							},
						}
					},
					{
						widget = "space",
						value  = spacing,
					},
					{
						widget      = "box",
						orientation = "vert",
						name        = "dst_box",
						children    = {
							{
								widget      = "textarea",
								name        = "dst_label",
								font        = "wui_info_panel_heading",
								text        = _("Destination Rectangle:"),
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "dst_x",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 0,
								min             = 0,
								max             = map.width - 1,
								label           = _("X"),
								step_size_small = 1,
								step_size_big   = 32,
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "dst_y",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 0,
								min             = 0,
								max             = map.height - 1,
								label           = _("Y"),
								step_size_small = 1,
								step_size_big   = 32,
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "dst_w",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 32,
								min             = 32,
								max             = 32,
								label           = _("Width"),
								step_size_small = 1,
								step_size_big   = 32,
							},
							{
								widget = "space",
								value  = padding,
							},
							{
								widget          = "spinbox",
								name            = "dst_h",
								w               = spinner_total_w,
								unit_w          = spinner_unit_w,
								value           = 32,
								min             = 32,
								max             = 32,
								label           = _("Height"),
								step_size_small = 1,
								step_size_big   = 32,
							},
						}
					},
				}
			},
			{
				widget = "space",
				value  = spacing,
			},
			{
				widget      = "button",
				name        = "ok",
				title       = _("Copy"),
				style       = "primary",
				w           = spinner_total_w,
				h           = spacing,
				on_click    = [[ include("addons/editor_copy_area.wad/callback.lua") ]]
			},
			{
				widget      = "box",
				name        = "progressbarbox",
				orientation = "vert",
				resizing    = "fullsize",
				children    = {
					{
						widget = "space",
						value  = spacing,
					},
					{
						widget       = "progressbar",
						name         = "progress",
						orientation  = "horz",
						total        = 1,
						state        = 0,
						show_percent = true,
						h            = spacing,
						resizing     = "fullsize",
					},
				},
			},
		}
	}
})
wl.ui.MapView():get_child("copy_area_plugin_window"):get_child("progressbarbox").visible = false

pop_textdomain()
