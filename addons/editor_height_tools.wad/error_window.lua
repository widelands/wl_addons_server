push_textdomain("editor_height_tools.wad", true)

wl.ui.MapView():create_child({
   widget   = "unique_window",
   registry = "error_window",
   name     = "error_window",
   title    = _("Error"),
   x        = wl.ui.MapView().width // 3,
   content  = {
      widget      = "box",
      name        = "main_box",
      w           = 600,
      orientation = "vertical",
      children    = {
            {widget="space", value=10},
            {
               widget = "multilinetextarea",
               name   = "error_text",
               w      = 500,
               font   = "wui_info_panel_paragraph",
               scroll_mode = "none",
               text   = "",
            },
            {widget="space", value=10},
            {
               widget  = "button",
               name    = "close_button",
               title   = _("OK"),
               w       = 100,
               on_click = [[ wl.ui.MapView():get_child("error_window"):close() ]],
            },
            {widget="space", value=10}
         }
      }
})

wl.ui.MapView():get_child("error_window").visible = false
pop_textdomain()
