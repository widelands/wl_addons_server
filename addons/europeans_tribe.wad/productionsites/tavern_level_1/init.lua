push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_tavern_level_1",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Tavern Level 1"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_tavern_level_2",
        enhancement_cost = {
          blackwood = 1,
          reed = 1,
          granite = 1
        },
        enhancement_return_on_dismantle = {
          blackwood = 1,
          granite = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 57, 88 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 57, 88 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 57, 88 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_baker_basic = 1,
      europeans_smoker_basic = 1
   },

   inputs = {
      { name = "water", amount = 6 },
      { name = "flour", amount = 6 },
      { name = "fish", amount = 4 },
      { name = "meat", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_ration_basic",
            "call=produce_ration",
            "return=skipped"
         }
      },
      produce_ration_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
         descname = _"preparing a ration",
         actions = {
            "return=skipped when economy needs flour",
            "return=skipped when economy needs water",
            "sleep=duration:10s",
            "consume=water flour fish,meat",
            "animate=working duration:70s",
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
            "animate=working duration:70s",
            "produce=ration:2"
         }
      },
   },
}

pop_textdomain()
