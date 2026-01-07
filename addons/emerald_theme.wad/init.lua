-- This script defines a GUI style for Widelands. At the moment, we only
-- support the default template.

-- Background textures and colors have the format { image = filename, color = {r, g, b } }.

-- Required parameters for font styles are:
-- * face: string
-- * color: table with r, g, b values as int
-- * size: positive int
-- Optional bools are: bold, italic, underline, shadow

-- Some elements carry custom parameters like e.g. "margin" that should be expanded upon in the future.

dirname = path.dirname(__file__)

-- Global colors
local emerald = {20, 150, 100}
local light_emerald = {40, 230, 150}
local white = {255, 255, 255}

-- Overlay colors for buttons
local overlay_dark =  {0, 0, 0}
local overlay_green =  {0, 20, 0}

local fs_button = dirname .. "fsmenu/button.png"
local wui_button = dirname .. "wui/button.png"

local fs_font_color = light_emerald
local fs_font_face = "sans"
local fs_font_size = 13 --14

local wui_font_color = light_emerald
local wui_font_face = "sans"
local wui_font_size = 13 --14

local fs_text_padding = 6
local fs_text_space_before = 0
local fs_text_space_after = fs_text_padding
local fs_heading_space_before_big = 2 * fs_text_padding
local fs_heading_space_before_small = fs_text_padding
local fs_heading_space_after = 2 * fs_text_padding
local fs_heading_color = {209, 209, 209}
local about_title_color = {50, 180, 150}

local wui_text_padding = 6
local wui_text_space_before = 0
local wui_text_space_after = wui_text_padding
local wui_heading_space_before_big = 2 * wui_text_padding
local wui_heading_space_before_small = wui_text_padding
local wui_heading_space_after = 2 * wui_text_padding
local wui_heading_color = {209, 209, 209}

local h1_font_size = 17
local h2_font_size = 14
local h3_font_size = 13
local h4_font_size = 12
local p_font_size = 11

local unknown_font_color = {209, 45, 45}
local unknown_font_face = "sans"
local unknown_font_size = 16

local wui_button_font = {
   color = light_emerald,
   face = wui_font_face,
   size = wui_font_size,
   bold = true,
   shadow = true
}

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
   enabled_wui = wui_button_font,
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
   low = {170, 0, 50},
   medium = {225, 205, 30},
   high = {0, 150, 80},
}

-- In version 1.3 the code for window borders has changed.
-- For versions > 1.2
local windows_def = {
      fsmenu = {
         -- red, green, blue, alpha
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background           = dirname .. "fsmenu/windows/background.png",
         border_top           = dirname .. "fsmenu/windows/top_v1.3.png",
         border_bottom        = dirname .. "fsmenu/windows/bottom_v1.3.png",
         border_right         = dirname .. "fsmenu/windows/right_v1.3.png",
         border_left          = dirname .. "fsmenu/windows/left_v1.3.png",
         corner_bottom_left   = dirname .. "fsmenu/windows/corner_bottom_left.png",
         corner_bottom_right  = dirname .. "fsmenu/windows/corner_bottom_right.png",
         corner_top_left      = dirname .. "fsmenu/windows/corner_top_left.png",
         corner_top_right     = dirname .. "fsmenu/windows/corner_top_right.png",
         corner_minimal_left  = dirname .. "fsmenu/windows/corner_minimal_left.png",
         corner_minimal_right = dirname .. "fsmenu/windows/corner_minimal_right.png",
         button_close         = dirname .. "fsmenu/windows/close.png",
         button_pin           = dirname .. "fsmenu/windows/pin.png",
         button_unpin         = dirname .. "fsmenu/windows/unpin.png",
         button_minimize      = dirname .. "fsmenu/windows/minimize.png",
         button_unminimize    = dirname .. "fsmenu/windows/maximize.png",
      },
      wui = {
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background           = dirname .. "wui/windows/background.png",
         border_top           = dirname .. "wui/windows/top_v1.3.png",
         border_bottom        = dirname .. "wui/windows/bottom_v1.3.png",
         border_right         = dirname .. "wui/windows/right_v1.3.png",
         border_left          = dirname .. "wui/windows/left_v1.3.png",
         corner_bottom_left   = dirname .. "wui/windows/corner_bottom_left.png",
         corner_bottom_right  = dirname .. "wui/windows/corner_bottom_right.png",
         corner_top_left      = dirname .. "wui/windows/corner_top_left.png",
         corner_top_right     = dirname .. "wui/windows/corner_top_right.png",
         corner_minimal_left  = dirname .. "wui/windows/corner_minimal_left.png",
         corner_minimal_right = dirname .. "wui/windows/corner_minimal_right.png",
         button_close         = dirname .. "wui/windows/close.png",
         button_pin           = dirname .. "wui/windows/pin.png",
         button_unpin         = dirname .. "wui/windows/unpin.png",
         button_minimize      = dirname .. "wui/windows/minimize.png",
         button_unminimize    = dirname .. "wui/windows/maximize.png",
      },
   }

-- For version 1.2
if get_build_id():find("1.2") ~= nil then
   windows_def = {
      fsmenu = {
         -- red, green, blue, alpha
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background        = dirname .. "fsmenu/windows/background.png",
         border_top        = dirname .. "fsmenu/windows/top.png",
         border_bottom     = dirname .. "fsmenu/windows/bottom.png",
         border_right      = dirname .. "fsmenu/windows/right.png",
         border_left       = dirname .. "fsmenu/windows/left.png",
         button_close      = dirname .. "fsmenu/windows/close.png",
         button_pin        = dirname .. "fsmenu/windows/pin.png",
         button_unpin      = dirname .. "fsmenu/windows/unpin.png",
         button_minimize   = dirname .. "fsmenu/windows/minimize.png",
         button_unminimize = dirname .. "fsmenu/windows/maximize.png",
      },
      wui = {
         window_border_focused = {220, 220, 250, 0},
         window_border_unfocused = {50, 0, 0, 0},
         background        = dirname .. "wui/windows/background.png",
         border_top        = dirname .. "wui/windows/top.png",
         border_bottom     = dirname .. "wui/windows/bottom.png",
         border_right      = dirname .. "wui/windows/right.png",
         border_left       = dirname .. "wui/windows/left.png",
         button_close      = dirname .. "wui/windows/close.png",
         button_pin        = dirname .. "wui/windows/pin.png",
         button_unpin      = dirname .. "wui/windows/unpin.png",
         button_minimize   = dirname .. "wui/windows/minimize.png",
         button_unminimize = dirname .. "wui/windows/maximize.png",
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
   focus_border_thickness = 1,

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
                  color = overlay_dark,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = fs_button,
                  color = overlay_dark,
               }
            }
         },
         -- Primary user selection ("OK", ...)
         primary = {
            enabled = {
               font = default_button_fonts.enabled_fs,
               background = {
                  image = fs_button,
                  color = overlay_green,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = fs_button,
                  color = overlay_dark,
               }
            }
         },
         -- Secondary user selection ("Cancel", "Delete", selection buttons, ...)
         secondary = {
            enabled = {
               font = default_button_fonts.enabled_fs,
               background = {
                  image = fs_button,
                  color = overlay_dark,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = fs_button,
                  color = overlay_dark,
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
                  color = overlay_dark,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = wui_button,
                  color = overlay_dark,
               }
            }
         },
         -- Primary user selection ("OK", attack, ...)
         primary = {
            enabled = {
               font = default_button_fonts.enabled_wui,
               background = {
                  image = wui_button,
                  color = overlay_green,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = wui_button,
                  color = overlay_dark,
               }
            }
         },
         -- Secondary user selection ("Cancel", "Delete", ...)
         secondary = {
            enabled = {
               font = default_button_fonts.enabled_wui,
               background = {
                  image = wui_button,
                  color = overlay_dark,
               }
            },
            disabled = {
               font = default_button_fonts.disabled,
               background = {
                  image = wui_button,
                  color = overlay_dark,
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
               color = overlay_dark,
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
               color = overlay_dark,
            },
            font = {
               color = light_emerald, --fs_font_color,
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
               color = overlay_dark,
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
         dark = { image = wui_button, color = overlay_dark },
      }
   },
   -- Used both for one-line and multiline edit boxes
   editboxes = {
      fsmenu = {
         background = {
            image = fs_button,
            color = overlay_dark,
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
            color = overlay_dark,
            margin = 2,
         },
         font = {
            color = light_emerald,
            face = wui_font_face,
            size = wui_font_size,
            shadow = true
         },
      },
   },
   -- Background for dropdown menus
   dropdowns = {
      fsmenu = {
         menu = { image = fs_button, color = overlay_dark },
      },
      wui = {
         menu = { image = wui_button, color = overlay_dark },
      }
   },
   -- Scrollbar buttons, table headers etc.
   scrollbars = {
      fsmenu = {
         menu = { image = fs_button, color = overlay_dark },
      },
      wui = {
         menu = { image = wui_button, color = overlay_dark },
      }
   },

   -- In-game statistics plots
   statistics_plot = {
      fonts = {
         x_tick = {
            color = { 205, 50, 50 },
            face = "condensed",
            size = 13,
         },
         y_min_value = {
            color = { 170, 0, 50 },
            face = "condensed",
            size = 13,
         },
         y_max_value = {
            color = { 0, 150, 80 },
            face = "condensed",
            size = 13,
         },
      },
      colors = {
         axis_line = { 0, 0, 0 },
         zero_line = { 255, 255, 255 },
      }
   },

   -- Map census and status, and building statistics window
   building_statistics = {
      census_font = {
         color = light_emerald,
         face = "condensed",
         size = wui_font_size,
         bold = true,
         shadow = true
      },
      statistics_font = {
         color = light_emerald,
         face = "condensed",
         size = wui_font_size,
         bold = true,
         shadow = true
      },
      -- Building statistics window
      statistics_window = {
         fonts = {
            button_font = {
               color = light_emerald,
               face = "condensed",
               size = 12, -- Do not make this bigger - the UI element size is still hard-coded.
               bold = true,
               shadow = true
            },
            details_font = {
               color = light_emerald,
               face = "sans",
               size = 12, -- Do not make this bigger - the UI element size is still hard-coded.
               bold = true,
               shadow = true
            },
         },
         editbox_margin = 0
      },
      colors = {
         construction = { 170, 150, 20 },
         neutral = { 255, 250, 170 },
         low = productivity_colors["low"],
         medium = productivity_colors["medium"],
         high = productivity_colors["high"],
         low_alt = {200, 100, 100},
         medium_alt = {230, 230, 50},
         high_alt = {10, 225, 100},
      }
   },

   progressbar = {
      fsmenu = {
         font = {
            color = light_emerald,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         background_colors = {
            low = emerald,
            medium = emerald,
            high = emerald,
         }
      },
      wui = {
         font = {
            color = light_emerald,
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
            color = light_emerald,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         disabled = {
            color = emerald,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         hotkey = {
            color = light_emerald,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         }
      },
      wui = {
         enabled = {
            color = light_emerald,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         disabled = {
            color = emerald,
            face = fs_font_face,
            size = fs_font_size,
            bold = true,
            shadow = true
         },
         hotkey = {
            color = light_emerald,
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
               color = light_emerald,
               face = "sans",
               size = 11,
            },
            info = {
               color = light_emerald,
               face = "condensed",
               size = 10,
            },
         },
         colors = {
            icon_frame = { 70, 100, 90 },
            icon_background = { 70, 100, 90 },
            info_background = { 0, 0, 0 },
         },
         icon_background_image = "images/wui/ware_list_bg.png",
      },
      highlight = {
         fonts = {
            header = {
               color = light_emerald,
               face = "sans",
               size = 11,
            },
            info = {
               color = light_emerald,
               face = "condensed",
               size = 10,
            },
         },
         colors = {
            icon_frame = {255, 255, 0},
            icon_background = {70, 100, 90},
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
         color = light_emerald,
         face = "serif",
         size = fs_font_size,
         shadow = true,
      },
      -- Basic chat message text color
      chat_timestamp = {
         color = { 30, 230, 150 },
         face = "serif",
         size = 9,
         shadow = true,
      },
      -- Chat for private messages
      chat_whisper = {
         color = { 235, 235, 235 },
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
         color = { 220, 220, 220 },
         face = "serif",
         size = fs_font_size,
         bold = true,
         shadow = true,
      },
      -- Intro screen
      fsmenu_intro = {
         color = light_emerald,
         face = fs_font_face,
         size = 16,
         bold = true,
         shadow = true
      },
      italic = {
         color = light_emerald,
         face = "serif",
         size = fs_font_size,
         italic = true,
         shadow = true,
      },
      -- Displayed in the loading screens
      fsmenu_gametip = {
         color = light_emerald,
         face = "serif",
         size = 16,
         shadow = true,
      },
      -- Game and Map info panels
      fsmenu_info_panel_heading = {
         color = white,
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      fsmenu_info_panel_paragraph = {
         color = light_emerald,
         face = fs_font_face,
         size = fs_font_size,
         shadow = true
      },
      -- Internet lobby and launch game
      fsmenu_game_setup_headings = {
         color = white,
         face = fs_font_face,
         size = fs_font_size + 2,
         bold = true,
         shadow = true
      },
      fsmenu_game_setup_mapname = {
         color = white, --change
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
         color = { 220, 220, 220 },
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
         color = light_emerald,
         face = wui_font_face,
         size = 13,
         bold = false,
      },
      tooltip_hotkey_wui = {
         color = light_emerald,
         face = wui_font_face,
         size = 13,
         bold = false,
      },
      tooltip_header_wui = {
         color = white,
         face = wui_font_face,
         size = 15,
         bold = true,
         shadow = true
      },
      tooltip_fs = {
         color = fs_font_color,
         face = fs_font_face,
         size = 13,
         bold = false,
      },
      tooltip_hotkey_fs = {
         color = light_emerald,
         face = fs_font_face,
         size = 13,
         bold = false,
      },
      tooltip_header_fs = {
         color = white,
         face = fs_font_face,
         size = 15,
         bold = true,
         shadow = true
      },
      warning = {
         color = {255, 25, 25},
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },
      disabled = {
         color = {125, 125, 125},
         face = fs_font_face,
         size = fs_font_size,
         bold = true,
         shadow = true
      },

      wui_attack_box_slider_label = {
         color = light_emerald,
         face = wui_font_face,
         size = 10,
         bold = true,
         shadow = true
      },
      wui_info_panel_heading = {
         color = white, --change
         face = wui_font_face,
         size = wui_font_size,
         bold = true,
         shadow = true
      },
      wui_info_panel_paragraph = {
         color = light_emerald, --change
         face = wui_font_face,
         size = wui_font_size,
      },
      -- Messages
      wui_message_heading = {
         color = white,
         face = wui_font_face,
         size = 15,
         bold = true,
         shadow = true
      },
      wui_message_paragraph = {
         color = light_emerald, --change
         face = wui_font_face,
         size = 12,
         bold=true,
         shadow=true,
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
         color = light_emerald,
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
         shadow = true
      }
   },

   paragraphs = {
      -- Campaign and help texts
      readme_title = {
         -- this is used for the "Widelands" title
         font = {
            color = about_title_color,
            -- should be "Widelands/Widelands.ttf", but it's not possible to pass font filename here
            face = fs_font_face,
            size = 38,
         },
         align = "center",
         valign = "center",
         space_before = 0,
         space_after = fs_text_space_after,
      },
      about_title = {
         font = {
            color = about_title_color,
            face = fs_font_face,
            size = 28,
         },
         align = "center",
         space_before = fs_text_space_before,
         space_after = fs_text_space_after,
      },
      about_subtitle = {
         font = {
            color = fs_heading_color,
            face = fs_font_face,
            size = 13, --14
            italic = true,
         },
         align = "center",
         space_before = fs_text_space_before,
         space_after = fs_text_space_after,
      },
      authors_heading_1 = {
         font = {
            color = {240, 170, 50},
            face = fs_font_face,
            size = 24,
            shadow = true
         },
         space_before = fs_heading_space_before_big,
         space_after = fs_heading_space_after,
      },
      fs_heading_1 = {
         font = {
            color = fs_heading_color,
            face = fs_font_face,
            size = h1_font_size,
            bold = true,
            shadow = true
         },
         space_before = fs_heading_space_before_big,
         space_after = fs_heading_space_after,
      },
      fs_heading_2 = {
         font = {
            color = fs_heading_color,
            face = fs_font_face,
            size = h2_font_size,
            bold = true,
            shadow = true
         },
         space_before = fs_heading_space_before_big,
         space_after = fs_heading_space_after,
      },
      fs_heading_3 = {
         font = {
            color = fs_heading_color,
            face = fs_font_face,
            size = h3_font_size,
            shadow = true
         },
         space_before = fs_heading_space_before_small,
         space_after = fs_heading_space_after,
      },
      fs_heading_4 = {
         font = {
            color = fs_heading_color,
            face = fs_font_face,
            size = h4_font_size,
            shadow = true
         },
         space_before = fs_text_space_before,
         space_after = fs_text_space_after,
      },
      fs_text = {
         font = {
            color = fs_font_color,
            face = fs_font_face,
            size = p_font_size,
         },
         space_before = fs_text_space_before,
         space_after = fs_text_space_after,
      },
      wui_objectives_heading = {
         font = {
            color = wui_heading_color,
            face = wui_font_face,
            size = h1_font_size,
            bold = true,
         },
         space_before = 3 * wui_text_padding,
         space_after = 0,
         valign = "center",
         shadow = true
      },
      wui_heading_1 = {
         font = {
            color = wui_heading_color,
            face = wui_font_face,
            size = h1_font_size,
            bold = true,
            shadow = true
         },
         space_before = wui_heading_space_before_big,
         space_after = wui_heading_space_after,
      },
      wui_heading_2 = {
         font = {
            color = wui_heading_color,
            face = wui_font_face,
            size = h2_font_size,
            bold = true,
            shadow = true
         },
         space_before = wui_heading_space_before_big,
         space_after = wui_heading_space_after,
      },
      wui_heading_3 = {
         font = {
            color = wui_heading_color,
            face = wui_font_face,
            size = h3_font_size,
            shadow = true
         },
         space_before = wui_heading_space_before_small,
         space_after = wui_heading_space_after,
      },
      wui_heading_4 = {
         font = {
            color = wui_heading_color,
            face = wui_font_face,
            size = h4_font_size,
            shadow = true
         },
         space_before = wui_text_space_before,
         space_after = wui_text_space_after,
      },
      wui_text = {
         font = {
            color = wui_font_color,
            face = wui_font_face,
            size = p_font_size,
         },
         space_before = wui_text_space_before,
         space_after = wui_text_space_after,
      },
      wui_image_line = {
         font = {
            color = wui_font_color,
            face = wui_font_face,
            size = p_font_size,
         },
         space_before = wui_text_space_before + wui_text_padding,
         space_after = wui_text_space_after + wui_text_padding,
      },
      wui_lore_author = {
         font = {
            color = wui_font_color,
            face = wui_font_face,
            size = 10,
            italic = true,
         },
         align = "right",
         space_before = wui_text_space_before,
         space_after = wui_text_space_after + 3,
      },

      -- Returned when lookup by name fails.
      -- Make this stand out to help debugging
      unknown = {
         font = {
            color = unknown_font_color,
            face = unknown_font_face,
            size = unknown_font_size,
            italic = true,
         },
         space_before = unknown_font_size,
         space_after = unknown_font_size,
      },
   },

   colors = {
      campaign_bar_thron = about_title_color,
      campaign_bar_boldreth = {0, 255, 50},
      campaign_bar_khantrukh = {120, 130, 255},

      campaign_emp_lutius = about_title_color,
      campaign_emp_amalea = {255, 0, 0},
      campaign_emp_saledus = {140, 150, 50},
      campaign_emp_marcus = {20, 120, 175},
      campaign_emp_julia = {200, 200, 200},

      campaign_atl_jundlina = about_title_color,
      campaign_atl_sidolus = {255, 30, 50},
      campaign_atl_loftomor = {250, 210, 60},
      campaign_atl_colionder = {50, 170, 250},
      campaign_atl_opol = {255, 70, 250},
      campaign_atl_ostur = {55, 95, 250},
      campaign_atl_kalitath = {0, 255, 50},

      campaign_fri_reebaud = about_title_color,
      campaign_fri_hauke = {120, 150, 190},
      campaign_fri_maukor = {150, 20, 0},
      campaign_fri_murilius = {180, 120, 85},
      campaign_fri_claus = {20, 200, 0},
      campaign_fri_henneke = {240, 255, 0},
      campaign_fri_iniucundus = {255, 0, 90},
      campaign_fri_angadthur = {0, 30, 255},
      campaign_fri_amazon = {100, 0, 150},
      campaign_fri_ketelsen = {70, 85, 200},

      map_river_advisor = {70, 140, 140},

      unknown = {50, 70, 60}
   },

   styled_sizes = {
      fs_text_default_gap = fs_text_padding,
      fs_text_space_before_inline_header = 8,
      fs_main_menu_dropdown_height = 33,
      wui_text_default_gap = wui_text_padding,
      wui_text_space_before_inline_header = 8,
      wui_space_before_immovable_icon = 14,
      win_condition_message_gap = 8,
      help_terrain_tree_header_space_before = 12,
      help_terrain_tree_header_space_after = 3,
      editor_tooltip_icon_gap = 2,
      campaign_message_box_default_h = 400,
      campaign_message_box_default_w = 450,
      campaign_message_box_top_pos_y = 25,
      campaign_message_box_size_step = 50,
      campaign_message_box_h_min = 150,
      campaign_message_box_h_max = 600,
      campaign_message_box_w_min = 200,
      campaign_message_box_w_max = 500,
      campaign_fri02_poem_indent = 10,
      map_plateau_message_pos_y = 1,
      ui_default_padding = 4,
      toolbar_button_size = 33,
   }
}
