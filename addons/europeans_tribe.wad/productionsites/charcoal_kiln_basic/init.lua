push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_charcoal_kiln_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Charcoal Kiln"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_charcoal_kiln_normal",
        enhancement_cost = {
          planks = 2,
          cloth = 2,
          granite = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          planks = 1,
          granite = 1,
          quartz = 1
        },
   },

   buildcost = {
      blackwood = 3,
      reed = 3,
      granite = 2
   },
   return_on_dismantle = {
      blackwood = 2,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 50, 71 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 50, 71 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 50, 71 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_charcoal_burner_basic = 1
   },

   inputs = {
      { name = "log", amount = 12 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=burn_log_basic",
            "call=burn_log",
            "return=skipped"
         }
      },
      burn_log_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _"producing coal",
         actions = {
            "return=skipped when economy needs coal",
            "return=skipped when economy needs log",
            "consume=log:3",
            "sleep=duration:60s",
            "animate=working duration:1m30s",
            "produce=coal"
         }
      },
      burn_log = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _"producing coal",
         actions = {
            "return=skipped unless economy needs coal",
            "consume=log:6",
            "sleep=duration:10s",
            "animate=working duration:3m",
            "produce=coal:2",
         }
      },
   },
}

pop_textdomain()
