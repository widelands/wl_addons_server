push_textdomain("tribes")

local programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start sculpting a marble column because ...
         descname = _("sculpting a marble column"),
         actions = {
            -- time total: 40 + 52.4 + 3.6 = 96 sec
            "return=skipped unless economy needs marble_column",
            "consume=marble",
            "sleep=duration:40s",
            "playsound=sound/stonecutting/stonemason priority:50% allow_multiple",
            "animate=working duration:52s400ms",
            "produce=marble_column"
         }
      },
}

pop_textdomain()
return programs
