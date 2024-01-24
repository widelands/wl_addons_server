push_textdomain("editor_analyse_map.wad", true)

-- Create some some boxes.
local players_box_children = {
                  { widget = "box",
                    name = "chk_box_group_1",
                    orientation = "vertical",
                    spacing = 5,
                    children ={}
                  },
                  { widget = "box",
                    name = "chk_box_group_2",
                    orientation = "vertical",
                    spacing = 5,
                    children ={}
                  },
                  { widget = "box",
                    name = "chk_box_group_3",
                    orientation = "vertical",
                    spacing = 5,
                    children ={}
                  },
                  { widget = "box",
                    name = "chk_box_group_4",
                    orientation = "vertical",
                    spacing = 5,
                    children ={}
                  },
                  { widget = "box",
                    name = "chk_box_group_5",
                    orientation = "vertical",
                    spacing = 5,
                    children ={}
                  },
                  { widget = "box",
                    name = "chk_box_group_6",
                    orientation = "vertical",
                    spacing = 5,
                    children ={}
                  },
               }

-- Add children to the prior created boxes, one box contain up to three
-- children. So the 6 boxes can hold 18 players.
local row = 1
for i, pl in ipairs(wl.Editor().map.player_slots) do
   local state = false
   if i == 1 then state = true end                    -- check first checkbox
   table.insert(players_box_children[row].children, 
                  { widget = "checkbox",
                    name   = "player_"..i,
                    title  = pl.name,
                    state  = state,
                    align  = "left",
                    on_changed = [[ include("addons/editor_analyse_map.wad/callbacks.lua") ]],
                  }
               )
   if math.fmod(i, 3) == 0 then
      row = row +1
   end
end

-- Window for choosing options
local col_l_width = 300
local col_r_width = 330

wl.ui.MapView():create_child({
   widget   = "unique_window",
   registry = "choose_statistic_window",
   name     = "choose_statistic_window",
   title    = _("What should be investigated?"),
   h        = 200,
   --w        = 600,
   x        = wl.ui.MapView().width  // 3,
   y        = wl.ui.MapView().height // 3,
   content  = {
      widget      = "box",
      name        = "main_box",
      orientation = "vert",
      children    = {
            {widget="space", value=10},
            {
               widget      = "box",
               name        = "row1",
               orientation = "horizontal",
               children    = {
                  {
                     widget = "textarea",
                     name   = "row1_col1",
                     fixed_width = col_l_width,
                     font   = "wui_info_panel_heading",  
                     text   = _("The whole map"),
                  },
                  {widget="space", value=20},
                  {
                     widget = "textarea",
                     name   = "row1_col2",
                     fixed_width = col_r_width,
                     font   = "wui_info_panel_heading",
                     text   = _("Information about players"),
                  },
               },  -- end row1 children
            }, -- end row1
            {widget="space", value=10},
            {
               widget = "box",
               name   = "row2",
               orientation = "horizontal",
               children = {
                  {
                     widget = "box",
                     name   = "row2_col1",
                     w      = col_l_width,
                     orientation = "vertical",
                     children = {
                        {
                           widget = "multilinetextarea",
                           name   = "whole_map_hint",
                           scroll_mode = "none",
                           w      = col_l_width,
                           resizing    = "expandboth",
                           font   = "wui_info_panel_paragraph",
                           text   = "… ooooops …",
                        },
                     },  --  row2_col1 children
                  },  -- row2_col1
                  {widget="space", value=20},
                  {
                     widget = "box",
                     name = "row2_col2",
                     orientation = "vertical",
                     w      = col_r_width,
                     resizing    = "expandboth",
                     children = {
                        {
                           widget = "box",
                           name   = "players_box",
                           orientation = "horizontal",
                           children = players_box_children,
                        },
                        {widget="space", value=10},
                        {
                           widget = "textarea",
                           name   = "spinbox_label",
                           fixed_width = col_r_width,
                           font   = "wui_info_panel_paragraph",
                           text   = "",
                        },
                        {widget="space", value=10},
                        {
                           widget = "spinbox",
                           name   = "plr_radius",
                           unit_w = 200,
                           value  = 15,
                           min    = 2,
                           max    = 60,
                           label  = "",
                           units  = "fields",
                        },
                     }, -- row2_col2 children
                  }, -- row2_col2
               }, -- row2 children
            }, -- end row2
            {widget="space", value=20},
            {
               widget = "box",
               name = "row3",
               orientation = "horizontal",
               children = {
                  {
                     widget = "textarea",
                     name   = "options_title",
                     font   = "wui_info_panel_heading",
                     text   = _("General Options"),
                  },
               },
            },
            { widget = "space", value=10},
            {
               widget = "box",
               name = "row3",
               orientation = "horizontal",
               children = {
                  {
                     widget =  "checkbox",
                     name   = "build_plots",
                     title  = _("Show building plots"),
                     state  = false,
                  },
                  { widget = "space", value=10},
                  {
                     widget =  "checkbox",
                     name   = "mountain_percent",
                     title  = _("Show Percent"),
                     tooltip = _("Show the percentage of all mineable resources"),
                     state  = false,
                  },
                  { widget = "space", value=10},
                  {
                     widget =  "checkbox",
                     name   = "calc_rocks",
                     title  = _("Calculate Marble"),
                     tooltip = _("Include the granite/marmor ratio for rocks"),
                     state  = true,
                  },
               },
            },
            { widget = "space", value=10},
            {
               widget = "box",
               name = "row3",
               orientation = "horizontal",
               children = {
                  {
                     widget =  "checkbox",
                     name   = "show_mem",
                     font   = "wui_info_panel_paragraph",
                     title  = _("Show memory usage"),
                     tooltip = _("Show memory usage, informational only when investigating the whole map"),
                     state  = false,
                  },
               },
            },
            {widget="space", value=10},
            {
               widget = "box",
               name = "row4",
               orientation = "horizontal",
               children = {
                  {
                     widget   = "button",
                     name     = "investigate_whole_map",
                     title  = _("Investigate the whole map"),
                     on_click = [[ include("addons/editor_analyse_map.wad/callbacks.lua") whole_map() ]],
                  },
                  {widget="space", value=30},
                  {   
                     widget   = "button",
                     name     = "investigate_players",
                     title    = _("Investigate the checked players"),
                     on_click = [[ include("addons/editor_analyse_map.wad/callbacks.lua") players() ]],
                  },
               },  -- end row4 children
            }, -- end row4
            {widget="space", value=10},  -- space below buttons
         } -- main_box children
    } -- main_box
})

-- Window for the result
local width = 480
wl.ui.MapView():create_child({
    widget   = "window",
    name     = "result_window",
    title    = "Result",
    x        = wl.ui.MapView().width - width,
    y        = 0,
    spacing  = 10,
    content  = {
        widget      = "box",
        name        = "result_box",
        orientation = "vert",
        children    = {
            {widget="space", value=10},
            {
               widget = "textarea",
               name   = "title",
               font   = "wui_message_heading",
               text   = "",
            },
            { widget="space", value=10 },
            {
                widget = "multilinetextarea",
                font   = "wui_info_panel_paragraph",
                name   = "result_text",
                w      = width,
                h      = 600,
                scroll_mode = "normal",
                text   = "Something has gone wrong :-(",
            },
            {
               widget   = "button",
               name     = "result_ok",
               w        = 180,
               title    = _("OK"),
               on_click = [[ wl.ui.MapView():get_child("result_window"):close() ]],
            },
         }
      }
})

-- Progressbar
local width = wl.ui.MapView().width // 2
local center_x = width
wl.ui.MapView():create_child({
    widget   = "window",
    name     = "progress_window",
    title    = _("Analysing"),
    x        = center_x - (width // 2),
    y        = wl.ui.MapView().height // 2,
    spacing  = 10,
    content  = {
        widget      = "box",
        name        = "progress_box",
        w           = width,
        orientation = "vert",
        children    = {
            {
               widget = "textarea",
               name   = "progress_title",
               font   = "wui_info_panel_heading",
               text   = "",
            },
            {widget="space", value=10},
            {
               widget = "progressbar",
               name   = "progressbar",
               w      = width,
               h      = 20,
               orientation = "horizontal",
               total  = 100,
               state  = 0,
            }
         }
      }
})

include("addons/editor_analyse_map.wad/callbacks.lua")
pop_textdomain()
