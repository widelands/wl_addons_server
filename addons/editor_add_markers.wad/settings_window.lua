push_textdomain("editor_add_markers.wad", true)

include "scripting/richtext.lua"

local map = wl.Editor().map

-- Calculate the values a map can evenly divided into and
-- create a table for using it in a dropdown list.
-- Returns an array containing tables with dropdown list items.
local function get_dropdown_list(w_or_h)
   dropd_list = {}
   -- Assuming no one wants a smaller distance than 8,
   -- and prevent the maps width/height as a distance (w_or_h-16)
   for x=8, w_or_h-16, 2 do
      if w_or_h % x == 0 then
         table.insert(dropd_list, { 
                                    ["label"] = _("%1$d Fields"):bformat(x),
                                    ["value"] = x,
                                    ["select"] = false,
                                  }
                     )
      end
   end
   return dropd_list
end

local distances_x = get_dropdown_list(map.width)
local distances_y = get_dropdown_list(map.height)

-- Compare the data and find two low equal numbers
-- The equal numbers will be set "selected" in each table
local found = false
for i, x_data in ipairs(distances_x) do
   -- Skip first value
   if i > 1 then
      for j, y_data in ipairs(distances_y) do
         if y_data.value == x_data.value then
            distances_x[i].select = true
            distances_y[j].select = true
            found = true
            break
         end
      end
   end
   -- Stop first loop
   if found then break end
end

local padding = 10
local col_width = 300
local dropdown_w = 150

wl.ui.MapView():create_child({
   widget   = "unique_window",
   registry = "set_marker_window",
   name     = "set_marker_window",
   title    = _("Place markers"),
   x        = 0,
   y        = 0,
   content  = {
      widget      = "box",
      name        = "main_box",
      orientation = "vertical",
      spacing     = 10,
      children    = {
         {widget="space", value=2},
         {
            widget = "multilinetextarea",
            name   = "choose_x_distance_header",
            w      = col_width,
            scroll_mode = "none",
            font   = "wui_info_panel_heading",
            text   = _("Choose the distance between markers:"),
         },
         {
            widget      = "box",
            name        = "dropdown_box_x",
            orientation = "horizontal",
            resizing    = "fullsize",
            children    = {
               { widget = "space", value = padding},
               {
                  widget = "textarea",
                  name   = "dropd_x_header",
                  text   = _("Horizontally"),
                  font   = "label_wui",
               },
               { widget = "inf_space"},
               {
                  widget = "dropdown",
                  name   = "distance_x_dropdown",
                  w = dropdown_w,
                  label  = "",
                  button_dimension = 24,
                  button_style = "primary",
                  type   = "textual",
                  datatype = "string",
                  max_list_items = #distances_x,
                  tooltip = _("Choose a distance"),
                  entries = distances_x,
               },
               { widget = "space", value = padding},
            },
         },
         {
            widget      = "box",
            name        = "dropdown_box_y",
            orientation = "horizontal",
            resizing    = "fullsize",
            children    = {
               { widget = "space", value = padding},
               {
                  widget = "textarea",
                  name   = "dropd_y_header",
                  text   = _("Vertically"),
                  font   = "label_wui",
               },
               { widget = "inf_space"},
               {
                  widget = "dropdown",
                  name   = "distance_y_dropdown",
                  w = dropdown_w,
                  label  = "",
                  button_dimension = 25,
                  button_style = "primary",
                  type   = "textual",
                  datatype = "string",
                  max_list_items = #distances_y,
                  tooltip = _("Choose a distance"),
                  entries = distances_y,
               },
               { widget = "space", value = padding},
            },
         },
         {widget="space", value=2},
         {
            widget = "button",
            name   = "set_markers_button",
            w      = col_width - (2*padding),
            title  = _("Place markers"),
            on_click = [[ include("addons/editor_add_markers.wad/set_markers.lua") set_markers() ]],
         },
         {
            widget = "button",
            name   = "undo_button",
            w      = col_width - (2*padding),
            title  = _("Undo"),
            on_click = [[ include("addons/editor_add_markers.wad/set_markers.lua") history_back() ]],
         },
         {
            widget = "button",
            name   = "center_button",
            w      = col_width - (2*padding),
            title  = _("Center position 0,0"),
            on_click = [[ wl.ui.MapView():scroll_to_field(wl.Editor().map:get_field(0,0)) ]],
         },
         {widget="space", value=2},
         {
            widget = "button",
            name   = "remove_markers_button",
            w      = col_width - (2*padding),
            title  = _("Remove all markers"),
            on_click = [[ include("addons/editor_add_markers.wad/set_markers.lua") remove_markers() ]],
         },
         {widget="space", value=2},
         {
            widget = "button",
            name   = "close_button",
            w      = dropdown_w,
            style  = "primary",
            title  = _("Hide"),
            tooltip = _("Hide window to keep the settings"),
            on_click = [[ wl.ui.MapView():get_child("set_marker_window").visible = false ]],
         },
         {widget="space", value=2},
      }
   }
})

pop_textdomain()

wl.ui.MapView():get_child("undo_button").enabled = false
include("addons/editor_add_markers.wad/set_markers.lua")
