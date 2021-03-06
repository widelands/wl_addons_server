push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_tavern_level_4",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Tavern Level 4"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_tavern_level_5",
        enhancement_cost = {
          planks = 1,
          cloth = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          planks = 1,
          quartz = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 53, 58 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 53, 68 },
         fps = 20
      }
   },

   aihints = {},

   working_positions = {
      europeans_baker_normal = 1,
      europeans_smoker_normal = 1
   },

   inputs = {
      { name = "water", amount = 10 },
      { name = "flour", amount = 10 },
      { name = "fish", amount = 6 },
      { name = "meat", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_ration_basic",
            "call=produce_ration",
            "call=produce_snack_basic",
            "call=produce_snack",
            "return=skipped"
         }
      },
      produce_ration_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
         descname = _"preparing a ration",
         actions = {
            "return=skipped when economy needs ration",
            "return=skipped when economy needs snack",
            "return=skipped when economy needs water",
            "sleep=duration:60s",
            "consume=water flour fish,meat",
            "animate=working duration:60s",
            "produce=ration"
         }
      },
      produce_ration = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
         descname = _"preparing a ration",
         actions = {
            "return=skipped when economy needs water and not economy needs ration",
            "return=skipped unless economy needs ration",
            "sleep=duration:10s",
            "consume=water:2 flour:2 fish,meat:2",
            "animate=working duration:40s",
            "produce=ration:2"
         }
      },
      produce_snack_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
         descname = _"preparing a snack",
         actions = {
            "return=skipped when economy needs ration",
            "return=skipped when economy needs snack",
            "return=skipped when economy needs water",
            "sleep=duration:60s",
            "consume=water:2 flour:2 fish,meat:2",
            "animate=working duration:60s",
            "produce=snack"
         }
      },
      produce_snack = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
         descname = _"preparing a snack",
         actions = {
            "return=skipped when economy needs water and not economy needs snack",
            "return=skipped unless economy needs snack",
            "sleep=duration:10s",
            "consume=water:4 flour:4 fish,meat:4",
            "animate=working duration:50s",
            "produce=snack:3"
         }
      },
   },
}

pop_textdomain()
