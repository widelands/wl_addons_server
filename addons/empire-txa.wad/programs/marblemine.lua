push_textdomain("tribes")

local programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 86 + 86 + 10 = 182 sec
            "return=skipped unless economy needs marble or economy needs granite",
            "call=mine_granite",
            "call=mine_marble",
            "return=skipped"
         }
      },
      mine_granite = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining granite because ...
         descname = _("mining granite"),
         actions = {
            -- time: 33.2 + 3 * (14 + 3.6) = 86 sec
            "return=skipped unless economy needs granite",
            "consume=ration wine",
            "sleep=duration:33s200ms",
            "call=a_mine_produce_granite",
            "call=a_mine_produce_marble",
            "call=a_mine_produce_granite",
            "return=skipped"
         }
      },
      mine_marble = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
         descname = _("mining marble"),
         actions = {
            -- time: 33.2 + 3 * (14 + 3.6) = 86 sec
            "return=skipped unless economy needs marble",
            "consume=wine ration",
            "sleep=duration:33s200ms",
            "call=a_mine_produce_marble",
            "call=a_mine_produce_granite",
            "call=a_mine_produce_marble",
            "return=skipped"
         }
      },
      a_mine_produce_granite = {
         descname = _("mining granite"),
         actions = {
            "animate=working duration:14s",
            "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:17%",
            "produce=granite",
         }
      },
      a_mine_produce_marble = {
         descname = _("mining marble"),
         actions = {
            "animate=working duration:14s",
            "mine=resource_stones radius:2 yield:50% when_empty:7% experience_on_fail:12%",
            "produce=marble",
         }
      },
      encyclopedia_granite = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=ration wine",
            "produce=granite:2 marble",
         }
      },
      encyclopedia_marble = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=wine ration",
            "produce=marble:2 granite",
         }
      },
}

pop_textdomain()
return programs
