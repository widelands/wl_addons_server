push_textdomain("tribes")

local dressmakery_programs = {
      produce_armor_wooden = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing a light wooden armor because ...
         descname = _("making a light wooden armor"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs armor_wooden",
            "consume=balsa:2 rope quartz",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=armor_wooden"
         },
      },
      produce_helmet_wooden = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
         descname = _("making a wooden helmet"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs helmet_wooden",
            "consume=ironwood rubber quartz",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=helmet_wooden"
         },
      },
      produce_boots_sturdy = {
         -- TRANSLATORS: Completed/Skipped/Did not start making sturdy boots because ...
         descname = _("making sturdy boots"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs boots_sturdy",
            "consume=rubber balsa rope",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=boots_sturdy"
         },
      },
      produce_boots_swift = {
         -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
         descname = _("making swift boots"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs boots_swift",
            "consume=rubber:3 rope quartz",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=boots_swift"
         },
      },
      produce_boots_hero = {
         -- TRANSLATORS: Completed/Skipped/Did not start making hero boots because ...
         descname = _("making hero boots"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs boots_hero",
            "consume=rubber:3 rope gold",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=boots_hero"
         },
      },
}

pop_textdomain()
return dressmakery_programs
