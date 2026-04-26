push_textdomain("tribes")

local programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
         descname = _("raising pigs"),
         actions = {
            -- time: 14.8 + 30 + 2 * 3.6 = 52 sec
            "return=skipped unless economy needs meat",
            "consume=water wheat",
            "sleep=duration:14s800ms",
            "playsound=sound/farm/farm_animal priority:40% allow_multiple",
            "animate=working duration:30s",
            "produce=meat:2"
         }
      },
}

pop_textdomain()
return programs
