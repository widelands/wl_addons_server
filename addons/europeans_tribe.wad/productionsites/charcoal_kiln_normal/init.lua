push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_charcoal_kiln_normal",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Normal Charcoal Kiln"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_charcoal_kiln_advanced",
        enhancement_cost = {
          marble_column = 2,
          quartz = 1,
          diamond = 1
        },
        enhancement_return_on_dismantle = {
          marble = 2,
          quartz = 1,
          diamond = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 47, 57 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 47, 60 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_charcoal_burner_normal = 1
   },

   inputs = {
      { name = "log", amount = 16 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=burn_log_basic",
            "call=burn_log",
         }
      },
      burn_log_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _"producing coal",
         actions = {
            "return=skipped when economy needs coal",
            "return=skipped when economy needs log",
            "consume=log:3",
            "sleep=duration:30s",
            "animate=working duration:1m30s",
            "produce=coal"
         }
      },
      burn_log = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _"producing coal",
         actions = {
            "return=skipped unless economy needs coal",
            "consume=log:9",
            "sleep=duration:30s",
            "animate=working duration:2m30s",
            "produce=coal:4",
         }
      },
   },
}

pop_textdomain()