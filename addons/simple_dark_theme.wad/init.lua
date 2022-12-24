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

-- THEME VARS

-- Adwaita palette

local blue2 = {55, 132, 228}
local red3 = {192, 28, 40}
local green0 = {143, 240, 164}
local green4 = {38, 162, 105}
local yellow1 = {248, 228, 92}
local light0 = {255, 255, 255}
local dark4 = {36, 31, 49}
local dark5 = {0, 0, 0}

-- Adwaita dark theme

local accent_color = {120, 174, 237}
local accent_bg_color = blue2
local accent_fg_color = light0

local destructive_color = {255, 123, 99}
local destructive_bg_color = red3
local destructive_fg_color = light0

local success_color = green0
local success_bg_color = green4
local success_fg_color = light0

local warning_color = yellow1
local warning_bg_color = {205, 147, 9}
local warning_fg_color = {98, 68, 2} -- mix of bg and a black .8 opacity fg

local error_color = destructive_color
local error_bg_color = red3
local error_fg_color = light0

local window_bg_color = {36, 36, 36}
local window_fg_color = light0

local headerbar_bg_color = {48, 48, 48}
local headerbar_fg_color = light0

local popover_bg_color = {56, 56, 56}
local popover_fg_color = light0

-- Theme vars

local disabled_color = dark4
local transparent_color = {0, 0, 0, 0}
local transparent_bg_img = dirname .. "ui/transparent.png"
local default_face = "sans"
local tip_face = "condensed"
local chat_face = "serif"
local xxl_size = 22
local xl_size = 18
local l_size = 16
local m_size = 14
local s_size = 11
local xs_size = 10
local color_range = {
   low = error_color,
   medium = warning_color,
   high = success_color,
}
local bg_color_range = {
   low = error_bg_color,
   medium = warning_bg_color,
   high = success_bg_color,
}

-- HELPERS

local function simple_bg(bg)
    return {
        color = bg,
        -- hack to preserve color
        image = transparent_bg_img,
   }
end

local function simple_btn(fg, bg, face, size)
    return {
        font = {
            color = fg,
            face = face or default_face,
            size = size or m_size,
            bold = false,
            shadow = false,
        },
        background = simple_bg(bg),
    }
end

local function btn_info(fg, bg, face, size)
    return {
        enabled = simple_btn(fg, bg, face, size),
        disabled = simple_btn(disabled_color, bg, face, size),
    }
end

-- PRESETS

local windows = {
    window_border_focused = transparent_color,
    window_border_unfocused = transparent_color,
    background        = dirname .. "ui/windows/background.png",
    border_top        = dirname .. "ui/windows/top.png",
    border_bottom     = dirname .. "ui/windows/bottom.png",
    border_right      = dirname .. "ui/windows/right.png",
    border_left       = dirname .. "ui/windows/left.png",
    button_close      = dirname .. "ui/windows/close.png",
    button_pin        = dirname .. "ui/windows/pin.png",
    button_unpin      = dirname .. "ui/windows/unpin.png",
    button_minimize   = dirname .. "ui/windows/minimize.png",
    button_unminimize = dirname .. "ui/windows/maximize.png",
}

-- Buttons

local primary_btn_info = btn_info(accent_fg_color, accent_bg_color)

local secondary_btn_info = btn_info(popover_fg_color, popover_bg_color)

local slider_btn = simple_btn(popover_fg_color, popover_bg_color, tip_face, s_size)

-- Others

local tab_bg = simple_bg(window_bg_color)

local edit_box = {
    background = {
        image = transparent_bg_img,
        color = popover_bg_color,
        margin = 4,
    },
    font = {
        color = popover_fg_color,
        face = default_face,
        size = m_size,
    },
}

local progress_bar = {
    font = {
        color = popover_fg_color,
        face = default_face,
        size = m_size,
    },
    background_colors = {
        low = error_bg_color,
        medium = warning_bg_color,
        high = success_bg_color,
    },
}

-- Fonts

local default_font = {
    color = window_fg_color,
    face = default_face,
    size = m_size,
}

local disabled_font = {
    color = dark4,
    face = default_face,
    size = m_size,
}

local small_font = {
    color = window_bg_color,
    face = default_face,
    size = s_size,
}

local xs_tip_font = {
    color = window_bg_color,
    face = tip_face,
    size = xs_size,
}

local stats_font = {
    color = window_fg_color,
    face = tip_face,
    size = m_size,
    bold = true,
    shadow = true,
}

local census_font = {
    color = window_fg_color,
    face = tip_face,
    size = m_size,
    shadow = true,
}

local building_stats_font = {
    color = window_fg_color,
    face = tip_face,
    -- Do not make this bigger - the UI element size is still hard-coded.
    size = s_size,
    bold = true,
    shadow = true,
}

local chat_font = {
    color = window_fg_color,
    face = chat_face,
    size = m_size,
    shadow = true,
}

local whisper_font = {
    color = window_fg_color,
    face = chat_face,
    size = m_size,
    shadow = true,
    italic = true,
}

local heading_font = {
    color = window_fg_color,
    face = default_face,
    size = m_size,
    bold = true,
}

local tooltip_header_font = {
    color = window_fg_color,
    face = default_face,
    size = l_size,
    bold = true,
}


-- These are the style definitions to be returned.
-- Note: you have to keep all the keys intact, or Widelands will not be happy.
return {
    -- Automatic resizing of fonts to make them fit onto buttons etc.
    -- won't go below this size
    minimum_font_size = xs_size,
    minimap_icon_frame = window_fg_color,

    -- red, green, blue, alpha
    background_focused = transparent_color,
    background_semi_focused = transparent_color,
    focus_border_thickness = 1,

    -- Windows
    windows = {
        fsmenu = windows,
        wui = windows,
    },

   -- Buttons
   buttons = {
      -- Buttons used in Fullscreen menus
      fsmenu = {
         -- Main menu ("Single Player", "Watch Replay", ...)
         menu = secondary_btn_info,
         -- Primary user selection ("OK", ...)
         primary = primary_btn_info,
         -- Secondary user selection ("Cancel", "Delete", selection buttons, ...)
         secondary = secondary_btn_info,
      },
      -- Buttons used in-game and in the editor
      wui = {
         -- Main menu ("Exit Game"), Building Windows, selection buttons, ...
         menu = secondary_btn_info,
         -- Primary user selection ("OK", attack, ...)
         primary = primary_btn_info,
         -- Secondary user selection ("Cancel", "Delete", ...)
         secondary = secondary_btn_info,
         -- Building buttons on fieldaction and building statistics need to be
         -- transparent in order to match the background of the tab panel.
         building_stats = btn_info(popover_fg_color, dark5)
      }
   },
   -- Slider cursors (Sound control, attack, statistics, ...)
   sliders = {
      fsmenu = {
         menu = slider_btn,
      },
      wui = {
         -- Sound Options, Statistics
         light = slider_btn,
         -- Fieldaction (attack)
         dark = slider_btn,
      }
   },
   -- Background for tab panels
   tabpanels = {
      fsmenu = {
         -- Options, About, ... this comes with a hard-coded border too
         menu = tab_bg,
      },
      wui = {
         -- Most in-game and in-editor tabs. Building windows, Editor tools,
         -- Encyclopedia, ...
         light = tab_bg,
         -- Building buttons in Fieldaction and Building Statistics need a dark
         -- background, otherwise the icons will be hard to see.
         dark = tab_bg,
      }
   },
   -- Used both for one-line and multiline edit boxes
   editboxes = {
      fsmenu = edit_box,
      wui = edit_box,
   },
   -- Background for dropdown menus
   dropdowns = {
      fsmenu = {
         menu = tab_bg,
      },
      wui = {
         menu = tab_bg,
      }
   },
   -- Scrollbar buttons, table headers etc.
   scrollbars = {
      fsmenu = {
         menu = tab_bg,
      },
      wui = {
         menu = tab_bg,
      }
   },

   -- In-game statistics plots
   statistics_plot = {
      fonts = {
         x_tick = {
            color = dark5,
            face = tip_face,
            size = s_size,
         },
         y_min_value = {
            color = bg_color_range.low,
            face = tip_face,
            size = s_size,
         },
         y_max_value = {
            color = bg_color_range.high,
            face = tip_face,
            size = s_size,
         },
      },
      colors = {
         axis_line = dark5,
         zero_line = light0,
      }
   },

   -- Map census and statistics, and building statistics window
   building_statistics = {
      census_font = census_font,
      statistics_font = stats_font,
      -- Building statistics window
      statistics_window = {
         fonts = {
            button_font = building_stats_font,
            details_font = building_stats_font,
         },
         editbox_margin = 0
      },
      colors = {
         construction = accent_color,
         neutral = window_fg_color,
         low = color_range.low,
         medium = color_range.medium,
         high = color_range.high,
         low_alt = bg_color_range.low,
         medium_alt = bg_color_range.medium,
         high_alt = bg_color_range.high,
      }
   },

   progressbar = {
      fsmenu = progress_bar,
      wui = progress_bar,
   },

   tables = {
      fsmenu = {
         enabled = default_font,
         disabled = disabled_font,
         hotkey = default_font,
      },
      wui = {
         enabled = default_font,
         disabled = disabled_font,
         hotkey = default_font,
      },
   },

   wareinfo = {
      -- TODO(GunChleoc): This design is ugly.
      -- Group stuff more logically once everything has been styled.
      normal = {
         fonts = {
            header = small_font,
            info = xs_tip_font,
         },
         colors = {
            icon_frame = popover_bg_color,
            icon_background = popover_bg_color,
            info_background = popover_bg_color,
         },
         icon_background_image = "images/wui/ware_list_bg.png",
      },
      highlight = {
         fonts = {
            header = small_font,
            info = xs_tip_font,
         },
         colors = {
            icon_frame = light0,
            icon_background = popover_bg_color,
            info_background = popover_bg_color,
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
      chat_message = chat_font,
      -- Basic chat message text color
      chat_timestamp = xs_tip_font,
      -- Chat for private messages
      chat_whisper = whisper_font,
      -- Chat playername highlight
      chat_playername = chat_font,
      -- Chat log messages color. Also doubles as spectator playercolor for chat messages.
      chat_server = small_font,
      -- Intro screen
      fsmenu_intro = {
         color = window_fg_color,
         face = default_face,
         size = l_size,
         bold = true,
         shadow = true
      },
      italic = {
         color = window_fg_color,
         face = default_face,
         size = m_size,
         italic = true,
         shadow = true,
      },
      -- Displayed in the loading screens
      fsmenu_gametip = {
         color = window_fg_color,
         face = default_face,
         size = l_size,
      },
      -- Game and Map info panels
      fsmenu_info_panel_heading = {
         color = accent_color,
         face = default_face,
         size = m_size,
         bold = true,
         shadow = true
      },
      fsmenu_info_panel_paragraph = {
         color = window_fg_color,
         face = default_face,
         size = m_size,
         shadow = true
      },
      -- Internet lobby and launch game
      fsmenu_game_setup_headings = {
         color = accent_color,
         face = default_face,
         size = l_size,
         bold = true,
         shadow = true
      },
      fsmenu_game_setup_mapname = {
         color = window_fg_color,
         face = default_face,
         size = m_size,
         bold = true,
         shadow = true
      },
      -- List admin in the internet lobby
      fsmenu_game_setup_superuser = {
         color = accent_color,
         face = default_face,
         size = m_size,
         bold = true,
         shadow = true
      },
      -- List IRC clients in the internet lobby
      fsmenu_game_setup_irc_client = {
         color = window_fg_color,
         face = default_face,
         size = m_size,
         bold = true,
         shadow = true
      },
      -- Page titles. Used in game summary TODO(GunChleoc): Refactor game summary
      game_summary_title = {
         color = window_fg_color,
         face = default_face,
         size = xxl_size,
         bold = true,
         shadow = true
      },
      -- Make font a bit smaller so the link will fit at 800x600 resolution.
      fsmenu_translation_info = {
         color = window_fg_color,
         face = default_face,
         size = s_size,
         bold = true,
         shadow = true
      },

      -- Textarea default style, also used for sliders, checkboxes
      label_wui = default_font,
      label_fs = default_font,
      tooltip_wui = default_font,
      tooltip_hotkey_wui = default_font,
      tooltip_header_wui = tooltip_header_font,
      tooltip_fs = default_font,
      tooltip_hotkey_fs = default_font,
      tooltip_header_fs = tooltip_header_font,
      warning = {
         color = warning_color,
         face = default_face,
         size = m_size,
         bold = true,
         shadow = true
      },
      disabled = disabled_font,

      wui_attack_box_slider_label = xs_tip_font,
      wui_info_panel_heading = heading_font,
      wui_info_panel_paragraph = default_font,
      -- Messages
      wui_message_heading = {
         color = window_fg_color,
         face = default_face,
         size = xl_size,
         bold = true,
      },
      wui_message_paragraph = default_font,
      wui_window_title = heading_font,
      fs_window_title = heading_font,
      wui_game_speed_and_coordinates = small_font,
   },
}

