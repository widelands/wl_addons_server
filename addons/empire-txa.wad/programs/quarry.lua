push_textdomain("tribes")

local programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- min. time total: 4 * 42.2 = 168.8 sec
            -- max. time total: 4 * 67.4 = 269.6 sec
            -- avg. time total: 4 * 54.8 = 219.2 sec
            "call=mine_granite on failure fail",
            "call=mine_granite on failure fail",
            "call=mine_marble on failure fail", -- This will find marble 1 out of 4 times
            "call=mine_granite on failure fail",
         }
      },
}

pop_textdomain()
return programs
