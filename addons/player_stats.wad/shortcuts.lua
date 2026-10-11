push_textdomain("player_stats.wad")

shortcuts = {
   {
      internal_name = "player_stats",
      descname = _("Player statistics"),
      scopes = { "game" },
      mods = { "shift" },
      keycode = "s",
   },
}

pop_textdomain()
return shortcuts
