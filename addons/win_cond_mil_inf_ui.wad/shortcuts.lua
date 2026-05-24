push_textdomain("win_cond_military_influence.wad")

shortcuts = {
   {
      internal_name = "win_condition_info",
      descname = _("Score info"),
      scopes = { "game" },
      mods = { "shift" },
      keycode = "i",
   },
}

pop_textdomain()
return shortcuts
