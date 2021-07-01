push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_mill_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Mill"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "medium",
   
   enhancement = {
        name = "europeans_mill_normal",
        enhancement_cost = {
          planks = 2,
          cloth = 2,
          spidercloth = 2,
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
      unoccupied = {
         directory = dirname,
         basename = "unoccupied",
         hotspot = { 52, 64 },
      }
   },
   spritesheets = {
      idle = {
         basename = "idle",
         frames = 20,
         columns = 4,
         rows = 5,
         hotspot = { 50, 65 }
      },
      build = {
         basename = "build",
         frames = 4,
         columns = 2,
         rows = 2,
         hotspot = { 50, 61 }
      },
      working = {
         basename = "working",
         frames = 20,
         columns = 4,
         rows = 5,
         hotspot = { 53, 65 }
      }
   },

   aihints = {
      basic_amount = 1
   },

   working_positions = {
      europeans_miller_basic = 1
   },

   inputs = {
      { name = "rye", amount = 6 },
      { name = "wheat", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=produce_mixed_flour_basic",
            "call=produce_mixed_flour",
            "return=skipped"
         }
      },
      produce_mixed_flour_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
         descname = _"grinding rye and wheat",
         actions = {
            "return=skipped when economy needs flour",
            "return=skipped when economy needs rye",
            "return=skipped when economy needs wheat",
            "sleep=duration:10s",
            "consume=wheat rye",
            "playsound=sound/mill/mill_turning priority:85% allow_multiple",
            "animate=working duration:60s",
            "produce=flour"
         }
      },
      produce_mixed_flour = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
         descname = _"grinding rye and wheat",
         actions = {
            "return=skipped unless economy needs flour",
            "sleep=duration:10s",
            "consume=wheat:2 rye:2",
            "playsound=sound/mill/mill_turning priority:85% allow_multiple",
            "animate=working duration:60s",
            "produce=flour:3"
         }
      },
   },
}

pop_textdomain()
