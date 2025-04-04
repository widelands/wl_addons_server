-- This script defines a GUI style for Widelands. At the moment, we only
-- support the default template.

-- Background textures and colors have the format { image = filename, color = {r, g, b } }.

-- Required parameters for font styles are:
-- * face: string
-- * color: table with r, g, b values as int
-- * size: positive int
-- Optional bools are: bold, italic, underline, shadow

-- Some elements carry custom parameters like e.g. "margin" that should be expanded upon in the future.

-- Some common elements for reuse
local fs_button = "ui/button.png"
local wui_button = "ui/button.png"

local fs_blue =  {0, 31, 40}
local fs_green =  {10, 50, 0}
local fs_brown =  {45, 34, 18}

local wui_light =  {85, 63, 35}
local wui_green =  {3, 15, 0}
local wui_brown =  {32, 19, 8}

local fs_font_color = {255, 255, 0}
local fs_font_face = "sans"
local fs_font_size = 14

local wui_font_color = {255, 255, 0}
local wui_font_face = "sans"
local wui_font_size = 14

local fs_text_padding = 6
local fs_text_space_before = 0
local fs_text_space_after = fs_text_padding
local fs_heading_space_before_big = 2 * fs_text_padding
local fs_heading_space_before_small = fs_text_padding
local fs_heading_space_after = 2 * fs_text_padding
local fs_heading_color = {209, 209, 209}
local about_title_color = {47, 145, 49}

local wui_text_padding = 6
local wui_text_space_before = 0
local wui_text_space_after = wui_text_padding
local wui_heading_space_before_big = 2 * wui_text_padding
local wui_heading_space_before_small = wui_text_padding
local wui_heading_space_after = 2 * wui_text_padding
local wui_heading_color = {209, 209, 209}
local campaign_leader_color = about_title_color

local h1_font_size = 18
local h2_font_size = 14
local h3_font_size = 13
local h4_font_size = 12
local p_font_size = 12

local unknown_font_color = {209, 45, 45}
local unknown_font_face = "sans"
local unknown_font_size = 16

local default_wui_font = {
   color = wui_font_color,
   face = wui_font_face,
   size = wui_font_size,
   bold = true,
   shadow = true
}
local default_fs_font = {
   color = fs_font_color,
   face = fs_font_face,
   size = fs_font_size,
   bold = true,
   shadow = true
}

local default_button_fonts = {
   enabled_wui = default_wui_font,
   enabled_fs = default_fs_font,
   disabled = {
         color = {127, 127, 127},
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
   },
}

local productivity_colors = {
   low = {187, 0, 0},
   medium = {255, 225, 30},
   high = {0, 187, 0},
}

-- In version 1.3 the code for window borders has changed.
-- For versions > 1.2
local windows_def = {
      fsmenu = {
         -- red, green, blue, alpha
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background           = "ui/windows/background.png",
         border_top           = "ui/windows/top.png",
         border_bottom        = "ui/windows/bottom.png",
         border_right         = "ui/windows/right.png",
         border_left          = "ui/windows/left.png",
         corner_bottom_left   = "ui/windows/corner_bottom_left.png",
         corner_bottom_right  = "ui/windows/corner_bottom_right.png",
         corner_top_left      = "ui/windows/corner_top_left.png",
         corner_top_right     = "ui/windows/corner_top_right.png",
         corner_minimal_left  = "ui/windows/corner_minimal_left.png",
         corner_minimal_right = "ui/windows/corner_minimal_right.png",
         button_close         = "ui/windows/close.png",
         button_pin           = "ui/windows/pin.png",
         button_unpin         = "ui/windows/unpin.png",
         button_minimize      = "ui/windows/minimize.png",
         button_unminimize    = "ui/windows/maximize.png",
      },
      wui = {
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background           = "ui/windows/background.png",
         border_top           = "ui/windows/top.png",
         border_bottom        = "ui/windows/bottom.png",
         border_right         = "ui/windows/right.png",
         border_left          = "ui/windows/left.png",
         corner_bottom_left   = "ui/windows/corner_bottom_left.png",
         corner_bottom_right  = "ui/windows/corner_bottom_right.png",
         corner_top_left      = "ui/windows/corner_top_left.png",
         corner_top_right     = "ui/windows/corner_top_right.png",
         corner_minimal_left  = "ui/windows/corner_minimal_left.png",
         corner_minimal_right = "ui/windows/corner_minimal_right.png",
         button_close         = "ui/windows/close.png",
         button_pin           = "ui/windows/pin.png",
         button_unpin         = "ui/windows/unpin.png",
         button_minimize      = "ui/windows/minimize.png",
         button_unminimize    = "ui/windows/maximize.png",
      },
   }

-- For version 1.2
if get_build_id():find("1.2") ~= nil then
   windows_def = {
      fsmenu = {
         -- red, green, blue, alpha
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background        = "ui/windows/background.png",
         border_top        = "ui/compat/top.png",
         border_bottom     = "ui/compat/bottom.png",
         border_right      = "ui/compat/right.png",
         border_left       = "ui/compat/left.png",
         button_close      = "ui/windows/close.png",
         button_pin        = "ui/windows/pin.png",
         button_unpin      = "ui/windows/unpin.png",
         button_minimize   = "ui/windows/minimize.png",
         button_unminimize = "ui/windows/maximize.png",
      },
      wui = {
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background        = "ui/windows/background.png",
         border_top        = "ui/compat/top.png",
         border_bottom     = "ui/compat/bottom.png",
         border_right      = "ui/compat/right.png",
         border_left       = "ui/compat/left.png",
         button_close      = "ui/windows/close.png",
         button_pin        = "ui/windows/pin.png",
         button_unpin      = "ui/windows/unpin.png",
         button_minimize   = "ui/windows/minimize.png",
         button_unminimize = "ui/windows/maximize.png",
      },
   }
end

-- These are the style definitions to be returned.
-- Note: you have to keep all the keys intact, or Widelands will not be happy.
return {
   -- Automatic resizing of fonts to make them fit onto buttons etc.
   -- won't go below this size
   minimum_font_size = 10,
   minimap_icon_frame = fs_font_color,

   -- red, green, blue, alpha
   background_focused = {240, 240, 240, 200},
   background_semi_focused = {180, 180, 180, 200},
   focus_border_thickness = 2,

   -- Windows
   windows = windows_def,

   -- Buttons
   buttons = {
      -- Buttons used in Fullscreen menus
      fsmenu = {
         -- Main menu ("Single Player", "Watch Replay", ...)
         menu = {
            enabled = {
               font = default_button_fonts.enabled_fs,
               background = {
                  image = fs_button,
                  color = fs_blue,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = fs_button,
                  color = fs_blue,
               }
            }
         },
         -- Primary user selection ("OK", ...)
         primary = {
            enabled = {
               font = default_button_fonts.enabled_fs,
               background = {
                  image = fs_button,
                  color = fs_green,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = fs_button,
                  color = fs_green,
               }
            }
         },
         -- Secondary user selection ("Cancel", "Delete", selection buttons, ...)
         secondary = {
            enabled = {
               font = default_button_fonts.enabled_fs,
               background = {
                  image = fs_button,
                  color = fs_brown,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = fs_button,
                  color = fs_brown,
               }
            }
         },
      },
      -- Buttons used in-game and in the editor
      wui = {
         -- Main menu ("Exit Game"), Building Windows, selection buttons, ...
         menu = {
            enabled = {
               font = default_button_fonts.enabled_wui,
               background = {
                  image = wui_button,
                  color = wui_light,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = wui_button,
                  color = wui_light,
               }
            }
         },
         -- Primary user selection ("OK", attack, ...)
         primary = {
            enabled = {
               font = default_button_fonts.enabled_wui,
               background = {
                  image = wui_button,
                  color = wui_green,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = wui_button,
                  color = wui_green,
               }
            }
         },
         -- Secondary user selection ("Cancel", "Delete", ...)
         secondary = {
            enabled = {
               font = default_button_fonts.enabled_wui,
               background = {
                  image = wui_button,
                  color = wui_brown,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = wui_button,
                  color = wui_brown,
               }
            }
         },
         -- Building buttons on fieldaction and building statistics need to be
         -- transparent in order to match the background of the tab panel.
         building_stats = {
            enabled = {
               font = default_button_fonts.enabled_wui,
               background = {
                  image = "",
                  color = {0, 0, 0},
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = "",
                  color = {0, 0, 0},
               }
            }
         },
      }
   },
   -- Slider cursors (Sound control, attack, statistics, ...)
   sliders = {
      fsmenu = {
         menu = {
            background = {
               image = fs_button,
               color = fs_blue,
            },
            font = {
               color = fs_font_color,
               face = "condensed",
               size = 11,
               bold = true,
               shadow = true
            }
         }
      },
      wui = {
         -- Sound Options, Statistics
         light = {
            background = {
               image = wui_button,
               color = wui_brown,
            },
            font = {
               color = fs_font_color,
               face = "condensed",
               size = 11,
               bold = true,
               shadow = true
            }
         },
         -- Fieldaction (attack)
         dark = {
            background = {
               image = wui_button,
               color = wui_green,
            },
            font = {
               color = fs_font_color,
               face = "condensed",
               size = 11,
               bold = true,
               shadow = true
            }
         },
      }
   },
   -- Background for tab panels
   tabpanels = {
      fsmenu = {
         -- Options, About, ... this comes with a hard-coded border too
         menu = { image = "", color = {5, 5, 5} },
      },
      wui = {
         -- Most in-game and in-editor tabs. Building windows, Editor tools,
         -- Encyclopedia, ...
         light = { image = "", color = {0, 0, 0} },
         -- Building buttons in Fieldaction and Building Statistics need a dark
         -- background, otherwise the icons will be hard to see.
         dark = { image = wui_button, color = wui_brown },
      }
   },
   -- Used both for one-line and multiline edit boxes
   editboxes = {
      fsmenu = {
         background = {
            image = fs_button,
            color = fs_green,
            margin = 4
         },
         font = {
            color = fs_font_color,
            face = fs_font_face,
            size = fs_font_size,
            shadow = true
         },
      },
      wui = {
         background = {
            image = wui_button,
            color = wui_brown,
            margin = 2,
         },
         font = {
            color = wui_font_color,
            face = wui_font_face,
            size = wui_font_size,
            shadow = true
         },
      },
   },
   -- Background for dropdown menus
   dropdowns = {
      fsmenu = {
         menu = { image = fs_button, color = fs_brown },
      },
      wui = {
         menu = { image = wui_button, color = wui_brown },
      }
   },
   -- Scrollbar buttons, table headers etc.
   scrollbars = {
      fsmenu = {
         menu = { image = fs_button, color = fs_blue },
      },
      wui = {
         menu = { image = wui_button, color = wui_brown },
      }
   },

   -- In-game statistics plots
   statistics_plot = {
      fonts = {
         x_tick = {
            color = { 255, 0, 0 },
            face = "condensed",
            size = 13,
         },
         y_min_value = {
            color = { 125, 0, 0 },
            face = "condensed",
            size = 13,
         },
         y_max_value = {
            color = { 60, 125, 0 },
            face = "condensed",
            size = 13,
         },
      },
      colors = {
         axis_line = { 0, 0, 0 },
         zero_line = { 255, 255, 255 },
      }
   },

   -- Map census and statistics, and building statistics window
   building_statistics = {
      census_font = {
         color = wui_font_color, -- Default color
         face = "condensed",
         size = wui_font_size,
         bold = true,
         shadow = true
      },
      statistics_font = {
         color = wui_font_color, -- Default color
         face = "condensed",
         size = wui_font_size,
         bold = true,
         shadow = true
      },
      -- Building statistics window
      statistics_window = {
         fonts = {
            button_font = {
               color = wui_font_color, -- Default color
               face = "condensed",
               size = 12, -- Do not make this bigger - the UI element size is still hard-coded.
               bold = true,
               shadow = true
            },
            details_font = {
               color = wui_font_color, -- Default color
               face = "sans",
               size = 12, -- Do not make this bigger - the UI element size is still hard-coded.
               bold = true,
               shadow = true
            },
         },
         editbox_margin = 0
      },
      colors = {
         construction = { 163, 144, 19 },
         neutral = { 255, 250, 170 },
         low = productivity_colors["low"],
         medium = productivity_colors["medium"],
         high = productivity_colors["high"],
         low_alt = {200, 100, 100},
         medium_alt = {230, 230, 10},
         high_alt = {50, 225, 50},
      }
   },

   progressbar = {
      fsmenu = {
         font = {
            color = { 128, 128, 255 },
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         background_colors = {
            low = { 64, 64, 0 }, -- Unused
            medium = { 64, 64, 0 },
            high = { 64, 64, 0 }, -- Unused
         }
      },
      wui = {
         font = {
            color = {255, 250, 170},
            face = wui_font_face,
            size = wui_font_size,
            bold = true,
            shadow = true
         },
         background_colors = {
            low = productivity_colors["low"],
            medium = productivity_colors["medium"],
            high = productivity_colors["high"],
         }
      }
   },

   tables = {
      fsmenu = {
         enabled = {
            color = fs_font_color,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         disabled = {
            color = {127, 127, 127},
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         hotkey = {
            color = {180, 180, 180},
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         }
      },
      wui = {
         enabled = {
            color = fs_font_color,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         disabled = {
            color = {127, 127, 127},
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         hotkey = {
            color = {180, 180, 180},
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         }
      },
   },

   wareinfo = {
      -- TODO(GunChleoc): This design is ugly.
      -- Group stuff more logically once everything has been styled.
      normal = {
         fonts = {
            header = {
               color = wui_font_color,
               face = "sans",
               size = 11,
            },
            info = {
               color = wui_font_color,
               face = "condensed",
               size = 10,
            },
         },
         colors = {
            icon_frame = { 69, 69, 69 },
            icon_background = { 69, 69, 69 },
            info_background = { 0, 0, 0 },
         },
         icon_background_image = "images/wui/ware_list_bg.png",
      },
      highlight = {
         fonts = {
            header = {
               color = wui_font_color,
               face = "sans",
               size = 11,
            },
            info = {
               color = wui_font_color,
               face = "condensed",
               size = 10,
            },
         },
         colors = {
            icon_frame = {255, 255, 0},
            icon_background = {69, 69, 69},
            info_background = {0, 0, 0},
         },
         icon_background_image = "images/wui/ware_list_bg_selected.png",
      }
   },

   -- Font styles. Required parameters are:
   -- * face: string
   -- * color: table with r, g, b values as int
   -- * size: positive int
   -- Optional bools are: bold, italic, underline, shadow
   fonts = {
      -- Basic chat message text color
      chat_message = {
         color = wui_font_color,
         face = "serif",
         size = fs_font_size,
         shadow = true,
      },
      -- Basic chat message text color
      chat_timestamp = {
         color = { 51, 255, 51 },
         face = "serif",
         size = 9,
         shadow = true,
      },
      -- Chat for private messages
      chat_whisper = {
         color = { 238, 238, 238 },
         face = "serif",
         size = fs_font_size,
         italic = true,
         shadow = true,
      },
      -- Chat playername highlight
      chat_playername = {
         color = { 255, 255, 255 },
         face = "serif",
         size = fs_font_size,
         bold = true,
         shadow = true,
      },
      -- Chat log messages color. Also doubles as spectator playercolor for chat messages.
      chat_server = {
         color = { 221, 221, 221 },
         face = "serif",
         size = fs_font_size,
         bold = true,
         shadow = true,
      },
      -- Intro screen
      fsmenu_intro = {
         color = { 192, 192, 128 },
         face = fs_font_face,
         size = 16,
         bold = true,
         shadow = true
      },
      italic = {
         color = { 238, 238, 238 },
         face = "serif",
         size = fs_font_size,
         italic = true,
         shadow = true,
      },
      -- Displayed in the loading screens
      fsmenu_gametip = {
         color = { 33, 33, 27 },
         face = "serif",
         size = 16,
      },
      -- Game and Map info panels
      fsmenu_info_panel_heading = {
         color = fs_font_color,
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      fsmenu_info_panel_paragraph = {
         color = { 209, 209, 209 },
         face = fs_font_face,
         size = fs_font_size,
         shadow = true
      },
      -- Internet lobby and launch game
      fsmenu_game_setup_headings = {
         color = { 0, 255, 0 },
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      fsmenu_game_setup_mapname = {
         color = { 255, 255, 127 },
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      -- List admin in the internet lobby
      fsmenu_game_setup_superuser = {
         color = { 0, 255, 0 },
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      -- List IRC clients in the internet lobby
      fsmenu_game_setup_irc_client = {
         color = { 221, 221, 221 },
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      -- Page titles. Used in game summary TODO(GunChleoc): Refactor game summary
      game_summary_title = {
         color = fs_font_color,
         face = fs_font_face,
         size = 22,
         bold = true,
         shadow = true
      },
      -- Make font a bit smaller so the link will fit at 800x600 resolution.
      fsmenu_translation_info = {
         color = fs_font_color,
         face = fs_font_face,
         size = fs_font_size - 2,
         bold = true,
         shadow = true
      },

      -- Textarea default style, also used for sliders, checkboxes
      label_wui = default_wui_font,
      label_fs = default_fs_font,
      tooltip_wui = {
         color = wui_font_color,
         face = wui_font_face,
         size = 14,
         bold = false,
      },
      tooltip_hotkey_wui = {
         color = {180, 180, 180},
         face = wui_font_face,
         size = 14,
         bold = false,
      },
      tooltip_header_wui = {
         color = wui_font_color,
         face = wui_font_face,
         size = 16,
         bold = true,
      },
      tooltip_fs = {
         color = fs_font_color,
         face = fs_font_face,
         size = 14,
         bold = false,
      },
      tooltip_hotkey_fs = {
         color = {180, 180, 180},
         face = fs_font_face,
         size = 14,
         bold = false,
      },
      tooltip_header_fs = {
         color = fs_font_color,
         face = fs_font_face,
         size = 16,
         bold = true,
      },
      warning = {
         color = {255, 22, 22},
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      disabled = {
         color = {127, 127, 127},
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },

      wui_attack_box_slider_label = {
         color = wui_font_color,
         face = wui_font_face,
         size = 10,
         bold = true,
         shadow = true
      },
      wui_info_panel_heading = {
         color = { 209, 209, 209 },
         face = wui_font_face,
         size = wui_font_size,
         bold = true,
      },
      wui_info_panel_paragraph = {
         color = { 255, 255, 0 },
         face = wui_font_face,
         size = wui_font_size,
      },
      -- Messages
      wui_message_heading = {
         color = { 209, 209, 209 },
         face = wui_font_face,
         size = 18,
         bold = true,
      },
      wui_message_paragraph = {
         color = { 255, 255, 0 },
         face = wui_font_face,
         size = 12,
      },
      wui_window_title = {
         color = fs_font_color,
         face = wui_font_face,
         size = 13,
         bold=true,
         shadow=true,
      },
      fs_window_title = {
         color = fs_font_color,
         face = fs_font_face,
         size = 13,
         bold=true,
         shadow=true,
      },
      wui_game_speed_and_coordinates = {
         color = wui_font_color,
         face = "condensed",
         size = wui_font_size,
         bold = true,
         shadow = true
      },

      -- Returned when lookup by name fails.
      -- Make this stand out to help debugging
      unknown = {
         color = unknown_font_color,
         face = unknown_font_face,
         size = unknown_font_size,
         bold = true,
      }
   },
}
