push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_weaving_mill_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "big",

   enhancement = {
        name = "europeans_weaving_mill_normal",
        enhancement_cost = {
          cloth = 3,
          brick = 3,
          grout = 3,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          granite = 3,
          quartz = 1,
        },
   },

   buildcost = {
      planks = 4,
      reed = 4,
      granite = 2
   },
   return_on_dismantle = {
      log = 4,
      granite = 2
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 36, 74 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 36, 74 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 36, 74 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_weaver_basic = 1
   },

   inputs = {
      { name = "reed", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_cloth_basic",
            "call=produce_cloth"
         }
      },
      produce_cloth_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
         descname = _"weaving",
         actions = {
            "return=skipped when economy needs cloth",
            "return=skipped when economy needs reed",
            "sleep=duration:60s",
            "consume=reed",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:60s",
            "produce=cloth"
         }
      },
      produce_cloth = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
         descname = _"weaving",
         actions = {
            "return=skipped unless economy needs cloth",
            "sleep=duration:50s",
            "consume=reed:3",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:50s",
            "produce=cloth:3"
         }
      },
   },
}

pop_textdomain()
