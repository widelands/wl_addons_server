push_textdomain("tribes")

local programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
         descname = _("mining marble"),
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
            -- time total: 31.6 + 4 * (10 + 3.6) = 86 sec
            "return=skipped unless economy needs granite",
            "consume=meal wine",
            "sleep=duration:31s600ms",
            "call=mine_produce_granite",
            "call=mine_produce_granite",
            "call=mine_produce_marble",
            "call=mine_produce_granite",
            "return=skipped"
         }
      },
      mine_marble = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
         descname = _("mining marble"),
         actions = {
            -- time total: 31.6 + 4 * (10 + 3.6) = 86 sec
            "return=skipped unless economy needs marble",
            "consume=meal wine",
            "sleep=duration:31s600ms",
            "call=mine_produce_marble",
            "call=mine_produce_marble",
            "call=mine_produce_granite",
            "call=mine_produce_marble",
            "return=skipped"
         }
      },
      mine_produce_granite = {
         descname = _("mining granite"),
         actions = {
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:5% experience_on_fail:2%",
            "produce=granite",
         }
      },
      mine_produce_marble = {
         descname = _("mining marble"),
         actions = {
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:8% experience_on_fail:2%",
            "produce=marble",
         }
      },
      encyclopedia_granite = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal wine",
            "produce=granite:3 marble:1",
         }
      },
      encyclopedia_marble = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal wine",
            "produce=marble:3 granite:1",
         }
      },
}

pop_textdomain()
return programs
