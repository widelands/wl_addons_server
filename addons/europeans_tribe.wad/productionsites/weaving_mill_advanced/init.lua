push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_weaving_mill_advanced",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Advanced Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "medium",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 65, 62 },
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 65, 62 },
      },
      unoccupied = {
         pictures = path.list_files(dirname .. "unoccupied_??.png"),
         hotspot = { 65, 62 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 65, 62 },
         fps = 5
      },
   },

   aihints = {},

   working_positions = {
      europeans_weaver_advanced = 1
   },

   inputs = {
      { name = "reed", amount = 8 },
      { name = "spider_silk", amount = 8 },
      { name = "wool", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_cloth_basic",
            "call=produce_cloth",
            "call=produce_spidercloth_basic",
            "call=produce_spidercloth",
            "call=produce_tabard",
            "call=produce_armor",
            "return=skipped"
         }
      },
      produce_cloth_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
         descname = _"weaving cloth",
         actions = {
            "return=skipped when economy needs cloth",
            "return=skipped when economy needs reed",
            "sleep=duration:10s",
            "consume=reed",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:60s",
            "produce=cloth"
         }
      },
      produce_cloth = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
         descname = _"weaving cloth",
         actions = {
            "return=skipped unless economy needs cloth",
            "sleep=duration:10s",
            "consume=reed:3",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:30s",
            "produce=cloth:3"
         }
      },
      produce_spidercloth_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
         descname = _"weaving spidercloth",
         actions = {
            "return=skipped when economy needs spidercloth",
            "return=skipped when economy needs tabard",
            "return=skipped when economy needs armor",
            "return=skipped when economy needs spider_silk",
            "sleep=duration:10s",
            "consume=spider_silk",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:60s",
            "produce=spidercloth"
         }
      },
      produce_spidercloth = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
         descname = _"weaving spidercloth",
         actions = {
            "return=skipped unless economy needs spidercloth",
            "consume=spider_silk:3",
            "sleep=duration:10s",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:30s",
            "produce=spidercloth:3"
         }
      },
      produce_tabard = {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring a tabard because ...
         descname = _"tailoring a tabard",
         actions = {
            "return=skipped unless economy needs tabard",
            "consume=spider_silk",
            "sleep=duration:10s",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:30s",
            "produce=tabard"
         }
      },
      produce_armor = {
         -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
         descname = _"tailoring an armor",
         actions = {
            "return=skipped unless economy needs armor",
            "consume=wool:2",
            "sleep=duration:10s",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:30s",
            "sleep=duration:5s",
            "produce=armor:2"
         }
      },
   },
}

pop_textdomain()
