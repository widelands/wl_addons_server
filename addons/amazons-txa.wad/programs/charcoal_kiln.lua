push_textdomain("tribes")

local programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing charcoal because ...
         descname = _("producing charcoal"),
         actions = {
            -- time total: 15.4 + 85 + 3.6 = 104 sec
            "return=skipped unless economy needs coal",
            -- Make it a little more efficient than other tribes
            "consume=log:5",
            "sleep=duration:15s400ms",
            "animate=working duration:85s", -- Charcoal fires will burn for some days in real life
            "produce=coal"
         }
      }
}

pop_textdomain()
return programs
